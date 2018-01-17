thewd = '/data/jflournoy/TDS/multiconds/ylg';
newdirname = 'pmods_to_conditions';

trials_info_file = 'trials.csv';

files = dir(fullfile(thewd, '*.mat'));
mkdir(fullfile(thewd,newdirname))

csv_header = ['sid,run,go,stop,go_good_o,stop_good_o,go_bad_o,stop_bad_o'];

[fid, errmsg] = fopen(fullfile(thewd, newdirname, trials_info_file), 'w');
fprintf(fid, '%s\n', csv_header);


for i = 1:length(files)
    display(['Processing file: ', files(i).name]);
    load(fullfile(thewd, files(i).name)); 
    
    [sidstarti, sidendi] = regexp(files(i).name, '\d\d\d');
    sid = files(i).name(sidstarti:sidendi);
    [runstarti, runendi] = regexp(files(i).name, '(ALONE|PEER|EXCL)');
    run = files(i).name(runstarti:runendi);
    
    newnames = ['go', 'stop', 'go_good_o', 'stop_good_o', 'go_bad_o', 'stop_bad_o', names(4:length(names))];
    for j = 1:length(pmod)
        i1 = j*2 - 1;
        i2 = j*2;
        newonsets{i1} = onsets{j}(pmod(j).param{1} == .5);
        newonsets{i2} = onsets{j}(pmod(j).param{1} == -.5);
        newdurations{i1} = durations{j}(pmod(j).param{1} == .5);
        newdurations{i2} = durations{j}(pmod(j).param{1} == -.5);
        for check_idx = i1:i2
            if isempty(newonsets{check_idx})
                warning([newnames{check_idx}, ' is empty']);
            end
        end
    end

    for k = 4:length(onsets)
        newonsets{k+3} = onsets{k};
    end
    clear('names', 'onsets', 'durations', 'pmod')
    names = newnames;
    onsets = newonsets;
    durations = newdurations;
    
    fprintf(fid, '%s,%s,', sid, run);
    for writei = 1:6
        fprintf(fid, '%d,', length(newonsets{writei}));
    end
    fprintf(fid, '\n');
    
    save(fullfile(thewd, newdirname, files(i).name), 'names', 'onsets', 'durations');
    clear('names', 'onsets', 'durations', 'newonsets', 'newdurations');
end

fclose(fid);
