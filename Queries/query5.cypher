MATCH (src_ligand:ChemicalComponent)-[:ACTS_AS_COFACTOR]->(co:COFactorClass)
    OPTIONAL MATCH (co)<-[:ACTS_AS_COFACTOR]->(dest_ligand:ChemicalComponent)
    RETURN co.NAME, dest_ligand.ID, dest_ligand.NAME LIMIT 50