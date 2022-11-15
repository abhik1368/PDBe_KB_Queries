  MATCH (entry:Entry)-[:HAS_ENTITY]->(entity:Entity {POLYMER_TYPE:'P'})-[:CONTAINS_CHAIN]->(chain:Chain)
    MATCH (entity)-[:HAS_GO]->(bio_go:GOBiologicalProcess)
    RETURN entity.ID, chain.AUTH_ASYM_ID, chain.STRUCT_ASYM_ID, bio_go.GO_ID, bio_go.DEFINITION, bio_go.NAME
    ORDER BY chain.AUTH_ASYM_ID, entity.ID LIMIT 50
