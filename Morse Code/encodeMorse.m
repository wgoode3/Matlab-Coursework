
%Two and a half points (2.5) can be earned by creating a function named
%encodeMorse() that takes in a lowercase string of letters and creates a
%.wav file named MorseMessage.wav that is a properly encoded audio sequence
%of the dashes, dots and spaces used below.

function encodeMorse()

T = 25000;
[dash Fs bits] = wavread('dash.wav');
[dot Fs bits] = wavread('dot.wav');
dash = dash(30000:(30000+T));
dot = dot(20000:(20000+T));
space = zeros(1,(T+1));
str = input('Message to encode: ','s');
msg = [];

% indexes through the string, uses a 'switch' statement to build a vector 
% for the message; will accept capital and lowercase letters.  I bet there
% is a more efficient way to do this...

for ind = 1:length(str)
    switch str(ind)
        case ' '
            msg = [msg space];
        case 'A'
            msg = [msg dot dash space];
        case 'a'
            msg = [msg dot dash space];
        case 'B'
            msg = [msg dash dot dot dot space];
        case 'b'
            msg = [msg dash dot dot dot space];
        case 'C'
            msg = [msg dash dot dash dot space];
        case 'c'
            msg = [msg dash dot dash dot space];
        case 'D'
            msg = [msg dash dot dot space];
        case 'd'
            msg = [msg dash dot dot space];
        case 'E'
            msg = [msg dot space];
        case 'e'
            msg = [msg dot space];
        case 'F' 
            msg = [msg dot dot dash dot space];
        case 'f'
            msg = [msg dot dot dash dot space];
        case 'G'
            msg = [msg dash dash dot space];
        case 'g'
            msg = [msg dash dash dot space];
        case 'H'
            msg = [msg dot dot dot dot space];
        case 'h'
            msg = [msg dot dot dot dot space];
        case 'I'
            msg = [msg dot dot space];
        case 'i'
            msg = [msg dot dot space];
        case 'J'
            msg = [msg dot dash dash dash space];
        case 'j'
            msg = [msg dot dash dash dash space];
        case 'K'
            msg = [msg dash dot dash space];
        case 'k'
            msg = [msg dash dot dash space];
        case 'L'
            msg = [msg dot dash dot dot space];
        case 'l'
            msg = [msg dot dash dot dot space];
        case 'M'
            msg = [msg dash dash space];
        case 'm'
            msg = [msg dash dash space];
        case 'N'
            msg = [msg dash dot space];
        case 'n'
            msg = [msg dash dot space];
        case 'O'
            msg = [msg dash dash dash space];
        case 'o'
            msg = [msg dash dash dash space];
        case 'P'
            msg = [msg dot dash dash dot space];
        case 'p'
            msg = [msg dot dash dash dot space];
        case 'Q'
            msg = [msg dash dash dot dash space];
        case 'q'
            msg = [msg dash dash dot dash space];
        case 'R'
            msg = [msg dot dash dot space];
        case 'r'
            msg = [msg dot dash dot space];
        case 'S'
            msg = [msg dot dot dot space];
        case 's'
            msg = [msg dot dot dot space];
        case 'T'
            msg = [msg dash space];
        case 't'
            msg = [msg dash space];
        case 'U'
            msg = [msg dot dot dash space];
        case 'u'
            msg = [msg dot dot dash space];
        case 'V'
            msg = [msg dot dot dot dash space];
        case 'v'
            msg = [msg dot dot dot dash space];
        case 'W'
            msg = [msg dot dash dash space];
        case 'w'
            msg = [msg dot dash dash space];
        case 'X'
            msg = [msg dash dot dot dash space];
        case 'x'
            msg = [msg dash dot dot dash space];
        case 'Y'
            msg = [msg dash dot dash dash space];
        case 'y'
            msg = [msg dash dot dash dash space];
        case 'Z'
            msg = [msg dash dash dot dot space];
        case 'z'
            msg = [msg dash dash dot dot space];
    end
end

% Writes out the message to a new file 'MorseMessage.wav'

msg((length(msg)-25000):length(msg)) = [];
wavwrite(msg, Fs, bits,'MorseMessage.wav');