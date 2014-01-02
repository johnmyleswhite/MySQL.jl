function mysql_insert_id(mysqlptr::Ptr{Void})
    return ccall((:mysql_insert_id, mysql_lib),
                 Uint64, # TODO: Confirm proper type to use here
                 (Ptr{Void}, ),
                 mysqlptr)
end

function mysql_real_escape_string(mysqlptr::Ptr{Void},
                                    to::Vector{Uint8},
                                    from::String,
                                    length::Uint32)
    return ccall((:mysql_real_escape_string, mysql_lib),
                 Uint32, # TODO: Confirm proper type to use here
                 (Ptr{Void},
                  Ptr{Uint8},
                  Ptr{Uint8},
                  Uint32), # TODO: Confirm proper type to use here
                 mysqlptr,
                 to,
                 from,
                 length)
end
