%Test that model works


%1. Set Ground Truth Values
a_true = 6;
b_true = 2;
c_true = 5;
d_true = 3;
e_true = 7;

NoOfFactors = 5;

N = 5000;



%2. Make N test samples of a,b,c in Gaussian distribution







a_test_create = normrnd(a_true, 1, [N,1]);
b_test_create = normrnd(b_true, 1, [N,1]);
c_test_create = normrnd(c_true, 1, [N,1]);
d_test_create = normrnd(d_true, 1, [N,1]);
e_test_create = normrnd(e_true, 1, [N,1]);








%{
a_test_create = wblrnd(6, 8, [N,1]);
b_test_create = wblrnd(2, 8, [N,1]);
c_test_create = wblrnd(3, 8, [N,1]);
d_test_create = wblrnd(2, 8, [N,1]);
e_test_create = wblrnd(5, 8, [N,1]);
%}







a_test_val = 0;
b_test_val = 0;
c_test_val = 0;
d_test_val = 0;


for i = 1:N
    
    [ab, bc, cd, de] = disc_func(i, a_test_create, b_test_create, c_test_create ...
    ,d_test_create, e_test_create);
    
  

 if strcmp(ab, '>>>>') == 1
        a_test_val = a_test_val + 2.5;
    else if strcmp(ab, '>>>') == 1
         a_test_val = a_test_val + 1.875;
     else if strcmp(ab, '>>') == 1
         a_test_val = a_test_val + 1.25;
     else if strcmp(ab, '>') == 1
         a_test_val = a_test_val + 0.625;
    else if strcmp(ab, '==') == 1
         a_test_val = a_test_val + 0;
    else if strcmp(ab, '<') == 1
         a_test_val = a_test_val + -0.625;
    else if strcmp(ab, '<<') == 1
         a_test_val = a_test_val + -1.25;
    else if strcmp(ab, '<<<') == 1
         a_test_val = a_test_val + -1.875;
    else if strcmp(ab, '<<<<') == 1
         a_test_val = a_test_val + -2.5;
    end
    end
    end
    end
    end
     end
     end
    end
    end


    if strcmp(bc, '>>>>') == 1
        b_test_val = b_test_val + 2.5;
    else if strcmp(bc, '>>>') == 1
         b_test_val = b_test_val + 1.875;
     else if strcmp(bc, '>>') == 1
         b_test_val = b_test_val + 1.25;
     else if strcmp(bc, '>') == 1
         b_test_val = b_test_val + 0.625;
    else if strcmp(bc, '==') == 1
         b_test_val = b_test_val + 0;
    else if strcmp(bc, '<') == 1
         b_test_val = b_test_val + -0.625;
    else if strcmp(bc, '<<') == 1
         b_test_val = b_test_val + -1.25;
    else if strcmp(bc, '<<<') == 1
         b_test_val = b_test_val + -1.875;
    else if strcmp(bc, '<<<<') == 1
         b_test_val = b_test_val + -2.5;
    end
    end
    end
    end
    end
     end
     end
    end
    end




    if strcmp(cd, '>>>>') == 1
        c_test_val = c_test_val + 2.5;
    else if strcmp(cd, '>>>') == 1
         c_test_val = c_test_val + 1.875;
     else if strcmp(cd, '>>') == 1
         c_test_val = c_test_val + 1.25;
     else if strcmp(cd, '>') == 1
         c_test_val = c_test_val + 0.625;
    else if strcmp(cd, '==') == 1
         c_test_val = c_test_val + 0;
    else if strcmp(cd, '<') == 1
         c_test_val = c_test_val + -0.625;
    else if strcmp(cd, '<<') == 1
         c_test_val = c_test_val + -1.25;
    else if strcmp(cd, '<<<') == 1
         c_test_val = c_test_val + -1.875;
    else if strcmp(cd, '<<<<') == 1
         c_test_val = c_test_val + -2.5;
    end
    end
    end
    end
    end
     end
     end
    end
    end


    if strcmp(de, '>>>>') == 1
        d_test_val = d_test_val + 2.5;
    else if strcmp(de, '>>>') == 1
         d_test_val = d_test_val + 1.875;
    else if strcmp(de, '>>') == 1
         d_test_val = d_test_val + 1.25;
    else if strcmp(de, '>') == 1
         d_test_val = d_test_val + 0.625;
    else if strcmp(de, '==') == 1
         d_test_val = d_test_val + 0;
    else if strcmp(de, '<') == 1
         d_test_val = d_test_val + -0.625;
    else if strcmp(de, '<<') == 1
         d_test_val = d_test_val + -1.25;
    else if strcmp(de, '<<<') == 1
         d_test_val = d_test_val + -1.875;
    else if strcmp(de, '<<<<') == 1
         d_test_val = d_test_val + -2.5;
    end
    end
    end
    end
    end
     end
     end
    end
    end



    

end


    if a_test_val > 0
        ab_rel = a_test_val/N + 1
        a_guess = ab_rel*b_true;
        a_error = ((a_guess-a_true)/a_true) * 100
    else if a_test_val < 0
        ab_rel = 1/(abs(a_test_val/N - 1))
        a_guess = ab_rel*b_true;
        a_error = ((a_guess-a_true)/a_true) * 100
    end
    end
    
    if b_test_val > 0
        bc_rel = b_test_val/N + 1
        b_guess = bc_rel*c_true;
        b_error = ((b_guess-b_true)/b_true) * 100
    else if b_test_val < 0
        bc_rel = 1/(abs(b_test_val/N - 1))
        b_guess = bc_rel*c_true;
        b_error = ((b_guess-b_true)/b_true) * 100
    end
    end
    
    if c_test_val > 0
        cd_rel = c_test_val/N + 1
        c_guess = cd_rel*d_true;
        c_error = ((c_guess-c_true)/c_true) * 100
    else if c_test_val < 0
        cd_rel = 1/(abs(c_test_val/N - 1))
        c_guess = cd_rel*d_true;
        c_error = ((c_guess-c_true)/c_true) * 100
    end
    end
    

    if d_test_val > 0
        de_rel = d_test_val/N + 1
        d_guess = de_rel*e_true;
        d_error = ((d_guess-d_true)/d_true) * 100
    else if d_test_val < 0
        de_rel = 1/(abs(d_test_val/N - 1))
        d_guess = de_rel*e_true;
        d_error = ((d_guess-d_true)/d_true) * 100 
    end
    end
    
        e_guess = (1/de_rel)*d_true;
        e_error = ((e_guess-e_true)/e_true) * 100



    
   
 aa_rel = 1
    ba_rel = 1/ab_rel
    ca_rel = 1/(ab_rel*bc_rel)
    da_rel = 1/(ab_rel*bc_rel*cd_rel)
    ea_rel = 1/(ab_rel*bc_rel*cd_rel*de_rel)
   




%Disc function - takes values for a_test_create 
function [ab, bc, cd, de] = disc_func(n, a_test_create, b_test_create, c_test_create ...
    , d_test_create, e_test_create)

        if (a_test_create(n) >= 3*b_test_create(n))
        ab = '>>>>';
    else if a_test_create(n) >= 2.5*b_test_create(n) && a_test_create(n) < 3*b_test_create(n)
         ab  = '>>>'
    else if a_test_create(n) >= 2*b_test_create(n) && a_test_create(n) < 2.5*b_test_create(n)
         ab = '>>'
    else if a_test_create(n) >= 1.5*b_test_create(n) && a_test_create(n) < 2*b_test_create(n)
         ab = '>'
    else if a_test_create(n) >= 1*b_test_create(n) && a_test_create(n) < 1.5*b_test_create(n)
         ab  = '=='
    else if b_test_create(n) >= 1*a_test_create(n) && b_test_create(n) < 1.5*a_test_create(n)
         ab = '=='
    else if b_test_create(n) >= 1.5*a_test_create(n) && b_test_create(n) < 2*a_test_create(n)
         ab = '<'
    else if b_test_create(n) >= 2*a_test_create(n) && b_test_create(n) < 2.5*a_test_create(n)
         ab = '<<'
    else if b_test_create(n) >= 2.5*a_test_create(n) && b_test_create(n) < 3*a_test_create(n)
         ab = '<<<'
    else if b_test_create(n) >= 3*a_test_create(n)
         ab = '<<<<'
    end
    end
    end
    end
    end
    end
    end
    end
    end
    end


    if (b_test_create(n) >= 3*c_test_create(n))
        bc = '>>>>';
    else if b_test_create(n) >= 2.5*c_test_create(n) && b_test_create(n) < 3*c_test_create(n)
         bc  = '>>>'
    else if b_test_create(n) >= 2*c_test_create(n) && b_test_create(n) < 2.5*c_test_create(n)
         bc = '>>'
    else if b_test_create(n) >= 1.5*c_test_create(n) && b_test_create(n) < 2*c_test_create(n)
         bc = '>'
    else if b_test_create(n) >= 1*c_test_create(n) && b_test_create(n) < 1.5*c_test_create(n)
         bc  = '=='
    else if c_test_create(n) >= 1*b_test_create(n) && c_test_create(n) < 1.5*b_test_create(n)
         bc = '=='
    else if c_test_create(n) >= 1.5*b_test_create(n) && c_test_create(n) < 2*b_test_create(n)
         bc = '<'
    else if c_test_create(n) >= 2*b_test_create(n) && c_test_create(n) < 2.5*b_test_create(n)
         bc = '<<'
    else if c_test_create(n) >= 2.5*b_test_create(n) && c_test_create(n) < 3*b_test_create(n)
         bc = '<<<'
    else if c_test_create(n) >= 3*b_test_create(n)
         bc = '<<<<'
    end
    end
    end
    end
    end
    end
    end
    end
    end
    end


    if (c_test_create(n) >= 3*d_test_create(n))
        cd = '>>>>';
    else if c_test_create(n) >= 2.5*d_test_create(n) && c_test_create(n) < 3*d_test_create(n)
         cd  = '>>>'
    else if c_test_create(n) >= 2*d_test_create(n) && c_test_create(n) < 2.5*d_test_create(n)
         cd = '>>'
    else if c_test_create(n) >= 1.5*d_test_create(n) && c_test_create(n) < 2*d_test_create(n)
         cd = '>'
    else if c_test_create(n) >= 1*d_test_create(n) && c_test_create(n) < 1.5*d_test_create(n)
         cd  = '=='
    else if d_test_create(n) >= 1*c_test_create(n) && d_test_create(n) < 1.5*c_test_create(n)
         cd = '=='
    else if d_test_create(n) >= 1.5*c_test_create(n) && d_test_create(n) < 2*c_test_create(n)
         cd = '<'
    else if d_test_create(n) >= 2*c_test_create(n) && d_test_create(n) < 2.5*c_test_create(n)
         cd = '<<'
    else if d_test_create(n) >= 2.5*c_test_create(n) && d_test_create(n) < 3*c_test_create(n)
         cd = '<<<'
    else if d_test_create(n) >= 3*c_test_create(n)
         cd = '<<<<'
    end
    end
    end
    end
    end
    end
    end
    end
    end
    end


    if (d_test_create(n) >= 3*e_test_create(n))
        de = '>>>>';
    else if d_test_create(n) >= 2.5*e_test_create(n) && d_test_create(n) < 3*e_test_create(n)
         de  = '>>>'
    else if d_test_create(n) >= 2*e_test_create(n) && d_test_create(n) < 2.5*e_test_create(n)
         de = '>>'
    else if d_test_create(n) >= 1.5*e_test_create(n) && d_test_create(n) < 2*e_test_create(n)
         de = '>'
    else if d_test_create(n) >= 1*e_test_create(n) && d_test_create(n) < 1.5*e_test_create(n)
         de  = '=='
    else if e_test_create(n) >= 1*d_test_create(n) && e_test_create(n) < 1.5*d_test_create(n)
         de = '=='
    else if e_test_create(n) >= 1.5*d_test_create(n) && e_test_create(n) < 2*d_test_create(n)
         de = '<'
    else if e_test_create(n) >= 2*d_test_create(n) && e_test_create(n) < 2.5*d_test_create(n)
         de = '<<'
    else if e_test_create(n) >= 2.5*d_test_create(n) && e_test_create(n) < 3*d_test_create(n)
         de = '<<<'
    else if e_test_create(n) >= 3*d_test_create(n)
         de = '<<<<'
    end
    end
    end
    end
    end
    end
    end
    end
    end
    end

    
end

