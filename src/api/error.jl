function mysql_errno(mysqlptr::Ptr{Void})
    return ccall((:mysql_errno, mysql_lib),
                 Uint32, # TODO: Confirm proper type to use here
                 (Ptr{Void}, ),
                 mysqlptr)
end

function mysql_error(mysqlptr::Ptr{Void})
    return ccall((:mysql_error, mysql_lib),
                 Ptr{Uint8},
                 (Ptr{Void}, ),
                 mysqlptr)
end
