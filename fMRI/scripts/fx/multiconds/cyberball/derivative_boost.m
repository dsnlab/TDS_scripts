d = dir('t*');

names_trash = {};
names_notrash = {};

i = 11;

for i=1:length(d),
    x = d(i).name;
    
    cd (x)
    cd fx/
    
    if exist('cyb/derivatives/newPT_compT_trash/');        
        cd cyb/derivatives/newPT_compT_trash/
        
        if exist('spmF_0009.nii'); 
            names_trash{end+1} = x;
            cd ../../../../../;
        else
            names_notrash{end+1} = x;
            cd ../../../../../
        end
    else
        cd ../../
    end
    
end

names_trash = names_trash(:);
names_notrash = names_notrash(:);

for j = 1:length(names_notrash), 
    y = names_notrash(j);
    y = cellstr(y);
    cd (y{1,1}); 
    cd ('fx/cyb/derivatives/newPT_compT_trash');
    apply_derivative_boost('all', 'nodb', 'contrasts', 'condition_numbers', [1:12, 18:29] ,'startend', [2 10]);
    cd ('../../../../../'); 
end

for k = 1:length(names_trash), 
    z = names_trash(k);
    z = cellstr(z);
    cd (z{1,1}); 
    cd ('fx/cyb/derivatives/newPT_compT_trash');
    apply_derivative_boost('contrasts', 'nodb', 'condition_numbers', [1:15, 21:32] ,'startend', [2 10]);
    cd ('../../../../../'); 
end