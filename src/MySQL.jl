module MySQL
    using DBI
    using DataArrays
    using DataFrames

    include("consts.jl")
    include("types.jl")
    include(joinpath("api", "connect.jl"))
    include(joinpath("api", "disconnect.jl"))
    include(joinpath("api", "error.jl"))
    include(joinpath("api", "execute.jl"))
    include(joinpath("api", "finish.jl"))
    include(joinpath("api", "prepare.jl"))
    include(joinpath("api", "misc.jl"))
    include("dbi.jl")

    export MySQL5
end
