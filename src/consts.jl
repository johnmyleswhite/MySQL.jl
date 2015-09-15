if OS_NAME==:Windows
  error("MySQL does not support Windows yet.  Please help out by locating your libmysqlclient.dll.")
else
  mysql_libs = String[]
  stream,process = open(`mysql_config --libs`,"r")
  dirs = split(readchomp(stream))
  for L in filter(x->beginswith(x,"-L"), dirs)
    files = readdir(L[3:end])
    libs = filter(x->ismatch(r"libmysqlclient\..*(so|dylib)$",x), files)
    push!(mysql_libs, map(x->joinpath(L[3:end],x),libs)...)
  end
  if length(mysql_libs)>1
    info("multiple SQL clients found:")
    map(info,mysql_libs)
  end
  const mysql_lib = mysql_libs[1]
end
