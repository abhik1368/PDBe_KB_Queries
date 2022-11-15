MATCH ()-[r]-() 
RETURN TYPE(r) AS relationshipType, COUNT(r) AS relationshipCount;