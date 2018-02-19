#' Reviewer 3, comment:
#'
#' >9.	Did subjects differ in terms of the number of volumes each contributed to
#' >the overall group map for each trial component (and does this effect the group
#' >estimate)?  How did the authors control for this possibility?  This question
#' >arose when pondering the somewhat counterintuitive finding that adolescents
#' >experienced outcomes following safe decisions as more rewarding than outcomes
#' >following risky decisions, regardless of whether the outcome was positive or
#' >negative.
#'
#+ warning=F,message=F

library(ylglearning)
library(tidyr)
library(dplyr)
data("ylgData")
no_session2 <- c(118, 123, 147, 148, 149, 153, 154, 166, 180)
behaviorals <- c(103, 107, 112, 138, 143, 176, 191)
invalid_data <- c(158, 189)
exclusions <- c(no_session2, behaviorals, invalid_data)

ylgData_tds2_alone <- ylgData %>%
  filter(grepl('1\\d\\d', subject_name),
         !subject_name %in% exclusions,
         run_index %in% c(3,4))

ylgData_tds2_alone_pgo <- ylgData_tds2_alone %>%
  group_by(subject_name) %>%
  summarize(Ngo = sum(goDec %in% 1),
            Ndec = sum(!is.na(goDec)),
            Pgo = Ngo/Ndec,
            Pgo_5050_divergence = abs(Pgo - .5)) %>%
  arrange(Pgo, Pgo_5050_divergence)

ylgData_tds2_alone_pgo %>% knitr::kable(digits = 2)
hist(ylgData_tds2_alone_pgo$Pgo, breaks = 10)
sum(ylgData_tds2_alone_pgo$Pgo >= .25 & ylgData_tds2_alone_pgo$Pgo <= .75)

#'
#' Subjects varied a great deal in the number of go decisions, with a range of
#' [1,32] (of 40 total possible decisions, so proportion of go decisions have a
#' range of [.03,.80]). First level models are estimated within each individual,
#' and so a participant with 1 go decision and 39 stop decisions will have a
#' more precise estimate of the BOLD signal correlation with stop decisions than
#' of the BOLD signal correlation with go decisions. However, each estimate,
#' regardless of its precision, is unbiased (under the assumptions of linear
#' regression, which are minimal). The imprecision of some of these estimates
#' may contribute noise to the overall group estimate for stop outcomes versus
#' go outcomes, but will not systematically bias the estimate. It is possible
#' that these particular findings are in error, but this is controlled at alpha
#' = .05 (the error rate for a single cluster from this contrast being a false
#' positive).
#'
#' The reviewer makes an interesting point that the result that "adolescents
#' experienced outcomes following safe decisions as more rewarding than outcomes
#' following risky decisions." We agree this is counter-intuitive. However, we
#' believe the intuition rests on two pillars that are not themselves to be
#' relied on. First is the intuition [I assume this is what they're referring
#' to] that activity in the ventral striatum can be used to infer that a
#' stimulus is rewarding [to be honest, maybe this is the case, but i thought we
#' made some caveats to this claim in response to another reviewer's comments
#' -- to check this, I would probably refer to your recent paper with Ell],
#' which is a somewhat tenuous reverse inference. The second assumption is that
#' adolescents tend to find the riskier option more rewarding or reinforcing,
#' which should then be reflected in increased relative BOLD signal in the VS.
#' However, as evidenced in this study, and in many studies using the Stop Light
#' Game, adolescents, on average, tend to choose the risky option less than 50% of
#' the time. In this study, the average revealed preference is for the safe
#' option (this is even more surprising in studies of the Stop Light Game, where
#' the go decision is actually optimal in terms of game performance). In light
#' of the fact that our participants preferred stop decisions on average, it
#' makes sense that we would see greater VS activity following stop decisions
#' versus following go decisions. Indeed, it would be odd if adolescents
#' decided to perform an action less often that they found more rewarding.
#'
#' It may also help the reviewer to imagine the bad stop versus bad go (the
#' clear intersection symbol versus the crash), and good stop versus good go
#' outcomes (cross-car animation versus the clear intersection symbol). To put
#' it another way, in the bad outcomes, what the neural results may indicate is
#' that participants prefer a missed go opportunity versus a decidedly nasty go
#' mistake, as well as a correct decision that avoids a crash versus a correct
#' decision that wins them a bit of time. Again, I think the reviewer will see
#' that these contrasts make sense in light of the fact that on average,
#' participants choose to stop more often than go.
#'
#' With regard to the precision of the the individual estimates that contributed
#' to the group map, it may help to know that 60 of the participants have at
#' least a quarter of decisions that are not of their modal type (i.e., >=25% go
#' and >=25% stop). Typically this means that >=10/40 trials are of the non-modal
#' type, though some participants have slightly fewer than 40 total trials during
#' which they make a stop or go decision. This is fairly normally distributed
#' around the mean of 40% go decisions.
