#
# Converted in Julia from https://github.com/mpf/Optimization-Test-Problems
#
#**************************
# SET UP THE INITIAL DATA *
#**************************
#   Problem :
#   *********
#   A problem arising in the estimation of structured O/D matrix
#   Source:
#   M. Bierlaire, private communication
#   see also
#   M. Bierlaire and Ph. L. Toint,
#   MEUSE: an origin-destination estimator that exploits structure,
#   Transportation Research B, 29, 1, 47--60, 1995.
#   SIF input: Ph. Toint, Dec 1989, Corrected July 1993.
#   classification SUR2-MN-30-0
# Parameters
# Number of parking columns
# Number of centroids
# Gamma : general trust in the countings
# Objective for fill-up coefficients
# Inverse of the weights for fill-up coefficients
# Number of available countings
# Inverse of the weight on unknow cells
# Trip ends
# Some interesting values...
# Countings
# Inverse of the trusts in countings
# Coefficients pour les parkings
# O/D matrix
# A priori information, but not parkings
# Parking coefficients
# Unknown parking entries
# Countings
# Parking columns
# 1,0
# 2,0
# 3,0
# 4,0
# 5,0
# 0,1
# 2,1
# 3,1
# 4,1
# 5,1
# 0,2
# 1,2
# 3,2
# 4,2
# 5,2
# Other columns
# 0,3
# 1,3
# 2,3
# 4,3
# 5,3
# 0,4
# 1,4
# 2,4
# 3,4
# 5,4
# 0,5
# 1,5
# 2,5
# 3,5
# 4,5
# Variance minimization
# A priori information, but not parkings
# Parking coefficients
export threepk

function threepk(; n::Int = default_nvar, kwargs...)
  nlp = Model()

  npkc  = 3
  npkcm1  = -1 + (3)
  npkcp1  = 1 + (3)
  ncent  = 6
  ncentm1  = -1 + (6)
  rncentm1  = 5.0
  gamma  = 10000.0
  ft0  = 0.5
  ft1  = 0.5
  ft2  = 0.5
  wft0  = 1.0
  wft1  = 1.0
  wft2  = 1.0
  count  = 9
  countm1  = -1 + (9)
  defw  = 999.999953
  cou0  = 910.0
  cou1  = 175.0
  cou2  = 1915.0
  cou3  = 450.0
  cou4  = 260.0
  cou5  = 80.0
  cou6  = 670.0
  cou7  = 1450.0
  cou8  = 990.0
  phi0  = (1.0) / (10000.0)
  phi1  = (1.0) / (10000.0)
  phi2  = (1.0) / (10000.0)
  phi3  = (1.0) / (10000.0)
  phi4  = (1.0) / (10000.0)
  phi5  = (1.0) / (10000.0)
  phi6  = (1.0) / (10000.0)
  phi7  = (1.0) / (10000.0)
  phi8  = (1.0) / (10000.0)
  jp1  = 1 + (5)
  jm1  = -1 + (5)
  tmp  = 1.0 / (80.0)
  tmp1  = 20.0 / (80.0)

  @variable(nlp, 0.0 <= a1_0 <= Inf, start = 0.5)
  @variable(nlp, 0.0 <= a2_0 <= Inf, start = 0.5)
  @variable(nlp, 0.0 <= a3_0 <= Inf, start = 0.5)
  @variable(nlp, 0.0 <= a4_0 <= Inf, start = 0.5)
  @variable(nlp, 0.0 <= a5_0 <= Inf, start = 0.5)
  @variable(nlp, 0.0 <= a0_1 <= Inf, start = 0.5)
  @variable(nlp, 0.0 <= a2_1 <= Inf, start = 0.5)
  @variable(nlp, 0.0 <= a3_1 <= Inf, start = 0.5)
  @variable(nlp, 0.0 <= a4_1 <= Inf, start = 0.5)
  @variable(nlp, 0.0 <= a5_1 <= Inf, start = 0.5)
  @variable(nlp, 0.0 <= a0_2 <= Inf, start = 0.5)
  @variable(nlp, 0.0 <= a1_2 <= Inf, start = 0.5)
  @variable(nlp, 0.0 <= a3_2 <= Inf, start = 0.5)
  @variable(nlp, 0.0 <= a4_2 <= Inf, start = 0.5)
  @variable(nlp, 0.0 <= a5_2 <= Inf, start = 0.5)
  @variable(nlp, 0.0 <= t0_3 <= Inf, start = 100.0)
  @variable(nlp, 0.0 <= t1_3 <= Inf, start = 140.0)
  @variable(nlp, 0.0 <= t2_3 <= Inf, start = 120.0)
  @variable(nlp, 0.0 <= t4_3 <= Inf, start = 20.0)
  @variable(nlp, 0.0 <= t5_3 <= Inf, start = 20.0)
  @variable(nlp, 0.0 <= t0_4 <= Inf, start = 200.0)
  @variable(nlp, 0.0 <= t1_4 <= Inf, start = 180.0)
  @variable(nlp, 0.0 <= t2_4 <= Inf, start = 20.0)
  @variable(nlp, 0.0 <= t3_4 <= Inf, start = 600.0)
  @variable(nlp, 0.0 <= t5_4 <= Inf, start = 40.0)
  @variable(nlp, 0.0 <= t0_5 <= Inf, start = 50.0)
  @variable(nlp, 0.0 <= t1_5 <= Inf, start = 30.0)
  @variable(nlp, 0.0 <= t2_5 <= Inf, start = 70.0)
  @variable(nlp, 0.0 <= t3_5 <= Inf, start = 150.0)
  @variable(nlp, 0.0 <= t4_5 <= Inf, start = 20.0)

  @NLobjective(nlp, Min, 
    (0.01*t0_3 - 1.0)*(0.01*t0_3 - 1.0) + (0.007143*t1_3 - 1.0)*(0.007143*t1_3 -
    1.0) + (0.008333*t2_3 - 1.0)*(0.008333*t2_3 - 1.0) + (0.05*t4_3 -
    1.0)*(0.05*t4_3 - 1.0) + (0.05*t5_3 - 1.0)*(0.05*t5_3 - 1.0) + (0.0050*t0_4 -
    1.0)*(0.0050*t0_4 - 1.0) + (0.005556*t1_4 - 1.0)*(0.005556*t1_4 - 1.0) +
    (0.05*t2_4 - 1.0)*(0.05*t2_4 - 1.0) + (0.001667*t3_4 - 1.0)*(0.001667*t3_4 -
    1.0) + (0.025*t5_4 - 1.0)*(0.025*t5_4 - 1.0) + (0.02*t0_5 - 1.0)*(0.02*t0_5 -
    1.0) + (0.033333*t1_5 - 1.0)*(0.033333*t1_5 - 1.0) + (0.014286*t2_5 -
    1.0)*(0.014286*t2_5 - 1.0) + (0.006667*t3_5 - 1.0)*(0.006667*t3_5 - 1.0) +
    (0.05*t4_5 - 1.0)*(0.05*t4_5 - 1.0) + (0.4*a1_0 + 0.4*a2_0 + 0.4*a3_0 +
    0.4*a4_0 + 0.4*a5_0 - 1.0)*(0.4*a1_0 + 0.4*a2_0 + 0.4*a3_0 + 0.4*a4_0 +
    0.4*a5_0 - 1.0) + (0.4*a0_1 + 0.4*a2_1 + 0.4*a3_1 + 0.4*a4_1 + 0.4*a5_1 -
    1.0)*(0.4*a0_1 + 0.4*a2_1 + 0.4*a3_1 + 0.4*a4_1 + 0.4*a5_1 - 1.0) + (0.4*a0_2 +
    0.4*a1_2 + 0.4*a3_2 + 0.4*a4_2 + 0.4*a5_2 - 1.0)*(0.4*a0_2 + 0.4*a1_2 +
    0.4*a3_2 + 0.4*a4_2 + 0.4*a5_2 - 1.0) + (((0.26373626373626374*a0_1 +
    0.43956043956043955*a2_1 + 0.46153846153846156*a3_1 + 0.1978021978021978*a4_1 +
    0.3516483516483517*a5_1 + 0.02197802197802198*a0_2 + 0.04395604395604396*a3_2 +
    0.001098901098901099*t0_5 + 0.001098901098901099*t3_5 -
    1.0)*(0.26373626373626374*a0_1 + 0.43956043956043955*a2_1 +
    0.46153846153846156*a3_1 + 0.1978021978021978*a4_1 + 0.3516483516483517*a5_1 +
    0.02197802197802198*a0_2 + 0.04395604395604396*a3_2 + 0.001098901098901099*t0_5
    + 0.001098901098901099*t3_5 - 1.0))/1.0e-4) + (((0.11428571428571428*a0_2 +
    0.34285714285714286*a1_2 + 0.22857142857142856*a3_2 + 0.005714285714285714*t0_5
    + 0.005714285714285714*t1_5 + 0.005714285714285714*t3_5 -
    1.0)*(0.11428571428571428*a0_2 + 0.34285714285714286*a1_2 +
    0.22857142857142856*a3_2 + 0.005714285714285714*t0_5 +
    0.005714285714285714*t1_5 + 0.005714285714285714*t3_5 - 1.0))/1.0e-4) +
    (((0.10443864229765012*a1_0 + 0.2506527415143603*a2_0 +
    0.06266318537859007*a3_0 + 0.18798955613577023*a4_0 + 0.2924281984334204*a5_0 +
    0.20887728459530025*a2_1 + 0.2193211488250653*a3_1 + 0.09399477806788512*a4_1 +
    0.1671018276762402*a5_1 + 0.020887728459530026*a3_2 + 5.221932114882506e-4*t3_4
    + 5.221932114882506e-4*t3_5 - 1.0)*(0.10443864229765012*a1_0 +
    0.2506527415143603*a2_0 + 0.06266318537859007*a3_0 + 0.18798955613577023*a4_0 +
    0.2924281984334204*a5_0 + 0.20887728459530025*a2_1 + 0.2193211488250653*a3_1 +
    0.09399477806788512*a4_1 + 0.1671018276762402*a5_1 + 0.020887728459530026*a3_2
    + 5.221932114882506e-4*t3_4 + 5.221932114882506e-4*t3_5 - 1.0))/1.0e-4) +
    (((0.0022222222222222222*t0_3 + 0.0022222222222222222*t0_4 +
    0.0022222222222222222*t3_4 - 1.0)*(0.0022222222222222222*t0_3 +
    0.0022222222222222222*t0_4 + 0.0022222222222222222*t3_4 - 1.0))/1.0e-4) +
    (((0.7692307692307693*a1_0 + 0.0038461538461538464*t1_3 +
    0.0038461538461538464*t1_4 - 1.0)*(0.7692307692307693*a1_0 +
    0.0038461538461538464*t1_3 + 0.0038461538461538464*t1_4 - 1.0))/1.0e-4) +
    (((1.5*a4_2 + 0.25*a5_2 + 0.0125*t4_5 - 1.0)*(1.5*a4_2 + 0.25*a5_2 +
    0.0125*t4_5 - 1.0))/1.0e-4) + (((0.7164179104477612*a2_0 +
    0.5970149253731343*a2_1 + 0.0014925373134328358*t2_3 +
    0.0014925373134328358*t2_4 + 0.0014925373134328358*t0_5 +
    0.0014925373134328358*t1_5 + 0.0014925373134328358*t2_5 +
    0.0014925373134328358*t3_5 + 0.0014925373134328358*t4_5 -
    1.0)*(0.7164179104477612*a2_0 + 0.5970149253731343*a2_1 +
    0.0014925373134328358*t2_3 + 0.0014925373134328358*t2_4 +
    0.0014925373134328358*t0_5 + 0.0014925373134328358*t1_5 +
    0.0014925373134328358*t2_5 + 0.0014925373134328358*t3_5 +
    0.0014925373134328358*t4_5 - 1.0))/1.0e-4) + (((0.13793103448275862*a1_0 +
    0.3310344827586207*a2_0 + 0.2482758620689655*a4_0 + 0.38620689655172413*a5_0 +
    0.27586206896551724*a2_1 + 0.12413793103448276*a4_1 + 0.2206896551724138*a5_1 +
    6.89655172413793e-4*t0_3 + 6.89655172413793e-4*t1_3 + 6.89655172413793e-4*t2_3
    + 6.89655172413793e-4*t4_3 + 6.89655172413793e-4*t5_3 -
    1.0)*(0.13793103448275862*a1_0 + 0.3310344827586207*a2_0 +
    0.2482758620689655*a4_0 + 0.38620689655172413*a5_0 + 0.27586206896551724*a2_1 +
    0.12413793103448276*a4_1 + 0.2206896551724138*a5_1 + 6.89655172413793e-4*t0_3 +
    6.89655172413793e-4*t1_3 + 6.89655172413793e-4*t2_3 + 6.89655172413793e-4*t4_3
    + 6.89655172413793e-4*t5_3 - 1.0))/1.0e-4) + (((0.48484848484848486*a2_0 +
    0.5656565656565656*a5_0 + 0.40404040404040403*a2_1 + 0.32323232323232326*a5_1 +
    0.020202020202020204*a5_2 + 0.00101010101010101*t2_3 + 0.00101010101010101*t5_3
    + 0.00101010101010101*t2_4 + 0.00101010101010101*t5_4 -
    1.0)*(0.48484848484848486*a2_0 + 0.5656565656565656*a5_0 +
    0.40404040404040403*a2_1 + 0.32323232323232326*a5_1 + 0.020202020202020204*a5_2
    + 0.00101010101010101*t2_3 + 0.00101010101010101*t5_3 +
    0.00101010101010101*t2_4 + 0.00101010101010101*t5_4 - 1.0))/1.0e-4) +
    (((-0.8*a1_0 + 0.2*a2_0 + 0.2*a3_0 + 0.2*a4_0 + 0.2*a5_0)*(-0.8*a1_0 + 0.2*a2_0
    + 0.2*a3_0 + 0.2*a4_0 + 0.2*a5_0))/0.5) + (((0.2*a1_0 - 0.8*a2_0 + 0.2*a3_0 +
    0.2*a4_0 + 0.2*a5_0)*(0.2*a1_0 - 0.8*a2_0 + 0.2*a3_0 + 0.2*a4_0 +
    0.2*a5_0))/0.5) + (((0.2*a1_0 + 0.2*a2_0 - 0.8*a3_0 + 0.2*a4_0 +
    0.2*a5_0)*(0.2*a1_0 + 0.2*a2_0 - 0.8*a3_0 + 0.2*a4_0 + 0.2*a5_0))/0.5) +
    (((0.2*a1_0 + 0.2*a2_0 + 0.2*a3_0 - 0.8*a4_0 + 0.2*a5_0)*(0.2*a1_0 + 0.2*a2_0 +
    0.2*a3_0 - 0.8*a4_0 + 0.2*a5_0))/0.5) + (((0.2*a1_0 + 0.2*a2_0 + 0.2*a3_0 +
    0.2*a4_0 - 0.8*a5_0)*(0.2*a1_0 + 0.2*a2_0 + 0.2*a3_0 + 0.2*a4_0 -
    0.8*a5_0))/0.5) + (((-0.8*a0_1 + 0.2*a2_1 + 0.2*a3_1 + 0.2*a4_1 +
    0.2*a5_1)*(-0.8*a0_1 + 0.2*a2_1 + 0.2*a3_1 + 0.2*a4_1 + 0.2*a5_1))/0.5) +
    (((0.2*a0_1 - 0.8*a2_1 + 0.2*a3_1 + 0.2*a4_1 + 0.2*a5_1)*(0.2*a0_1 - 0.8*a2_1 +
    0.2*a3_1 + 0.2*a4_1 + 0.2*a5_1))/0.5) + (((0.2*a0_1 + 0.2*a2_1 - 0.8*a3_1 +
    0.2*a4_1 + 0.2*a5_1)*(0.2*a0_1 + 0.2*a2_1 - 0.8*a3_1 + 0.2*a4_1 +
    0.2*a5_1))/0.5) + (((0.2*a0_1 + 0.2*a2_1 + 0.2*a3_1 - 0.8*a4_1 +
    0.2*a5_1)*(0.2*a0_1 + 0.2*a2_1 + 0.2*a3_1 - 0.8*a4_1 + 0.2*a5_1))/0.5) +
    (((0.2*a0_1 + 0.2*a2_1 + 0.2*a3_1 + 0.2*a4_1 - 0.8*a5_1)*(0.2*a0_1 + 0.2*a2_1 +
    0.2*a3_1 + 0.2*a4_1 - 0.8*a5_1))/0.5) + (((-0.8*a0_2 + 0.2*a1_2 + 0.2*a3_2 +
    0.2*a4_2 + 0.2*a5_2)*(-0.8*a0_2 + 0.2*a1_2 + 0.2*a3_2 + 0.2*a4_2 +
    0.2*a5_2))/0.5) + (((0.2*a0_2 - 0.8*a1_2 + 0.2*a3_2 + 0.2*a4_2 +
    0.2*a5_2)*(0.2*a0_2 - 0.8*a1_2 + 0.2*a3_2 + 0.2*a4_2 + 0.2*a5_2))/0.5) +
    (((0.2*a0_2 + 0.2*a1_2 - 0.8*a3_2 + 0.2*a4_2 + 0.2*a5_2)*(0.2*a0_2 + 0.2*a1_2 -
    0.8*a3_2 + 0.2*a4_2 + 0.2*a5_2))/0.5) + (((0.2*a0_2 + 0.2*a1_2 + 0.2*a3_2 -
    0.8*a4_2 + 0.2*a5_2)*(0.2*a0_2 + 0.2*a1_2 + 0.2*a3_2 - 0.8*a4_2 +
    0.2*a5_2))/0.5) + (((0.2*a0_2 + 0.2*a1_2 + 0.2*a3_2 + 0.2*a4_2 -
    0.8*a5_2)*(0.2*a0_2 + 0.2*a1_2 + 0.2*a3_2 + 0.2*a4_2 - 0.8*a5_2))/0.5)
  )

  return nlp
end

