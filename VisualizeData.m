% VISUALIZE DATA

function VisualizeData(X, y)

    % This is just a simple plot of three of the four features, just to get a
    % rough feel for what the data looks like. I could choose any three of the
    % four features to visualize.

    figure(1);
    seidx = y(:,1) == 1;
    veidx = y(:,2) == 1;
    viidx = y(:,3) == 1;
    plot3(X(seidx,1),X(seidx,2),X(seidx,3),'bx'); hold on
    plot3(X(veidx,1),X(veidx,2),X(veidx,3),'ro'); hold on
    plot3(X(viidx,1),X(viidx,2),X(viidx,3),'g*'); hold on
    grid on;
    title('Three of Four Dimensions Visualization of Fisher''s Iris Plant Database');

end % function