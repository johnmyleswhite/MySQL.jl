abstract MySQL5 <: DBI.DatabaseSystem

type MySQLDatabaseHandle <: DBI.DatabaseHandle
    ptr::Ptr{Void}
end

type MySQLStatementHandle <: DBI.StatementHandle
    db::MySQLDatabaseHandle
    ptr::Ptr{Void}
end
