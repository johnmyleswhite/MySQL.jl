function mysql_query(mysqlptr::Ptr{Void}, sql::String)
    return ccall((:mysql_query, mysql_lib),
                 Cint, # TODO: Confirm proper type here
                 (Ptr{Void}, Ptr{Uint8}),
                 mysqlptr,
                 sql)
end
