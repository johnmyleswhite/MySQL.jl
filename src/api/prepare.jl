function mysql_query(mysqlptr::Ptr{Void}, sql::String)
    return ccall((:mysql_query, mysql_lib),
                 Cint, # TODO: Confirm proper type here
                 (Ptr{Void}, Ptr{Uint8}),
                 mysqlptr,
                 sql)
end

function mysql_stmt_init(dbptr::Ptr{Void})
    return ccall((:mysql_stmt_init, mysql_lib),
                 Ptr{Void},
                 (Ptr{Void}, ),
                 dbptr)
end

function mysql_stmt_prepare(stmtptr::Ptr{Void}, sql::String)
    s = utf8(sql)
    return ccall((:mysql_stmt_prepare, mysql_lib),
                 Cint, # TODO: Confirm proper type to use here
                 (Ptr{Void}, Ptr{Uint8}, Uint64),
                 stmtptr,
                 s, # TODO: Confirm proper type to use here
                 length(s)) # TODO: Confirm proper type to use here
end

function mysql_stmt_error(stmtptr::Ptr{Void})
    return ccall((:mysql_stmt_error, mysql_lib),
                 Ptr{Uint8},
                 (Ptr{Void}, ),
                 stmtptr)
end
