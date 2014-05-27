CREATE TABLE IF NOT EXISTS Boek (
isbn VARCHAR (13), 
titel (45),
auteur VARCHAR(45),
PRIMARY KEY (isbn),
);

CREATE TABLE IF NOT EXISTS Exemplaar (
isbn VARCHAR(13) NOT NULL,
volgnummer SMALLINT,
gewicht INT,
kast VARCHAR(20),
PRIMARY KEY (isbn, volgnummer),
FOREIGN KEY (isbn) REFERENCES Boek(isbn)
ON UPDATE CASCADE,
);

Create Trigger delete_boek
	before DELETEON Boek
	FOR EACH row
	EXECUTE PROCEDURE delete_exemplaren();

CREATE FUNCTION delete_exemplaren() return TRIGGER as $_$
BEGIN
	DELETE FROM Exemplaar WHERE Exemplaar.isbn = OLD.isbn
	return OLD;
END $_$ language 'plpgsgl';


