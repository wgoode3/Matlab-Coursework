function resize()
done = false;
while ~done
    job = input('Are you finished? [Y/N] ', 's');
    if job == 'Y'
        done = true;
    elseif job == 'y'
        done = true;
    else
        name = input('What is the file name? ', 's');
        pic = imread(name);
        [rows, cols, d]=size(pic);
        fprintf('R/C %d , %d \n', rows, cols);
        r = input('How many rows? ');
        c = input('How many columns? ');
        rowvector=round(linspace(1,rows,r));
        colvector=round(linspace(1,cols,c));
        picture=pic(rowvector,colvector,:);
        imshow(picture);
        pause
        close all
        new_name = input('What is the new file name? ', 's');
        imwrite(picture, new_name, 'jpg');
    end
end