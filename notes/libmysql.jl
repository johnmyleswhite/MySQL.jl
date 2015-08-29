# Julia wrapper for header: /usr/include/mysql/mysql.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0

function my_net_init(net::Ptr{NET}, vio::Ptr{Vio})
  ccall( (:my_net_init, mysql), my_bool, (Ptr{NET}, Ptr{Vio}), net, vio)
end
function my_net_local_init(net::Ptr{NET})
  ccall( (:my_net_local_init, mysql), None, (Ptr{NET},), net)
end
function net_end(net::Ptr{NET})
  ccall( (:net_end, mysql), None, (Ptr{NET},), net)
end
function net_clear(net::Ptr{NET}, clear_buffer::my_bool)
  ccall( (:net_clear, mysql), None, (Ptr{NET}, my_bool), net, clear_buffer)
end
function net_realloc(net::Ptr{NET}, length::Cint)
  ccall( (:net_realloc, mysql), my_bool, (Ptr{NET}, Cint), net, length)
end
function net_flush(net::Ptr{NET})
  ccall( (:net_flush, mysql), my_bool, (Ptr{NET},), net)
end
function my_net_write(net::Ptr{NET}, packet::Ptr{Cuchar}, len::Cint)
  ccall( (:my_net_write, mysql), my_bool, (Ptr{NET}, Ptr{Cuchar}, Cint), net, packet, len)
end
function net_write_command(net::Ptr{NET}, command::Cuchar, header::Ptr{Cuchar}, head_len::Cint, packet::Ptr{Cuchar}, len::Cint)
  ccall( (:net_write_command, mysql), my_bool, (Ptr{NET}, Cuchar, Ptr{Cuchar}, Cint, Ptr{Cuchar}, Cint), net, command, header, head_len, packet, len)
end
function net_real_write(net::Ptr{NET}, packet::Ptr{Cuchar}, len::Cint)
  ccall( (:net_real_write, mysql), Cint, (Ptr{NET}, Ptr{Cuchar}, Cint), net, packet, len)
end
function my_net_read(net::Ptr{NET})
  ccall( (:my_net_read, mysql), Culong, (Ptr{NET},), net)
end
function my_connect(s::my_socket, name::Ptr{sockaddr}, namelen::Uint32, timeout::Uint32)
  ccall( (:my_connect, mysql), Cint, (my_socket, Ptr{sockaddr}, Uint32, Uint32), s, name, namelen, timeout)
end
function randominit(::Ptr{rand_struct}, seed1::Culong, seed2::Culong)
  ccall( (:randominit, mysql), None, (Ptr{rand_struct}, Culong, Culong), , seed1, seed2)
end
function my_rnd(::Ptr{rand_struct})
  ccall( (:my_rnd, mysql), Cdouble, (Ptr{rand_struct},), )
end
function create_random_string(to::Ptr{Uint8}, length::Uint32, rand_st::Ptr{rand_struct})
  ccall( (:create_random_string, mysql), None, (Ptr{Uint8}, Uint32, Ptr{rand_struct}), to, length, rand_st)
end
function hash_password(to::Ptr{Culong}, password::Ptr{Uint8}, password_len::Uint32)
  ccall( (:hash_password, mysql), None, (Ptr{Culong}, Ptr{Uint8}, Uint32), to, password, password_len)
end
function make_scrambled_password_323(to::Ptr{Uint8}, password::Ptr{Uint8})
  ccall( (:make_scrambled_password_323, mysql), None, (Ptr{Uint8}, Ptr{Uint8}), to, password)
end
function scramble_323(to::Ptr{Uint8}, message::Ptr{Uint8}, password::Ptr{Uint8})
  ccall( (:scramble_323, mysql), None, (Ptr{Uint8}, Ptr{Uint8}, Ptr{Uint8}), to, message, password)
end
function check_scramble_323(reply::Ptr{Cuchar}, message::Ptr{Uint8}, salt::Ptr{Culong})
  ccall( (:check_scramble_323, mysql), my_bool, (Ptr{Cuchar}, Ptr{Uint8}, Ptr{Culong}), reply, message, salt)
end
function get_salt_from_password_323(res::Ptr{Culong}, password::Ptr{Uint8})
  ccall( (:get_salt_from_password_323, mysql), None, (Ptr{Culong}, Ptr{Uint8}), res, password)
end
function make_password_from_salt_323(to::Ptr{Uint8}, salt::Ptr{Culong})
  ccall( (:make_password_from_salt_323, mysql), None, (Ptr{Uint8}, Ptr{Culong}), to, salt)
end
function make_scrambled_password(to::Ptr{Uint8}, password::Ptr{Uint8})
  ccall( (:make_scrambled_password, mysql), None, (Ptr{Uint8}, Ptr{Uint8}), to, password)
end
function scramble(to::Ptr{Uint8}, message::Ptr{Uint8}, password::Ptr{Uint8})
  ccall( (:scramble, mysql), None, (Ptr{Uint8}, Ptr{Uint8}, Ptr{Uint8}), to, message, password)
end
function check_scramble(reply::Ptr{Cuchar}, message::Ptr{Uint8}, hash_stage2::Ptr{Cuchar})
  ccall( (:check_scramble, mysql), my_bool, (Ptr{Cuchar}, Ptr{Uint8}, Ptr{Cuchar}), reply, message, hash_stage2)
end
function get_salt_from_password(res::Ptr{Cuchar}, password::Ptr{Uint8})
  ccall( (:get_salt_from_password, mysql), None, (Ptr{Cuchar}, Ptr{Uint8}), res, password)
end
function make_password_from_salt(to::Ptr{Uint8}, hash_stage2::Ptr{Cuchar})
  ccall( (:make_password_from_salt, mysql), None, (Ptr{Uint8}, Ptr{Cuchar}), to, hash_stage2)
end
function octet2hex(to::Ptr{Uint8}, str::Ptr{Uint8}, len::Uint32)
  ccall( (:octet2hex, mysql), Ptr{Uint8}, (Ptr{Uint8}, Ptr{Uint8}, Uint32), to, str, len)
end
function get_tty_password(opt_message::Ptr{Uint8})
  ccall( (:get_tty_password, mysql), Ptr{Uint8}, (Ptr{Uint8},), opt_message)
end
function mysql_errno_to_sqlstate(mysql_errno::Uint32)
  ccall( (:mysql_errno_to_sqlstate, mysql), Ptr{Uint8}, (Uint32,), mysql_errno)
end
function my_thread_init()
  ccall( (:my_thread_init, mysql), my_bool, (), )
end
function my_thread_end()
  ccall( (:my_thread_end, mysql), None, (), )
end
function list_add(root::Ptr{LIST}, element::Ptr{LIST})
  ccall( (:list_add, mysql), Ptr{LIST}, (Ptr{LIST}, Ptr{LIST}), root, element)
end
function list_delete(root::Ptr{LIST}, element::Ptr{LIST})
  ccall( (:list_delete, mysql), Ptr{LIST}, (Ptr{LIST}, Ptr{LIST}), root, element)
end
function list_cons(data::Ptr{None}, root::Ptr{LIST})
  ccall( (:list_cons, mysql), Ptr{LIST}, (Ptr{None}, Ptr{LIST}), data, root)
end
function list_reverse(root::Ptr{LIST})
  ccall( (:list_reverse, mysql), Ptr{LIST}, (Ptr{LIST},), root)
end
function list_free(root::Ptr{LIST}, free_data::Uint32)
  ccall( (:list_free, mysql), None, (Ptr{LIST}, Uint32), root, free_data)
end
function list_length(::Ptr{LIST})
  ccall( (:list_length, mysql), Uint32, (Ptr{LIST},), )
end
function list_walk(::Ptr{LIST}, action::list_walk_action, argument::Ptr{Cuchar})
  ccall( (:list_walk, mysql), Cint, (Ptr{LIST}, list_walk_action, Ptr{Cuchar}), , action, argument)
end
function find_typeset(x::Ptr{Uint8}, typelib::Ptr{TYPELIB}, error_position::Ptr{Cint})
  ccall( (:find_typeset, mysql), my_ulonglong, (Ptr{Uint8}, Ptr{TYPELIB}, Ptr{Cint}), x, typelib, error_position)
end
function find_type_or_exit(x::Ptr{Uint8}, typelib::Ptr{TYPELIB}, option::Ptr{Uint8})
  ccall( (:find_type_or_exit, mysql), Cint, (Ptr{Uint8}, Ptr{TYPELIB}, Ptr{Uint8}), x, typelib, option)
end
function find_type(x::Ptr{Uint8}, typelib::Ptr{TYPELIB}, flags::Uint32)
  ccall( (:find_type, mysql), Cint, (Ptr{Uint8}, Ptr{TYPELIB}, Uint32), x, typelib, flags)
end
function make_type(to::Ptr{Uint8}, nr::Uint32, typelib::Ptr{TYPELIB})
  ccall( (:make_type, mysql), None, (Ptr{Uint8}, Uint32, Ptr{TYPELIB}), to, nr, typelib)
end
function get_type(typelib::Ptr{TYPELIB}, nr::Uint32)
  ccall( (:get_type, mysql), Ptr{Uint8}, (Ptr{TYPELIB}, Uint32), typelib, nr)
end
function copy_typelib(root::Ptr{MEM_ROOT}, from::Ptr{TYPELIB})
  ccall( (:copy_typelib, mysql), Ptr{TYPELIB}, (Ptr{MEM_ROOT}, Ptr{TYPELIB}), root, from)
end
function find_set_from_flags(lib::Ptr{TYPELIB}, default_name::Uint32, cur_set::my_ulonglong, default_set::my_ulonglong, str::Ptr{Uint8}, length::Uint32, err_pos::Ptr{Ptr{Uint8}}, err_len::Ptr{Uint32})
  ccall( (:find_set_from_flags, mysql), my_ulonglong, (Ptr{TYPELIB}, Uint32, my_ulonglong, my_ulonglong, Ptr{Uint8}, Uint32, Ptr{Ptr{Uint8}}, Ptr{Uint32}), lib, default_name, cur_set, default_set, str, length, err_pos, err_len)
end
function mysql_server_init(argc::Cint, argv::Ptr{Ptr{Uint8}}, groups::Ptr{Ptr{Uint8}})
  ccall( (:mysql_server_init, mysql), Cint, (Cint, Ptr{Ptr{Uint8}}, Ptr{Ptr{Uint8}}), argc, argv, groups)
end
function mysql_server_end()
  ccall( (:mysql_server_end, mysql), None, (), )
end
function mysql_get_parameters()
  ccall( (:mysql_get_parameters, mysql), Ptr{MYSQL_PARAMETERS}, (), )
end
function mysql_thread_init()
  ccall( (:mysql_thread_init, mysql), my_bool, (), )
end
function mysql_thread_end()
  ccall( (:mysql_thread_end, mysql), None, (), )
end
function mysql_num_rows(res::Ptr{MYSQL_RES})
  ccall( (:mysql_num_rows, mysql), my_ulonglong, (Ptr{MYSQL_RES},), res)
end
function mysql_num_fields(res::Ptr{MYSQL_RES})
  ccall( (:mysql_num_fields, mysql), Uint32, (Ptr{MYSQL_RES},), res)
end
function mysql_eof(res::Ptr{MYSQL_RES})
  ccall( (:mysql_eof, mysql), my_bool, (Ptr{MYSQL_RES},), res)
end
function mysql_fetch_field_direct(res::Ptr{MYSQL_RES}, fieldnr::Uint32)
  ccall( (:mysql_fetch_field_direct, mysql), Ptr{MYSQL_FIELD}, (Ptr{MYSQL_RES}, Uint32), res, fieldnr)
end
function mysql_fetch_fields(res::Ptr{MYSQL_RES})
  ccall( (:mysql_fetch_fields, mysql), Ptr{MYSQL_FIELD}, (Ptr{MYSQL_RES},), res)
end
function mysql_row_tell(res::Ptr{MYSQL_RES})
  ccall( (:mysql_row_tell, mysql), MYSQL_ROW_OFFSET, (Ptr{MYSQL_RES},), res)
end
function mysql_field_tell(res::Ptr{MYSQL_RES})
  ccall( (:mysql_field_tell, mysql), MYSQL_FIELD_OFFSET, (Ptr{MYSQL_RES},), res)
end
function mysql_field_count(mysql::Ptr{MYSQL})
  ccall( (:mysql_field_count, mysql), Uint32, (Ptr{MYSQL},), mysql)
end
function mysql_affected_rows(mysql::Ptr{MYSQL})
  ccall( (:mysql_affected_rows, mysql), my_ulonglong, (Ptr{MYSQL},), mysql)
end
function mysql_insert_id(mysql::Ptr{MYSQL})
  ccall( (:mysql_insert_id, mysql), my_ulonglong, (Ptr{MYSQL},), mysql)
end
function mysql_errno(mysql::Ptr{MYSQL})
  ccall( (:mysql_errno, mysql), Uint32, (Ptr{MYSQL},), mysql)
end
function mysql_error(mysql::Ptr{MYSQL})
  ccall( (:mysql_error, mysql), Ptr{Uint8}, (Ptr{MYSQL},), mysql)
end
function mysql_sqlstate(mysql::Ptr{MYSQL})
  ccall( (:mysql_sqlstate, mysql), Ptr{Uint8}, (Ptr{MYSQL},), mysql)
end
function mysql_warning_count(mysql::Ptr{MYSQL})
  ccall( (:mysql_warning_count, mysql), Uint32, (Ptr{MYSQL},), mysql)
end
function mysql_info(mysql::Ptr{MYSQL})
  ccall( (:mysql_info, mysql), Ptr{Uint8}, (Ptr{MYSQL},), mysql)
end
function mysql_thread_id(mysql::Ptr{MYSQL})
  ccall( (:mysql_thread_id, mysql), Culong, (Ptr{MYSQL},), mysql)
end
function mysql_character_set_name(mysql::Ptr{MYSQL})
  ccall( (:mysql_character_set_name, mysql), Ptr{Uint8}, (Ptr{MYSQL},), mysql)
end
function mysql_set_character_set(mysql::Ptr{MYSQL}, csname::Ptr{Uint8})
  ccall( (:mysql_set_character_set, mysql), Cint, (Ptr{MYSQL}, Ptr{Uint8}), mysql, csname)
end
function mysql_init(mysql::Ptr{MYSQL})
  ccall( (:mysql_init, mysql), Ptr{MYSQL}, (Ptr{MYSQL},), mysql)
end
function mysql_ssl_set(mysql::Ptr{MYSQL}, key::Ptr{Uint8}, cert::Ptr{Uint8}, ca::Ptr{Uint8}, capath::Ptr{Uint8}, cipher::Ptr{Uint8})
  ccall( (:mysql_ssl_set, mysql), my_bool, (Ptr{MYSQL}, Ptr{Uint8}, Ptr{Uint8}, Ptr{Uint8}, Ptr{Uint8}, Ptr{Uint8}), mysql, key, cert, ca, capath, cipher)
end
function mysql_get_ssl_cipher(mysql::Ptr{MYSQL})
  ccall( (:mysql_get_ssl_cipher, mysql), Ptr{Uint8}, (Ptr{MYSQL},), mysql)
end
function mysql_change_user(mysql::Ptr{MYSQL}, user::Ptr{Uint8}, passwd::Ptr{Uint8}, db::Ptr{Uint8})
  ccall( (:mysql_change_user, mysql), my_bool, (Ptr{MYSQL}, Ptr{Uint8}, Ptr{Uint8}, Ptr{Uint8}), mysql, user, passwd, db)
end
function mysql_real_connect(mysql::Ptr{MYSQL}, host::Ptr{Uint8}, user::Ptr{Uint8}, passwd::Ptr{Uint8}, db::Ptr{Uint8}, port::Uint32, unix_socket::Ptr{Uint8}, clientflag::Culong)
  ccall( (:mysql_real_connect, mysql), Ptr{MYSQL}, (Ptr{MYSQL}, Ptr{Uint8}, Ptr{Uint8}, Ptr{Uint8}, Ptr{Uint8}, Uint32, Ptr{Uint8}, Culong), mysql, host, user, passwd, db, port, unix_socket, clientflag)
end
function mysql_select_db(mysql::Ptr{MYSQL}, db::Ptr{Uint8})
  ccall( (:mysql_select_db, mysql), Cint, (Ptr{MYSQL}, Ptr{Uint8}), mysql, db)
end
function mysql_query(mysql::Ptr{MYSQL}, q::Ptr{Uint8})
  ccall( (:mysql_query, mysql), Cint, (Ptr{MYSQL}, Ptr{Uint8}), mysql, q)
end
function mysql_send_query(mysql::Ptr{MYSQL}, q::Ptr{Uint8}, length::Culong)
  ccall( (:mysql_send_query, mysql), Cint, (Ptr{MYSQL}, Ptr{Uint8}, Culong), mysql, q, length)
end
function mysql_real_query(mysql::Ptr{MYSQL}, q::Ptr{Uint8}, length::Culong)
  ccall( (:mysql_real_query, mysql), Cint, (Ptr{MYSQL}, Ptr{Uint8}, Culong), mysql, q, length)
end
function mysql_store_result(mysql::Ptr{MYSQL})
  ccall( (:mysql_store_result, mysql), Ptr{MYSQL_RES}, (Ptr{MYSQL},), mysql)
end
function mysql_use_result(mysql::Ptr{MYSQL})
  ccall( (:mysql_use_result, mysql), Ptr{MYSQL_RES}, (Ptr{MYSQL},), mysql)
end
function mysql_get_character_set_info(mysql::Ptr{MYSQL}, charset::Ptr{MY_CHARSET_INFO})
  ccall( (:mysql_get_character_set_info, mysql), None, (Ptr{MYSQL}, Ptr{MY_CHARSET_INFO}), mysql, charset)
end
function mysql_set_local_infile_handler(mysql::Ptr{MYSQL}, local_infile_init::Ptr{Void}, local_infile_read::Ptr{Void}, local_infile_end::Ptr{Void}, local_infile_error::Ptr{Void}, ::Ptr{None})
  ccall( (:mysql_set_local_infile_handler, mysql), None, (Ptr{MYSQL}, Ptr{Void}, Ptr{Void}, Ptr{Void}, Ptr{Void}, Ptr{None}), mysql, local_infile_init, local_infile_read, local_infile_end, local_infile_error, )
end
function mysql_set_local_infile_default(mysql::Ptr{MYSQL})
  ccall( (:mysql_set_local_infile_default, mysql), None, (Ptr{MYSQL},), mysql)
end
function mysql_shutdown(mysql::Ptr{MYSQL}, shutdown_level::mysql_enum_shutdown_level)
  ccall( (:mysql_shutdown, mysql), Cint, (Ptr{MYSQL}, mysql_enum_shutdown_level), mysql, shutdown_level)
end
function mysql_dump_debug_info(mysql::Ptr{MYSQL})
  ccall( (:mysql_dump_debug_info, mysql), Cint, (Ptr{MYSQL},), mysql)
end
function mysql_refresh(mysql::Ptr{MYSQL}, refresh_options::Uint32)
  ccall( (:mysql_refresh, mysql), Cint, (Ptr{MYSQL}, Uint32), mysql, refresh_options)
end
function mysql_kill(mysql::Ptr{MYSQL}, pid::Culong)
  ccall( (:mysql_kill, mysql), Cint, (Ptr{MYSQL}, Culong), mysql, pid)
end
function mysql_set_server_option(mysql::Ptr{MYSQL}, option::enum_mysql_set_option)
  ccall( (:mysql_set_server_option, mysql), Cint, (Ptr{MYSQL}, enum_mysql_set_option), mysql, option)
end
function mysql_ping(mysql::Ptr{MYSQL})
  ccall( (:mysql_ping, mysql), Cint, (Ptr{MYSQL},), mysql)
end
function mysql_stat(mysql::Ptr{MYSQL})
  ccall( (:mysql_stat, mysql), Ptr{Uint8}, (Ptr{MYSQL},), mysql)
end
function mysql_get_server_info(mysql::Ptr{MYSQL})
  ccall( (:mysql_get_server_info, mysql), Ptr{Uint8}, (Ptr{MYSQL},), mysql)
end
function mysql_get_client_info()
  ccall( (:mysql_get_client_info, mysql), Ptr{Uint8}, (), )
end
function mysql_get_client_version()
  ccall( (:mysql_get_client_version, mysql), Culong, (), )
end
function mysql_get_host_info(mysql::Ptr{MYSQL})
  ccall( (:mysql_get_host_info, mysql), Ptr{Uint8}, (Ptr{MYSQL},), mysql)
end
function mysql_get_server_version(mysql::Ptr{MYSQL})
  ccall( (:mysql_get_server_version, mysql), Culong, (Ptr{MYSQL},), mysql)
end
function mysql_get_proto_info(mysql::Ptr{MYSQL})
  ccall( (:mysql_get_proto_info, mysql), Uint32, (Ptr{MYSQL},), mysql)
end
function mysql_list_dbs(mysql::Ptr{MYSQL}, wild::Ptr{Uint8})
  ccall( (:mysql_list_dbs, mysql), Ptr{MYSQL_RES}, (Ptr{MYSQL}, Ptr{Uint8}), mysql, wild)
end
function mysql_list_tables(mysql::Ptr{MYSQL}, wild::Ptr{Uint8})
  ccall( (:mysql_list_tables, mysql), Ptr{MYSQL_RES}, (Ptr{MYSQL}, Ptr{Uint8}), mysql, wild)
end
function mysql_list_processes(mysql::Ptr{MYSQL})
  ccall( (:mysql_list_processes, mysql), Ptr{MYSQL_RES}, (Ptr{MYSQL},), mysql)
end
function mysql_options(mysql::Ptr{MYSQL}, option::mysql_option, arg::Ptr{None})
  ccall( (:mysql_options, mysql), Cint, (Ptr{MYSQL}, mysql_option, Ptr{None}), mysql, option, arg)
end
function mysql_free_result(result::Ptr{MYSQL_RES})
  ccall( (:mysql_free_result, mysql), None, (Ptr{MYSQL_RES},), result)
end
function mysql_data_seek(result::Ptr{MYSQL_RES}, offset::my_ulonglong)
  ccall( (:mysql_data_seek, mysql), None, (Ptr{MYSQL_RES}, my_ulonglong), result, offset)
end
function mysql_row_seek(result::Ptr{MYSQL_RES}, offset::MYSQL_ROW_OFFSET)
  ccall( (:mysql_row_seek, mysql), MYSQL_ROW_OFFSET, (Ptr{MYSQL_RES}, MYSQL_ROW_OFFSET), result, offset)
end
function mysql_field_seek(result::Ptr{MYSQL_RES}, offset::MYSQL_FIELD_OFFSET)
  ccall( (:mysql_field_seek, mysql), MYSQL_FIELD_OFFSET, (Ptr{MYSQL_RES}, MYSQL_FIELD_OFFSET), result, offset)
end
function mysql_fetch_row(result::Ptr{MYSQL_RES})
  ccall( (:mysql_fetch_row, mysql), MYSQL_ROW, (Ptr{MYSQL_RES},), result)
end
function mysql_fetch_lengths(result::Ptr{MYSQL_RES})
  ccall( (:mysql_fetch_lengths, mysql), Ptr{Culong}, (Ptr{MYSQL_RES},), result)
end
function mysql_fetch_field(result::Ptr{MYSQL_RES})
  ccall( (:mysql_fetch_field, mysql), Ptr{MYSQL_FIELD}, (Ptr{MYSQL_RES},), result)
end
function mysql_list_fields(mysql::Ptr{MYSQL}, table::Ptr{Uint8}, wild::Ptr{Uint8})
  ccall( (:mysql_list_fields, mysql), Ptr{MYSQL_RES}, (Ptr{MYSQL}, Ptr{Uint8}, Ptr{Uint8}), mysql, table, wild)
end
function mysql_escape_string(to::Ptr{Uint8}, from::Ptr{Uint8}, from_length::Culong)
  ccall( (:mysql_escape_string, mysql), Culong, (Ptr{Uint8}, Ptr{Uint8}, Culong), to, from, from_length)
end
function mysql_hex_string(to::Ptr{Uint8}, from::Ptr{Uint8}, from_length::Culong)
  ccall( (:mysql_hex_string, mysql), Culong, (Ptr{Uint8}, Ptr{Uint8}, Culong), to, from, from_length)
end
function mysql_real_escape_string(mysql::Ptr{MYSQL}, to::Ptr{Uint8}, from::Ptr{Uint8}, length::Culong)
  ccall( (:mysql_real_escape_string, mysql), Culong, (Ptr{MYSQL}, Ptr{Uint8}, Ptr{Uint8}, Culong), mysql, to, from, length)
end
function mysql_debug(debug::Ptr{Uint8})
  ccall( (:mysql_debug, mysql), None, (Ptr{Uint8},), debug)
end
function myodbc_remove_escape(mysql::Ptr{MYSQL}, name::Ptr{Uint8})
  ccall( (:myodbc_remove_escape, mysql), None, (Ptr{MYSQL}, Ptr{Uint8}), mysql, name)
end
function mysql_thread_safe()
  ccall( (:mysql_thread_safe, mysql), Uint32, (), )
end
function mysql_embedded()
  ccall( (:mysql_embedded, mysql), my_bool, (), )
end
function mysql_read_query_result(mysql::Ptr{MYSQL})
  ccall( (:mysql_read_query_result, mysql), my_bool, (Ptr{MYSQL},), mysql)
end
function mysql_stmt_init(mysql::Ptr{MYSQL})
  ccall( (:mysql_stmt_init, mysql), Ptr{MYSQL_STMT}, (Ptr{MYSQL},), mysql)
end
function mysql_stmt_prepare(stmt::Ptr{MYSQL_STMT}, query::Ptr{Uint8}, length::Culong)
  ccall( (:mysql_stmt_prepare, mysql), Cint, (Ptr{MYSQL_STMT}, Ptr{Uint8}, Culong), stmt, query, length)
end
function mysql_stmt_execute(stmt::Ptr{MYSQL_STMT})
  ccall( (:mysql_stmt_execute, mysql), Cint, (Ptr{MYSQL_STMT},), stmt)
end
function mysql_stmt_fetch(stmt::Ptr{MYSQL_STMT})
  ccall( (:mysql_stmt_fetch, mysql), Cint, (Ptr{MYSQL_STMT},), stmt)
end
function mysql_stmt_fetch_column(stmt::Ptr{MYSQL_STMT}, bind_arg::Ptr{MYSQL_BIND}, column::Uint32, offset::Culong)
  ccall( (:mysql_stmt_fetch_column, mysql), Cint, (Ptr{MYSQL_STMT}, Ptr{MYSQL_BIND}, Uint32, Culong), stmt, bind_arg, column, offset)
end
function mysql_stmt_store_result(stmt::Ptr{MYSQL_STMT})
  ccall( (:mysql_stmt_store_result, mysql), Cint, (Ptr{MYSQL_STMT},), stmt)
end
function mysql_stmt_param_count(stmt::Ptr{MYSQL_STMT})
  ccall( (:mysql_stmt_param_count, mysql), Culong, (Ptr{MYSQL_STMT},), stmt)
end
function mysql_stmt_attr_set(stmt::Ptr{MYSQL_STMT}, attr_type::enum_stmt_attr_type, attr::Ptr{None})
  ccall( (:mysql_stmt_attr_set, mysql), my_bool, (Ptr{MYSQL_STMT}, enum_stmt_attr_type, Ptr{None}), stmt, attr_type, attr)
end
function mysql_stmt_attr_get(stmt::Ptr{MYSQL_STMT}, attr_type::enum_stmt_attr_type, attr::Ptr{None})
  ccall( (:mysql_stmt_attr_get, mysql), my_bool, (Ptr{MYSQL_STMT}, enum_stmt_attr_type, Ptr{None}), stmt, attr_type, attr)
end
function mysql_stmt_bind_param(stmt::Ptr{MYSQL_STMT}, bnd::Ptr{MYSQL_BIND})
  ccall( (:mysql_stmt_bind_param, mysql), my_bool, (Ptr{MYSQL_STMT}, Ptr{MYSQL_BIND}), stmt, bnd)
end
function mysql_stmt_bind_result(stmt::Ptr{MYSQL_STMT}, bnd::Ptr{MYSQL_BIND})
  ccall( (:mysql_stmt_bind_result, mysql), my_bool, (Ptr{MYSQL_STMT}, Ptr{MYSQL_BIND}), stmt, bnd)
end
function mysql_stmt_close(stmt::Ptr{MYSQL_STMT})
  ccall( (:mysql_stmt_close, mysql), my_bool, (Ptr{MYSQL_STMT},), stmt)
end
function mysql_stmt_reset(stmt::Ptr{MYSQL_STMT})
  ccall( (:mysql_stmt_reset, mysql), my_bool, (Ptr{MYSQL_STMT},), stmt)
end
function mysql_stmt_free_result(stmt::Ptr{MYSQL_STMT})
  ccall( (:mysql_stmt_free_result, mysql), my_bool, (Ptr{MYSQL_STMT},), stmt)
end
function mysql_stmt_send_long_data(stmt::Ptr{MYSQL_STMT}, param_number::Uint32, data::Ptr{Uint8}, length::Culong)
  ccall( (:mysql_stmt_send_long_data, mysql), my_bool, (Ptr{MYSQL_STMT}, Uint32, Ptr{Uint8}, Culong), stmt, param_number, data, length)
end
function mysql_stmt_result_metadata(stmt::Ptr{MYSQL_STMT})
  ccall( (:mysql_stmt_result_metadata, mysql), Ptr{MYSQL_RES}, (Ptr{MYSQL_STMT},), stmt)
end
function mysql_stmt_param_metadata(stmt::Ptr{MYSQL_STMT})
  ccall( (:mysql_stmt_param_metadata, mysql), Ptr{MYSQL_RES}, (Ptr{MYSQL_STMT},), stmt)
end
function mysql_stmt_errno(stmt::Ptr{MYSQL_STMT})
  ccall( (:mysql_stmt_errno, mysql), Uint32, (Ptr{MYSQL_STMT},), stmt)
end
function mysql_stmt_error(stmt::Ptr{MYSQL_STMT})
  ccall( (:mysql_stmt_error, mysql), Ptr{Uint8}, (Ptr{MYSQL_STMT},), stmt)
end
function mysql_stmt_sqlstate(stmt::Ptr{MYSQL_STMT})
  ccall( (:mysql_stmt_sqlstate, mysql), Ptr{Uint8}, (Ptr{MYSQL_STMT},), stmt)
end
function mysql_stmt_row_seek(stmt::Ptr{MYSQL_STMT}, offset::MYSQL_ROW_OFFSET)
  ccall( (:mysql_stmt_row_seek, mysql), MYSQL_ROW_OFFSET, (Ptr{MYSQL_STMT}, MYSQL_ROW_OFFSET), stmt, offset)
end
function mysql_stmt_row_tell(stmt::Ptr{MYSQL_STMT})
  ccall( (:mysql_stmt_row_tell, mysql), MYSQL_ROW_OFFSET, (Ptr{MYSQL_STMT},), stmt)
end
function mysql_stmt_data_seek(stmt::Ptr{MYSQL_STMT}, offset::my_ulonglong)
  ccall( (:mysql_stmt_data_seek, mysql), None, (Ptr{MYSQL_STMT}, my_ulonglong), stmt, offset)
end
function mysql_stmt_num_rows(stmt::Ptr{MYSQL_STMT})
  ccall( (:mysql_stmt_num_rows, mysql), my_ulonglong, (Ptr{MYSQL_STMT},), stmt)
end
function mysql_stmt_affected_rows(stmt::Ptr{MYSQL_STMT})
  ccall( (:mysql_stmt_affected_rows, mysql), my_ulonglong, (Ptr{MYSQL_STMT},), stmt)
end
function mysql_stmt_insert_id(stmt::Ptr{MYSQL_STMT})
  ccall( (:mysql_stmt_insert_id, mysql), my_ulonglong, (Ptr{MYSQL_STMT},), stmt)
end
function mysql_stmt_field_count(stmt::Ptr{MYSQL_STMT})
  ccall( (:mysql_stmt_field_count, mysql), Uint32, (Ptr{MYSQL_STMT},), stmt)
end
function mysql_commit(mysql::Ptr{MYSQL})
  ccall( (:mysql_commit, mysql), my_bool, (Ptr{MYSQL},), mysql)
end
function mysql_rollback(mysql::Ptr{MYSQL})
  ccall( (:mysql_rollback, mysql), my_bool, (Ptr{MYSQL},), mysql)
end
function mysql_autocommit(mysql::Ptr{MYSQL}, auto_mode::my_bool)
  ccall( (:mysql_autocommit, mysql), my_bool, (Ptr{MYSQL}, my_bool), mysql, auto_mode)
end
function mysql_more_results(mysql::Ptr{MYSQL})
  ccall( (:mysql_more_results, mysql), my_bool, (Ptr{MYSQL},), mysql)
end
function mysql_next_result(mysql::Ptr{MYSQL})
  ccall( (:mysql_next_result, mysql), Cint, (Ptr{MYSQL},), mysql)
end
function mysql_stmt_next_result(stmt::Ptr{MYSQL_STMT})
  ccall( (:mysql_stmt_next_result, mysql), Cint, (Ptr{MYSQL_STMT},), stmt)
end
function mysql_close(sock::Ptr{MYSQL})
  ccall( (:mysql_close, mysql), None, (Ptr{MYSQL},), sock)
end
