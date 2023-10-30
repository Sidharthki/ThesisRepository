%1. Read in set x,y,z scenario values (NOT NECESSARY)
    
%2. Read in a,b,c survey values for each x,y,z, in the form of << < = > >>
% 10+ participants giving 3-4 relationships each for 6 scenarios


%3. Turn all qualitative relationships for one relationship into 1 quantitative
%ones, by setting >> = 3, > = 2, etc. This should yield a mean test value
%for ab_rel, bc_rel etc. (maybe find median instead of mean?)

%4. Start with guess for a_true, and optimise for each individual's set of 4-5 constraints. e.g. if
%Participant 1 says a << b, b >> c and c == d, then optimise the mean test
%values with these constraints to find lowest possible error. Save the
%result in cumulative answer variable (see optimproblem below for simple 2
%factor case)

%5. Repeat 4. for all participants

%6. Divide cumulative answer variable by total participants to find 'true'
%values for a,b,c

    clc;
    clf;
    clear;





%read in survey data in tabular form
AllSurveys = readtable('SurveyResults.csv', 'Range', 'A41:AM66');
%Access each variable's results 
Factor1 = AllSurveys.Var2(2:end);
Factor2 = AllSurveys.Var3(2:end);
Factor1_2 = AllSurveys.Var4(2:end);
Factor7_8 = AllSurveys.Var5(2:end);
Factor8_9 = AllSurveys.Var6(2:end);
Factor7_9 = AllSurveys.Var7(2:end);

Factor3 = AllSurveys.Var8(2:end);
Factor4 = AllSurveys.Var9(2:end);
Factor9_10 = AllSurveys.Var10(2:end);
Factor4_5 = AllSurveys.Var11(2:end);
Factor10_11 = AllSurveys.Var12(2:end);
Factor9_11 = AllSurveys.Var13(2:end);
Factor1_6 = AllSurveys.Var14(2:end);


Factor5 = AllSurveys.Var15(2:end);
Factor6 = AllSurveys.Var16(2:end);
Factor3_4 = AllSurveys.Var17(2:end);
Factor2_3 = AllSurveys.Var18(2:end);
Factor5_7 = AllSurveys.Var19(2:end);
Factor12_2 = AllSurveys.Var20(2:end);

Factor7 = AllSurveys.Var21(2:end);
Factor8 = AllSurveys.Var22(2:end);
Factor12_1 = AllSurveys.Var23(2:end);
Factor2_4 = AllSurveys.Var24(2:end);
Factor4_6 = AllSurveys.Var25(2:end);
Factor10_12 = AllSurveys.Var26(2:end);

Factor9 = AllSurveys.Var27(2:end);
Factor10 = AllSurveys.Var28(2:end);
Factor5_6 = AllSurveys.Var29(2:end);
Factor6_7 = AllSurveys.Var30(2:end);
Factor6_8 = AllSurveys.Var31(2:end);
Factor8_10 = AllSurveys.Var32(2:end);
Factor7_12 = AllSurveys.Var33(2:end);

Factor11 = AllSurveys.Var34(2:end);
Factor12 = AllSurveys.Var35(2:end);
Factor11_12 = AllSurveys.Var36(2:end);
Factor1_3 = AllSurveys.Var37(2:end);
Factor3_5 = AllSurveys.Var38(2:end);
Factor11_1 = AllSurveys.Var39(2:end);


%plot the single factor data in 3-column bar graphs (repeat for all 12
%factors)


figure(1)
subplot(2,2,1)
c = ["closer", "doesnt matter", "further away"];
d = [sum(count(Factor1, "blue")), sum(count(Factor1, "doesnt matter")), sum(count(Factor1, "black"))];
bar(c,d);
title('Vehicle Travelling Closer or Further Away?')

subplot(2,2,2)
c = ["with zebra", "doesnt matter", "without zebra"];
d = [sum(count(Factor2, "zebra")), sum(count(Factor2, "doesnt matter")), sum(count(Factor2, "no zebra"))];
bar(c,d);
title('Zebra Crossing or Not?')

subplot(2,2,3)
c = ["louder sounds", "doesnt matter", "softer sounds"];
d = [sum(count(Factor3, "louder")), sum(count(Factor3, "doesnt matter")), sum(count(Factor3, "softer"))];
bar(c,d);
title('Louder or Softer Vehicle Sounds?')

subplot(2,2,4)
c = ["lighter colour", "doesnt matter", "darker colour"];
d = [sum(count(Factor4, "lighter")), sum(count(Factor4, "doesnt matter")), sum(count(Factor4, "darker"))];
bar(c,d);
title('Lighter or Darker Colour?')
exportgraphics(gcf, 'SingleFactorFigure1.png');

figure(2)
subplot(2,2,1)
c = ["slower deceleration", "doesnt matter", "faster deceleration"];
d = [sum(count(Factor5, "slower")), sum(count(Factor5, "doesnt matter")), sum(count(Factor5, "faster"))];
bar(c,d);
title('Faster or Slower Deceleration?')

subplot(2,2,2)
c = ["smaller vehicle", "doesnt matter", "larger vehicle"];
d = [sum(count(Factor6, "smaller")), sum(count(Factor6, "doesnt matter")), sum(count(Factor6, "larger"))];
bar(c,d);
title('Smaller or Larger Vehicle?')

subplot(2,2,3)
c = ["stop signs", "doesnt matter", "no stop signs"];
d = [sum(count(Factor7, "stop signs")), sum(count(Factor7, "doesnt matter")), sum(count(Factor7, "no stop signs"))];
bar(c,d);
title('Crossing at Stop Signs or Not?')

subplot(2,2,4)
c = ["brighter", "doesnt matter", "darker"];
d = [sum(count(Factor8, "brighter")), sum(count(Factor8, "doesnt matter")), sum(count(Factor8, "darker"))];
bar(c,d);
title('Brighter or Darker Environment?')
exportgraphics(gcf, 'SingleFactorFigure2.png');

figure(3)
subplot(2,2,1)
c = ["parked cars", "doesnt matter", "no parked cars"];
d = [sum(count(Factor9, "nope")), sum(count(Factor9, "doesnt matter")), sum(count(Factor9, "were not"))];
bar(c,d);
title('Parked Cars by Crossing or Not?')

subplot(2,2,2)
c = ["faster speed", "doesnt matter", "slower speed"];
d = [sum(count(Factor10, "higher")), sum(count(Factor10, "doesnt matter")), sum(count(Factor10, "lower"))];
bar(c,d);
title('Faster or Slower Speed?')

subplot(2,2,3)
c = ["defensive", "doesnt matter", "aggressive"];
d = [sum(count(Factor11, "defensively")), sum(count(Factor11, "doesnt matter")), sum(count(Factor11, "aggressively"))];
bar(c,d);
title('Defensive or Aggressive Driving?')

subplot(2,2,4)
c = ["closer", "doesnt matter", "further away"];
d = [sum(count(Factor12, "closer")), sum(count(Factor12, "doesnt matter")), sum(count(Factor12, "further away"))];
bar(c,d);
title('Vehicle Stopping Closer or Further Away?')
exportgraphics(gcf, 'SingleFactorFigure3.png');



%Plot comparison survey data as bar plots
figure(4)
c = ["strongly disagree", "disagree", "moderately disagree", "slightly disagree", "neither", "slightly agree", "moderately agree", "agree", "strongly agree"];
d = [length(find(Factor1_2=="strongly disagree")), length(find(Factor1_2=="disagree")), length(find(Factor1_2=="moderately disagree")), length(find(Factor1_2=="slightly disagree")), length(find(Factor1_2=="neither")), length(find(Factor1_2=="slightly agree")), length(find(Factor1_2=="moderately agree")), length(find(Factor1_2=="agree")), length(find(Factor1_2=="strongly agree"))];
bar(c,d)
title('Rather make vehicle travel further away than cross on a zebra crossing')
exportgraphics(gcf, 'Fac1_2.png');

figure(5)
c = ["strongly disagree", "disagree", "moderately disagree", "slightly disagree", "neither", "slightly agree", "moderately agree", "agree", "strongly agree"];
d = [length(find(Factor7_8=="strongly disagree")), length(find(Factor7_8=="disagree")), length(find(Factor7_8=="moderately disagree")), length(find(Factor7_8=="slightly disagree")), length(find(Factor7_8=="neither")), length(find(Factor7_8=="slightly agree")), length(find(Factor7_8=="moderately agree")), length(find(Factor7_8=="agree")), length(find(Factor7_8=="strongly agree"))];
bar(c,d)
title('Rather cross at stop signs than increase ambient light level')
exportgraphics(gcf, 'Fac7_8.png');

figure(6)
c = ["strongly disagree", "disagree", "moderately disagree", "slightly disagree", "neither", "slightly agree", "moderately agree", "agree", "strongly agree"];
d = [length(find(Factor8_9=="strongly disagree")), length(find(Factor8_9=="disagree")), length(find(Factor8_9=="moderately disagree")), length(find(Factor8_9=="slightly disagree")), length(find(Factor8_9=="neither")), length(find(Factor8_9=="slightly agree")), length(find(Factor8_9=="moderately agree")), length(find(Factor8_9=="agree")), length(find(Factor8_9=="strongly agree"))];
bar(c,d)
title('Rather increase ambient light level than cross without obstructed vision')
exportgraphics(gcf, 'Fac8_9.png');

figure(7)
c = ["strongly disagree", "disagree", "moderately disagree", "slightly disagree", "neither", "slightly agree", "moderately agree", "agree", "strongly agree"];
d = [length(find(Factor7_9=="strongly disagree")), length(find(Factor7_9=="disagree")), length(find(Factor7_9=="moderately disagree")), length(find(Factor7_9=="slightly disagree")), length(find(Factor7_9=="neither")), length(find(Factor7_9=="slightly agree")), length(find(Factor7_9=="moderately agree")), length(find(Factor7_9=="agree")), length(find(Factor7_9=="strongly agree"))];
bar(c,d)
title('Rather cross at stop signs than cross without obstructed vision')
exportgraphics(gcf, 'Fac7_9.png');

figure(8)
c = ["strongly disagree", "disagree", "moderately disagree", "slightly disagree", "neither", "slightly agree", "moderately agree", "agree", "strongly agree"];
d = [length(find(Factor9_10=="strongly disagree")), length(find(Factor9_10=="disagree")), length(find(Factor9_10=="moderately disagree")), length(find(Factor9_10=="slightly disagree")), length(find(Factor9_10=="neither")), length(find(Factor9_10=="slightly agree")), length(find(Factor9_10=="moderately agree")), length(find(Factor9_10=="agree")), length(find(Factor9_10=="strongly agree"))];
bar(c,d)
title('Rather cross without obstructed vision than decrease vehicle speed')
exportgraphics(gcf, 'Fac9_10.png');

figure(9)
c = ["strongly disagree", "disagree", "moderately disagree", "slightly disagree", "neither", "slightly agree", "moderately agree", "agree", "strongly agree"];
d = [length(find(Factor4_5=="strongly disagree")), length(find(Factor4_5=="disagree")), length(find(Factor4_5=="moderately disagree")), length(find(Factor4_5=="slightly disagree")), length(find(Factor4_5=="neither")), length(find(Factor4_5=="slightly agree")), length(find(Factor4_5=="moderately agree")), length(find(Factor4_5=="agree")), length(find(Factor4_5=="strongly agree"))];
bar(c,d)
title('Rather lighten vehicle colour than slower deceleration')
exportgraphics(gcf, 'Fac4_5.png');

figure(10)
c = ["strongly disagree", "disagree", "moderately disagree", "slightly disagree", "neither", "slightly agree", "moderately agree", "agree", "strongly agree"];
d = [length(find(Factor10_11=="strongly disagree")), length(find(Factor10_11=="disagree")), length(find(Factor10_11=="moderately disagree")), length(find(Factor10_11=="slightly disagree")), length(find(Factor10_11=="neither")), length(find(Factor10_11=="slightly agree")), length(find(Factor10_11=="moderately agree")), length(find(Factor10_11=="agree")), length(find(Factor10_11=="strongly agree"))];
bar(c,d)
title('Rather decrease speed than more defensive driving')
exportgraphics(gcf, 'Fac10_11.png');

figure(11)
c = ["strongly disagree", "disagree", "moderately disagree", "slightly disagree", "neither", "slightly agree", "moderately agree", "agree", "strongly agree"];
d = [length(find(Factor9_11=="strongly disagree")), length(find(Factor9_11=="disagree")), length(find(Factor9_11=="moderately disagree")), length(find(Factor9_11=="slightly disagree")), length(find(Factor9_11=="neither")), length(find(Factor9_11=="slightly agree")), length(find(Factor9_11=="moderately agree")), length(find(Factor9_11=="agree")), length(find(Factor9_11=="strongly agree"))];
bar(c,d)
title('Rather cross without obstructed vision than more defensive driving')
exportgraphics(gcf, 'Fac9_11.png');

figure(12)
c = ["strongly disagree", "disagree", "moderately disagree", "slightly disagree", "neither", "slightly agree", "moderately agree", "agree", "strongly agree"];
d = [length(find(Factor1_6=="strongly disagree")), length(find(Factor1_6=="disagree")), length(find(Factor1_6=="moderately disagree")), length(find(Factor1_6=="slightly disagree")), length(find(Factor1_6=="neither")), length(find(Factor1_6=="slightly agree")), length(find(Factor1_6=="moderately agree")), length(find(Factor1_6=="agree")), length(find(Factor1_6=="strongly agree"))];
bar(c,d)
title('Rather make vehicle travel further away than make vehicle smaller')
exportgraphics(gcf, 'Fac1_6.png');

figure(13)
c = ["strongly disagree", "disagree", "moderately disagree", "slightly disagree", "neither", "slightly agree", "moderately agree", "agree", "strongly agree"];
d = [length(find(Factor3_4=="strongly disagree")), length(find(Factor3_4=="disagree")), length(find(Factor3_4=="moderately disagree")), length(find(Factor3_4=="slightly disagree")), length(find(Factor3_4=="neither")), length(find(Factor3_4=="slightly agree")), length(find(Factor3_4=="moderately agree")), length(find(Factor3_4=="agree")), length(find(Factor3_4=="strongly agree"))];
bar(c,d)
title('Rather make vehicle sounds louder than lighten vehicle colour')
exportgraphics(gcf, 'Fac3_4.png');

figure(14)
c = ["strongly disagree", "disagree", "moderately disagree", "slightly disagree", "neither", "slightly agree", "moderately agree", "agree", "strongly agree"];
d = [length(find(Factor2_3=="strongly disagree")), length(find(Factor2_3=="disagree")), length(find(Factor2_3=="moderately disagree")), length(find(Factor2_3=="slightly disagree")), length(find(Factor2_3=="neither")), length(find(Factor2_3=="slightly agree")), length(find(Factor2_3=="moderately agree")), length(find(Factor2_3=="agree")), length(find(Factor2_3=="strongly agree"))];
bar(c,d)
title('Rather cross on a zebra crossing than make vehicle sounds louder')
exportgraphics(gcf, 'Fac2_3.png');

figure(15)
c = ["strongly disagree", "disagree", "moderately disagree", "slightly disagree", "neither", "slightly agree", "moderately agree", "agree", "strongly agree"];
d = [length(find(Factor5_7=="strongly disagree")), length(find(Factor5_7=="disagree")), length(find(Factor5_7=="moderately disagree")), length(find(Factor5_7=="slightly disagree")), length(find(Factor5_7=="neither")), length(find(Factor5_7=="slightly agree")), length(find(Factor5_7=="moderately agree")), length(find(Factor5_7=="agree")), length(find(Factor5_7=="strongly agree"))];
bar(c,d)
title('Rather slower deceleration than cross at stop signs')
exportgraphics(gcf, 'Fac5_7.png');

figure(16)
c = ["strongly disagree", "disagree", "moderately disagree", "slightly disagree", "neither", "slightly agree", "moderately agree", "agree", "strongly agree"];
d = [length(find(Factor12_2=="strongly disagree")), length(find(Factor12_2=="disagree")), length(find(Factor12_2=="moderately disagree")), length(find(Factor12_2=="slightly disagree")), length(find(Factor12_2=="neither")), length(find(Factor12_2=="slightly agree")), length(find(Factor12_2=="moderately agree")), length(find(Factor12_2=="agree")), length(find(Factor12_2=="strongly agree"))];
bar(c,d)
title('Rather vehicle stop further from crossing than cross on a zebra crossing')
exportgraphics(gcf, 'Fac12_2.png');

figure(17)
c = ["strongly disagree", "disagree", "moderately disagree", "slightly disagree", "neither", "slightly agree", "moderately agree", "agree", "strongly agree"];
d = [length(find(Factor12_1=="strongly disagree")), length(find(Factor12_1=="disagree")), length(find(Factor12_1=="moderately disagree")), length(find(Factor12_1=="slightly disagree")), length(find(Factor12_1=="neither")), length(find(Factor12_1=="slightly agree")), length(find(Factor12_1=="moderately agree")), length(find(Factor12_1=="agree")), length(find(Factor12_1=="strongly agree"))];
bar(c,d)
title('Rather vehicle stop further from crossing than make vehicle travel further away')
exportgraphics(gcf, 'Fac12_1.png');

figure(18)
c = ["strongly disagree", "disagree", "moderately disagree", "slightly disagree", "neither", "slightly agree", "moderately agree", "agree", "strongly agree"];
d = [length(find(Factor2_4=="strongly disagree")), length(find(Factor2_4=="disagree")), length(find(Factor2_4=="moderately disagree")), length(find(Factor2_4=="slightly disagree")), length(find(Factor2_4=="neither")), length(find(Factor2_4=="slightly agree")), length(find(Factor2_4=="moderately agree")), length(find(Factor2_4=="agree")), length(find(Factor2_4=="strongly agree"))];
bar(c,d)
title('Rather cross on a zebra crossing than lighten vehicle colour')
exportgraphics(gcf, 'Fac2_4.png');

figure(19)
c = ["strongly disagree", "disagree", "moderately disagree", "slightly disagree", "neither", "slightly agree", "moderately agree", "agree", "strongly agree"];
d = [length(find(Factor4_6=="strongly disagree")), length(find(Factor4_6=="disagree")), length(find(Factor4_6=="moderately disagree")), length(find(Factor4_6=="slightly disagree")), length(find(Factor4_6=="neither")), length(find(Factor4_6=="slightly agree")), length(find(Factor4_6=="moderately agree")), length(find(Factor4_6=="agree")), length(find(Factor4_6=="strongly agree"))];
bar(c,d)
title('Rather lighten vehicle colour than make vehicle smaller')
exportgraphics(gcf, 'Fac4_6.png');

figure(20)
c = ["strongly disagree", "disagree", "moderately disagree", "slightly disagree", "neither", "slightly agree", "moderately agree", "agree", "strongly agree"];
d = [length(find(Factor10_12=="strongly disagree")), length(find(Factor10_12=="disagree")), length(find(Factor10_12=="moderately disagree")), length(find(Factor10_12=="slightly disagree")), length(find(Factor10_12=="neither")), length(find(Factor10_12=="slightly agree")), length(find(Factor10_12=="moderately agree")), length(find(Factor10_12=="agree")), length(find(Factor10_12=="strongly agree"))];
bar(c,d)
title('Rather decrease speed than make vehicle stop further from crossing')
exportgraphics(gcf, 'Fac10_12.png');

figure(21)
c = ["strongly disagree", "disagree", "moderately disagree", "slightly disagree", "neither", "slightly agree", "moderately agree", "agree", "strongly agree"];
d = [length(find(Factor5_6=="strongly disagree")), length(find(Factor5_6=="disagree")), length(find(Factor5_6=="moderately disagree")), length(find(Factor5_6=="slightly disagree")), length(find(Factor5_6=="neither")), length(find(Factor5_6=="slightly agree")), length(find(Factor5_6=="moderately agree")), length(find(Factor5_6=="agree")), length(find(Factor5_6=="strongly agree"))];
bar(c,d)
title('Rather decrease deceleration than make vehicle smaller')
exportgraphics(gcf, 'Fac5_6.png');

figure(22)
c = ["strongly disagree", "disagree", "moderately disagree", "slightly disagree", "neither", "slightly agree", "moderately agree", "agree", "strongly agree"];
d = [length(find(Factor6_7=="strongly disagree")), length(find(Factor6_7=="disagree")), length(find(Factor6_7=="moderately disagree")), length(find(Factor6_7=="slightly disagree")), length(find(Factor6_7=="neither")), length(find(Factor6_7=="slightly agree")), length(find(Factor6_7=="moderately agree")), length(find(Factor6_7=="agree")), length(find(Factor6_7=="strongly agree"))];
bar(c,d)
title('Rather make vehicle smaller than cross at stop signs')
exportgraphics(gcf, 'Fac6_7.png');

figure(23)
c = ["strongly disagree", "disagree", "moderately disagree", "slightly disagree", "neither", "slightly agree", "moderately agree", "agree", "strongly agree"];
d = [length(find(Factor6_8=="strongly disagree")), length(find(Factor6_8=="disagree")), length(find(Factor6_8=="moderately disagree")), length(find(Factor6_8=="slightly disagree")), length(find(Factor6_8=="neither")), length(find(Factor6_8=="slightly agree")), length(find(Factor6_8=="moderately agree")), length(find(Factor6_8=="agree")), length(find(Factor6_8=="strongly agree"))];
bar(c,d)
title('Rather make vehicle smaller than increase ambient light level')
exportgraphics(gcf, 'Fac6_8.png');

figure(24)
c = ["strongly disagree", "disagree", "moderately disagree", "slightly disagree", "neither", "slightly agree", "moderately agree", "agree", "strongly agree"];
d = [length(find(Factor8_10=="strongly disagree")), length(find(Factor8_10=="disagree")), length(find(Factor8_10=="moderately disagree")), length(find(Factor8_10=="slightly disagree")), length(find(Factor8_10=="neither")), length(find(Factor8_10=="slightly agree")), length(find(Factor8_10=="moderately agree")), length(find(Factor8_10=="agree")), length(find(Factor8_10=="strongly agree"))];
bar(c,d)
title('Rather increase ambient light level than decrease speed')
exportgraphics(gcf, 'Fac8_10.png');

figure(25)
c = ["strongly disagree", "disagree", "moderately disagree", "slightly disagree", "neither", "slightly agree", "moderately agree", "agree", "strongly agree"];
d = [length(find(Factor7_12=="strongly disagree")), length(find(Factor7_12=="disagree")), length(find(Factor7_12=="moderately disagree")), length(find(Factor7_12=="slightly disagree")), length(find(Factor7_12=="neither")), length(find(Factor7_12=="slightly agree")), length(find(Factor7_12=="moderately agree")), length(find(Factor7_12=="agree")), length(find(Factor7_12=="strongly agree"))];
bar(c,d)
title('Rather cross at stop signs than make vehicle stop further from crossing')
exportgraphics(gcf, 'Fac7_12.png');

figure(26)
c = ["strongly disagree", "disagree", "moderately disagree", "slightly disagree", "neither", "slightly agree", "moderately agree", "agree", "strongly agree"];
d = [length(find(Factor11_12=="strongly disagree")), length(find(Factor11_12=="disagree")), length(find(Factor11_12=="moderately disagree")), length(find(Factor11_12=="slightly disagree")), length(find(Factor11_12=="neither")), length(find(Factor11_12=="slightly agree")), length(find(Factor11_12=="moderately agree")), length(find(Factor11_12=="agree")), length(find(Factor11_12=="strongly agree"))];
bar(c,d)
title('Rather more defensive driving than make the vehicle stop further from crossing')
exportgraphics(gcf, 'Fac11_12.png');

figure(27)
c = ["strongly disagree", "disagree", "moderately disagree", "slightly disagree", "neither", "slightly agree", "moderately agree", "agree", "strongly agree"];
d = [length(find(Factor1_3=="strongly disagree")), length(find(Factor1_3=="disagree")), length(find(Factor1_3=="moderately disagree")), length(find(Factor1_3=="slightly disagree")), length(find(Factor1_3=="neither")), length(find(Factor1_3=="slightly agree")), length(find(Factor1_3=="moderately agree")), length(find(Factor1_3=="agree")), length(find(Factor1_3=="strongly agree"))];
bar(c,d)
title('Rather make vehicle travel further away than make vehicle sounds louder')
exportgraphics(gcf, 'Fac1_3.png');

figure(28)
c = ["strongly disagree", "disagree", "moderately disagree", "slightly disagree", "neither", "slightly agree", "moderately agree", "agree", "strongly agree"];
d = [length(find(Factor3_5=="strongly disagree")), length(find(Factor3_5=="disagree")), length(find(Factor3_5=="moderately disagree")), length(find(Factor3_5=="slightly disagree")), length(find(Factor3_5=="neither")), length(find(Factor3_5=="slightly agree")), length(find(Factor3_5=="moderately agree")), length(find(Factor3_5=="agree")), length(find(Factor3_5=="strongly agree"))];
bar(c,d)
title('Rather make vehicle sounds louder than decrease deceleration')
exportgraphics(gcf, 'Fac3_5.png');

figure(29)
c = ["strongly disagree", "disagree", "moderately disagree", "slightly disagree", "neither", "slightly agree", "moderately agree", "agree", "strongly agree"];
d = [length(find(Factor11_1=="strongly disagree")), length(find(Factor11_1=="disagree")), length(find(Factor11_1=="moderately disagree")), length(find(Factor11_1=="slightly disagree")), length(find(Factor11_1=="neither")), length(find(Factor11_1=="slightly agree")), length(find(Factor11_1=="moderately agree")), length(find(Factor11_1=="agree")), length(find(Factor11_1=="strongly agree"))];
bar(c,d)
title('Rather more defensive driving than make vehicle travel further away')
exportgraphics(gcf, 'Fac11_1.png');



%Turn factor comparison survey data vectors into vectors of numbers (repeat
%for all pairs of factors compared)
ScoredFactor1_2 = WeighFactorArray(Factor1_2);
ScoredFactor7_8 = WeighFactorArray(Factor7_8);
ScoredFactor8_9 = WeighFactorArray(Factor8_9);
ScoredFactor7_9 = WeighFactorArray(Factor7_9);

ScoredFactor9_10 = WeighFactorArray(Factor9_10);
ScoredFactor4_5 = WeighFactorArray(Factor4_5);
ScoredFactor10_11 = WeighFactorArray(Factor10_11);
ScoredFactor9_11 = WeighFactorArray(Factor9_11);
ScoredFactor1_6 = WeighFactorArray(Factor1_6);

ScoredFactor3_4 = WeighFactorArray(Factor3_4);
ScoredFactor2_3 = WeighFactorArray(Factor2_3);
ScoredFactor5_7 = WeighFactorArray(Factor5_7);
ScoredFactor12_2 = WeighFactorArray(Factor12_2);


ScoredFactor12_1 = WeighFactorArray(Factor12_1);
ScoredFactor2_4 = WeighFactorArray(Factor2_4);
ScoredFactor4_6 = WeighFactorArray(Factor4_6);
ScoredFactor10_12 = WeighFactorArray(Factor10_12);

ScoredFactor5_6 = WeighFactorArray(Factor5_6);
ScoredFactor6_7 = WeighFactorArray(Factor6_7);
ScoredFactor6_8 = WeighFactorArray(Factor6_8);
ScoredFactor8_10 = WeighFactorArray(Factor8_10);
ScoredFactor7_12 = WeighFactorArray(Factor7_12);

ScoredFactor11_12 = WeighFactorArray(Factor11_12);
ScoredFactor1_3 = WeighFactorArray(Factor1_3);
ScoredFactor3_5 = WeighFactorArray(Factor3_5);
ScoredFactor11_1 = WeighFactorArray(Factor11_1);


%Find Variance on Score distribution
figure(30)
Variance1_2 = var(ScoredFactor1_2);
subplot(2,2,1)
boxplot(ScoredFactor1_2);
Variance7_8 = var(ScoredFactor7_8);
subplot(2,2,2)
boxplot(ScoredFactor7_8);
Variance8_9 = var(ScoredFactor8_9);
subplot(2,2,3)
boxplot(ScoredFactor8_9);
Variance7_9 = var(ScoredFactor7_9);
subplot(2,2,4)
boxplot(ScoredFactor7_9);

figure(31)
Variance9_10 = var(ScoredFactor9_10);
subplot(3,2,1)
boxplot(ScoredFactor9_10);
Variance4_5 = var(ScoredFactor4_5);
subplot(3,2,2)
boxplot(ScoredFactor4_5);
Variance10_11 = var(ScoredFactor10_11);
subplot(3,2,3)
boxplot(ScoredFactor10_11);
Variance9_11 = var(ScoredFactor9_11);
subplot(3,2,4)
boxplot(ScoredFactor9_11);
Variance1_6 = var(ScoredFactor1_6);
subplot(3,2,5)
boxplot(ScoredFactor1_6);

figure(32)
Variance3_4 = var(ScoredFactor3_4);
subplot(2,2,1)
boxplot(ScoredFactor3_4);
Variance2_3 = var(ScoredFactor2_3);
subplot(2,2,2)
boxplot(ScoredFactor2_3);
Variance5_7 = var(ScoredFactor5_7);
subplot(2,2,3)
boxplot(ScoredFactor5_7);
Variance12_2 = var(ScoredFactor12_2);
subplot(2,2,4)
boxplot(ScoredFactor12_2);

figure(33)
Variance12_1 = var(ScoredFactor12_1);
subplot(2,2,1)
boxplot(ScoredFactor12_1);
Variance2_4 = var(ScoredFactor2_4);
subplot(2,2,2)
boxplot(ScoredFactor2_4);
Variance4_6 = var(ScoredFactor4_6);
subplot(2,2,3)
boxplot(ScoredFactor4_6);
Variance10_12 = var(ScoredFactor10_12);
subplot(2,2,4)
boxplot(ScoredFactor10_12);

figure(34)
Variance5_6 = var(ScoredFactor5_6);
subplot(3,2,1)
boxplot(ScoredFactor5_6);
Variance6_7 = var(ScoredFactor6_7);
subplot(3,2,2)
boxplot(ScoredFactor6_7);
Variance6_8 = var(ScoredFactor6_8);
subplot(3,2,3)
boxplot(ScoredFactor6_8);
Variance8_10 = var(ScoredFactor8_10);
subplot(3,2,4)
boxplot(ScoredFactor8_10);
Variance7_12 = var(ScoredFactor7_12);
subplot(3,2,5)
boxplot(ScoredFactor7_12);

figure(35)
Variance11_12 = var(ScoredFactor11_12);
subplot(2,2,1)
boxplot(ScoredFactor11_12);
Variance1_3 = var(ScoredFactor1_3);
subplot(2,2,2)
boxplot(ScoredFactor1_3);
Variance3_5 = var(ScoredFactor3_5);
subplot(2,2,3)
boxplot(ScoredFactor3_5);
Variance11_1 = var(ScoredFactor11_1);
subplot(2,2,4)
boxplot(ScoredFactor11_1);


%Use the scored factor vectos to calculate mean of each vector (repeat
%for all pairs of factors)

if mean(ScoredFactor1_2) > 0
    Relationship1_2 = mean(ScoredFactor1_2) + 1;
else if mean(ScoredFactor1_2) < 0
     Relationship1_2 = 1/(abs(mean(ScoredFactor1_2)-1));
end
end

if mean(ScoredFactor7_8) > 0
    Relationship7_8 = mean(ScoredFactor7_8) + 1;
else if mean(ScoredFactor7_8) < 0
    Relationship7_8 = 1/(abs(mean(ScoredFactor7_8)-1));
end
end


if mean(ScoredFactor8_9) > 0
    Relationship8_9 = mean(ScoredFactor8_9) + 1;
else if mean(ScoredFactor8_9) < 0
    Relationship8_9 = 1/(abs(mean(ScoredFactor8_9)-1));
end
end


if mean(ScoredFactor7_9) > 0
    Relationship7_9 = mean(ScoredFactor7_9) + 1;
else if mean(ScoredFactor7_9) < 0
    Relationship7_9 = 1/(abs(mean(ScoredFactor7_9)-1));
end
end

if mean(ScoredFactor9_10) > 0
    Relationship9_10 = mean(ScoredFactor9_10) + 1;
else if mean(ScoredFactor9_10) < 0
    Relationship9_10 = 1/(abs(mean(ScoredFactor9_10)-1));
end
end


if mean(ScoredFactor4_5) > 0
    Relationship4_5 = mean(ScoredFactor4_5) + 1;
else if mean(ScoredFactor4_5) < 0
    Relationship4_5 = 1/(abs(mean(ScoredFactor4_5)-1));
end
end


if mean(ScoredFactor10_11) > 0
    Relationship10_11 = mean(ScoredFactor10_11) + 1;
else if mean(ScoredFactor10_11) < 0
    Relationship10_11 = 1/(abs(mean(ScoredFactor10_11)-1));
end
end

if mean(ScoredFactor9_11) > 0
    Relationship9_11 = mean(ScoredFactor9_11) + 1;
else if mean(ScoredFactor9_11) < 0
    Relationship9_11 = 1/(abs(mean(ScoredFactor9_11)-1));
end
end

if mean(ScoredFactor1_6) > 0
    Relationship1_6 = mean(ScoredFactor1_6) + 1;
else if mean(ScoredFactor1_6) < 0
    Relationship1_6 = 1/(abs(mean(ScoredFactor1_6)-1));
end
end

if mean(ScoredFactor3_4) > 0
    Relationship3_4 = mean(ScoredFactor3_4) + 1;
else if mean(ScoredFactor3_4) < 0
    Relationship3_4 = 1/(abs(mean(ScoredFactor3_4)-1));
end
end

if mean(ScoredFactor2_3) > 0
    Relationship2_3 = mean(ScoredFactor2_3) + 1;
else if mean(ScoredFactor2_3) < 0
    Relationship2_3 = 1/(abs(mean(ScoredFactor2_3)-1));
end
end

if mean(ScoredFactor5_7) > 0
    Relationship5_7 = mean(ScoredFactor5_7) + 1;
else if mean(ScoredFactor5_7) < 0
    Relationship5_7 = 1/(abs(mean(ScoredFactor5_7)-1));
end
end

if mean(ScoredFactor12_2) > 0
    Relationship12_2 = mean(ScoredFactor12_2) + 1;
else if mean(ScoredFactor12_2) < 0
    Relationship12_2 = 1/(abs(mean(ScoredFactor12_2)-1));
end
end

if mean(ScoredFactor12_1) > 0
    Relationship12_1 = mean(ScoredFactor12_1) + 1;
else if mean(ScoredFactor12_1) < 0
    Relationship12_1 = 1/(abs(mean(ScoredFactor12_1)-1));
end
end

if mean(ScoredFactor2_4) > 0
    Relationship2_4 = mean(ScoredFactor2_4) + 1;
else if mean(ScoredFactor2_4) < 0
    Relationship2_4 = 1/(abs(mean(ScoredFactor2_4)-1));
end
end

if mean(ScoredFactor4_6) > 0
    Relationship4_6 = mean(ScoredFactor4_6) + 1;
else if mean(ScoredFactor4_6) < 0
    Relationship4_6 = 1/(abs(mean(ScoredFactor4_6)-1));
end
end

if mean(ScoredFactor10_12) > 0
    Relationship10_12 = mean(ScoredFactor10_12) + 1;
else if mean(ScoredFactor10_12) < 0
    Relationship10_12 = 1/(abs(mean(ScoredFactor10_12)-1));
end
end

if mean(ScoredFactor5_6) > 0
    Relationship5_6 = mean(ScoredFactor5_6) + 1;
else if mean(ScoredFactor5_6) < 0
    Relationship5_6 = 1/(abs(mean(ScoredFactor5_6)-1));
end
end

if mean(ScoredFactor6_7) > 0
    Relationship6_7 = mean(ScoredFactor6_7) + 1;
else if mean(ScoredFactor6_7) < 0
    Relationship6_7 = 1/(abs(mean(ScoredFactor6_7)-1));
end
end

if mean(ScoredFactor6_8) > 0
    Relationship6_8 = mean(ScoredFactor6_8) + 1;
else if mean(ScoredFactor6_8) < 0
    Relationship6_8 = 1/(abs(mean(ScoredFactor6_8)-1));
end
end

if mean(ScoredFactor8_10) > 0
    Relationship8_10 = mean(ScoredFactor8_10) + 1;
else if mean(ScoredFactor8_10) < 0
    Relationship8_10 = 1/(abs(mean(ScoredFactor8_10)-1));
end
end

if mean(ScoredFactor7_12) > 0
    Relationship7_12 = mean(ScoredFactor7_12) + 1;
else if mean(ScoredFactor7_12) < 0
    Relationship7_12 = 1/(abs(mean(ScoredFactor7_12)-1));
end
end

if mean(ScoredFactor11_12) > 0
    Relationship11_12 = mean(ScoredFactor11_12) + 1;
else if mean(ScoredFactor11_12) < 0
    Relationship11_12 = 1/(abs(mean(ScoredFactor11_12)-1));
end
end

if mean(ScoredFactor1_3) > 0
    Relationship1_3 = mean(ScoredFactor1_3) + 1;
else if mean(ScoredFactor1_3) < 0
    Relationship1_3 = 1/(abs(mean(ScoredFactor1_3)-1));
end
end

if mean(ScoredFactor3_5) > 0
    Relationship3_5 = mean(ScoredFactor3_5) + 1;
else if mean(ScoredFactor3_5) < 0
    Relationship3_5 = 1/(abs(mean(ScoredFactor3_5)-1));
end
end

if mean(ScoredFactor11_1) > 0
    Relationship11_1 = mean(ScoredFactor11_1) + 1;
else if mean(ScoredFactor11_1) < 0
    Relationship11_1 = 1/(abs(mean(ScoredFactor11_1)-1));
end
end

%Test whether Factor 1_6 = Factor1*2*3*4*5*6 

Relationship1_6
Relationship123456 = Relationship1_2*Relationship2_3*Relationship3_4*Relationship4_5*Relationship5_6
Relationship1356 = Relationship1_3*Relationship3_5*Relationship5_6
Relationship1246 = Relationship1_2*Relationship2_4*Relationship4_6
Relationship11211109876 = 1/(Relationship12_1*Relationship11_12*Relationship10_11*Relationship9_10*Relationship8_9*Relationship7_8*Relationship6_7)
Relationship1_11_9_7_6 = 1/(Relationship11_1*Relationship9_11*Relationship7_9*Relationship6_7)
Relationship1_12_10_8_6 = 1/(Relationship12_1*Relationship10_12*Relationship8_10*Relationship6_8)


%Test whether Factor 7_12 = Factoretc.

Relationship7_12
Relationship789101112 = Relationship7_8*Relationship8_9*Relationship9_10*Relationship10_11*Relationship11_12
Relationship791112 = Relationship7_9*Relationship9_11*Relationship11_12
Relationship781012 = Relationship7_8*Relationship8_10*Relationship10_12
Relationship765432112 = 1/(Relationship6_7*Relationship5_6*Relationship4_5*Relationship3_4*Relationship2_3*Relationship1_2*Relationship12_1)
Relationship753112 = 1/(Relationship5_7*Relationship3_5*Relationship1_3*Relationship12_1)
Relationship764212 = 1/(Relationship6_7*Relationship4_6*Relationship2_4*Relationship12_2)


%Certain Relationships have relationships with far more error. Check
%Relationship Plots to see which ones these are: (ones with less well-defined
%spread)

%Plots with very large Variance > 2: 11_12, 1_6, 3_5, 7_12, 9_10
%Do not use above relationships, calculate using others
%Find path of least variance when calculating others!!!!!



%Let Factor 1 = 1 and find relationships of everything to factor 1 (in a
%range including error (i.e. calculate 1_6 via different methods, then find
%the lowest and highest values and keep that as a range)) Maybe also use
%quantitative data to figure out which relationships have highest
%correlation???




%Read in Participant 1 Scenario 1 Survey Data

ParticipantString = ["p1", "p2", "p3", "p4", "p5", "p6", "p7", "p8", "p9", "p10", "p11", "p12", "p13", "p14", "p15", "p16", "p17", "p18", "p19", "p20", "p21", "p22", "p23", "p24", "p25"];
ScenarioString = ["Scen1", "Scen2", "Scen3", "Scen4", "Scen5", "Scen6"];


TimeToCross = zeros(25,6);
TimeStoppedAtCurb = zeros(25,6);
AvgYDistance = zeros(25,6);
VelocityWhenMoving = zeros(25,6);
%Measure of Hesitancy? CorCoeff
HesitancyOfParticipants = zeros(26,6);

figureNum = 36;

for i = 1:length(ParticipantString)
    for j = 1:length(ScenarioString)
        CSVString = ParticipantString(i)+ScenarioString(j);
        

        %Open CSV File
        DataAll = readtable(CSVString);
        
        %Delta Time Data
        TimeData = DataAll.Time_s_;
        
        %Separated X Y and Z Data
        for n = 1:size(DataAll.Position)
            Posn = DataAll.Position(n);
            xyz = char(Posn);
            PosData = regexp(xyz, '[+-]?\d*[.]\d*', 'Match');
            x(n) = str2double(PosData(1));
            y(n) = str2double(PosData(2));
            z(n) = str2double(PosData(3));
        end
        
        
        %Remove preamble at beginning and at end of walk
        indices = find(x < -150);
        x(indices) = [];
        TimeData(indices) = [];
        y(indices) = [];

        indices = find(x > 150);
        x(indices) = [];
        TimeData(indices) = [];
        y(indices) = [];
        
        index = indices(1):length(x);
        

        x(index) = [];
        TimeData(index) = [];
        y(index) = [];
        
        CumulativeTime = cumsum(TimeData);
        TimeToCross(i,j) = CumulativeTime(end);


        x_stopped = x;
        time_stopped = TimeData;
        gradx = gradient(x);
        indices = find(abs(gradx) > 0.55 );
        x_stopped(indices) = [];
        time_stopped(indices) = [];

        indices1 = find(x_stopped < -100);
        x_stopped(indices1) = [];
        indices2 = find(x_stopped > 0);
        x_stopped(indices2) = [];

        time_stopped(indices1) = [];
        time_stopped(indices2) = [];


        x_speed = x;
        time_speed = TimeData;

        indices1 = find(x_speed > -100);
        indices2 = find(x_speed < 0);

        indicesMoving = intersect(indices1, indices2);

        x_speed(indicesMoving) = [];
        time_speed(indicesMoving) = [];

        CumSumTimeSpeed = cumsum(time_speed);
        velocity = (x_speed(1) - x_speed(end))/CumSumTimeSpeed(end);


        A =  corrcoef(x, TimeData);

        HesitancyOfParticipants(i,j) = A(1,2);



        VelocityWhenMoving(i,j) = velocity;
        AvgYDistance(i,j) = mean(y);
        
        CumulativeTimeStopped = cumsum(time_stopped);
        if isempty(CumulativeTimeStopped) == 1
            TimeStoppedAtCurb(i,j) = 0;
        else
            TimeStoppedAtCurb(i,j) = CumulativeTimeStopped(end);
        end

        

        figure(figureNum)
        plot(CumulativeTime, x);
        hold on;
        legend({'Scen1', 'Scen2', 'Scen3', 'Scen4', 'Scen5', 'Scen6'}, 'Location', 'northwest');
        xlabel('Time(s)');
        ylabel('X Distance(cm)');
        title('Participant '+ParticipantString(i)+' Trajectories');
        string = 'Participant '+ParticipantString(i)+' Trajectories.png';
        exportgraphics(gcf, string);

       
    end
    hold off;
    figureNum = figureNum+1;
end

AvgYScenarios = mean(AvgYDistance);
AvgVelocityScenarios = mean(VelocityWhenMoving);

HesitancyOfScenarios = mean(abs(HesitancyOfParticipants));

TimeToCrossScenarios = mean(TimeToCross);
TimeStoppedAtCurbScenarios = mean(TimeStoppedAtCurb);


%Boxplot of each scenario

figure(61)
subplot(2,3,1)
boxplot(TimeToCross(:,1))
subplot(2,3,2)
boxplot(TimeToCross(:,2))
subplot(2,3,3)
boxplot(TimeToCross(:,3))
subplot(2,3,4)
boxplot(TimeToCross(:,4))
subplot(2,3,5)
boxplot(TimeToCross(:,5))
subplot(2,3,6)
boxplot(TimeToCross(:,6))
exportgraphics(gcf, 'TimeToCrossBoxplots.png');

figure(62)
subplot(2,3,1)
boxplot(TimeStoppedAtCurb(:,1))
subplot(2,3,2)
boxplot(TimeStoppedAtCurb(:,2))
subplot(2,3,3)
boxplot(TimeStoppedAtCurb(:,3))
subplot(2,3,4)
boxplot(TimeStoppedAtCurb(:,4))
subplot(2,3,5)
boxplot(TimeStoppedAtCurb(:,5))
subplot(2,3,6)
boxplot(TimeStoppedAtCurb(:,6))
exportgraphics(gcf, 'TimeStoppedAtCurb.png');

%Variance

TimeToCrossVariance1 = var(TimeToCross(:,1));
TimeToCrossVariance2 = var(TimeToCross(:,2));
TimeToCrossVariance3 = var(TimeToCross(:,3));
TimeToCrossVariance4 = var(TimeToCross(:,4));
TimeToCrossVariance5 = var(TimeToCross(:,5));
TimeToCrossVariance6 = var(TimeToCross(:,6));

TimeStoppedAtCurbVariance1 = var(TimeStoppedAtCurb(:,1));
TimeStoppedAtCurbVariance2 = var(TimeStoppedAtCurb(:,2));
TimeStoppedAtCurbVariance3 = var(TimeStoppedAtCurb(:,3));
TimeStoppedAtCurbVariance4 = var(TimeStoppedAtCurb(:,4));
TimeStoppedAtCurbVariance5 = var(TimeStoppedAtCurb(:,5));
TimeStoppedAtCurbVariance6 = var(TimeStoppedAtCurb(:,6));


function WeightedFactorScores = WeighFactorArray(FactorArray)
    for i = 1:length(FactorArray)
        if strcmp(FactorArray(i), 'strongly disagree') == 1
            WeightedFactorScores(i) = -2.5;
        else if strcmp(FactorArray(i), 'disagree') == 1
                WeightedFactorScores(i) = -1.875;
        else if strcmp(FactorArray(i), 'moderately disagree') == 1
                WeightedFactorScores(i) = -1.25;
        else if strcmp(FactorArray(i), 'slightly disagree') == 1
                WeightedFactorScores(i) = -0.625;
        else if strcmp(FactorArray(i), 'neither') == 1
                WeightedFactorScores(i) = 0;
        else if strcmp(FactorArray(i), 'slightly agree') == 1
                WeightedFactorScores(i) = 0.625;
        else if strcmp(FactorArray(i), 'moderately agree') == 1
                WeightedFactorScores(i) = 1.25;
        else if strcmp(FactorArray(i), 'agree') == 1
                WeightedFactorScores(i) = 1.875;
        else if strcmp(FactorArray(i), 'strongly agree') == 1
                WeightedFactorScores(i) = 2.5;
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



