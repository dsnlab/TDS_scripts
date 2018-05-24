#' ---
#' author: John Flournoy
#' data: "`r Sys.Date()`"
#' output:
#'   html_document:
#'     toc: true
#'     toc_float: true
#' ---
#' 
#+echo=F,message=F,error=F,warning=F
knitr::opts_chunk$set(collapse = T, message = F, error = F, warning = F, echo=F)

#+
file_list <- dir('/data/jflournoy/TDS/roi_extractions', pattern = '*tsv', full.names = T)
voxval_list <- lapply(file_list, function(filename){
  adf <- readr::read_tsv(filename, 
                  col_names = 'voxel_value', 
                  col_types = readr::cols(voxel_value = readr::col_double()))
  adf$filename <- filename
  adf
})

voxval_df <- dplyr::bind_rows(voxval_list)

voxval_df$id <- gsub('.*/(\\d{3})_con.*', '\\1', voxval_df$filename)
voxval_df$contrast <- gsub('.*/\\d{3}_con_(\\d{4}).*', '\\1', voxval_df$filename)

plot_voxel_hists <- function(id, data, binwidth = .5, per_id = T){
  if(per_id) {
    id.data <- dplyr::filter(data, id == (!! id[[1]] ))
    titletext <- id[[1]]
  } else {
    id.data <- data
    titletext <- 'All'
  }
  con.summary <- dplyr::summarise(
    dplyr::group_by(id.data, contrast),
    mean = mean(as.numeric(voxel_value)),
    median = median(as.numeric(voxel_value)))

  aplot <- ggplot2::ggplot(id.data, 
                  ggplot2::aes(x = voxel_value)) + 
    ggplot2::geom_histogram(binwidth = binwidth) +
    ggplot2::geom_vline(ggplot2::aes(xintercept = mean, linetype = 'mean'), 
                        data = con.summary) + 
    ggplot2::geom_vline(ggplot2::aes(xintercept = median, linetype = 'median'), 
                        data = con.summary) +
    ggplot2::scale_linetype_manual(values = c('mean' = 1, 'median' = 2), name = 'Statistic') +
    ggplot2::facet_wrap(~contrast) + 
    ggplot2::theme_minimal() + 
    ggplot2::labs(x = 'Voxel parameter value', y = 'Count', title = paste0('Participant: ', titletext),
                  subtitle = 'Facet labels indicate contrast number.')
  return(aplot)
}

#'
#' # Mean and median across participants
#'
#+fig.width=7,fig.height=7
ggplot2::ggplot(
  tidyr::gather(dplyr::summarize(dplyr::group_by(voxval_df, id, contrast),
                                 mean = mean(voxel_value),
                                 median = median(voxel_value)),
                stat, value, mean, median),
  ggplot2::aes(x = value)) + 
  ggplot2::geom_histogram(binwidth = .5) +
  ggplot2::facet_grid(contrast~stat) + 
  ggplot2::theme_minimal() + 
  ggplot2::labs(x = 'Central tendency value', y = 'Count', title = 'Central tendency across contrasts')

id_voxval_plots <- lapply(unique(voxval_df$id),
       plot_voxel_hists, data = voxval_df, binwidth = .75)

#'
#' # Voxel distribution for every participant
#' 

#+results='asis'
notathing <- lapply(1:length(id_voxval_plots), function(x){
  cat(paste0('\n\n## ', unique(voxval_df$id)[x], '\n\n'))
  print(id_voxval_plots[[x]])
})


  