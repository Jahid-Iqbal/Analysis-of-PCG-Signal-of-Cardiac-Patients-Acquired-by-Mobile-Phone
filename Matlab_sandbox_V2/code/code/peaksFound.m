
for k = 2 : length(my_VAR_1)-1
    if((my_VAR_1(k) > my_VAR_1(k-1)) && (my_VAR_1(k) > my_VAR_1(k+1)) && (my_VAR_1(k) > 1))
        disp(k);
        disp('Prominent peak found');
    end
end