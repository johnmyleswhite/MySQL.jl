include("api.jl")

mysql = C_NULL

mysql = mysql_init(mysql)

mysql = mysql_real_connect(
    mysql,
    "127.0.0.1",
    "root",
    "MYPASSWORD",
    "jmw",
    convert(Cuint, 0),
    C_NULL,
    convert(Culong, 0),
)

sql = "CREATE TABLE users (id INT PRIMARY KEY AUTO_INCREMENT, name VARCHAR(255))"

stmt = mysql_stmt_init(mysql)

status = mysql_stmt_prepare(stmt, sql)

status = mysql_stmt_execute(stmt)

failed = mysql_stmt_close(stmt)

sql = "INSERT INTO users (name) VALUES ('Jeff Bezanson')"

stmt = mysql_stmt_init(mysql)

status = mysql_stmt_prepare(stmt, sql)

status = mysql_stmt_execute(stmt)

failed = mysql_stmt_close(stmt)

sql = "INSERT INTO users (name) VALUES ('Viral Shah')"

stmt = mysql_stmt_init(mysql)

status = mysql_stmt_prepare(stmt, sql)

status = mysql_stmt_execute(stmt)

failed = mysql_stmt_close(stmt)

sql = "INSERT INTO users (name) VALUES ('Stefan Karpinski')"

stmt = mysql_stmt_init(mysql)

status = mysql_stmt_prepare(stmt, sql)

status = mysql_stmt_execute(stmt)

failed = mysql_stmt_close(stmt)

Int64(mysql_insert_id(mysql))

sql = "INSERT INTO users (id, name) VALUES (17, 'John Myles White')"

stmt = mysql_stmt_init(mysql)

status = mysql_stmt_prepare(stmt, sql)

status = mysql_stmt_execute(stmt)

failed = mysql_stmt_close(stmt)

sql = "SELECT * FROM users"

status = mysql_query(mysql, sql)

result = mysql_store_result(mysql)

ncols = mysql_num_fields(result)

row = mysql_fetch_row(result)

colnames = Array(UTF8String, ncols)
coltypes = Array(DataType, ncols)

for col in 1:ncols
    field = mysql_fetch_field(result)
    real_field = unsafe_load(field)
    colnames[col] = bytestring(real_field.name)
    coltypes[col] = julia_type(real_field._type)
end

res = Dict{ASCIIString, Vector}()
for col in 1:ncols
    # TODO: Get nrows here
    res[colnames[col]] = Array(coltypes[col], 0)
end

while row != C_NULL
    col_lengths = mysql_fetch_lengths(result)

    bytesizes = Int64[unsafe_load(col_lengths, i) for i in 1:ncols]

    for col in 1:ncols
        io = IOBuffer()
        for i in 1:bytesizes[col]
            write(io, unsafe_load(unsafe_load(row, col), i))
        end
        s = takebuf_string(io)

        if coltypes[col] != UTF8String
            push!(res[colnames[col]], parse(coltypes[col], s))
        else
            push!(res[colnames[col]], s)
        end
    end

    row = mysql_fetch_row(result)
end

# Everything is passed as character strings? Meh!

mysql_free_result(result)

sql = "DROP TABLE users"

stmt = mysql_stmt_init(mysql)

status = mysql_stmt_prepare(stmt, sql)

status = mysql_stmt_execute(stmt)

failed = mysql_stmt_close(stmt)

mysql_close(mysql)
