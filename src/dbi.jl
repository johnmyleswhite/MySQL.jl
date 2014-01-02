function Base.connect(::Type{MySQL5},
                      host::String,
                      user::String,
                      passwd::String,
                      db::String, # TODO: Let this be optional?
                      port::Integer = 0,
                      unix_socket::Any = C_NULL,
                      client_flag::Integer = 0)
    mysqlptr = C_NULL

    mysqlptr = mysql_init(mysqlptr)

    if mysqlptr == C_NULL
        error("Failed to connect to MySQL database")
    end

    mysqlptr = mysql_real_connect(mysqlptr,
                                  host,
                                  user,
                                  passwd,
                                  db,
                                  convert(Cint, port), # TODO: Confirm type here
                                  unix_socket,
                                  convert(Uint64, client_flag)) # TODO: Confirm type here

    if mysqlptr == C_NULL
        error("Failed to connect to MySQL database")
    end

    return MySQLDatabaseHandle(mysqlptr)
end

function DBI.disconnect(db::MySQLDatabaseHandle)
    mysql_close(db.ptr)
    return
end

function DBI.columninfo(db::MySQLDatabaseHandle,
                        table::String,
                        column::String)
    error("DBI API not fully implemented")
end

function DBI.prepare(db::MySQLDatabaseHandle, sql::String)
    status = mysql_query(db.ptr, sql)
    return status
end

function DBI.errcode(db::MySQLDatabaseHandle)
    return int(mysql_errno(db.ptr))
end

# TODO: Make a copy here?
function DBI.errstring(db::MySQLDatabaseHandle)
    return bytestring(mysql_error(db.ptr))
end

function DBI.fetchall(stmt::MySQLStatementHandle)
    error("DBI API not fully implemented")
end

function DBI.fetchdf(stmt::MySQLStatementHandle)
    error("DBI API not fully implemented")
end

function DBI.fetchrow(stmt::MySQLStatementHandle)
    error("DBI API not fully implemented")
end

function DBI.finish(stmt::MySQLStatementHandle)
    error("DBI API not fully implemented")
end

function DBI.lastinsertid(db::MySQLDatabaseHandle)
    return int64(mysql_insert_id(db.ptr))
end

function DBI.sqlescape(db::MySQLDatabaseHandle, dirtysql::String)
    to = Array(Uint8, 4 * length(dirtysql))
    writelength = mysql_real_escape_string(db.ptr,
                                           to,
                                           dirtysql,
                                           convert(Uint32, length(dirtysql)))
    return bytestring(to[1:writelength])
end

function DBI.tableinfo(db::MySQLDatabaseHandle, table::String)
    error("DBI API not fully implemented")
end
