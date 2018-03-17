function UserData = updateRP(UserData)
try
    tic
    %% get parameter values from UserData
    data_raw = UserData.data_raw;
    norm  = UserData.norm;
    radius = UserData.radius;
    delay = UserData.delay;
    embed = UserData.embed;
    
    %% Turn data_raw into delayed space points
    data = vectorize(data_raw(:,2), embed, delay);
    
    % find distance matrix
    % find recurrence matrix
    % display recurrence plot
    
    toc
catch ME
    disp(ME)
end
end
