match (b:BoundLigand)-[dis:HAS_ARP_CONTACT]->(res:PDBResidue),(res:PDBResidue)<-[:HAS_PDB_RESIDUE]-(e:Entity),
(e:Entity)<-[:HAS_ENTITY]-(pdb:Entry)
optional match (res:PDBResidue)-[:IS_IN_SCOP_DOMAIN]->(scop:SCOP)
optional match (res:PDBResidue)-[:IS_IN_CATH_DOMAIN]->(cath:CATH)
return distinct pdb.ID, scop.DESCRIPTION, dis.DISTANCE,res.CHEM_COMP_ID,b.CHEM_COMP_ID LIMIT 50