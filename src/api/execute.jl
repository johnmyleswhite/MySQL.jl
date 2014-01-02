function mysql_stmt_execute(stmtptr::Ptr{Void})
    return ccall((:mysql_stmt_execute, mysql_lib),
                 Cint, # TODO: Confirm proper type to use here
                 (Ptr{Void}, ),
                 stmtptr)
end
