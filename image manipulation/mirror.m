function mirror()
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
        [r c d] = size(pic);
        imshow(pic);
        pic = pic(:, c:-1:1, :);
        pause (1)
        close all
        imshow(pic);
        pause (1)
        close all
        imwrite(pic,name);
    end
end