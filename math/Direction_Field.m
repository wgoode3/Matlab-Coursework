function Direction_Field ()
x=0;
y=0;
e= 2.71828183;
pi= 3.14159265; 
Equation = input('Enter the Equation? dy/dt = ');
Min_x = input('What is the minimum "x" value? ');
Max_x = input('What is the maximum "x" value? ');
Min_y = input('What is the minimum "y" value? ');
Max_y = input('What is the maximum "y" value? ');
Scale_x = input('How many points along "x"? ');
Scale_y = input('How many points along "y"? ');
table = []
xs = linspace( Min_x, Max_x, Scale_x);
ys = linspace( Min_y, Max_y, Scale_y);
for x = 1:length(xs)
    for y = 1:length(ys)
        slope = Equation
        table(x,y) = slope;
    end
end
table

