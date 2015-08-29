# abstract MySQL5 <: DBI.DatabaseSystem
#
# type MySQLDatabaseHandle <: DBI.DatabaseHandle
#     ptr::Ptr{Void}
#     status::Cint
# end
#
# type MySQLStatementHandle <: DBI.StatementHandle
#     db::MySQLDatabaseHandle
#     ptr::Ptr{Void}
#     executed::Int
#
#     function MySQLStatementHandle(db::MySQLDatabaseHandle,
#                                   ptr::Ptr{Void})
#         new(db, ptr, 0)
#     end
# end

const mysql_lib = "/usr/local/mysql/lib/libmysqlclient.dylib"

typealias MySQL Void
typealias MySQLStatement Void
typealias MyBool Uint8
typealias MyULongLong Culonglong
typealias MySQLRes Void
typealias MySQLRow Ptr{Ptr{Uint8}}
typealias EnumFieldTypes Cuint

const MYSQL_TYPE_DECIMAL = 0
const MYSQL_TYPE_TINY = 1
const MYSQL_TYPE_SHORT = 2
const MYSQL_TYPE_LONG = 3
const MYSQL_TYPE_FLOAT = 4
const MYSQL_TYPE_DOUBLE = 5
const MYSQL_TYPE_NULL = 6
const MYSQL_TYPE_TIMESTAMP = 7
const MYSQL_TYPE_LONGLONG = 8
const MYSQL_TYPE_INT24 = 9
const MYSQL_TYPE_DATE = 10
const MYSQL_TYPE_TIME = 11
const MYSQL_TYPE_DATETIME = 12
const MYSQL_TYPE_YEAR = 13
const MYSQL_TYPE_NEWDATE = 14
const MYSQL_TYPE_VARCHAR = 15
const MYSQL_TYPE_BIT = 16
const MYSQL_TYPE_NEWDECIMAL = 246
const MYSQL_TYPE_ENUM = 247
const MYSQL_TYPE_SET = 248
const MYSQL_TYPE_TINY_BLOB = 249
const MYSQL_TYPE_MEDIUM_BLOB = 250
const MYSQL_TYPE_LONG_BLOB = 251
const MYSQL_TYPE_BLOB = 252
const MYSQL_TYPE_VAR_STRING = 253
const MYSQL_TYPE_STRING = 254
const MYSQL_TYPE_GEOMETRY = 255

function julia_type(_type::Cuint)
    if _type == MYSQL_TYPE_TINY
        return Int8
    elseif _type == MYSQL_TYPE_SHORT
        return Int16
    elseif _type == MYSQL_TYPE_LONG
        return Int32
    elseif _type == MYSQL_TYPE_FLOAT
        return Float32
    elseif _type == MYSQL_TYPE_DOUBLE
        return Float64
    elseif _type == MYSQL_TYPE_NULL
        return Int64 # TODO: How to handle this?
    elseif _type == MYSQL_TYPE_LONGLONG
        return Int64
    elseif _type == MYSQL_TYPE_VARCHAR
        return UTF8String # Ptr{Uint8}
    elseif _type == MYSQL_TYPE_BLOB
        return # Ptr{Uint8}
    elseif _type == MYSQL_TYPE_VAR_STRING
        return UTF8String # Ptr{Uint8}
    end
end

type MySQLField
    name::Ptr{Uint8}
    org_name::Ptr{Uint8}
    table::Ptr{Uint8}
    org_table::Ptr{Uint8}
    db::Ptr{Uint8}
    catalog::Ptr{Uint8}
    def::Ptr{Uint8}
    length::Culong
    max_length::Culong
    name_length::Cuint
    org_name_length::Cuint
    table_length::Cuint
    org_table_length::Cuint
    db_length::Cuint
    catalog_length::Cuint
    def_length::Cuint
    flags::Cuint
    decimals::Cuint
    charsetnr::Cuint
    _type::EnumFieldTypes
    extension::Ptr{None}
end

# Initialize by setting to zero
# MYSQL_BIND bind[3];
# memset(bind, 0, sizeof(bind));

immutable MySQLBind
    length::Ptr{Culong}
    is_null::Ptr{MyBool}
    buffer::Ptr{None}
    error::Ptr{MyBool}
    row_ptr::Ptr{Cuchar}
    store_param_func::Ptr{Void}
    fetch_result::Ptr{Void}
    skip_result::Ptr{Void}
    buffer_length::Culong
    offset::Culong
    length_value::Culong
    param_number::Cuint
    pack_length::Cuint
    buffer_type::EnumFieldTypes
    error_value::MyBool
    is_unsigned::MyBool
    long_data_used::MyBool
    is_null_value::MyBool
    extension::Ptr{None}
end

function MySQLBind(;
    length::Ptr{Culong} = C_NULL,
    is_null::Ptr{MyBool} = C_NULL,
    buffer::Ptr{None} = C_NULL,
    error::Ptr{MyBool} = C_NULL,
    row_ptr::Ptr{Cuchar} = C_NULL,
    store_param_func::Ptr{Void} = C_NULL,
    fetch_result::Ptr{Void} = C_NULL,
    skip_result::Ptr{Void} = C_NULL,
    buffer_length::Culong = 0,
    offset::Culong = 0,
    length_value::Culong = 0,
    param_number::Cuint = 0,
    pack_length::Cuint = 0,
    buffer_type::EnumFieldTypes = 0,
    error_value::MyBool = 0,
    is_unsigned::MyBool = 0,
    long_data_used::MyBool = 0,
    is_null_value::MyBool = 0,
    extension::Ptr{None} = C_NULL,
 )
    MySQLBind(
        length,
        is_null,
        buffer,
        error,
        row_ptr,
        store_param_func,
        fetch_result,
        skip_result,
        buffer_length,
        offset,
        length_value,
        param_number,
        pack_length,
        buffer_type,
        error_value,
        is_unsigned,
        long_data_used,
        is_null_value,
        extension,
    )
end

function initialize!(bind::MySQLBind)
    bind.length = C_NULL
    bind.is_null = C_NULL
    bind.buffer = C_NULL
    bind.error = C_NULL
    bind.row_ptr = C_NULL
    bind.store_param_func = C_NULL
    bind.fetch_result = C_NULL
    bind.skip_result = C_NULL
    bind.buffer_length = 0
    bind.offset = 0
    bind.length_value = 0
    bind.param_number = 0
    bind.pack_length = 0
    bind.buffer_type = 0
    bind.error_value = 0
    bind.is_unsigned = 0
    bind.long_data_used = 0
    bind.is_null_value = 0
    bind.extension = C_NULL
    return
end

function mysql_init(mysql::Ptr{MySQL})
    return ccall(
        (:mysql_init, mysql_lib),
        Ptr{MySQL},
        (Ptr{MySQL}, ),
        mysql
    )
end

function mysql_real_connect(
    mysql::Ptr{MySQL},
    host::String,
    user::String,
    passwd::String,
    db::String,
    port::Cuint,
    unix_socket::Any,
    client_flag::Culong,
)
    return ccall(
        (:mysql_real_connect, mysql_lib),
        Ptr{MySQL},
        (
            Ptr{MySQL},
            Ptr{Uint8},
            Ptr{Uint8},
            Ptr{Uint8},
            Ptr{Uint8},
            Cuint,
            Ptr{Uint8},
            Culong,
        ),
        mysql,
        host,
        user,
        passwd,
        db,
        port,
        unix_socket,
        client_flag
    )
end

function mysql_errno(mysql::Ptr{MySQL})
    return ccall(
        (:mysql_errno, mysql_lib),
        Cuint,
        (Ptr{MySQL}, ),
        mysql
    )
end

function mysql_error(mysql::Ptr{Void})
    return ccall(
        (:mysql_error, mysql_lib),
        Ptr{Uint8},
        (Ptr{MySQL}, ),
        mysql
    )
end

function mysql_stmt_execute(stmt::Ptr{MySQLStatement})
    return ccall(
        (:mysql_stmt_execute, mysql_lib),
        Cint,
        (Ptr{MySQLStatement}, ),
        stmt
    )
end

function mysql_stmt_close(stmt::Ptr{MySQLStatement})
    return ccall(
        (:mysql_stmt_close, mysql_lib),
        MyBool,
        (Ptr{MySQLStatement}, ),
        stmt
    )
end

function mysql_close(mysql::Ptr{MySQL})
    return ccall(
        (:mysql_close, mysql_lib),
        Void,
        (Ptr{MySQL}, ),
        mysql
    )
end

function mysql_insert_id(mysql::Ptr{MySQL})
    return ccall(
        (:mysql_insert_id, mysql_lib),
        MyULongLong,
        (Ptr{MySQL}, ),
        mysql
    )
end

# TODO: Work on this later
# function mysql_real_escape_string(
#     mysqlptr::Ptr{Void},
#     to::Vector{Uint8},
#     from::String,
#     length::Uint32
# )
#     return ccall((:mysql_real_escape_string, mysql_lib),
#                  Uint32, # TODO: Confirm proper type to use here
#                  (Ptr{Void},
#                   Ptr{Uint8},
#                   Ptr{Uint8},
#                   Uint32), # TODO: Confirm proper type to use here
#                  mysqlptr,
#                  to,
#                  from,
#                  length)
# end

function mysql_query(mysql::Ptr{MySQL}, sql::String)
    return ccall(
        (:mysql_query, mysql_lib),
        Cint,
        (Ptr{MySQL}, Ptr{Uint8}),
        mysql, sql
    )
end

function mysql_stmt_init(mysql::Ptr{MySQL})
    return ccall(
        (:mysql_stmt_init, mysql_lib),
        Ptr{MySQLStatement},
        (Ptr{MySQL}, ),
        mysql
    )
end

function mysql_stmt_prepare(
    stmt::Ptr{MySQLStatement},
    stmt_str::String,
)
    return ccall(
        (:mysql_stmt_prepare, mysql_lib),
        Cint,
        (Ptr{MySQLStatement}, Ptr{Uint8}, Culong),
        stmt, stmt_str, length(stmt_str)
    )
end

function mysql_stmt_error(stmt::Ptr{MySQLStatement})
    return ccall(
        (:mysql_stmt_error, mysql_lib),
        Ptr{Uint8},
        (Ptr{MySQLStatement}, ),
        stmt
    )
end

function mysql_query(mysql::Ptr{MySQL}, stmt_str)
    return ccall(
        (:mysql_query, mysql_lib),
        Cint,
        (Ptr{MySQL}, ),
        stmt_str
    )
end

function mysql_store_result(mysql::Ptr{MySQL})
    return ccall(
        (:mysql_store_result, mysql_lib),
        Ptr{MySQLRes},
        (Ptr{MySQL}, ),
        mysql
    )
end

function mysql_num_fields(result::Ptr{MySQLRes})
    return ccall(
        (:mysql_num_fields, mysql_lib),
        Cuint,
        (Ptr{MySQLRes}, ),
        result
    )
end

function mysql_fetch_row(result::Ptr{MySQLRes})
    return ccall(
        (:mysql_fetch_row, mysql_lib),
        MySQLRow,
        (Ptr{MySQLRes}, ),
        result
    )
end

function mysql_free_result(result::Ptr{MySQLRes})
    return ccall(
        (:mysql_free_result, mysql_lib),
        Void,
        (Ptr{MySQLRes}, ),
        result
    )
end

function mysql_fetch_lengths(result::Ptr{MySQLRes})
    return ccall(
        (:mysql_fetch_lengths, mysql_lib),
        Ptr{Culong},
        (Ptr{MySQLRes}, ),
        result
    )
end

function mysql_fetch_field(result::Ptr{MySQLRes})
    return ccall(
        (:mysql_fetch_field, mysql_lib),
        Ptr{MySQLField},
        (Ptr{MySQLRes}, ),
        result
    )
end
