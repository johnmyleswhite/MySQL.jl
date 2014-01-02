function mysql_init(mysqlptr::Ptr{Void})
    return ccall((:mysql_init, mysql_lib),
                 Ptr{Void},
                 (Ptr{Void}, ),
                 mysqlptr)
end

function mysql_real_connect(mysqlptr::Ptr{Void},
                              host::String,
                              user::String,
                              passwd::String,
                              db::String,
                              port::Cint,
                              unix_socket::Any,
                              client_flag::Uint64)
    return ccall((:mysql_real_connect, mysql_lib),
                 Ptr{Void},
                 (Ptr{Void},
                  Ptr{Uint8},
                  Ptr{Uint8},
                  Ptr{Uint8},
                  Ptr{Uint8},
                  Cint, # TODO: Confirm type here
                  Ptr{Uint8},
                  Uint64), # TODO: Confirm type here
                 mysqlptr,
                 host,
                 user,
                 passwd,
                 db,
                 port,
                 unix_socket,
                 client_flag)
end
