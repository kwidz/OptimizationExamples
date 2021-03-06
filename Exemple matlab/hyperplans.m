%x= discharge water m2/s min 200 max 1400
%y=stored water hm3 min 353 max 385
%z=linear coefficient for hyperplane
%Centrale 1 une turbine
hyperplane_11_x=[0.25
-0.1

]
hyperplane_11_y=[0.008406189344
0.12
]
hyperplane_11_z =[11
252
]

%Centrale 1 deux turbines
hyperplane_12_x=[0.26
-0.15

]
hyperplane_12_y=[0.008806189344
0.125
]
hyperplane_12_z =[11
300
]
%Centrale 1 3turbines
hyperplane_13_x=[0.27
-0.2

]
hyperplane_13_y=[0.009406189344
0.13
]
hyperplane_13_z =[11
380
]
%x= discharge water m2/s min 200 max 1400
%y=stored water hm3 min 450 max 500
%z=linear coefficient for hyperplane
%Centrale 2 une turbine
hyperplane_21_x=[0.45
-0.35

]
hyperplane_21_y=[0.009
0.10
]
hyperplane_21_z =[0
800
]

%Centrale 2 deux turbines
hyperplane_22_x=[0.5
-0.38

]
hyperplane_22_y=[0.009
0.10
]
hyperplane_22_z =[0
800
]
%Centrale 2 3turbines
hyperplane_23_x=[0.7
-0.40

]
hyperplane_23_y=[0.009
0.10
]
hyperplane_23_z =[0
800
]

figure
for i = 1:2
    [x y] = meshgrid(0:100:1500,450:5:500); % Generate x and y data
    z1 = (hyperplane_21_x(i)*x + hyperplane_21_y(i) *y + hyperplane_21_z(i)); % Solve for z data
    z2 = (hyperplane_22_x(i)*x + hyperplane_22_y(i) *y + hyperplane_22_z(i));
    z3 = (hyperplane_23_x(i)*x + hyperplane_23_y(i) *y + hyperplane_23_z(i));
    %surf(x,y,z1) %Plot the surface
    %hold on
    surf(x,y,z2) %Plot the surface
    hold on
    %surf(x,y,z3) %Plot the surface
    %hold on
    
end
grid on 