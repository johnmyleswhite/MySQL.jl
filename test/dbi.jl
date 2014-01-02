module TestDBI
    using DBI
    using MySQL

    db = connect(MySQL5, "127.0.0.1", "root", "KF4BvgkhFqd9", "jmw")

    sql = "CREATE TABLE users (id INT PRIMARY KEY AUTO_INCREMENT, name VARCHAR(255))"

    stmt = prepare(db, sql)
    execute(stmt)

    try
        stmt = prepare(db, sql)
        execute(stmt)
    end

    errcode(db)
    errstring(db)

    rowid = lastinsertid(db)

    stmt = prepare(db, "INSERT INTO users (name) VALUES ('Jeff Bezanson')")
    execute(stmt)

    stmt = prepare(db, "INSERT INTO users (name) VALUES ('Viral Shah')")
    execute(stmt)

    stmt = prepare(db, "INSERT INTO users (name) VALUES ('Stefan Karpinski')")
    execute(stmt)

    rowid = lastinsertid(db)

    stmt = prepare(db, "DROP TABLE users")
    execute(stmt)

    # TODO: Rename this
    safesql = sqlescape(db, "Viral's")

    disconnect(db)
end
