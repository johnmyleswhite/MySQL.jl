module TestDBI
    using DBI
    using MySQL

    db = connect(MySQL5,
                 "127.0.0.1",
                 "root",
                 "KF4BvgkhFqd9",
                 "jmw")

    stmt = prepare(db, "CREATE TABLE users (id INT PRIMARY KEY AUTO_INCREMENT, name VARCHAR(255))")

    stmt = prepare(db, "CREATE TABLE users (id INT PRIMARY KEY AUTO_INCREMENT, name VARCHAR(255))")

    errcode(db)
    errstring(db)

    rowid = lastinsertid(db)

    stmt = prepare(db, "INSERT INTO users (name) VALUES ('Jeff Bezanson')")
    stmt = prepare(db, "INSERT INTO users (name) VALUES ('Viral Shah')")
    stmt = prepare(db, "INSERT INTO users (name) VALUES ('Stefan Karpinski')")

    rowid = lastinsertid(db)

    stmt = prepare(db, "DROP TABLE users")

    safesql = sqlescape(db, "SELECT * FROM users WHERE name LIKE Viral's")

    disconnect(db)
end
