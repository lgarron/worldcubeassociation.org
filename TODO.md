Migration: 

    ALTER TABLE Events MODIFY COLUMN id varchar(100);
    INSERT INTO Events (id, name, rank, format, cellName) VALUES ("unofficial-333ft", "3x3x3 With Feet (Unofficial)", 1010, "time", "3x3x3 With Feet (Unofficial)");



