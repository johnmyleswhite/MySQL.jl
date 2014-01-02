function mysql_close(mysqlptr::Ptr{Void})
    return ccall((:mysql_close, mysql_lib),
                 Void,
                 (Ptr{Void}, ),
                 mysqlptr)
end
