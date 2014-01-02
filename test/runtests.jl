using DBI
using MySQL

for testfile in ["dbi.jl"]
    include(testfile)
end
