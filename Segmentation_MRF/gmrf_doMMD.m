function mrf=gmrf_doMMD(mrf)

         cmap = load('MRF_colormap.mat'); % the colormap
            h = mrf.imagesize(1);         % height of the image
            w = mrf.imagesize(2);         % width of the image
         cnum = mrf.classnum;             % number of classes
         beta = mrf.Beta;                 % value of parameter beta
    DeltaUmin = mrf.DeltaUmin;            % value of minimal necessary energy change
            T = mrf.T0;                   % temperature at the begining
            c = mrf.c;                    % the c constant parameter
     

           cycle = 0;
    summa_deltaE = 2 * DeltaUmin; % the first iteration is guaranteed

    while summa_deltaE > DeltaUmin 
        
        % ====================================== %
        %                                        %
        %    Please, put your implementation     %
        %             BELOW THIS LINE            %
        %                                        %
        % ====================================== %
        
        summa_deltaE = 0;
        cycle = cycle + 1;
        for y=1:h
            for x=1:w
                C = mrf.classmask(y,x);
                neighbors = [];
                if x-1>0
                    neighbors = [neighbors mrf.classmask(y,x-1)];
                end
                if x+1<w
                    neighbors = [neighbors mrf.classmask(y,x+1)];
                end
                if y-1>0
                    neighbors = [neighbors mrf.classmask(y-1,x)];
                end
                if y+1<h
                    neighbors = [neighbors mrf.classmask(y+1,x)];
                end
                pp = mrf.logProbs{C}(y, x);
                pr = 0;
                for i=1:length(neighbors)
                    if C == neighbors(i)
                        pr = pr - beta;
                    else
                        pr = pr + beta;
                    end
                end
                r = randi(cnum);
                while r == C
                    r = randi(cnum);
                end
                new_pp = mrf.logProbs{r}(y, x);
                new_pr = 0;
                for i=1:length(neighbors)
                    if r == neighbors(i)
                        new_pr = new_pr - beta;
                    else
                        new_pr = new_pr + beta;
                    end
                end
                U_act = pp + pr;
                U_new = new_pp + new_pr;
                dU = U_new - U_act;
                if dU<0 || (dU>0 && rand(1,1) < exp(-dU/T))
                    summa_deltaE = summa_deltaE+abs(dU);
                    mrf.classmask(y,x) = r;
                end
            end
        end
        T = T*c;
        % ====================================== %
        %                                        %
        %    Please, put your implementation     %
        %             ABOVE THIS LINE            %
        %                                        %
        % ====================================== %    
        
        imshow(uint8(255*reshape(cmap.color(mrf.classmask,:), h, w, 3)));
        %fprintf('Iteration #%i\n', cycle);
        title(['Class map in cycle ', num2str(cycle)]);
        drawnow;
    end
end
