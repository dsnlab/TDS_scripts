fileID=fopen(script_file);
textstuff=textscan(fileID, '%[^\n]');
fclose(fileID);

regexp=['(''.*)',num2str(replacesid),'(.*'')'];
replaceexpr=['$1',num2str(sub),'$2'];
newtext=cellfun(@(x) regexprep(x, regexp, replaceexpr), textstuff{1}, 'UniformOutput', false);

cellfun(@eval, newtext);

[outdir, outfile] = fileparts(script_file);

outdirfull = fullfile(outdir,'sid_batches');

if ~exist(outdirfull, 'dir')
  mkdir(outdirfull);
end

save(fullfile(outdirfull,strcat(num2str(sub),'_',outfile,'.mat')),'matlabbatch');