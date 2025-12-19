###############################################################################
#  Packages & helper
###############################################################################
using Distributions, Random, Statistics, Plots, CSV, StatsBase,DataFrames
using LinearAlgebra, DelimitedFiles, ThreadsX, StaticArrays, LoopVectorization



@kwdef struct Model{TI<:Integer, TF<:AbstractFloat}
    nc ::TI               #number of choices
    ns ::TI               #number of working sectors
    nt ::TI               #number of types
    ng ::TI               #number of sex
    tstart::TI             # year when the model starts
    test::TI               # year when the estimation start
    agemin::TI             # minimum age
    agemax::TI             # maximum age
    na::TI                 # number of age
    ny0::TI                # number of years
    ny1::TI             # number of years for estimation
    np::TI              # number of persons
    nx::TI             # number of state draws
    ns::TI              # number of shocks draws
    nvar::TI           # number of estimation parameters
    nemax::TI          # number of Emax coefs

end


function solve_model()

# set expectation parameters to be zero, TFP and perference draw from lognormal
### Outerloop on expectation parameters, u=2

   ### Emax Approximation 
      ### loop on age
        # draw TFP and preference shocks
        # draw state variables， state variable dimension is (nx, na)
        # backward solution to get Emax function, Emax dimension is (na,number of coefs,nc,nx,nt)
        ### loop on type
          ### loop on sex 
            ## vectorize other dimensions: nx, ns ,nc
          ### end sex
        ### end type
      ### end age
    ### end Emax Approximation
    
    # generate initial state for first year's inidividuals' state variables
    ### begin inner loop year by year , maximum loop for a given year is 20
      ### loop on year
        ### initialize the youngest cohort’s state variables； assign types for different age and sex 
        ### draw skill and preference shocks
        ### guess equilibrium prices, constant for the first loop
          ### iterate over capital price and skill rent, the number of loop depends on year
        ### get yearly equilibirum prices
        ### calculate simulated moments
        ### update individuals' state variables for next year
    ### end year loop

    ### use ols to estimate the expectationparameters
### end outerloop

### calculate simulated moments

