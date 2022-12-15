threepk_meta = Dict(
  :nvar => 30,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "threepk",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 20236.538579257834,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
)
get_threepk_nvar(; n::Integer = default_nvar, kwargs...) = 30
get_threepk_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_threepk_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_threepk_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_threepk_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_threepk_nineq(; n::Integer = default_nvar, kwargs...) = 0
