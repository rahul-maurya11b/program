function test()
    
    % Q1: for demand and supply as constant
    simulate_demand_supply_constant();
    
    % Q2: for demand and supply as function of time
    simulate_demand_supply_function_of_time();
    
    % Q3: for demand and supply as polynomial function of time
    simulate_demand_supply_polynomial_function();
    
    % Q4: for demand and supply as function of price (linear)
    simulate_demand_supply_function_of_price();
    
    % Q5: for demand and supply as polynomial function of price
    simulate_demand_supply_polynomial_price();
    
    % Q6: when population depends on birth and death rate (constant)
    simulate_population_constant_birth_death();
    
    % Q7: when birth and death rate are function of time
    simulate_population_time_dependent_birth_death();
    
    % Q8: when population is polynomial function of time
    simulate_population_polynomial_function_time();
    
    % Q9: when birth and death rate are function of population
    simulate_population_dependent_birth_death();
end

function rk4_solver(f, h, t, y_initial, exact, plot_title)
    n = numel(t);
    ry = zeros(size(t));
    ey=  zeros(size(t));
    ry(1) = y_initial;
    ey(1) = y_initial;
    for i = 1:n-1
        k1 = h * f(t(i), ry(i));
        k2 = h * f(t(i) + 0.5 * h, ry(i) + 0.5 * k1);
        k3 = h * f(t(i) + 0.5 * h, ry(i) + 0.5 * k2);
        k4 = h * f(t(i) + h, ry(i) + k3);
        ry(i + 1) = ry(i) + (1/6) * (k1 + 2 * k2 + 2 * k3 + k4);
        ey(i+1)=ey(i)+h*f(t(i),ey(i));
    end
    
    re = 100 * abs((exact - ry) ./ exact);
    ee= 100 * abs((exact - ey) ./ exact);
    
    figure
    
    subplot(2, 2, 1)
    plot(t, ry)
    
    hold on;
    plot(t, exact)
    legend('RK','Exact')
    title(plot_title,'RK method');
    subplot(2,2,2)
    plot(t,ey)
    hold on
    plot(t,exact)
    legend('Euler','Exact')
    title('Euler method');
    subplot(2,2,3)
    plot(t,re)
    title('RK Error');
    subplot(2,2,4)
    plot(t,ee)
    title('Euler Error');
    

end

function simulate_demand_supply_constant()
    h = 1; x = 0:h:10;
    d = 1065.4; s = 1047; k = 0.01;
    exact = 15 + k * (d - s) * x;
    f = @(x, y) k * (d - s);
    rk4_solver(f, h, x, 15, exact, 'Demand and Supply Constant');
end

function simulate_demand_supply_function_of_time()
    h = 1; t = 0:h:15;
    k = 0.01; g0 = 922.9 - 1032; g1 = 27.68 + 3.957;
    exact = 15 + k * (g1 * (t.^2 / 2) + g0 * t);
    f = @(t, y) k * (g0 + g1 * t);
    rk4_solver(f, h, t, 15, exact, 'Demand and Supply Function of Time');
end

function simulate_demand_supply_polynomial_function()
    h = 1; t = 0:h:15;
    k = 0.01; h2 = 6.853 - 2.071; h1 = -47.703 + 26.74; h0 = 1073.673 - 1077.1;
    exact = 15 + k * (h2 * (t.^3 / 3) + h1 * (t.^2 / 2) + h0 * t);
    f = @(t, y) k * (h0 + h1 * t + h2 * t.^2);
    rk4_solver(f, h, t, 15, exact, 'Demand and Supply Polynomial Function of Time');
end

function simulate_demand_supply_function_of_price()
    h = 1; t = 0:h:15;
    k = 0.01; g0 = 736.4 - 1040; g1 = 16.76 + 1.485;
    exact = (((g0 + g1 * 15) .* exp(k * g1 * t)) - g0) / g1;
    f = @(t, y) k * (g0 + g1 * y);
    rk4_solver(f, h, t, 15, exact, 'Demand and Supply Function of Price');
end

function simulate_demand_supply_polynomial_price()
    h = 1; t = 0:h:15;
    k = 0.01;
    g0 = 55513.787 + 3845.1389;
    g1 = -10158.3336 + 979.6366;
    g2 = 696.3364 + 72.1238;
    g3 = -20.8186 - 2.2970;
    g4 = 0.2295 + 0.0267;
    f = @(t, y) k * (g0 + g1 * y + g2 * y^2 + g3 * y^3 + g4 * y^4);
    exact = NaN; %Nothing
    rk4_solver(f, h, t, 15, exact, 'Demand and Supply Polynomial of Price');
end

function simulate_population_constant_birth_death()
    h = 1; t = 0:h:10;
    b = 0.4; d = 0.3;
    exact = 1000 * exp((b - d) * t);
    f = @(t, y) (b - d) * y;
    rk4_solver(f, h, t, 1000, exact, 'Population with Constant Birth/Death Rate');
end

function simulate_population_time_dependent_birth_death()
    h = 0.00001; t = 0:h:1;
    exact = 87.05 * exp(-0.3623 * (t.^2) / 2 + 21.55 * t);
    f = @(t, y) (21.55 - 0.3623 * t) * y;
    rk4_solver(f, h, t, 87.05, exact, 'Population Time-Dependent Birth/Death Rate');
end

function simulate_population_polynomial_function_time()
    h = 0.00001; t = 0:h:1;
    a = [32.866382, -0.987768, 0.0864, -0.005963, 0.000171, 0.000002];
    b = [11.4223906, -0.3986533, 0.0257024, -0.001359, 0.0000374, -0.0000004];
    g = a - b;
    exact = 87.05 * exp(g(1) * t + g(2) * (t.^2 / 2) + g(3) * (t.^3 / 3) + g(4) * (t.^4 / 4) + g(5) * (t.^5 / 5) + g(6) * (t.^6 / 6));
    f = @(t, y) (g(1) + g(2) * t + g(3) * t.^2 + g(4) * t.^3 + g(5) * t.^4 + g(6) * t.^5) * y;
    rk4_solver(f, h, t, 87.05, exact, 'Population Polynomial of Time');
end

function simulate_population_dependent_birth_death()
    h = 0.00001; t = 0:h:1;
    alpha0 = 55.30; alpha1 = -2.713; beta0 = 15.57; beta1 = -0.0615;
    alpha = alpha0 - beta0; beta = beta1 - alpha1;
    exact = 87.05 ./ ((1 - (beta * 87.05 / alpha)) .* exp(-alpha * t) + (beta / alpha) * 87.05);
    f = @(t, y) (alpha - beta * y) * y;
    rk4_solver(f, h, t, 87.05, exact, 'Population Dependent Birth/Death Rate');
end
