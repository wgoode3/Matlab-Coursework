
%Two and a half points (2.5) can be earned by creating a function named
%decodeMorse() that takes in a .wav file composed of some combination of
%the dashes, dots and spaces shown below in the msg variable. (Use these
%exact sound samples, only the coded message will vary)  Your function
%should decode the audio message into one line of lowercase letters, each 
%seperated by a single space.  The file helloMorse.wav has been included 
%in this directory (along with dash.wav and dot.wav) to get you started.

function string = decodeMorse(filename)

[msg] = wavread(filename);
unit = 25000;

code = {};
code_index = 1;

% Uses a Fast Fourier Transformation to determine if a the sound is dot or
% dash...

i = 1;
while i+unit < length(msg)
    unit_fft = abs(fft( msg(i:i+unit) ));
    unit_sum = sum( unit_fft(1:500) );  
    if unit_sum > 100000
        code{code_index} = 'dash';
    elseif unit_sum > 80000
        code{code_index} = 'dot';
    else
        code{code_index} = 'space';
    end
    code_index = code_index + 1;
    i = i + unit;
end

string = [];
done = false;

while ~isempty(code)
    
    code1 = [];
    
    while true
        if isempty(code)
            break
        elseif strcmpi(code(1), 'dash')
            code1 = [code1 1];
            code(1) = [];
        elseif strcmpi(code{1}, 'dot')
            code1 = [code1 2];
            code(1) = [];
        elseif strcmpi(code{1}, 'space')
            code(1) = [];
            break
        end
    end
    
    q = length(code1);
            
        switch q
            
            case 1
                if code1(1)==2
                    string = [string 'e'];
                else
                    string = [string 't'];
                end

            case 2
                if code1(1)==2
                    if code1(2)==2
                        string = [string 'i'];
                    else
                        string = [string 'a'];
                    end
                else
                    if code1(2)==2
                        string = [string 'n'];
                    else
                        string = [string 'm'];
                    end
                end

            case 3
                if code1(1)==2
                    if code1(2)==2
                        if code1(3)==2
                            string = [string 's'];
                        else
                            string = [string 'u'];
                        end
                    else
                        if code1(3)==2
                            string = [string 'r'];
                        else
                            string = [string 'w'];
                        end
                    end
                else
                    if code1(2)==2
                        if code1(3)==2
                            string = [string 'd'];
                        else
                            string = [string 'k'];
                        end
                    else
                        if code1(3)==2
                            string = [string 'g'];
                        else
                            string = [string 'o'];
                        end
                    end
                end

            case 4
                if code1(1)==2
                    if code1(2)==2
                        if code1(3)==2
                            if code1(4)==2
                                string = [string 'h'];
                            else
                                string = [string 'v'];
                            end
                        else
                            if code1(4)==2
                                string = [string 'f'];
                            else 
                                string = [string];
                            end
                        end
                    else
                        if code1(3)==2
                            if code1(4)==2
                                string = [string 'l'];
                            else
                                string = [string];
                            end
                        else
                            if code1(4)==2
                                string = [string 'p'];
                            else
                                string = [string 'j'];
                            end
                        end
                    end
                else
                    if code1(2)==2
                        if code1(3)==2
                            if code1(4)==2
                                string = [string 'b'];
                            else
                                string = [string 'x'];
                            end
                        else
                            if code1(4)==2
                                string = [string 'c'];
                            else 
                                string = [string 'y'];
                            end
                        end
                    else
                        if code1(3)==2
                            if code1(4)==2
                                string = [string 'z'];
                            else
                                string = [string 'q'];
                            end
                        else
                            if code1(4)==2
                                string = [string];
                            else
                                string = [string];
                            end
                        end
                    end
                end
                string
        end
end
