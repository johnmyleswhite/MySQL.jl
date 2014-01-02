function mysql_stmt_close(stmtptr::Ptr{Void})
    return ccall((:mysql_stmt_close, mysql_lib),
                 Bool, # TODO: Confirm proper type to use here
                 (Ptr{Void}, ),
                 stmtptr)
end
