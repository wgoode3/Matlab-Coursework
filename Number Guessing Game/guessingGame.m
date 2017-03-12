% This extra credit assignment can add a total of 3 points to your course average.

% A half of a point (0.5) can be earned by having the game ask the user for
% his/her first name before "How many digits in the combination?" and addressing the player
% by his/her name during the entire game.
%(e.g. Cedric, that is a wrong guess.  Please try again.)

% One point (1) can be earned by having the game give the player scoring information after each incorrect guess and upon finding the correct combination.
% (e.g. WRONG, TRY AGAIN.  CORRECT DIGITS--> 1. 	 CORRECT POSITIONS-->0. 	 HINT-->_ _ _   SCORE-->152)
% (e.g. CORRECT COMBINATION, YOUR SCORE IS 152)
% The score should be calculated accroding to the following rules:
% 1) The player's maximum score is set at: ((combinationLength)^2 )*10
%    (e.g. If a player is attempting to guess a 4 digit combination, then the maximum points are set at 160)
% 2) The player looses ( (combinationLength)*(combinationLength-2) ) points for each incorrect guess.
%    (e.g. If a player is attempting to guess a 4 digit combination, he would loose 8 points after each incorrect guess.
%     Thus, his score after the first incorrect guess would be 152)
 
% One and a half points (1.5) can be earned by storing all game results in an
% Excel file and displaying the scoring history (in decending order according to score) after the player guesses the
% correct combination.

function guessingGame()
    name = input('Please enter your name: ', 's');
    combinationLength = input('How many digits in the combination? ');
    hint = input('Do you need hints? [Y/N] ', 's');
    score = ((combinationLength)^2)*10;
    done = false;
    
    combination = ceil( 10.^(combinationLength)*rand(1,1) );
    while combination==0 || combination==10.^(combinationLength-1)
        combination = ceil( 10.^(combinationLength)*rand(1,1) );
    end    

    while ~done
        prompt = sprintf('\n%s, please enter your %d digit combination: ', name, combinationLength);
        guess = input(prompt); 
        guessString = int2str(guess);
        combinationString = int2str(combination);
        
        if length( guessString ) > combinationLength
            score = 0;
            fprintf('%s the combination you entered is too long.\n', name);
        elseif length( guessString )< combinationLength
            score = 0;
            fprintf('%s the combination you entered is too short.\n', name);
        else
            if guess == combination
               
               fprintf('CORRECT COMBINATION. \n\n');
               fprintf('%s your score is %d \n\n', name, score);
               done = true;
               
               %Adds the attempt to the file 'HighScores.xls' and sorts it
               [num txt raw] = xlsread('HighScores.xls');
               HS = raw;
               NAMES = [];
               VECS = [];
               SCORES = [];
               L1 = length(HS);
               HS{L1+1} = name;
               HS{L1+2} = score;
               L1 = length(HS);
               for ind = 1:L1
                   if rem(ind,2)==1
                       NAMES = [NAMES HS(ind)];
                   else
                       VECS = [VECS HS{ind}];
                       SCORES = [SCORES HS(ind)];
                   end
               end
               L2 = length(VECS)
               NEWHS = [];
               for ind=1:L2
                   [v,p]= max(VECS);
                   NEWHS = [NEWHS; NAMES(p); SCORES(p)];
                   VECS(p) = [];
                   NAMES(p) = [];
                   SCORES(p) = [];
               end
                
               % Displays the contents of the new file 'HighScores.xls'
               fprintf('   High Scores: \n');
               disp(NEWHS);
               xlswrite('HighScores.xls',NEWHS);
               
            else
               score = (score-((combinationLength)*(combinationLength-2)));
               correctString = [];
               correctPositions = ( guessString == combinationString );           
               correctPositionsCount = length ( find( correctPositions ) );
               for i = 1:length(correctPositions)
                    if correctPositions(i)
                        correctString  = [correctString '# '];
                    else
                        correctString = [correctString '_ '];
                    end 
               end
              
               numberCorrect = 0;               
               for i = 1:length(guessString)
                   for j = 1:length(combinationString)
                       if guessString(i) == combinationString(j)
                           combinationString(j) = [];
                           numberCorrect = numberCorrect + 1;
                           break;
                       end
                   end
               end
               
               if hint == 'Y' || hint == 'y'
                   fprintf('WRONG, TRY AGAIN.  CORRECT DIGITS--> %d. \t CORRECT POSITIONS--> %d. \t HINT-->%s \t SCORE--> %d.\n', numberCorrect, correctPositionsCount, correctString, score);
               else
                   fprintf('WRONG, TRY AGAIN.  CORRECT DIGITS--> %d. \t CORRECT POSITIONS--> %d. \t SCORE--> %d.\n', numberCorrect, numberCorrect, score);
               end
               
            end
        end
    end
