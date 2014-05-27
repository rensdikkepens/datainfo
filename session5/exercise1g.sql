CREATE TABLE Bestelling IF NOT EXISTS(
isbn VARCHAR(13),
aantal BIGINT,
)

CREATE TRIGGER bestellingTrigger
	before insert of auteur on Boek
	referencing old as O new as N
	for each row
	when O.auteur <> N.auteur
	execute procedure function;




Schrijf daarna een trigger die een nieuwe rij aan Bestelling 
toevoegt wanneer er een boek aan de tabel Boek wordt toegevoegd
van een schrijver die nog niet in de tabel Boek voorkwam vóórdat 
het boek toegevoegd werd