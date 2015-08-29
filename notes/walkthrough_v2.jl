include("api.jl")

param = Array(MySQLBind, 1)
result = Array(MySQLBind, 1)

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

sql = "SELECT `name` FROM `users` WHERE `name` = ?"

stmt = mysql_stmt_init(mysql)

status = mysql_stmt_prepare(stmt, sql)

# Zero out both the param and result data structures
STRING_SIZE = 256
str_data = Array(Uint8, STRING_SIZE)
result_data = Array(Uint8, STRING_SIZE)

# Input/output parameters
str_length = convert(Culong, 0)
data_length = convert(Culong, 0)
is_null = convert(MyBool, 0)

param[1] = MySQLBind(
    length = Ref(str_length),
    is_null = C_NULL,
    buffer_length = STRING_SIZE,
    buffer = str_data,
    buffer_type = MYSQL_TYPE_STRING,
)

result[1] = MySQLBind(
    result[0].buffer_type= MYSQL_TYPE_VAR_STRING;
    result[0].buffer = result_data;
    result[0].buffer_length = STRING_SIZE;
    result[0].is_null = 0;
    result[0].length = &data_length;
)



/* Bind the parameters buffer */
if (mysql_stmt_bind_param(stmt, param)) {
fprintf(stderr, " mysql_stmt_bind_param() failed\n");
fprintf(stderr, " %s\n", mysql_stmt_error(stmt));
exit(EXIT_FAILURE);
}

/* Bind the results buffer */
if (mysql_stmt_bind_result(stmt, result) != 0) {
fprintf(stderr, " mysql_stmt_bind_result() failed\n");
fprintf(stderr, " %s\n", mysql_stmt_error(stmt));
exit(EXIT_FAILURE);
}

/* Specify the parameter that we send to the query */
strncpy(str_data, "nsi2.erickcantwell.com", STRING_SIZE);
str_length= strlen(str_data);

/* Execute the statement */
if (mysql_stmt_execute(stmt)) {
fprintf(stderr, " mysql_stmt_execute(), failed\n");
fprintf(stderr, " %s\n", mysql_stmt_error(stmt));
exit(EXIT_FAILURE);
}

/* Print our results */
if(mysql_stmt_fetch (stmt) == 0) {
printf("%s\n", result_data);
} else {
printf("No results found!\n");
}

failed = mysql_stmt_close(stmt)

mysql_close(mysql)
