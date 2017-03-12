% Simulates rolling dice

function diceSimulation()

done = false;
dRolls = [];
while ~done
    job = input('Do you want to roll again [Y/N] ', 's');
    if job == 'N'
        done = true;
    elseif job == 'n'
        done = true;
    else
        a = ceil(rand*6);
        name = sprintf('%d.png',a);
        pic = imread(name);
        
        % Saves the roll and generates the statistics
        
        dRolls = [dRolls a];
        d1 = [];
        d2 = [];
        d3 = [];
        d4 = [];
        d5 = [];
        d6 = [];
        
        for ind = 1:length(dRolls)
            q = dRolls(ind);
            switch q
                case 1
                    d1 = [d1 1];
                case 2
                    d2 = [d2 2];
                case 3
                    d3 = [d3 3];
                case 4
                    d4 = [d4 4];
                case 5
                    d5 = [d5 5];
                case 6
                    d6 = [d6 6];
            end
        end

        T = length(dRolls);
        R1 = length(d1);
        R2 = length(d2);
        R3 = length(d3);
        R4 = length(d4);
        R5 = length(d5);
        R6 = length(d6);      
        
        % displays the information
        
        imshow(pic);
        title(name);
        
        fprintf('Dots    |  1  |  2  |  3  |  4  |  5  |  6  |\n');
        fprintf('Count   |  %d  |  %d  |  %d  |  %d  |  %d  |  %d  |\n', R1, R2, R3, R4, R5, R6);
        fprintf('Percent |  %d  |  %d  |  %d  |  %d  |  %d  |  %d  |\n',...
        (R1/T)*100, (R2/T)*100, (R3/T)*100, (R4/T)*100, (R5/T)*100, (R6/T)*100)
        fprintf('Rolls   |  %d \n', T) 
                               
        pause
        close all
        clc       
	
    end
end
clear
clc

