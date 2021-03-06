%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                   %
% EFK measurement Jacobian. Computes the expected measurements      %
% given a state.                                                    %
%                                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                   %
% By Geoffrey Bower                                                 %
% (C) 2011                                                         %
% Last Updated 5-25-2011                                            %
%                                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                   %
% 6 measurement quantities:                                         %
% x,y,z accelerations                                               %
% x,y,z magnetic field strength                                     %
%                                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [Ht] = Measure(x,xyz)

Ht = zeros(6,4);

%z1 = -(2*x(2)*x(4)-2*x(1)*x(3))
Ht(1,1) = 2*x(3);
Ht(1,2) = -2*x(4);
Ht(1,3) = 2*x(1);
Ht(1,4) = -2*x(2);

%z2 = -(2*x(3)*x(4)+2*x(1)*x(2))
Ht(2,1) = -2*x(2);
Ht(2,2) = -2*x(1);
Ht(2,3) = -2*x(4);
Ht(2,4) = -2*x(3);

%z3 = -(1-2*x(2)*x(2)-2*x(3)*x(3))
Ht(3,1) = 0;
Ht(3,2) = 4*x(2);
Ht(3,3) = 4*x(3);
Ht(3,4) = 0;

%z4 = (1-2*x(3)*x(3)-2*x(4)*x(4))*xyz(1) + (2*x(2)*x(3)+2*x(1)*x(4))*xyz(2)
%+ (2*x(2)*x(4)-2*x(1)*x(3))*xyz(3)
Ht(4,1) = 2*x(4)*xyz(2) - 2*x(3)*xyz(3);
Ht(4,2) = 2*x(3)*xyz(2) + 2*x(4)*xyz(3);
Ht(4,3) = -4*x(3)*xyz(1) + 2*x(2)*xyz(2) - 2*x(1)*xyz(3);
Ht(4,4) = -4*x(4)*xyz(1) + 2*x(1)*xyz(2) + 2*x(2)*xyz(3);

%z5 = (2*x(2)*x(3)-2*x(1)*x(4))*xyz(1) + (1-2*x(2)*x(2)-2*x(4)*x(4))*xyz(2)
%+ (2*x(3)*x(4)+2*x(1)*x(2))*xyz(3)
Ht(5,1) = -2*x(4)*xyz(1) + 2*x(2)*xyz(3);
Ht(5,2) = 2*x(3)*xyz(1) - 4*x(2)*xyz(2) + 2*x(1)*xyz(3);
Ht(5,3) = 2*x(2)*xyz(1) + 2*x(4)*xyz(3);
Ht(5,4) = -2*x(1)*xyz(1) - 4*x(4)*xyz(2) + 2*x(3)*xyz(3);

%z6 = (2*x(2)*x(4)+2*x(1)*x(3))*xyz(1) + (2*x(3)*x(4)-2*x(1)*x(2))*xyz(2) +
% (1-2*x(2)*x(2)-2*x(3)*x(3))*xyz(3)
Ht(6,1) = 2*x(3)*xyz(1) - 2*x(2)*xyz(2);
Ht(6,2) = 2*x(4)*xyz(1) - 2*x(1)*xyz(2) - 4*x(2)*xyz(3);
Ht(6,3) = 2*x(1)*xyz(1) + 2*x(4)*xyz(2) - 4*x(3)*xyz(3);
Ht(6,4) = 2*x(2)*xyz(1) + 2*x(3)*xyz(2);

end