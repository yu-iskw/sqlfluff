create table table1 (
    c1 INT NOT NULL,
    c2 INT NULL DEFAULT 1,
    c3 INT PRIMARY KEY,
    c4 INT UNIQUE,
    c5 INT REFERENCES table2,
    c6 INT REFERENCES table2 (c6_other),
    c6 INT REFERENCES table2 (c6_other) MATCH FULL,
    c6 INT REFERENCES table2 (c6_other) MATCH PARTIAL,
    c6 INT REFERENCES table2 (c6_other) MATCH SIMPLE,
    c6 INT REFERENCES table2 (c6_other) ON DELETE NO ACTION,
    c6 INT REFERENCES table2 (c6_other) ON UPDATE SET NULL,
    c6 INT REFERENCES table2 (c6_other) ON DELETE RESTRICT ON UPDATE CASCADE,
    c7 INT NOT NULL DEFAULT 1 UNIQUE REFERENCES table3 (c7_other)
)
