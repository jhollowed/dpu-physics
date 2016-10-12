% Joe Hollowed
% PHY 342
%
% Function to find root of some function f(x), given initial root bounds
%
% Last Edited 9/9/16

function [] = rootSolver2(func, a, tols, makePlot=false)

	% param func: function to pass to root finder, as a string 
	% param xl: starting left-bound of root region
	% param xr: startig right-bound of root region
	% return: None

	%----------Check validity of function----------
 	x = linspace(1,10,10);
	try
		test = eval(func);
	catch
		error('Function f(x) uses invalid operators');
	end
	
	roots = zeros(1, length(tols));
	iters = zeros(1, length(tols));

	for n = 1:length(tols)
		%----------Preform root finding----------
		[root, iter] = newton_raphson(func, a, tols(n), makePlot);
		roots(n) = root;
		iters(n) = iter;
	end
	disp(roots)
	disp(iters)
	
	
	if(length(tols) > 1)
		figure;
		semilogx(1./tols, iters, 'o-', 'linewidth', 2, 'Color', 'magenta');
		xlabel('1 / tolerance', 'fontsize', 16);
		ylabel('iterations', 'fontsize', 16);
		title(sprintf('Tolerance vs. Iterations\nNewton-Raphson'), 'fontsize', 18);
	end
end	
