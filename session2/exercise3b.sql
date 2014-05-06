SELECT p.pid FROM Person p
WHERE EXISTS (
	SELECT * FROM Acts a
	WHERE a.pid = p.pid
	AND a.mid IN (
		SELECT m.mid FROM Movie m 
		WHERE m.name = 'Back to the Future'
	)
);