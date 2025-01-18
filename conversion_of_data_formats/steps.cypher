UNWIND [{id:"1029890",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000001"}, end: {id:"1029890"}, properties:{sequence_index:10}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1029890"}, end: {id:"111721"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1029890"}, end: {id:"4923339482"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1029890"}, end: {id:"0006656532"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1029890"}, end: {id:"9482923849"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1848471",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000001"}, end: {id:"1848471"}, properties:{sequence_index:7}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1848471"}, end: {id:"111132"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1848471"}, end: {id:"9482113948"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1848471"}, end: {id:"0004264724"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1848471"}, end: {id:"9482943948"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2741906",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000001"}, end: {id:"2741906"}, properties:{sequence_index:5}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2741906"}, end: {id:"111182"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2741906"}, end: {id:"9848294829"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2741906"}, end: {id:"0003954314"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2741906"}, end: {id:"9848292229"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4614728",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000001"}, end: {id:"4614728"}, properties:{sequence_index:3}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4614728"}, end: {id:"111260"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4614728"}, end: {id:"9429829482"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4614728"}, end: {id:"0007563791"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4614728"}, end: {id:"9482984922"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"6462728",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000001"}, end: {id:"6462728"}, properties:{sequence_index:8}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"6462728"}, end: {id:"111132"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"6462728"}, end: {id:"9482943948"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6462728"}, end: {id:"0006563727"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6462728"}, end: {id:"4928239482"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"6463728",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000001"}, end: {id:"6463728"}, properties:{sequence_index:2}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"6463728"}, end: {id:"111649"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"6463728"}, end: {id:"9492920340"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6463728"}, end: {id:"0007636749"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6463728"}, end: {id:"9429829482"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"6466378",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000001"}, end: {id:"6466378"}, properties:{sequence_index:6}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"6466378"}, end: {id:"111975"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"6466378"}, end: {id:"9848292229"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6466378"}, end: {id:"0009877781"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6466378"}, end: {id:"9482113948"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"7364656",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000001"}, end: {id:"7364656"}, properties:{sequence_index:1}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"7364656"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"7364656"}, end: {id:"9492920340"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"7466748",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000001"}, end: {id:"7466748"}, properties:{sequence_index:4}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"7466748"}, end: {id:"111634"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"7466748"}, end: {id:"9492920340"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7466748"}, end: {id:"9482984922"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7466748"}, end: {id:"9848294829"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"7561612",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000001"}, end: {id:"7561612"}, properties:{sequence_index:12}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"7561612"}, end: {id:"111341"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"7561612"}, end: {id:"4938429483"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"7563728",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000001"}, end: {id:"7563728"}, properties:{sequence_index:9}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"7563728"}, end: {id:"111268"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"7563728"}, end: {id:"4928239482"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7563728"}, end: {id:"4923339482"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"7566272",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000001"}, end: {id:"7566272"}, properties:{sequence_index:11}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"7566272"}, end: {id:"111634"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"7566272"}, end: {id:"9482923849"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7566272"}, end: {id:"9492920340"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7566272"}, end: {id:"4938429483"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1383414",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000002"}, end: {id:"1383414"}, properties:{sequence_index:16}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1383414"}, end: {id:"111341"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1383414"}, end: {id:"9988949211"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3040493",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000002"}, end: {id:"3040493"}, properties:{sequence_index:8}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3040493"}, end: {id:"111299"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3040493"}, end: {id:"5832984291"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3841414",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000002"}, end: {id:"3841414"}, properties:{sequence_index:15}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3841414"}, end: {id:"111975"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3841414"}, end: {id:"9889984281"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3841414"}, end: {id:"0003838111"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"3841414"}, end: {id:"9988949211"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3984721",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000002"}, end: {id:"3984721"}, properties:{sequence_index:10}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3984721"}, end: {id:"111268"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3984721"}, end: {id:"9482928243"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3984721"}, end: {id:"9482438243"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5832058",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000002"}, end: {id:"5832058"}, properties:{sequence_index:5}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5832058"}, end: {id:"111546"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5832058"}, end: {id:"4638429483"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5832058"}, end: {id:"4598294821"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"6839583",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000002"}, end: {id:"6839583"}, properties:{sequence_index:2}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"6839583"}, end: {id:"111886"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"6839583"}, end: {id:"4938429483"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6839583"}, end: {id:"0004089571"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6839583"}, end: {id:"0004582412"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6839583"}, end: {id:"4838429483"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"7563628",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000002"}, end: {id:"7563628"}, properties:{sequence_index:12}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"7563628"}, end: {id:"111282"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"7563628"}, end: {id:"4827492911"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7563628"}, end: {id:"0006466214"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7563628"}, end: {id:"1248277773"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"7566277",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000002"}, end: {id:"7566277"}, properties:{sequence_index:14}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"7566277"}, end: {id:"111282"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"7566277"}, end: {id:"7572664728"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7566277"}, end: {id:"0008842811"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7566277"}, end: {id:"9889984281"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"7572728",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000002"}, end: {id:"7572728"}, properties:{sequence_index:13}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"7572728"}, end: {id:"111530"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"7572728"}, end: {id:"1248277773"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7572728"}, end: {id:"0007471778"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7572728"}, end: {id:"7572664728"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"7663728",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000002"}, end: {id:"7663728"}, properties:{sequence_index:1}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"7663728"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"7663728"}, end: {id:"4938429483"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8374590",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000002"}, end: {id:"8374590"}, properties:{sequence_index:6}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8374590"}, end: {id:"111198"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8374590"}, end: {id:"9483928192"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8374590"}, end: {id:"9482928242"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8374625",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000002"}, end: {id:"8374625"}, properties:{sequence_index:7}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8374625"}, end: {id:"111530"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8374625"}, end: {id:"9482928242"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8374625"}, end: {id:"0007894942"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8374625"}, end: {id:"9482928243"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8492847",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000002"}, end: {id:"8492847"}, properties:{sequence_index:4}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8492847"}, end: {id:"111253"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8492847"}, end: {id:"4938429483"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8492847"}, end: {id:"4938429483"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8492847"}, end: {id:"4638429483"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9483240",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000002"}, end: {id:"9483240"}, properties:{sequence_index:11}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9483240"}, end: {id:"111355"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9483240"}, end: {id:"9482438243"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9483240"}, end: {id:"3285732911"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9483240"}, end: {id:"4827492911"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9582956",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000002"}, end: {id:"9582956"}, properties:{sequence_index:3}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9582956"}, end: {id:"111355"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9582956"}, end: {id:"4598294821"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9582956"}, end: {id:"4838429483"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9582956"}, end: {id:"9483928192"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9832430",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000002"}, end: {id:"9832430"}, properties:{sequence_index:9}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9832430"}, end: {id:"111282"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9832430"}, end: {id:"5832984291"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9832430"}, end: {id:"0001111111"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9832430"}, end: {id:"3285732911"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1928392",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000003"}, end: {id:"1928392"}, properties:{sequence_index:6}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1928392"}, end: {id:"111975"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1928392"}, end: {id:"4742644828"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1928392"}, end: {id:"0004829194"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1928392"}, end: {id:"3829492824"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2384942",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000003"}, end: {id:"2384942"}, properties:{sequence_index:8}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2384942"}, end: {id:"111341"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2384942"}, end: {id:"4585932229"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2384942"}, end: {id:"2103023049"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2849492",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000003"}, end: {id:"2849492"}, properties:{sequence_index:11}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2849492"}, end: {id:"111975"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2849492"}, end: {id:"3942849294"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2849492"}, end: {id:"0001921933"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2849492"}, end: {id:"4843995999"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2939404",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000003"}, end: {id:"2939404"}, properties:{sequence_index:10}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2939404"}, end: {id:"111980"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2939404"}, end: {id:"4938429483"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2939404"}, end: {id:"2123139121"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2939404"}, end: {id:"3942849294"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2949492",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000003"}, end: {id:"2949492"}, properties:{sequence_index:7}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2949492"}, end: {id:"111268"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2949492"}, end: {id:"3829492824"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2949492"}, end: {id:"4585932229"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3848592",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000003"}, end: {id:"3848592"}, properties:{sequence_index:5}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3848592"}, end: {id:"111980"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3848592"}, end: {id:"4938429483"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3848592"}, end: {id:"4938429484"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3848592"}, end: {id:"4742644828"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3848924",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000003"}, end: {id:"3848924"}, properties:{sequence_index:9}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3848924"}, end: {id:"111182"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3848924"}, end: {id:"4938429484"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3848924"}, end: {id:"0003747849"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"3848924"}, end: {id:"2123139121"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3848927",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000003"}, end: {id:"3848927"}, properties:{sequence_index:2}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3848927"}, end: {id:"111886"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3848927"}, end: {id:"4938429483"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3848927"}, end: {id:"0002393922"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"3848927"}, end: {id:"0003949052"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"3848927"}, end: {id:"2394853829"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4294921",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000003"}, end: {id:"4294921"}, properties:{sequence_index:12}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4294921"}, end: {id:"111268"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4294921"}, end: {id:"4843995999"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4294921"}, end: {id:"2103023049"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4747288",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000003"}, end: {id:"4747288"}, properties:{sequence_index:4}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4747288"}, end: {id:"111522"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4747288"}, end: {id:"4938429482"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4747288"}, end: {id:"0003919391"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4747288"}, end: {id:"0003981813"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4747288"}, end: {id:"0002919191"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4747288"}, end: {id:"4938429484"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"7473895",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000003"}, end: {id:"7473895"}, properties:{sequence_index:1}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"7473895"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"7473895"}, end: {id:"4938429483"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9595949",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000003"}, end: {id:"9595949"}, properties:{sequence_index:3}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9595949"}, end: {id:"111329"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9595949"}, end: {id:"2394853829"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9595949"}, end: {id:"0004849392"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9595949"}, end: {id:"0001030901"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9595949"}, end: {id:"0003413423"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9595949"}, end: {id:"4938429482"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1010301",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000004"}, end: {id:"1010301"}, properties:{sequence_index:3}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1010301"}, end: {id:"111680"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1010301"}, end: {id:"1314864131"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1010301"}, end: {id:"0005626421"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1010301"}, end: {id:"1314464131"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1939442",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000004"}, end: {id:"1939442"}, properties:{sequence_index:5}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1939442"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1939442"}, end: {id:"9291999979"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1939442"}, end: {id:"1314464131"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1939442"}, end: {id:"3947269979"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2932848",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000004"}, end: {id:"2932848"}, properties:{sequence_index:1}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2932848"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2932848"}, end: {id:"9991999979"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2932849",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000004"}, end: {id:"2932849"}, properties:{sequence_index:1.3}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2932849"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2932849"}, end: {id:"1314864131"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2932850",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000004"}, end: {id:"2932850"}, properties:{sequence_index:1.6}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2932850"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2932850"}, end: {id:"9999999981"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3737384",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000004"}, end: {id:"3737384"}, properties:{sequence_index:11}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3737384"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3737384"}, end: {id:"1636453295"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3737384"}, end: {id:"3947269979"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3737384"}, end: {id:"8494839423"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3837471",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000004"}, end: {id:"3837471"}, properties:{sequence_index:7}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3837471"}, end: {id:"111104"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3837471"}, end: {id:"9919999981"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3948573",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000004"}, end: {id:"3948573"}, properties:{sequence_index:9}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3948573"}, end: {id:"111299"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3948573"}, end: {id:"7575859295"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3948584",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000004"}, end: {id:"3948584"}, properties:{sequence_index:12}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3948584"}, end: {id:"111341"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3948584"}, end: {id:"8494839423"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4224853",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000004"}, end: {id:"4224853"}, properties:{sequence_index:4}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4224853"}, end: {id:"111776"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4224853"}, end: {id:"9991999979"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4224853"}, end: {id:"9291999979"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4655746",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000004"}, end: {id:"4655746"}, properties:{sequence_index:10}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4655746"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4655746"}, end: {id:"7575859295"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4655746"}, end: {id:"7466829492"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4655746"}, end: {id:"1636453295"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5656372",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000004"}, end: {id:"5656372"}, properties:{sequence_index:8}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5656372"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5656372"}, end: {id:"9999999981"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5656372"}, end: {id:"9919999981"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5656372"}, end: {id:"7466829492"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1393411",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000005"}, end: {id:"1393411"}, properties:{sequence_index:8}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1393411"}, end: {id:"111894"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1393411"}, end: {id:"7575859310"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1393411"}, end: {id:"7575859312"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2339482",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000005"}, end: {id:"2339482"}, properties:{sequence_index:2}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2339482"}, end: {id:"111935"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2339482"}, end: {id:"7575859295"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2339482"}, end: {id:"7575859300"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2930454",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000005"}, end: {id:"2930454"}, properties:{sequence_index:5}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2930454"}, end: {id:"111634"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2930454"}, end: {id:"7575859304"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2930454"}, end: {id:"7575859302"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2930454"}, end: {id:"7575859306"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3838233",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000005"}, end: {id:"3838233"}, properties:{sequence_index:7}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3838233"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3838233"}, end: {id:"7575859308"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3838233"}, end: {id:"7575859310"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3848292",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000005"}, end: {id:"3848292"}, properties:{sequence_index:6}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3848292"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3848292"}, end: {id:"7575859306"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3848292"}, end: {id:"7575859308"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3948552",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000005"}, end: {id:"3948552"}, properties:{sequence_index:3}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3948552"}, end: {id:"111935"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3948552"}, end: {id:"7575859300"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3948552"}, end: {id:"7575859302"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3948572",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000005"}, end: {id:"3948572"}, properties:{sequence_index:1}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3948572"}, end: {id:"111299"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3948572"}, end: {id:"7575859295"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3949211",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000005"}, end: {id:"3949211"}, properties:{sequence_index:9}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3949211"}, end: {id:"111345"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3949211"}, end: {id:"7575859312"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4295822",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000005"}, end: {id:"4295822"}, properties:{sequence_index:4}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4295822"}, end: {id:"111299"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4295822"}, end: {id:"7575859304"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1039774",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000006"}, end: {id:"1039774"}, properties:{sequence_index:14}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1039774"}, end: {id:"111215"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1039774"}, end: {id:"9999999870"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1039774"}, end: {id:"9999998870"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1203100",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000006"}, end: {id:"1203100"}, properties:{sequence_index:17}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1203100"}, end: {id:"111634"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1203100"}, end: {id:"3948574226"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1203100"}, end: {id:"9999999961"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1203100"}, end: {id:"3948574228"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1204921",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000006"}, end: {id:"1204921"}, properties:{sequence_index:1}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1204921"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1204921"}, end: {id:"3121513111"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1204929",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000006"}, end: {id:"1204929"}, properties:{sequence_index:19}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1204929"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1204929"}, end: {id:"1029039903"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1204945",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000006"}, end: {id:"1204945"}, properties:{sequence_index:11}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1204945"}, end: {id:"111634"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1204945"}, end: {id:"1020394900"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1204945"}, end: {id:"3121234211"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1204945"}, end: {id:"3121234212"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1294844",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000006"}, end: {id:"1294844"}, properties:{sequence_index:3}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1294844"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1294844"}, end: {id:"9999999960"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1294945",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000006"}, end: {id:"1294945"}, properties:{sequence_index:7}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1294945"}, end: {id:"111634"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1294945"}, end: {id:"3147472131"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1294945"}, end: {id:"1020394902"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1294945"}, end: {id:"4147472132"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1341141",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000006"}, end: {id:"1341141"}, properties:{sequence_index:18}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1341141"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1341141"}, end: {id:"3948574228"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1341141"}, end: {id:"3948574230"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1347587",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000006"}, end: {id:"1347587"}, properties:{sequence_index:24}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1347587"}, end: {id:"111680"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1347587"}, end: {id:"3948574230"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1347587"}, end: {id:"0006544644"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1347587"}, end: {id:"3948574233"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1395335",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000006"}, end: {id:"1395335"}, properties:{sequence_index:20}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1395335"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1395335"}, end: {id:"4298359835"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1923945",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000006"}, end: {id:"1923945"}, properties:{sequence_index:15}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1923945"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1923945"}, end: {id:"3948574224"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2030624",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000006"}, end: {id:"2030624"}, properties:{sequence_index:13}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2030624"}, end: {id:"111975"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2030624"}, end: {id:"9999999962"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2030624"}, end: {id:"0001304952"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2030624"}, end: {id:"9999999870"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2322434",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000006"}, end: {id:"2322434"}, properties:{sequence_index:22}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2322434"}, end: {id:"111646"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2322434"}, end: {id:"4298359835"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2322434"}, end: {id:"0002342425"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2322434"}, end: {id:"4298359845"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2394495",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000006"}, end: {id:"2394495"}, properties:{sequence_index:32}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2394495"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2394495"}, end: {id:"4394958389"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2394495"}, end: {id:"1648958381"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2422434",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000006"}, end: {id:"2422434"}, properties:{sequence_index:21}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2422434"}, end: {id:"111483"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2422434"}, end: {id:"1029039903"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2422434"}, end: {id:"0002239424"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2422434"}, end: {id:"1029039904"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2449858",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000006"}, end: {id:"2449858"}, properties:{sequence_index:23}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2449858"}, end: {id:"111634"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2449858"}, end: {id:"1029039904"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2449858"}, end: {id:"4298359845"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2449858"}, end: {id:"4298359851"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2454535",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000006"}, end: {id:"2454535"}, properties:{sequence_index:28}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2454535"}, end: {id:"111531"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2454535"}, end: {id:"3948574230"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2454535"}, end: {id:"3948574230"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2455452",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000006"}, end: {id:"2455452"}, properties:{sequence_index:37}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2455452"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2455452"}, end: {id:"1158485859"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2464445",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000006"}, end: {id:"2464445"}, properties:{sequence_index:25}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2464445"}, end: {id:"111634"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2464445"}, end: {id:"3948574233"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2464445"}, end: {id:"3948574230"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2464445"}, end: {id:"3948571256"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2900428",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000006"}, end: {id:"2900428"}, properties:{sequence_index:10}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2900428"}, end: {id:"111975"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2900428"}, end: {id:"3121513111"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2900428"}, end: {id:"0001209482"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2900428"}, end: {id:"3121234211"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2919311",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000006"}, end: {id:"2919311"}, properties:{sequence_index:2}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2919311"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2919311"}, end: {id:"3131211131"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2930492",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000006"}, end: {id:"2930492"}, properties:{sequence_index:8}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2930492"}, end: {id:"111634"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2930492"}, end: {id:"9999999960"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2930492"}, end: {id:"4147472132"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2930492"}, end: {id:"9999999965"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2938341",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000006"}, end: {id:"2938341"}, properties:{sequence_index:16}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2938341"}, end: {id:"111634"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2938341"}, end: {id:"3948574224"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2938341"}, end: {id:"9999998870"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2938341"}, end: {id:"3948574226"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2939400",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000006"}, end: {id:"2939400"}, properties:{sequence_index:12}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2939400"}, end: {id:"111634"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2939400"}, end: {id:"3121234212"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2939400"}, end: {id:"9999999960"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2939400"}, end: {id:"9999999962"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2954835",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000006"}, end: {id:"2954835"}, properties:{sequence_index:38}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2954835"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2954835"}, end: {id:"1158485859"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2954835"}, end: {id:"9958485859"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2954835"}, end: {id:"2258485859"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3294932",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000006"}, end: {id:"3294932"}, properties:{sequence_index:31}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3294932"}, end: {id:"111463"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3294932"}, end: {id:"5985371230"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3294932"}, end: {id:"4394958389"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3454353",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000006"}, end: {id:"3454353"}, properties:{sequence_index:26}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3454353"}, end: {id:"111634"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3454353"}, end: {id:"4298359851"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3454353"}, end: {id:"3948571256"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3454353"}, end: {id:"4348571256"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3919384",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000006"}, end: {id:"3919384"}, properties:{sequence_index:9}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3919384"}, end: {id:"111975"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3919384"}, end: {id:"9999999965"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3919384"}, end: {id:"0003949921"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"3919384"}, end: {id:"9999999961"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3934948",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000006"}, end: {id:"3934948"}, properties:{sequence_index:5}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3934948"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3934948"}, end: {id:"1020394902"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3949482",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000006"}, end: {id:"3949482"}, properties:{sequence_index:6}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3949482"}, end: {id:"111975"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3949482"}, end: {id:"3131211131"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3949482"}, end: {id:"0002940021"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"3949482"}, end: {id:"3147472131"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4059592",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000006"}, end: {id:"4059592"}, properties:{sequence_index:33}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4059592"}, end: {id:"111634"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4059592"}, end: {id:"5985371230"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4059592"}, end: {id:"1648958381"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4059592"}, end: {id:"2648958382"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4305953",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000006"}, end: {id:"4305953"}, properties:{sequence_index:34}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4305953"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4305953"}, end: {id:"2648958382"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4305953"}, end: {id:"2395958385"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4358635",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000006"}, end: {id:"4358635"}, properties:{sequence_index:27}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4358635"}, end: {id:"111182"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4358635"}, end: {id:"4348571256"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4358635"}, end: {id:"0002436656"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4358635"}, end: {id:"4341171256"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4939459",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000006"}, end: {id:"4939459"}, properties:{sequence_index:35}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4939459"}, end: {id:"111182"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4939459"}, end: {id:"2395958385"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4939459"}, end: {id:"0005938585"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4939459"}, end: {id:"5868688585"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5354635",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000006"}, end: {id:"5354635"}, properties:{sequence_index:30}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5354635"}, end: {id:"111634"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5354635"}, end: {id:"4943571230"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5354635"}, end: {id:"3948574230"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5354635"}, end: {id:"5985371230"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5858694",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000006"}, end: {id:"5858694"}, properties:{sequence_index:29}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5858694"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5858694"}, end: {id:"3948574230"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5858694"}, end: {id:"4943571230"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"6756574",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000006"}, end: {id:"6756574"}, properties:{sequence_index:39}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"6756574"}, end: {id:"111341"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"6756574"}, end: {id:"2258485859"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9394834",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000006"}, end: {id:"9394834"}, properties:{sequence_index:36}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9394834"}, end: {id:"111355"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9394834"}, end: {id:"4341171256"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9394834"}, end: {id:"5868688585"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9394834"}, end: {id:"9958485859"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9394842",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000006"}, end: {id:"9394842"}, properties:{sequence_index:4}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9394842"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9394842"}, end: {id:"1020394900"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1002928",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000007"}, end: {id:"1002928"}, properties:{sequence_index:5}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1002928"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1002928"}, end: {id:"9499428242"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1002928"}, end: {id:"9394939493"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1002928"}, end: {id:"2029293929"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2319391",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000007"}, end: {id:"2319391"}, properties:{sequence_index:6}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2319391"}, end: {id:"111649"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2319391"}, end: {id:"2029293929"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2319391"}, end: {id:"0003232242"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2319391"}, end: {id:"4985825552"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3568093",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000007"}, end: {id:"3568093"}, properties:{sequence_index:2}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3568093"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3568093"}, end: {id:"8572852424"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4585829",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000007"}, end: {id:"4585829"}, properties:{sequence_index:3}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4585829"}, end: {id:"111237"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4585829"}, end: {id:"8494839423"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4585829"}, end: {id:"9499428242"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4858282",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000007"}, end: {id:"4858282"}, properties:{sequence_index:4}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4858282"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4858282"}, end: {id:"8572852424"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4858282"}, end: {id:"8494839423"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4858282"}, end: {id:"9394939493"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4955966",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000007"}, end: {id:"4955966"}, properties:{sequence_index:7}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4955966"}, end: {id:"111649"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4955966"}, end: {id:"4985825552"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4955966"}, end: {id:"0003232242"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4955966"}, end: {id:"1858578388"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4958883",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000007"}, end: {id:"4958883"}, properties:{sequence_index:10}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4958883"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4958883"}, end: {id:"9485384858"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4958883"}, end: {id:"3485475729"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5495827",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000007"}, end: {id:"5495827"}, properties:{sequence_index:11}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5495827"}, end: {id:"111341"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5495827"}, end: {id:"3485475729"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5839535",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000007"}, end: {id:"5839535"}, properties:{sequence_index:9}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5839535"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5839535"}, end: {id:"1858578388"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5839535"}, end: {id:"4585828572"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5839535"}, end: {id:"9485384858"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"7419980",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000007"}, end: {id:"7419980"}, properties:{sequence_index:1}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"7419980"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"7419980"}, end: {id:"8494839423"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8485758",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000007"}, end: {id:"8485758"}, properties:{sequence_index:8}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8485758"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8485758"}, end: {id:"4585828572"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2303943",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000008"}, end: {id:"2303943"}, properties:{sequence_index:1}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2303943"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2303943"}, end: {id:"5900595848"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2939482",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000008"}, end: {id:"2939482"}, properties:{sequence_index:6}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2939482"}, end: {id:"111634"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2939482"}, end: {id:"3131111133"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2939482"}, end: {id:"0404050504"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2939482"}, end: {id:"1293923844"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3049480",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000008"}, end: {id:"3049480"}, properties:{sequence_index:2}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3049480"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3049480"}, end: {id:"0404050504"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3832748",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000008"}, end: {id:"3832748"}, properties:{sequence_index:5}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3832748"}, end: {id:"111634"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3832748"}, end: {id:"3132131132"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3832748"}, end: {id:"5900595848"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3832748"}, end: {id:"0934990943"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"6822583",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000008"}, end: {id:"6822583"}, properties:{sequence_index:8}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"6822583"}, end: {id:"111182"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"6822583"}, end: {id:"3131111133"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6822583"}, end: {id:"0005749291"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6822583"}, end: {id:"2131616531"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8332941",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000008"}, end: {id:"8332941"}, properties:{sequence_index:3}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8332941"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8332941"}, end: {id:"3131211131"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8345721",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000008"}, end: {id:"8345721"}, properties:{sequence_index:11}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8345721"}, end: {id:"111341"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8345721"}, end: {id:"3121513111"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8946983",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000008"}, end: {id:"8946983"}, properties:{sequence_index:7}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8946983"}, end: {id:"111634"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8946983"}, end: {id:"1293923844"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8946983"}, end: {id:"0934990943"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8946983"}, end: {id:"3121513111"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9103516",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000008"}, end: {id:"9103516"}, properties:{sequence_index:4}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9103516"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9103516"}, end: {id:"3131111133"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9483715",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000008"}, end: {id:"9483715"}, properties:{sequence_index:9}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9483715"}, end: {id:"111975"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9483715"}, end: {id:"2131616531"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9483715"}, end: {id:"0008837284"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9483715"}, end: {id:"2113211456"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9483843",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000008"}, end: {id:"9483843"}, properties:{sequence_index:10}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9483843"}, end: {id:"111634"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9483843"}, end: {id:"2113211456"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9483843"}, end: {id:"3131211131"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9483843"}, end: {id:"3132131132"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2839422",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000009"}, end: {id:"2839422"}, properties:{sequence_index:5}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2839422"}, end: {id:"111341"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2839422"}, end: {id:"8489593964"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4842942",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000009"}, end: {id:"4842942"}, properties:{sequence_index:2}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4842942"}, end: {id:"111282"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4842942"}, end: {id:"8489593958"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4842942"}, end: {id:"0009492929"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4842942"}, end: {id:"8489593960"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4848592",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000009"}, end: {id:"4848592"}, properties:{sequence_index:3}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4848592"}, end: {id:"111268"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4848592"}, end: {id:"8489593960"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4848592"}, end: {id:"8489593962"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4952082",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000009"}, end: {id:"4952082"}, properties:{sequence_index:1}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4952082"}, end: {id:"111299"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4952082"}, end: {id:"8489593958"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8483953",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000009"}, end: {id:"8483953"}, properties:{sequence_index:4}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8483953"}, end: {id:"111608"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8483953"}, end: {id:"8489593962"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8483953"}, end: {id:"8489593964"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1003049",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000010"}, end: {id:"1003049"}, properties:{sequence_index:20}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1003049"}, end: {id:"111886"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1003049"}, end: {id:"9988949211"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1003049"}, end: {id:"0009484724"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1003049"}, end: {id:"0004934845"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1003049"}, end: {id:"7575738420"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1293948",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000010"}, end: {id:"1293948"}, properties:{sequence_index:32}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1293948"}, end: {id:"111524"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1293948"}, end: {id:"8485867742"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1293948"}, end: {id:"9485747245"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1293948"}, end: {id:"9485747246"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1384011",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000010"}, end: {id:"1384011"}, properties:{sequence_index:2}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1384011"}, end: {id:"111237"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1384011"}, end: {id:"5727578862"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1384011"}, end: {id:"8582885111"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1384935",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000010"}, end: {id:"1384935"}, properties:{sequence_index:33}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1384935"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1384935"}, end: {id:"9485747245"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1384935"}, end: {id:"2944838499"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1384935"}, end: {id:"9393939991"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1911919",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000010"}, end: {id:"1911919"}, properties:{sequence_index:27}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1911919"}, end: {id:"111886"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1911919"}, end: {id:"5857434758"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1911919"}, end: {id:"0002929944"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1911919"}, end: {id:"0004948585"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1911919"}, end: {id:"8575746378"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2029394",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000010"}, end: {id:"2029394"}, properties:{sequence_index:38}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2029394"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2029394"}, end: {id:"8575748999"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2029394"}, end: {id:"8485757728"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3048100",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000010"}, end: {id:"3048100"}, properties:{sequence_index:26}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3048100"}, end: {id:"111299"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3048100"}, end: {id:"5857434758"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3048800",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000010"}, end: {id:"3048800"}, properties:{sequence_index:24}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3048800"}, end: {id:"111299"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3048800"}, end: {id:"0948572140"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3329831",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000010"}, end: {id:"3329831"}, properties:{sequence_index:28}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3329831"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3329831"}, end: {id:"8575746378"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3329831"}, end: {id:"1202310110"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3329831"}, end: {id:"1202312210"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3847567",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000010"}, end: {id:"3847567"}, properties:{sequence_index:34}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3847567"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3847567"}, end: {id:"9485747246"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3847567"}, end: {id:"2944838499"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3847567"}, end: {id:"9393939992"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3949284",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000010"}, end: {id:"3949284"}, properties:{sequence_index:23}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3949284"}, end: {id:"111581"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3949284"}, end: {id:"9858028950"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3949284"}, end: {id:"1202310110"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4434559",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000010"}, end: {id:"4434559"}, properties:{sequence_index:13}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4434559"}, end: {id:"111493"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4434559"}, end: {id:"1934748140"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4455453",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000010"}, end: {id:"4455453"}, properties:{sequence_index:17}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4455453"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4455453"}, end: {id:"2944838499"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4455453"}, end: {id:"4857472413"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4455453"}, end: {id:"0203024440"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4485722",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000010"}, end: {id:"4485722"}, properties:{sequence_index:25}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4485722"}, end: {id:"111886"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4485722"}, end: {id:"0948572140"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4485722"}, end: {id:"0009485858"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4485722"}, end: {id:"0004831494"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4485722"}, end: {id:"7564894985"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4757567",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000010"}, end: {id:"4757567"}, properties:{sequence_index:15}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4757567"}, end: {id:"111268"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4757567"}, end: {id:"1934748140"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4757567"}, end: {id:"8572657110"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4757743",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000010"}, end: {id:"4757743"}, properties:{sequence_index:37}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4757743"}, end: {id:"111634"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4757743"}, end: {id:"5727578862"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4757743"}, end: {id:"8582885111"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4757743"}, end: {id:"8575748999"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4948339",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000010"}, end: {id:"4948339"}, properties:{sequence_index:18}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4948339"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4948339"}, end: {id:"8849289982"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4948339"}, end: {id:"0203024440"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4948339"}, end: {id:"8889444440"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5751725",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000010"}, end: {id:"5751725"}, properties:{sequence_index:14}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5751725"}, end: {id:"111996"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5751725"}, end: {id:"2944838499"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5751725"}, end: {id:"0009587738"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5751725"}, end: {id:"8849289982"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5859994",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000010"}, end: {id:"5859994"}, properties:{sequence_index:31}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5859994"}, end: {id:"111182"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5859994"}, end: {id:"4857475848"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5859994"}, end: {id:"0009485857"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5859994"}, end: {id:"8485867742"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5940300",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000010"}, end: {id:"5940300"}, properties:{sequence_index:22}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5940300"}, end: {id:"111975"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5940300"}, end: {id:"8576785890"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5940300"}, end: {id:"0000040490"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5940300"}, end: {id:"9858028950"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"7374289",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000010"}, end: {id:"7374289"}, properties:{sequence_index:40}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"7374289"}, end: {id:"111345"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"7374289"}, end: {id:"8484544728"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"7455643",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000010"}, end: {id:"7455643"}, properties:{sequence_index:16}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"7455643"}, end: {id:"111166"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"7455643"}, end: {id:"8572657110"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7455643"}, end: {id:"0009458842"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7455643"}, end: {id:"4857472413"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"7474753",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000010"}, end: {id:"7474753"}, properties:{sequence_index:35}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"7474753"}, end: {id:"111341"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"7474753"}, end: {id:"9393939992"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8373472",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000010"}, end: {id:"8373472"}, properties:{sequence_index:30}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8373472"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8373472"}, end: {id:"0439492440"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8373472"}, end: {id:"4857475848"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8485725",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000010"}, end: {id:"8485725"}, properties:{sequence_index:19}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8485725"}, end: {id:"111299"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8485725"}, end: {id:"9988949211"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8485747",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000010"}, end: {id:"8485747"}, properties:{sequence_index:29}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8485747"}, end: {id:"111634"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8485747"}, end: {id:"7564894985"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8485747"}, end: {id:"1202312210"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8485747"}, end: {id:"0439492440"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8571277",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000010"}, end: {id:"8571277"}, properties:{sequence_index:5}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8571277"}, end: {id:"111355"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8571277"}, end: {id:"9585727710"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8571277"}, end: {id:"8582885111"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8571277"}, end: {id:"8577275751"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8572265",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000010"}, end: {id:"8572265"}, properties:{sequence_index:7}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8572265"}, end: {id:"111634"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8572265"}, end: {id:"1293913110"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8572265"}, end: {id:"8582885111"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8572265"}, end: {id:"9059289981"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8572771",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000010"}, end: {id:"8572771"}, properties:{sequence_index:3}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8572771"}, end: {id:"111802"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8572771"}, end: {id:"5727578862"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8572771"}, end: {id:"9585727710"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8572778",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000010"}, end: {id:"8572778"}, properties:{sequence_index:4}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8572778"}, end: {id:"111802"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8572778"}, end: {id:"5727578862"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8572778"}, end: {id:"9495857278"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8575627",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000010"}, end: {id:"8575627"}, properties:{sequence_index:10}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8575627"}, end: {id:"111698"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8575627"}, end: {id:"1020010291"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8575627"}, end: {id:"1857710291"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8575627"}, end: {id:"1010923823"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8575717",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000010"}, end: {id:"8575717"}, properties:{sequence_index:9}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8575717"}, end: {id:"111299"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8575717"}, end: {id:"1857710291"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8575761",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000010"}, end: {id:"8575761"}, properties:{sequence_index:12}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8575761"}, end: {id:"111634"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8575761"}, end: {id:"1858772113"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8575761"}, end: {id:"9059289981"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8575761"}, end: {id:"2944838499"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8576571",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000010"}, end: {id:"8576571"}, properties:{sequence_index:6}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8576571"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8576571"}, end: {id:"8577275751"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8576571"}, end: {id:"1293913110"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8576627",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000010"}, end: {id:"8576627"}, properties:{sequence_index:1}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8576627"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8576627"}, end: {id:"5727578862"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8576741",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000010"}, end: {id:"8576741"}, properties:{sequence_index:21}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8576741"}, end: {id:"111634"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8576741"}, end: {id:"7575738420"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8576741"}, end: {id:"8889444440"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8576741"}, end: {id:"8576785890"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9114413",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000010"}, end: {id:"9114413"}, properties:{sequence_index:11}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9114413"}, end: {id:"111975"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9114413"}, end: {id:"1010923823"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9114413"}, end: {id:"0001334112"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9114413"}, end: {id:"1858772113"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9394948",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000010"}, end: {id:"9394948"}, properties:{sequence_index:39}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9394948"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9394948"}, end: {id:"8485757728"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9394948"}, end: {id:"8484544728"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9686782",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000010"}, end: {id:"9686782"}, properties:{sequence_index:8}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9686782"}, end: {id:"111355"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9686782"}, end: {id:"9495857278"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9686782"}, end: {id:"9059289981"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9686782"}, end: {id:"1020010291"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2200910",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000011"}, end: {id:"2200910"}, properties:{sequence_index:10}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2200910"}, end: {id:"111282"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2200910"}, end: {id:"5982958249"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2200910"}, end: {id:"0002838490"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2200910"}, end: {id:"9582958293"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2200911",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000011"}, end: {id:"2200911"}, properties:{sequence_index:10.5}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2200911"}, end: {id:"111282"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2200911"}, end: {id:"9582958294"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2200911"}, end: {id:"0002449291"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2200911"}, end: {id:"5982958248"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2211910",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000011"}, end: {id:"2211910"}, properties:{sequence_index:11}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2211910"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2211910"}, end: {id:"5982958248"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2211910"}, end: {id:"9999999968"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2211911",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000011"}, end: {id:"2211911"}, properties:{sequence_index:11.5}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2211911"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2211911"}, end: {id:"9582958293"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2211911"}, end: {id:"9999999969"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2500423",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000011"}, end: {id:"2500423"}, properties:{sequence_index:5}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2500423"}, end: {id:"111530"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2500423"}, end: {id:"5938459282"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2500423"}, end: {id:"0004307451"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2500423"}, end: {id:"5928292841"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5829110",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000011"}, end: {id:"5829110"}, properties:{sequence_index:4}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5829110"}, end: {id:"111282"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5829110"}, end: {id:"5958392859"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5829110"}, end: {id:"0006644853"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5829110"}, end: {id:"5938459282"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"7487443",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000011"}, end: {id:"7487443"}, properties:{sequence_index:9}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"7487443"}, end: {id:"111524"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"7487443"}, end: {id:"9385938295"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7487443"}, end: {id:"5982958249"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7487443"}, end: {id:"9582958294"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"7777777",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000011"}, end: {id:"7777777"}, properties:{sequence_index:8}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"7777777"}, end: {id:"111355"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"7777777"}, end: {id:"5928292841"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7777777"}, end: {id:"5959282914"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7777777"}, end: {id:"9385938295"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"7996484",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000011"}, end: {id:"7996484"}, properties:{sequence_index:7}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"7996484"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"7996484"}, end: {id:"5928285821"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7996484"}, end: {id:"5959282914"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8321038",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000011"}, end: {id:"8321038"}, properties:{sequence_index:6}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8321038"}, end: {id:"111886"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8321038"}, end: {id:"8582954722"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8321038"}, end: {id:"0004858592"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8321038"}, end: {id:"0000999900"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8321038"}, end: {id:"5928285821"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8359402",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000011"}, end: {id:"8359402"}, properties:{sequence_index:14}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8359402"}, end: {id:"111341"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8359402"}, end: {id:"9999999968"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8359403",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000011"}, end: {id:"8359403"}, properties:{sequence_index:15}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8359403"}, end: {id:"111341"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8359403"}, end: {id:"9999999969"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8492932",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000011"}, end: {id:"8492932"}, properties:{sequence_index:3}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8492932"}, end: {id:"111975"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8492932"}, end: {id:"9285928292"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8492932"}, end: {id:"0002424922"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8492932"}, end: {id:"5958392859"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8494551",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000011"}, end: {id:"8494551"}, properties:{sequence_index:1}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8494551"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8494551"}, end: {id:"9285928292"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8494552",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000011"}, end: {id:"8494552"}, properties:{sequence_index:7.5}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8494552"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8494552"}, end: {id:"8582954722"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1294984",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000012"}, end: {id:"1294984"}, properties:{sequence_index:4}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1294984"}, end: {id:"111104"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1294984"}, end: {id:"9294858532"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2394942",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000012"}, end: {id:"2394942"}, properties:{sequence_index:3}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2394942"}, end: {id:"111890"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2394942"}, end: {id:"2394935835"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2394942"}, end: {id:"1010393913"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2485909",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000012"}, end: {id:"2485909"}, properties:{sequence_index:5}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2485909"}, end: {id:"111634"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2485909"}, end: {id:"9294858532"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2485909"}, end: {id:"1010393913"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2485909"}, end: {id:"4948934890"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2490098",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000012"}, end: {id:"2490098"}, properties:{sequence_index:6}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2490098"}, end: {id:"111634"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2490098"}, end: {id:"4948934890"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2490098"}, end: {id:"9999999975"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2490098"}, end: {id:"2848934890"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2939493",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000012"}, end: {id:"2939493"}, properties:{sequence_index:7}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2939493"}, end: {id:"111341"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2939493"}, end: {id:"2848934890"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3403595",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000012"}, end: {id:"3403595"}, properties:{sequence_index:1}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3403595"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3403595"}, end: {id:"9999999975"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9538385",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000012"}, end: {id:"9538385"}, properties:{sequence_index:2}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9538385"}, end: {id:"111696"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9538385"}, end: {id:"9999999975"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9538385"}, end: {id:"2394935835"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1301442",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000013"}, end: {id:"1301442"}, properties:{sequence_index:3}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1301442"}, end: {id:"111390"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1301442"}, end: {id:"9596004948"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1301442"}, end: {id:"1395858355"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2304934",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000013"}, end: {id:"2304934"}, properties:{sequence_index:4}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2304934"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2304934"}, end: {id:"1010393944"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2304934"}, end: {id:"2394240499"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2384852",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000013"}, end: {id:"2384852"}, properties:{sequence_index:9}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2384852"}, end: {id:"111341"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2384852"}, end: {id:"2394935831"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2455366",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000013"}, end: {id:"2455366"}, properties:{sequence_index:1}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2455366"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2455366"}, end: {id:"9596004948"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3848591",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000013"}, end: {id:"3848591"}, properties:{sequence_index:2}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3848591"}, end: {id:"111946"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3848591"}, end: {id:"9596004948"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3848591"}, end: {id:"1010393944"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4838499",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000013"}, end: {id:"4838499"}, properties:{sequence_index:7}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4838499"}, end: {id:"111282"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4838499"}, end: {id:"1203938249"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4838499"}, end: {id:"0005395034"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4838499"}, end: {id:"3924948349"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4938400",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000013"}, end: {id:"4938400"}, properties:{sequence_index:5}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4938400"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4938400"}, end: {id:"1395858355"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4938400"}, end: {id:"3943939590"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9878900",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000013"}, end: {id:"9878900"}, properties:{sequence_index:6}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9878900"}, end: {id:"111355"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9878900"}, end: {id:"2394240499"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9878900"}, end: {id:"3943939590"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9878900"}, end: {id:"1203938249"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9888730",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000013"}, end: {id:"9888730"}, properties:{sequence_index:8}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9888730"}, end: {id:"111728"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9888730"}, end: {id:"3924948349"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9888730"}, end: {id:"2394935831"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2004989",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000014"}, end: {id:"2004989"}, properties:{sequence_index:1}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2004989"}, end: {id:"111299"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2004989"}, end: {id:"3585845894"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2349059",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000014"}, end: {id:"2349059"}, properties:{sequence_index:2}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2349059"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2349059"}, end: {id:"3585845894"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2349059"}, end: {id:"8399484849"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2390498",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000014"}, end: {id:"2390498"}, properties:{sequence_index:3}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2390498"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2390498"}, end: {id:"8399484849"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2390498"}, end: {id:"2404934990"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3848494",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000014"}, end: {id:"3848494"}, properties:{sequence_index:4}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3848494"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3848494"}, end: {id:"2404934990"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3848494"}, end: {id:"4949359835"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4948384",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000014"}, end: {id:"4948384"}, properties:{sequence_index:5}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4948384"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4948384"}, end: {id:"4949359835"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4948384"}, end: {id:"2494533900"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4948955",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000014"}, end: {id:"4948955"}, properties:{sequence_index:6}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4948955"}, end: {id:"111345"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4948955"}, end: {id:"2494533900"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3445641",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000015"}, end: {id:"3445641"}, properties:{sequence_index:2}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3445641"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3445641"}, end: {id:"8257621077"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3667395",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000015"}, end: {id:"3667395"}, properties:{sequence_index:5}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3667395"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3667395"}, end: {id:"3951205425"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3667395"}, end: {id:"8311458118"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3667395"}, end: {id:"8139187332"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3871228",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000015"}, end: {id:"3871228"}, properties:{sequence_index:7}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3871228"}, end: {id:"111268"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3871228"}, end: {id:"5530148480"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3871228"}, end: {id:"7917051060"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4733986",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000015"}, end: {id:"4733986"}, properties:{sequence_index:3}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4733986"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4733986"}, end: {id:"8311458118"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4738354",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000015"}, end: {id:"4738354"}, properties:{sequence_index:8}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4738354"}, end: {id:"111253"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4738354"}, end: {id:"7917051060"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4738354"}, end: {id:"7917051060"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4738354"}, end: {id:"6742123016"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"7952658",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000015"}, end: {id:"7952658"}, properties:{sequence_index:6}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"7952658"}, end: {id:"111282"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"7952658"}, end: {id:"8139187332"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7952658"}, end: {id:"0002338514"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7952658"}, end: {id:"5530148480"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"7958085",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000015"}, end: {id:"7958085"}, properties:{sequence_index:4}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"7958085"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"7958085"}, end: {id:"8257621077"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7958085"}, end: {id:"1638282134"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7958085"}, end: {id:"3951205425"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8668018",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000015"}, end: {id:"8668018"}, properties:{sequence_index:1}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8668018"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8668018"}, end: {id:"1638282134"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1541045",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000016"}, end: {id:"1541045"}, properties:{sequence_index:4}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1541045"}, end: {id:"111253"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1541045"}, end: {id:"2103023049"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1541045"}, end: {id:"4585932229"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1541045"}, end: {id:"3470587782"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2750343",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000016"}, end: {id:"2750343"}, properties:{sequence_index:8}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2750343"}, end: {id:"111863"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2750343"}, end: {id:"9180861128"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2750343"}, end: {id:"8483686863"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2750343"}, end: {id:"2405307372"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5887774",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000016"}, end: {id:"5887774"}, properties:{sequence_index:1}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5887774"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5887774"}, end: {id:"2103023049"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"6131891",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000016"}, end: {id:"6131891"}, properties:{sequence_index:3}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"6131891"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"6131891"}, end: {id:"4585932229"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"6240603",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000016"}, end: {id:"6240603"}, properties:{sequence_index:2}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"6240603"}, end: {id:"111886"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"6240603"}, end: {id:"2103023049"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6240603"}, end: {id:"4961662865"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6240603"}, end: {id:"9110536742"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6240603"}, end: {id:"8483686863"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"6790653",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000016"}, end: {id:"6790653"}, properties:{sequence_index:7}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"6790653"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"6790653"}, end: {id:"8699789241"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6790653"}, end: {id:"9180861128"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"7763037",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000016"}, end: {id:"7763037"}, properties:{sequence_index:9}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"7763037"}, end: {id:"111341"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"7763037"}, end: {id:"2405307372"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8636739",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000016"}, end: {id:"8636739"}, properties:{sequence_index:5}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8636739"}, end: {id:"111182"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8636739"}, end: {id:"3470587782"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8636739"}, end: {id:"8642992037"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8636739"}, end: {id:"9894826550"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9916897",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000016"}, end: {id:"9916897"}, properties:{sequence_index:6}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9916897"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9916897"}, end: {id:"9894826550"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9916897"}, end: {id:"8699789241"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1530591",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000017"}, end: {id:"1530591"}, properties:{sequence_index:3}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1530591"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1530591"}, end: {id:"8332931442"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1530591"}, end: {id:"6885625907"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5103914",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000017"}, end: {id:"5103914"}, properties:{sequence_index:2}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5103914"}, end: {id:"111886"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5103914"}, end: {id:"4938429483"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5103914"}, end: {id:"3268645065"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5103914"}, end: {id:"9350663581"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5103914"}, end: {id:"8332931442"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"6831079",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000017"}, end: {id:"6831079"}, properties:{sequence_index:1}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"6831079"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"6831079"}, end: {id:"4938429483"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8465659",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000017"}, end: {id:"8465659"}, properties:{sequence_index:5}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8465659"}, end: {id:"111530"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8465659"}, end: {id:"3331824625"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8465659"}, end: {id:"4901237716"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8465659"}, end: {id:"2501591100"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8755752",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000017"}, end: {id:"8755752"}, properties:{sequence_index:4}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8755752"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8755752"}, end: {id:"6885625907"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8755752"}, end: {id:"3331824625"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9932332",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000017"}, end: {id:"9932332"}, properties:{sequence_index:6}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9932332"}, end: {id:"111341"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9932332"}, end: {id:"2501591100"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1466499",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000018"}, end: {id:"1466499"}, properties:{sequence_index:27}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1466499"}, end: {id:"111634"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1466499"}, end: {id:"9337785146"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1466499"}, end: {id:"7267155233"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1466499"}, end: {id:"4872970974"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1560617",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000018"}, end: {id:"1560617"}, properties:{sequence_index:14}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1560617"}, end: {id:"111634"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1560617"}, end: {id:"4648451961"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1560617"}, end: {id:"4270680309"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1560617"}, end: {id:"9356924046"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1702334",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000018"}, end: {id:"1702334"}, properties:{sequence_index:18}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1702334"}, end: {id:"111634"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1702334"}, end: {id:"2857430695"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1702334"}, end: {id:"7735737409"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1702334"}, end: {id:"4784793837"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1882970",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000018"}, end: {id:"1882970"}, properties:{sequence_index:31}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1882970"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1882970"}, end: {id:"1772416655"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1882970"}, end: {id:"1809909100"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2343637",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000018"}, end: {id:"2343637"}, properties:{sequence_index:32}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2343637"}, end: {id:"111182"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2343637"}, end: {id:"1809909100"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2343637"}, end: {id:"5778176146"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2343637"}, end: {id:"3806977900"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2410249",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000018"}, end: {id:"2410249"}, properties:{sequence_index:6}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2410249"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2410249"}, end: {id:"8357234146"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3258083",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000018"}, end: {id:"3258083"}, properties:{sequence_index:17}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3258083"}, end: {id:"111634"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3258083"}, end: {id:"9397152918"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3258083"}, end: {id:"9356924046"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3258083"}, end: {id:"7735737409"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4729245",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000018"}, end: {id:"4729245"}, properties:{sequence_index:29}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4729245"}, end: {id:"111634"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4729245"}, end: {id:"4872970974"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4729245"}, end: {id:"2770069250"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4729245"}, end: {id:"3591237106"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4803359",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000018"}, end: {id:"4803359"}, properties:{sequence_index:7}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4803359"}, end: {id:"111984"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4803359"}, end: {id:"8357234146"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4803359"}, end: {id:"6383056612"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4803359"}, end: {id:"6838659900"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4803359"}, end: {id:"9305761407"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4803359"}, end: {id:"5011888122"}, properties:{sequence_index:"3"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4803359"}, end: {id:"7676652285"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4909770",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000018"}, end: {id:"4909770"}, properties:{sequence_index:11}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4909770"}, end: {id:"111975"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4909770"}, end: {id:"5733146966"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4909770"}, end: {id:"6554292307"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4909770"}, end: {id:"4270680309"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5181988",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000018"}, end: {id:"5181988"}, properties:{sequence_index:1}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5181988"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5181988"}, end: {id:"5136652623"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5590554",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000018"}, end: {id:"5590554"}, properties:{sequence_index:2}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5590554"}, end: {id:"111236"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5590554"}, end: {id:"5136652623"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5590554"}, end: {id:"1258245373"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5590554"}, end: {id:"2344320475"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5590554"}, end: {id:"6383056612"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5590554"}, end: {id:"7939947931"}, properties:{sequence_index:"3"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5590554"}, end: {id:"5075406409"}, properties:{sequence_index:"4"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5590554"}, end: {id:"5803210729"}, properties:{sequence_index:"5"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5590554"}, end: {id:"7875206161"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5826700",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000018"}, end: {id:"5826700"}, properties:{sequence_index:28}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5826700"}, end: {id:"111975"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5826700"}, end: {id:"5514556106"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5826700"}, end: {id:"2081689540"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5826700"}, end: {id:"2770069250"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5851086",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000018"}, end: {id:"5851086"}, properties:{sequence_index:10}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5851086"}, end: {id:"111222"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5851086"}, end: {id:"4928007622"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5851086"}, end: {id:"7676652285"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5851086"}, end: {id:"5733146966"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5867939",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000018"}, end: {id:"5867939"}, properties:{sequence_index:16}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5867939"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5867939"}, end: {id:"2857430695"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5879978",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000018"}, end: {id:"5879978"}, properties:{sequence_index:25}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5879978"}, end: {id:"111975"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5879978"}, end: {id:"7734996511"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5879978"}, end: {id:"2016063530"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5879978"}, end: {id:"7267155233"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5969230",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000018"}, end: {id:"5969230"}, properties:{sequence_index:23}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5969230"}, end: {id:"111984"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5969230"}, end: {id:"6715248283"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5969230"}, end: {id:"3809726424"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5969230"}, end: {id:"6749533119"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5969230"}, end: {id:"4218009993"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5969230"}, end: {id:"1552869972"}, properties:{sequence_index:"3"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5969230"}, end: {id:"4669290568"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"6718378",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000018"}, end: {id:"6718378"}, properties:{sequence_index:19}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"6718378"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"6718378"}, end: {id:"5345738321"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"6719788",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:"assumes constant force"}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000018"}, end: {id:"6719788"}, properties:{sequence_index:22}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"6719788"}, end: {id:"111984"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"6719788"}, end: {id:"6715248283"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6719788"}, end: {id:"5075406409"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6719788"}, end: {id:"4522137851"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6719788"}, end: {id:"4188639044"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6719788"}, end: {id:"4755369593"}, properties:{sequence_index:"3"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6719788"}, end: {id:"2431507955"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"6886472",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000018"}, end: {id:"6886472"}, properties:{sequence_index:5}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"6886472"}, end: {id:"111222"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"6886472"}, end: {id:"4303372136"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6886472"}, end: {id:"7875206161"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6886472"}, end: {id:"5514556106"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"7014882",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000018"}, end: {id:"7014882"}, properties:{sequence_index:34}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"7014882"}, end: {id:"111341"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"7014882"}, end: {id:"8558338742"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"7067324",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000018"}, end: {id:"7067324"}, properties:{sequence_index:20}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"7067324"}, end: {id:"111634"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"7067324"}, end: {id:"5345738321"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7067324"}, end: {id:"4784793837"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7067324"}, end: {id:"2186083170"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"7085632",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000018"}, end: {id:"7085632"}, properties:{sequence_index:12}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"7085632"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"7085632"}, end: {id:"5781981178"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"7113502",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000018"}, end: {id:"7113502"}, properties:{sequence_index:8}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"7113502"}, end: {id:"111984"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"7113502"}, end: {id:"8357234146"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7113502"}, end: {id:"4147101187"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7113502"}, end: {id:"6964468708"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7113502"}, end: {id:"5398681503"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7113502"}, end: {id:"3105350101"}, properties:{sequence_index:"3"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7113502"}, end: {id:"4928007622"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"7171014",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000018"}, end: {id:"7171014"}, properties:{sequence_index:21}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"7171014"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"7171014"}, end: {id:"6715248283"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"7184509",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000018"}, end: {id:"7184509"}, properties:{sequence_index:24}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"7184509"}, end: {id:"111222"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"7184509"}, end: {id:"4669290568"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7184509"}, end: {id:"2431507955"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7184509"}, end: {id:"7734996511"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"7511478",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000018"}, end: {id:"7511478"}, properties:{sequence_index:33}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"7511478"}, end: {id:"111530"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"7511478"}, end: {id:"3806977900"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7511478"}, end: {id:"5960438249"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7511478"}, end: {id:"8558338742"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"7835026",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000018"}, end: {id:"7835026"}, properties:{sequence_index:13}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"7835026"}, end: {id:"111984"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"7835026"}, end: {id:"5781981178"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7835026"}, end: {id:"1025759423"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7835026"}, end: {id:"5239755033"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7835026"}, end: {id:"8173074178"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7835026"}, end: {id:"4319470443"}, properties:{sequence_index:"3"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7835026"}, end: {id:"4648451961"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"7965863",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000018"}, end: {id:"7965863"}, properties:{sequence_index:26}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"7965863"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"7965863"}, end: {id:"9337785146"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8337849",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000018"}, end: {id:"8337849"}, properties:{sequence_index:15}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8337849"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8337849"}, end: {id:"9397152918"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8346419",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000018"}, end: {id:"8346419"}, properties:{sequence_index:3}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8346419"}, end: {id:"111236"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8346419"}, end: {id:"5136652623"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8346419"}, end: {id:"3749492596"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8346419"}, end: {id:"4213426349"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8346419"}, end: {id:"4147101187"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8346419"}, end: {id:"1092872200"}, properties:{sequence_index:"3"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8346419"}, end: {id:"3809726424"}, properties:{sequence_index:"4"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8346419"}, end: {id:"8061701434"}, properties:{sequence_index:"5"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8346419"}, end: {id:"4303372136"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9646681",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"000018"}, end: {id:"9646681"}, properties:{sequence_index:30}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9646681"}, end: {id:"111634"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9646681"}, end: {id:"2186083170"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9646681"}, end: {id:"3591237106"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9646681"}, end: {id:"1772416655"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1078239",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"129143"}, end: {id:"1078239"}, properties:{sequence_index:20}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1078239"}, end: {id:"111268"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1078239"}, end: {id:"2977457786"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1078239"}, end: {id:"9412953728"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1179540",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"129143"}, end: {id:"1179540"}, properties:{sequence_index:8}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1179540"}, end: {id:"111732"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1179540"}, end: {id:"4303372136"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1179540"}, end: {id:"7875206161"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1179540"}, end: {id:"8558338742"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1179540"}, end: {id:"8960645192"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1518987",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"129143"}, end: {id:"1518987"}, properties:{sequence_index:9}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1518987"}, end: {id:"111104"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1518987"}, end: {id:"2267521164"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1868693",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"129143"}, end: {id:"1868693"}, properties:{sequence_index:13}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1868693"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1868693"}, end: {id:"7573835180"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3270895",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"129143"}, end: {id:"3270895"}, properties:{sequence_index:19}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3270895"}, end: {id:"111182"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3270895"}, end: {id:"1143343287"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3270895"}, end: {id:"5775658332"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"3270895"}, end: {id:"2977457786"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3324084",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"129143"}, end: {id:"3324084"}, properties:{sequence_index:4}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3324084"}, end: {id:"111662"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3324084"}, end: {id:"4447113478"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3324084"}, end: {id:"5732331610"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4165232",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"129143"}, end: {id:"4165232"}, properties:{sequence_index:7}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4165232"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4165232"}, end: {id:"5978756813"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4165232"}, end: {id:"7749253510"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4334762",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"129143"}, end: {id:"4334762"}, properties:{sequence_index:22}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4334762"}, end: {id:"111341"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4334762"}, end: {id:"1330874553"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4437085",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:"replaced Earth-specific variables"}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"129143"}, end: {id:"4437085"}, properties:{sequence_index:23}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4437085"}, end: {id:"111984"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4437085"}, end: {id:"1330874553"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4437085"}, end: {id:"2674546234"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4437085"}, end: {id:"2135482543"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4437085"}, end: {id:"2396787389"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4437085"}, end: {id:"8020058613"}, properties:{sequence_index:"3"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4437085"}, end: {id:"5404822208"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4505146",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"129143"}, end: {id:"4505146"}, properties:{sequence_index:21}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4505146"}, end: {id:"111524"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4505146"}, end: {id:"9412953728"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4505146"}, end: {id:"1330874553"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4505146"}, end: {id:"2750380042"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4650277",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"129143"}, end: {id:"4650277"}, properties:{sequence_index:2}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4650277"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4650277"}, end: {id:"6935745841"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4650277"}, end: {id:"1590774089"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4650277"}, end: {id:"8604483515"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5854765",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"129143"}, end: {id:"5854765"}, properties:{sequence_index:18}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5854765"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5854765"}, end: {id:"9703482302"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5854765"}, end: {id:"1143343287"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"6008233",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"129143"}, end: {id:"6008233"}, properties:{sequence_index:3}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"6008233"}, end: {id:"111408"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"6008233"}, end: {id:"8604483515"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6008233"}, end: {id:"4447113478"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"6200985",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"129143"}, end: {id:"6200985"}, properties:{sequence_index:14}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"6200985"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"6200985"}, end: {id:"7749253510"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6200985"}, end: {id:"7573835180"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6200985"}, end: {id:"3846041519"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"6881790",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"129143"}, end: {id:"6881790"}, properties:{sequence_index:1}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"6881790"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"6881790"}, end: {id:"6935745841"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"6988834",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"129143"}, end: {id:"6988834"}, properties:{sequence_index:10}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"6988834"}, end: {id:"111104"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"6988834"}, end: {id:"1840080113"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"7320847",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"129143"}, end: {id:"7320847"}, properties:{sequence_index:11}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"7320847"}, end: {id:"111732"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"7320847"}, end: {id:"2267521164"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7320847"}, end: {id:"1840080113"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7320847"}, end: {id:"8960645192"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7320847"}, end: {id:"9749777192"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8039319",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"129143"}, end: {id:"8039319"}, properties:{sequence_index:5}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8039319"}, end: {id:"111984"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8039319"}, end: {id:"5732331610"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8039319"}, end: {id:"1413137236"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8039319"}, end: {id:"9072369552"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8039319"}, end: {id:"2764966428"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8039319"}, end: {id:"7140470627"}, properties:{sequence_index:"3"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8039319"}, end: {id:"6131764194"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8184884",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"129143"}, end: {id:"8184884"}, properties:{sequence_index:16}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8184884"}, end: {id:"111732"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8184884"}, end: {id:"6870322215"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8184884"}, end: {id:"3846041519"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8184884"}, end: {id:"2503972039"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8184884"}, end: {id:"2042298788"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8498604",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"129143"}, end: {id:"8498604"}, properties:{sequence_index:15}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8498604"}, end: {id:"111984"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8498604"}, end: {id:"8357234146"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8498604"}, end: {id:"5021965469"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8498604"}, end: {id:"9370882921"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8498604"}, end: {id:"6681646197"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8498604"}, end: {id:"6498985149"}, properties:{sequence_index:"3"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8498604"}, end: {id:"6870322215"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8921345",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"129143"}, end: {id:"8921345"}, properties:{sequence_index:17}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8921345"}, end: {id:"111530"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8921345"}, end: {id:"2042298788"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8921345"}, end: {id:"5050429607"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8921345"}, end: {id:"9703482302"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9534004",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"129143"}, end: {id:"9534004"}, properties:{sequence_index:6}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9534004"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9534004"}, end: {id:"6131764194"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9534004"}, end: {id:"5978756813"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9709070",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"129143"}, end: {id:"9709070"}, properties:{sequence_index:12}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9709070"}, end: {id:"111984"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9709070"}, end: {id:"9749777192"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9709070"}, end: {id:"5591692598"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9709070"}, end: {id:"8416464049"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9709070"}, end: {id:"6158970683"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9709070"}, end: {id:"8871333437"}, properties:{sequence_index:"3"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9709070"}, end: {id:"2503972039"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2544795",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"142831"}, end: {id:"2544795"}, properties:{sequence_index:2}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2544795"}, end: {id:"111984"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2544795"}, end: {id:"8946383937"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2544795"}, end: {id:"8362338572"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2544795"}, end: {id:"1238593037"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2544795"}, end: {id:"2660368546"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2544795"}, end: {id:"9933742680"}, properties:{sequence_index:"3"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2544795"}, end: {id:"4275004561"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2775447",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"142831"}, end: {id:"2775447"}, properties:{sequence_index:4}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2775447"}, end: {id:"111975"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2775447"}, end: {id:"2883079365"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2775447"}, end: {id:"7263534144"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2775447"}, end: {id:"6800170830"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4980032",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"142831"}, end: {id:"4980032"}, properties:{sequence_index:1}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4980032"}, end: {id:"111483"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4980032"}, end: {id:"5404822208"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4980032"}, end: {id:"3663007361"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4980032"}, end: {id:"8946383937"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8627172",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"142831"}, end: {id:"8627172"}, properties:{sequence_index:3}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8627172"}, end: {id:"111182"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8627172"}, end: {id:"4275004561"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8627172"}, end: {id:"7194432406"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8627172"}, end: {id:"2883079365"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1997333",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"146432"}, end: {id:"1997333"}, properties:{sequence_index:8}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1997333"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1997333"}, end: {id:"6925244346"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1997333"}, end: {id:"2472653783"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2439511",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"146432"}, end: {id:"2439511"}, properties:{sequence_index:5}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2439511"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2439511"}, end: {id:"8435841627"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3037920",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"146432"}, end: {id:"3037920"}, properties:{sequence_index:2}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3037920"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3037920"}, end: {id:"3497828859"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3078632",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"146432"}, end: {id:"3078632"}, properties:{sequence_index:7}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3078632"}, end: {id:"111634"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3078632"}, end: {id:"2613006036"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3078632"}, end: {id:"5962145508"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3078632"}, end: {id:"6925244346"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3744460",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"146432"}, end: {id:"3744460"}, properties:{sequence_index:1}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3744460"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3744460"}, end: {id:"3464107376"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5311790",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"146432"}, end: {id:"5311790"}, properties:{sequence_index:4}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5311790"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5311790"}, end: {id:"1311403394"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5311790"}, end: {id:"5962145508"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5713113",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"146432"}, end: {id:"5713113"}, properties:{sequence_index:6}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5713113"}, end: {id:"111975"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5713113"}, end: {id:"8435841627"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5713113"}, end: {id:"7924842770"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5713113"}, end: {id:"2613006036"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"6216231",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"146432"}, end: {id:"6216231"}, properties:{sequence_index:9}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"6216231"}, end: {id:"111341"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"6216231"}, end: {id:"2472653783"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8295331",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"146432"}, end: {id:"8295331"}, properties:{sequence_index:3}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8295331"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8295331"}, end: {id:"3497828859"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8295331"}, end: {id:"3464107376"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8295331"}, end: {id:"1311403394"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1117397",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"187793"}, end: {id:"1117397"}, properties:{sequence_index:28}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1117397"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1117397"}, end: {id:"6134836751"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1117397"}, end: {id:"8460820419"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1117397"}, end: {id:"7455581657"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1136226",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"187793"}, end: {id:"1136226"}, properties:{sequence_index:17}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1136226"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1136226"}, end: {id:"7252338326"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1138623",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"187793"}, end: {id:"1138623"}, properties:{sequence_index:23}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1138623"}, end: {id:"111182"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1138623"}, end: {id:"8750379055"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1138623"}, end: {id:"8717193282"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1138623"}, end: {id:"1166310428"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1298567",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"187793"}, end: {id:"1298567"}, properties:{sequence_index:10}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1298567"}, end: {id:"111791"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1298567"}, end: {id:"8880467139"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1298567"}, end: {id:"5349866551"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1662112",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"187793"}, end: {id:"1662112"}, properties:{sequence_index:29}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1662112"}, end: {id:"111182"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1662112"}, end: {id:"7455581657"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1662112"}, end: {id:"8607458157"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1662112"}, end: {id:"1963253044"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2139033",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"187793"}, end: {id:"2139033"}, properties:{sequence_index:16}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2139033"}, end: {id:"111530"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2139033"}, end: {id:"9973952056"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2139033"}, end: {id:"4167526462"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2139033"}, end: {id:"6572039835"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2304792",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"187793"}, end: {id:"2304792"}, properties:{sequence_index:11}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2304792"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2304792"}, end: {id:"9707028061"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2304792"}, end: {id:"1819663717"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2304792"}, end: {id:"8750379055"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2739184",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"187793"}, end: {id:"2739184"}, properties:{sequence_index:30}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2739184"}, end: {id:"111608"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2739184"}, end: {id:"1963253044"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2739184"}, end: {id:"3676159007"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2766390",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"187793"}, end: {id:"2766390"}, properties:{sequence_index:39}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2766390"}, end: {id:"111182"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2766390"}, end: {id:"7376526845"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2766390"}, end: {id:"5620558729"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2766390"}, end: {id:"8949329361"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2851041",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"187793"}, end: {id:"2851041"}, properties:{sequence_index:33}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2851041"}, end: {id:"111268"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2851041"}, end: {id:"8486706976"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2851041"}, end: {id:"1306360899"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2904437",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"187793"}, end: {id:"2904437"}, properties:{sequence_index:12}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2904437"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2904437"}, end: {id:"2741489181"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2904437"}, end: {id:"8228733125"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2904437"}, end: {id:"1977955751"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3356600",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"187793"}, end: {id:"3356600"}, properties:{sequence_index:6}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3356600"}, end: {id:"111270"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3356600"}, end: {id:"7729413831"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3356600"}, end: {id:"1819663717"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3356600"}, end: {id:"8228733125"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3500836",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"187793"}, end: {id:"3500836"}, properties:{sequence_index:13}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3500836"}, end: {id:"111182"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3500836"}, end: {id:"1977955751"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3500836"}, end: {id:"6672141531"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"3500836"}, end: {id:"1702349646"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3504214",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"187793"}, end: {id:"3504214"}, properties:{sequence_index:37}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3504214"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3504214"}, end: {id:"6083821265"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3504214"}, end: {id:"1306360899"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3504214"}, end: {id:"5438722682"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3673220",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"187793"}, end: {id:"3673220"}, properties:{sequence_index:14}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3673220"}, end: {id:"111608"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3673220"}, end: {id:"1702349646"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3673220"}, end: {id:"8584698994"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4385306",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"187793"}, end: {id:"4385306"}, properties:{sequence_index:40}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4385306"}, end: {id:"111268"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4385306"}, end: {id:"2461349007"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4385306"}, end: {id:"1405465835"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4389482",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"187793"}, end: {id:"4389482"}, properties:{sequence_index:22}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4389482"}, end: {id:"111530"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4389482"}, end: {id:"2858549874"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4389482"}, end: {id:"6098638221"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4389482"}, end: {id:"2461349007"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4553137",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"187793"}, end: {id:"4553137"}, properties:{sequence_index:15}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4553137"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4553137"}, end: {id:"8584698994"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4553137"}, end: {id:"9973952056"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4576718",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:"define the orientation of the coordinate system with respect to the gravitational acceleration such that x axis is perpendicular to gravity"}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"187793"}, end: {id:"4576718"}, properties:{sequence_index:7}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4576718"}, end: {id:"111104"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4576718"}, end: {id:"9707028061"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4691130",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:"define the orientation of the coordinate system with respect to the gravitational acceleration such that y axis is parallel to gravity"}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"187793"}, end: {id:"4691130"}, properties:{sequence_index:8}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4691130"}, end: {id:"111104"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4691130"}, end: {id:"2741489181"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5219345",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"187793"}, end: {id:"5219345"}, properties:{sequence_index:36}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5219345"}, end: {id:"111182"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5219345"}, end: {id:"7391837535"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5219345"}, end: {id:"5868731041"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5219345"}, end: {id:"6083821265"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5993111",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"187793"}, end: {id:"5993111"}, properties:{sequence_index:32}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5993111"}, end: {id:"111530"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5993111"}, end: {id:"9882526611"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5993111"}, end: {id:"3182907803"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5993111"}, end: {id:"8486706976"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"6387363",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"187793"}, end: {id:"6387363"}, properties:{sequence_index:5}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"6387363"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"6387363"}, end: {id:"5349866551"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6387363"}, end: {id:"4158986868"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6387363"}, end: {id:"7729413831"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"6514260",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"187793"}, end: {id:"6514260"}, properties:{sequence_index:24}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"6514260"}, end: {id:"111608"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"6514260"}, end: {id:"1166310428"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6514260"}, end: {id:"2366691988"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"6571218",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"187793"}, end: {id:"6571218"}, properties:{sequence_index:42}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"6571218"}, end: {id:"111341"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"6571218"}, end: {id:"9862900242"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"6601736",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"187793"}, end: {id:"6601736"}, properties:{sequence_index:38}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"6601736"}, end: {id:"111341"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"6601736"}, end: {id:"5438722682"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"6602846",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"187793"}, end: {id:"6602846"}, properties:{sequence_index:9}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"6602846"}, end: {id:"111791"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"6602846"}, end: {id:"3270039798"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6602846"}, end: {id:"8602512487"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"6781797",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"187793"}, end: {id:"6781797"}, properties:{sequence_index:18}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"6781797"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"6781797"}, end: {id:"7252338326"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6781797"}, end: {id:"6572039835"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6781797"}, end: {id:"6204539227"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"6801838",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"187793"}, end: {id:"6801838"}, properties:{sequence_index:27}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"6801838"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"6801838"}, end: {id:"8460820419"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"7192805",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"187793"}, end: {id:"7192805"}, properties:{sequence_index:25}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"7192805"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"7192805"}, end: {id:"2366691988"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7192805"}, end: {id:"1676472948"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"7320561",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"187793"}, end: {id:"7320561"}, properties:{sequence_index:3}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"7320561"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"7320561"}, end: {id:"3169580383"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7320561"}, end: {id:"8602512487"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7320561"}, end: {id:"4158986868"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"7412638",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"187793"}, end: {id:"7412638"}, properties:{sequence_index:20}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"7412638"}, end: {id:"111608"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"7412638"}, end: {id:"8145337879"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7412638"}, end: {id:"8808860551"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"7852750",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"187793"}, end: {id:"7852750"}, properties:{sequence_index:35}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"7852750"}, end: {id:"111295"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"7852750"}, end: {id:"9341391925"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7852750"}, end: {id:"6410818363"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7852750"}, end: {id:"7391837535"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7852750"}, end: {id:"7376526845"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8183035",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"187793"}, end: {id:"8183035"}, properties:{sequence_index:41}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8183035"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8183035"}, end: {id:"8949329361"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8183035"}, end: {id:"1405465835"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8183035"}, end: {id:"9862900242"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8200501",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"187793"}, end: {id:"8200501"}, properties:{sequence_index:21}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8200501"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8200501"}, end: {id:"8808860551"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8200501"}, end: {id:"2858549874"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8369238",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"187793"}, end: {id:"8369238"}, properties:{sequence_index:31}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8369238"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8369238"}, end: {id:"3676159007"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8369238"}, end: {id:"9882526611"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8974812",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"187793"}, end: {id:"8974812"}, properties:{sequence_index:34}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8974812"}, end: {id:"111791"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8974812"}, end: {id:"7049769409"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8974812"}, end: {id:"9341391925"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9095941",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"187793"}, end: {id:"9095941"}, properties:{sequence_index:19}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9095941"}, end: {id:"111182"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9095941"}, end: {id:"6204539227"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9095941"}, end: {id:"1614343171"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9095941"}, end: {id:"8145337879"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9736733",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"187793"}, end: {id:"9736733"}, properties:{sequence_index:1}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9736733"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9736733"}, end: {id:"3169580383"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9911907",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"187793"}, end: {id:"9911907"}, properties:{sequence_index:26}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9911907"}, end: {id:"111530"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9911907"}, end: {id:"1676472948"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9911907"}, end: {id:"1439089569"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9911907"}, end: {id:"6134836751"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2825295",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"201726"}, end: {id:"2825295"}, properties:{sequence_index:7}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2825295"}, end: {id:"111975"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2825295"}, end: {id:"1087417579"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2825295"}, end: {id:"4829590294"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2825295"}, end: {id:"2086924031"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2888455",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"201726"}, end: {id:"2888455"}, properties:{sequence_index:4}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2888455"}, end: {id:"111355"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2888455"}, end: {id:"5379546684"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2888455"}, end: {id:"9112191201"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2888455"}, end: {id:"8198310977"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2933842",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"201726"}, end: {id:"2933842"}, properties:{sequence_index:22}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2933842"}, end: {id:"111341"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2933842"}, end: {id:"5353282496"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3635128",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"201726"}, end: {id:"3635128"}, properties:{sequence_index:16}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3635128"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3635128"}, end: {id:"2405307372"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3645843",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"201726"}, end: {id:"3645843"}, properties:{sequence_index:10}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3645843"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3645843"}, end: {id:"5438722682"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3846508",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"201726"}, end: {id:"3846508"}, properties:{sequence_index:21}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3846508"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3846508"}, end: {id:"3607070319"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3846508"}, end: {id:"5353282496"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4274767",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"201726"}, end: {id:"4274767"}, properties:{sequence_index:12}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4274767"}, end: {id:"111278"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4274767"}, end: {id:"4370074654"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4274767"}, end: {id:"2378095808"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5424962",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"201726"}, end: {id:"5424962"}, properties:{sequence_index:13}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5424962"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5424962"}, end: {id:"2378095808"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5424962"}, end: {id:"3485125659"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5424962"}, end: {id:"4268085801"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5447490",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"201726"}, end: {id:"5447490"}, properties:{sequence_index:14}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5447490"}, end: {id:"111282"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5447490"}, end: {id:"4268085801"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5447490"}, end: {id:"8072682558"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5447490"}, end: {id:"7233558441"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5860845",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"201726"}, end: {id:"5860845"}, properties:{sequence_index:11}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5860845"}, end: {id:"111984"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5860845"}, end: {id:"5438722682"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5860845"}, end: {id:"3273630811"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5860845"}, end: {id:"5194141542"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5860845"}, end: {id:"6732786762"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5860845"}, end: {id:"6463266449"}, properties:{sequence_index:"3"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5860845"}, end: {id:"3485125659"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5937834",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"201726"}, end: {id:"5937834"}, properties:{sequence_index:2}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5937834"}, end: {id:"111984"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5937834"}, end: {id:"9862900242"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5937834"}, end: {id:"8406170337"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5937834"}, end: {id:"8120663858"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5937834"}, end: {id:"2403773761"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5937834"}, end: {id:"4162188238"}, properties:{sequence_index:"3"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5937834"}, end: {id:"5379546684"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"6398792",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"201726"}, end: {id:"6398792"}, properties:{sequence_index:6}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"6398792"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"6398792"}, end: {id:"8198310977"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6398792"}, end: {id:"1650441634"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6398792"}, end: {id:"1087417579"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"6672580",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"201726"}, end: {id:"6672580"}, properties:{sequence_index:18}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"6672580"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"6672580"}, end: {id:"2519058903"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6672580"}, end: {id:"2297105551"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6672580"}, end: {id:"8922441655"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"7068872",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:"y(t_f) = y_f = 0"}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"201726"}, end: {id:"7068872"}, properties:{sequence_index:3}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"7068872"}, end: {id:"111278"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"7068872"}, end: {id:"5373931751"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7068872"}, end: {id:"9112191201"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"7996351",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"201726"}, end: {id:"7996351"}, properties:{sequence_index:23}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"7996351"}, end: {id:"111341"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"7996351"}, end: {id:"1541916015"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8131060",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"201726"}, end: {id:"8131060"}, properties:{sequence_index:9}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8131060"}, end: {id:"111182"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8131060"}, end: {id:"1191796961"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8131060"}, end: {id:"2510804451"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8131060"}, end: {id:"4778077984"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8352636",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"201726"}, end: {id:"8352636"}, properties:{sequence_index:15}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8352636"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8352636"}, end: {id:"4778077984"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8352636"}, end: {id:"7233558441"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8352636"}, end: {id:"2297105551"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8794366",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"201726"}, end: {id:"8794366"}, properties:{sequence_index:1}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8794366"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8794366"}, end: {id:"9862900242"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9270409",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"201726"}, end: {id:"9270409"}, properties:{sequence_index:8}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9270409"}, end: {id:"111530"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9270409"}, end: {id:"2086924031"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9270409"}, end: {id:"6974054946"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9270409"}, end: {id:"1191796961"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9551659",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"201726"}, end: {id:"9551659"}, properties:{sequence_index:20}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9551659"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9551659"}, end: {id:"1541916015"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9551659"}, end: {id:"8922441655"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9551659"}, end: {id:"3607070319"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9561765",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"201726"}, end: {id:"9561765"}, properties:{sequence_index:5}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9561765"}, end: {id:"111104"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9561765"}, end: {id:"1650441634"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9760197",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"201726"}, end: {id:"9760197"}, properties:{sequence_index:17}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9760197"}, end: {id:"111886"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9760197"}, end: {id:"2405307372"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9760197"}, end: {id:"7587034465"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9760197"}, end: {id:"7214442790"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9760197"}, end: {id:"2519058903"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9804800",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"201726"}, end: {id:"9804800"}, properties:{sequence_index:19}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9804800"}, end: {id:"111773"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9804800"}, end: {id:"8922441655"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9804800"}, end: {id:"5667870149"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9804800"}, end: {id:"1541916015"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1345199",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"207210"}, end: {id:"1345199"}, properties:{sequence_index:17}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1345199"}, end: {id:"111732"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1345199"}, end: {id:"4264859781"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1345199"}, end: {id:"4490788873"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1345199"}, end: {id:"1571582377"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1345199"}, end: {id:"3650814381"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1388833",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"207210"}, end: {id:"1388833"}, properties:{sequence_index:8}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1388833"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1388833"}, end: {id:"6026694087"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1388833"}, end: {id:"4820320578"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1388833"}, end: {id:"4267808354"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1894519",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"207210"}, end: {id:"1894519"}, properties:{sequence_index:10}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1894519"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1894519"}, end: {id:"6785303857"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2320827",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"207210"}, end: {id:"2320827"}, properties:{sequence_index:9}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2320827"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2320827"}, end: {id:"3411994811"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2431777",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"207210"}, end: {id:"2431777"}, properties:{sequence_index:5}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2431777"}, end: {id:"111104"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2431777"}, end: {id:"4820320578"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2676398",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"207210"}, end: {id:"2676398"}, properties:{sequence_index:19}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2676398"}, end: {id:"111341"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2676398"}, end: {id:"1292735067"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2901381",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"207210"}, end: {id:"2901381"}, properties:{sequence_index:7}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2901381"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2901381"}, end: {id:"8361238989"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2901381"}, end: {id:"5345738321"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2901381"}, end: {id:"6026694087"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3408108",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"207210"}, end: {id:"3408108"}, properties:{sequence_index:15}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3408108"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3408108"}, end: {id:"3004158505"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3408108"}, end: {id:"3650370389"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3492706",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"207210"}, end: {id:"3492706"}, properties:{sequence_index:11}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3492706"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3492706"}, end: {id:"6785303857"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3492706"}, end: {id:"3411994811"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3492706"}, end: {id:"5177311762"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4575140",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"207210"}, end: {id:"4575140"}, properties:{sequence_index:3}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4575140"}, end: {id:"111886"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4575140"}, end: {id:"1848400430"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4575140"}, end: {id:"3876446703"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4575140"}, end: {id:"7905984866"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4575140"}, end: {id:"4264859781"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4705210",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"207210"}, end: {id:"4705210"}, properties:{sequence_index:18}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4705210"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4705210"}, end: {id:"3650814381"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4705210"}, end: {id:"1292735067"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5400789",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"207210"}, end: {id:"5400789"}, properties:{sequence_index:13}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5400789"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5400789"}, end: {id:"6268336290"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5400789"}, end: {id:"7672365885"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5550676",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"207210"}, end: {id:"5550676"}, properties:{sequence_index:14}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5550676"}, end: {id:"111182"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5550676"}, end: {id:"7672365885"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5550676"}, end: {id:"3448601530"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5550676"}, end: {id:"3004158505"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5863314",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"207210"}, end: {id:"5863314"}, properties:{sequence_index:1}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5863314"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5863314"}, end: {id:"5345738321"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"6715674",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"207210"}, end: {id:"6715674"}, properties:{sequence_index:6}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"6715674"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"6715674"}, end: {id:"8361238989"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"7387809",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"207210"}, end: {id:"7387809"}, properties:{sequence_index:4}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"7387809"}, end: {id:"111886"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"7387809"}, end: {id:"1848400430"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7387809"}, end: {id:"2346952973"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7387809"}, end: {id:"9594072504"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7387809"}, end: {id:"4490788873"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"7878437",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"207210"}, end: {id:"7878437"}, properties:{sequence_index:12}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"7878437"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"7878437"}, end: {id:"5177311762"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7878437"}, end: {id:"4267808354"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7878437"}, end: {id:"6268336290"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8162484",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:"this is a big leap of logic that is consistent with Kepler's third law of motion"}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"207210"}, end: {id:"8162484"}, properties:{sequence_index:16}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8162484"}, end: {id:"111237"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8162484"}, end: {id:"3650370389"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8162484"}, end: {id:"1571582377"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9492883",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"207210"}, end: {id:"9492883"}, properties:{sequence_index:2}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9492883"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9492883"}, end: {id:"5345738321"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9492883"}, end: {id:"1848400430"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1306821",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"282755"}, end: {id:"1306821"}, properties:{sequence_index:3}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1306821"}, end: {id:"111777"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1306821"}, end: {id:"9226945488"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1306821"}, end: {id:"5089196493"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1306821"}, end: {id:"1333474099"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1306821"}, end: {id:"3342155559"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1306821"}, end: {id:"2114570475"}, properties:{sequence_index:"3"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1306821"}, end: {id:"7912578203"}, properties:{sequence_index:"4"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1306821"}, end: {id:"9789485295"}, properties:{sequence_index:"5"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1306821"}, end: {id:"4627284246"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1608311",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"282755"}, end: {id:"1608311"}, properties:{sequence_index:12}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1608311"}, end: {id:"111182"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1608311"}, end: {id:"3906710072"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1608311"}, end: {id:"6238632840"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1608311"}, end: {id:"7010294143"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1834675",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"282755"}, end: {id:"1834675"}, properties:{sequence_index:14}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1834675"}, end: {id:"111483"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1834675"}, end: {id:"4858693811"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1834675"}, end: {id:"4319544433"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1834675"}, end: {id:"2617541067"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2499406",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"282755"}, end: {id:"2499406"}, properties:{sequence_index:10}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2499406"}, end: {id:"111975"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2499406"}, end: {id:"4072200527"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2499406"}, end: {id:"5359471792"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2499406"}, end: {id:"1994296484"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3688405",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"282755"}, end: {id:"3688405"}, properties:{sequence_index:16}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3688405"}, end: {id:"111984"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3688405"}, end: {id:"2617541067"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3688405"}, end: {id:"3846345263"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"3688405"}, end: {id:"5208737840"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"3688405"}, end: {id:"5770088141"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"3688405"}, end: {id:"7053449926"}, properties:{sequence_index:"3"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"3688405"}, end: {id:"1559688463"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4469272",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"282755"}, end: {id:"4469272"}, properties:{sequence_index:7}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4469272"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4469272"}, end: {id:"9262596735"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4469272"}, end: {id:"5426308937"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4469272"}, end: {id:"4245712581"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4586003",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"282755"}, end: {id:"4586003"}, properties:{sequence_index:1}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4586003"}, end: {id:"111777"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4586003"}, end: {id:"6935745841"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4586003"}, end: {id:"3398368564"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4586003"}, end: {id:"3594626260"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4586003"}, end: {id:"9794128647"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4586003"}, end: {id:"4153613253"}, properties:{sequence_index:"3"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4586003"}, end: {id:"3088463019"}, properties:{sequence_index:"4"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4586003"}, end: {id:"3486213448"}, properties:{sequence_index:"5"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4586003"}, end: {id:"4830480629"}, properties:{sequence_index:"6"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4586003"}, end: {id:"7819443873"}, properties:{sequence_index:"7"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4586003"}, end: {id:"5563580265"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"6127864",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"282755"}, end: {id:"6127864"}, properties:{sequence_index:8}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"6127864"}, end: {id:"111886"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"6127864"}, end: {id:"4245712581"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6127864"}, end: {id:"3722461713"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6127864"}, end: {id:"9346215480"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6127864"}, end: {id:"3614055652"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"7853333",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"282755"}, end: {id:"7853333"}, properties:{sequence_index:9}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"7853333"}, end: {id:"111483"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"7853333"}, end: {id:"3614055652"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7853333"}, end: {id:"2754264786"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7853333"}, end: {id:"8059639673"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8603083",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"282755"}, end: {id:"8603083"}, properties:{sequence_index:11}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8603083"}, end: {id:"111355"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8603083"}, end: {id:"1994296484"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8603083"}, end: {id:"8059639673"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8603083"}, end: {id:"3906710072"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8643391",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"282755"}, end: {id:"8643391"}, properties:{sequence_index:15}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8643391"}, end: {id:"111104"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8643391"}, end: {id:"3920616792"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8659528",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"282755"}, end: {id:"8659528"}, properties:{sequence_index:5}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8659528"}, end: {id:"111732"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8659528"}, end: {id:"5563580265"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8659528"}, end: {id:"4627284246"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8659528"}, end: {id:"3176662571"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8659528"}, end: {id:"4072200527"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8796814",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"282755"}, end: {id:"8796814"}, properties:{sequence_index:13}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8796814"}, end: {id:"111975"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8796814"}, end: {id:"7010294143"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8796814"}, end: {id:"7556442438"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8796814"}, end: {id:"4858693811"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9698967",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"282755"}, end: {id:"9698967"}, properties:{sequence_index:2}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9698967"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9698967"}, end: {id:"9226945488"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9835541",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"282755"}, end: {id:"9835541"}, properties:{sequence_index:6}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9835541"}, end: {id:"111886"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9835541"}, end: {id:"6785303857"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9835541"}, end: {id:"1823570358"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9835541"}, end: {id:"3236313290"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9835541"}, end: {id:"9262596735"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9847336",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"282755"}, end: {id:"9847336"}, properties:{sequence_index:4}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9847336"}, end: {id:"111104"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9847336"}, end: {id:"3176662571"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1044455",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"332170"}, end: {id:"1044455"}, properties:{sequence_index:19}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1044455"}, end: {id:"111268"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1044455"}, end: {id:"9759901995"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1044455"}, end: {id:"4748157455"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1643757",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"332170"}, end: {id:"1643757"}, properties:{sequence_index:30}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1643757"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1643757"}, end: {id:"4580545876"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1643757"}, end: {id:"6421241247"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2416859",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"332170"}, end: {id:"2416859"}, properties:{sequence_index:1}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2416859"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2416859"}, end: {id:"3366703541"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2562830",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"332170"}, end: {id:"2562830"}, properties:{sequence_index:3}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2562830"}, end: {id:"111530"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2562830"}, end: {id:"4748157455"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2562830"}, end: {id:"6417359412"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2562830"}, end: {id:"4798787814"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2591191",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"332170"}, end: {id:"2591191"}, properties:{sequence_index:5}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2591191"}, end: {id:"111341"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2591191"}, end: {id:"3462972452"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2743537",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"332170"}, end: {id:"2743537"}, properties:{sequence_index:14}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2743537"}, end: {id:"111483"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2743537"}, end: {id:"3462972452"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2743537"}, end: {id:"5799753649"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2743537"}, end: {id:"7215099603"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2812689",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"332170"}, end: {id:"2812689"}, properties:{sequence_index:20}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2812689"}, end: {id:"111975"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2812689"}, end: {id:"4748157455"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2812689"}, end: {id:"2242144313"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2812689"}, end: {id:"1967582749"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2848379",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"332170"}, end: {id:"2848379"}, properties:{sequence_index:12}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2848379"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2848379"}, end: {id:"1265150401"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2848379"}, end: {id:"9658195023"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3304384",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"332170"}, end: {id:"3304384"}, properties:{sequence_index:31}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3304384"}, end: {id:"111341"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3304384"}, end: {id:"6421241247"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3636217",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"332170"}, end: {id:"3636217"}, properties:{sequence_index:21}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3636217"}, end: {id:"111634"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3636217"}, end: {id:"1967582749"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3636217"}, end: {id:"8706092970"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3636217"}, end: {id:"5733721198"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5355580",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"332170"}, end: {id:"5355580"}, properties:{sequence_index:13}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5355580"}, end: {id:"111341"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5355580"}, end: {id:"9658195023"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5369106",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"332170"}, end: {id:"5369106"}, properties:{sequence_index:24}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5369106"}, end: {id:"111530"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5369106"}, end: {id:"8269198922"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5369106"}, end: {id:"9070454719"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5369106"}, end: {id:"4948763856"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5379322",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"332170"}, end: {id:"5379322"}, properties:{sequence_index:16}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5379322"}, end: {id:"111634"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5379322"}, end: {id:"5144263777"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5379322"}, end: {id:"9658195023"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5379322"}, end: {id:"7939765107"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5815479",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"332170"}, end: {id:"5815479"}, properties:{sequence_index:9}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5815479"}, end: {id:"111182"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5815479"}, end: {id:"9897284307"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5815479"}, end: {id:"8865085668"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5815479"}, end: {id:"8706092970"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"6053987",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"332170"}, end: {id:"6053987"}, properties:{sequence_index:17}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"6053987"}, end: {id:"111341"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"6053987"}, end: {id:"7939765107"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"6224974",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"332170"}, end: {id:"6224974"}, properties:{sequence_index:28}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"6224974"}, end: {id:"111634"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"6224974"}, end: {id:"6457044853"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6224974"}, end: {id:"9658195023"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6224974"}, end: {id:"1259826355"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"6814904",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"332170"}, end: {id:"6814904"}, properties:{sequence_index:29}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"6814904"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"6814904"}, end: {id:"1259826355"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6814904"}, end: {id:"4580545876"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"6829719",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"332170"}, end: {id:"6829719"}, properties:{sequence_index:8}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"6829719"}, end: {id:"111355"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"6829719"}, end: {id:"3411994811"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6829719"}, end: {id:"6175547907"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6829719"}, end: {id:"9897284307"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"6932861",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"332170"}, end: {id:"6932861"}, properties:{sequence_index:10}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"6932861"}, end: {id:"111634"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"6932861"}, end: {id:"3462972452"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6932861"}, end: {id:"8706092970"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6932861"}, end: {id:"7011114072"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"7095007",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"332170"}, end: {id:"7095007"}, properties:{sequence_index:23}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"7095007"}, end: {id:"111182"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"7095007"}, end: {id:"5611024898"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7095007"}, end: {id:"5542390646"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7095007"}, end: {id:"8269198922"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"7173255",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"332170"}, end: {id:"7173255"}, properties:{sequence_index:2}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"7173255"}, end: {id:"111182"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"7173255"}, end: {id:"3366703541"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7173255"}, end: {id:"7083390553"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7173255"}, end: {id:"4748157455"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"7275831",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"332170"}, end: {id:"7275831"}, properties:{sequence_index:27}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"7275831"}, end: {id:"111282"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"7275831"}, end: {id:"3462972452"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7275831"}, end: {id:"9645178657"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7275831"}, end: {id:"6457044853"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"7602827",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:"difference of squares"}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"332170"}, end: {id:"7602827"}, properties:{sequence_index:22}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"7602827"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"7602827"}, end: {id:"5733721198"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7602827"}, end: {id:"5611024898"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"7962856",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"332170"}, end: {id:"7962856"}, properties:{sequence_index:18}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"7962856"}, end: {id:"111282"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"7962856"}, end: {id:"3462972452"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7962856"}, end: {id:"6729698807"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7962856"}, end: {id:"9759901995"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"7991401",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"332170"}, end: {id:"7991401"}, properties:{sequence_index:4}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"7991401"}, end: {id:"111268"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"7991401"}, end: {id:"4798787814"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7991401"}, end: {id:"3462972452"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8096380",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"332170"}, end: {id:"8096380"}, properties:{sequence_index:25}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8096380"}, end: {id:"111268"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8096380"}, end: {id:"4948763856"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8096380"}, end: {id:"7939765107"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8205479",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:"factored 2a out of two terms"}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"332170"}, end: {id:"8205479"}, properties:{sequence_index:15}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8205479"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8205479"}, end: {id:"7215099603"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8205479"}, end: {id:"5144263777"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8839945",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"332170"}, end: {id:"8839945"}, properties:{sequence_index:26}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8839945"}, end: {id:"111341"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8839945"}, end: {id:"8706092970"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9357941",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"332170"}, end: {id:"9357941"}, properties:{sequence_index:11}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9357941"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9357941"}, end: {id:"7011114072"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9357941"}, end: {id:"1265150401"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9381314",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"332170"}, end: {id:"9381314"}, properties:{sequence_index:7}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9381314"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9381314"}, end: {id:"6175547907"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9823399",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"332170"}, end: {id:"9823399"}, properties:{sequence_index:6}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9823399"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9823399"}, end: {id:"3411994811"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1153771",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"374317"}, end: {id:"1153771"}, properties:{sequence_index:5}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1153771"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1153771"}, end: {id:"5902985919"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1153771"}, end: {id:"7882872592"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1153771"}, end: {id:"3566149658"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1302085",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:"https://en.wikipedia.org/wiki/Newton%27s_law_of_universal_gravitation#Modern_form"}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"374317"}, end: {id:"1302085"}, properties:{sequence_index:2}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1302085"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1302085"}, end: {id:"5902985919"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1322174",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"374317"}, end: {id:"1322174"}, properties:{sequence_index:12}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1322174"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1322174"}, end: {id:"8049905441"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1322174"}, end: {id:"1114820451"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1322174"}, end: {id:"5779256336"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1875894",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"374317"}, end: {id:"1875894"}, properties:{sequence_index:15}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1875894"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1875894"}, end: {id:"2924222857"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1962578",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"374317"}, end: {id:"1962578"}, properties:{sequence_index:8}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1962578"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1962578"}, end: {id:"5596822289"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1962578"}, end: {id:"2061086175"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2603561",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"374317"}, end: {id:"2603561"}, properties:{sequence_index:11}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2603561"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2603561"}, end: {id:"8357234146"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2893958",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"374317"}, end: {id:"2893958"}, properties:{sequence_index:26}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2893958"}, end: {id:"111341"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2893958"}, end: {id:"2005061870"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3433370",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"374317"}, end: {id:"3433370"}, properties:{sequence_index:7}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3433370"}, end: {id:"111662"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3433370"}, end: {id:"8405272745"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3433370"}, end: {id:"5596822289"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3576436",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"374317"}, end: {id:"3576436"}, properties:{sequence_index:9}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3576436"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3576436"}, end: {id:"2061086175"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3576436"}, end: {id:"4393670960"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3577090",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"374317"}, end: {id:"3577090"}, properties:{sequence_index:25}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3577090"}, end: {id:"111886"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3577090"}, end: {id:"5846639423"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3577090"}, end: {id:"6599829782"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"3577090"}, end: {id:"3531380618"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"3577090"}, end: {id:"2005061870"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3633525",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"374317"}, end: {id:"3633525"}, properties:{sequence_index:6}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3633525"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3633525"}, end: {id:"3566149658"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3633525"}, end: {id:"8405272745"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3641174",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"374317"}, end: {id:"3641174"}, properties:{sequence_index:16}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3641174"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3641174"}, end: {id:"3214170322"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3641174"}, end: {id:"2924222857"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3641174"}, end: {id:"2998709778"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3660209",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"374317"}, end: {id:"3660209"}, properties:{sequence_index:3}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3660209"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3660209"}, end: {id:"1114820451"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3724598",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"374317"}, end: {id:"3724598"}, properties:{sequence_index:18}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3724598"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3724598"}, end: {id:"9510328252"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3724598"}, end: {id:"5779256336"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3724598"}, end: {id:"5850144586"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4513518",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"374317"}, end: {id:"4513518"}, properties:{sequence_index:10}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4513518"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4513518"}, end: {id:"8049905441"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5188363",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"374317"}, end: {id:"5188363"}, properties:{sequence_index:13}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5188363"}, end: {id:"111236"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5188363"}, end: {id:"8357234146"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5188363"}, end: {id:"3731774096"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5188363"}, end: {id:"3350802342"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5188363"}, end: {id:"5904227750"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5188363"}, end: {id:"6281834543"}, properties:{sequence_index:"3"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5188363"}, end: {id:"8066819515"}, properties:{sequence_index:"4"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5188363"}, end: {id:"3274176452"}, properties:{sequence_index:"5"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5188363"}, end: {id:"6091977310"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5454987",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"374317"}, end: {id:"5454987"}, properties:{sequence_index:21}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5454987"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5454987"}, end: {id:"9081138616"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5454987"}, end: {id:"2907404069"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5454987"}, end: {id:"4947831649"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5679035",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"374317"}, end: {id:"5679035"}, properties:{sequence_index:20}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5679035"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5679035"}, end: {id:"2907404069"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"6228957",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"374317"}, end: {id:"6228957"}, properties:{sequence_index:22}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"6228957"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"6228957"}, end: {id:"4393670960"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6228957"}, end: {id:"4947831649"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6228957"}, end: {id:"6892595652"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"7795985",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"374317"}, end: {id:"7795985"}, properties:{sequence_index:17}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"7795985"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"7795985"}, end: {id:"2998709778"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7795985"}, end: {id:"6091977310"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7795985"}, end: {id:"9510328252"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"7925705",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"374317"}, end: {id:"7925705"}, properties:{sequence_index:14}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"7925705"}, end: {id:"111236"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"7925705"}, end: {id:"8357234146"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7925705"}, end: {id:"4587046017"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7925705"}, end: {id:"3939572542"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7925705"}, end: {id:"9350720370"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7925705"}, end: {id:"3166466250"}, properties:{sequence_index:"3"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7925705"}, end: {id:"6038673136"}, properties:{sequence_index:"4"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7925705"}, end: {id:"1616666229"}, properties:{sequence_index:"5"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7925705"}, end: {id:"8552710882"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"7936249",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"374317"}, end: {id:"7936249"}, properties:{sequence_index:4}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"7936249"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"7936249"}, end: {id:"7882872592"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8435512",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"374317"}, end: {id:"8435512"}, properties:{sequence_index:24}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8435512"}, end: {id:"111524"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8435512"}, end: {id:"7112646057"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8435512"}, end: {id:"5846639423"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8435512"}, end: {id:"5693047217"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9878340",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"374317"}, end: {id:"9878340"}, properties:{sequence_index:19}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9878340"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9878340"}, end: {id:"8552710882"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9878340"}, end: {id:"5850144586"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9878340"}, end: {id:"9081138616"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9887933",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"374317"}, end: {id:"9887933"}, properties:{sequence_index:23}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9887933"}, end: {id:"111182"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9887933"}, end: {id:"6892595652"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9887933"}, end: {id:"7410526982"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9887933"}, end: {id:"7112646057"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9935422",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:"starting velocity at infinity is zero"}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"374317"}, end: {id:"9935422"}, properties:{sequence_index:1}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9935422"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9935422"}, end: {id:"3214170322"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1059017",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"375160"}, end: {id:"1059017"}, properties:{sequence_index:9}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1059017"}, end: {id:"111341"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1059017"}, end: {id:"9718685793"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1873674",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"375160"}, end: {id:"1873674"}, properties:{sequence_index:6}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1873674"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1873674"}, end: {id:"1190768176"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1873674"}, end: {id:"3605073197"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3831533",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"375160"}, end: {id:"3831533"}, properties:{sequence_index:1}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3831533"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3831533"}, end: {id:"9781951738"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3862516",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"375160"}, end: {id:"3862516"}, properties:{sequence_index:3}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3862516"}, end: {id:"111975"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3862516"}, end: {id:"8435841627"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3862516"}, end: {id:"6296166842"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"3862516"}, end: {id:"3497828859"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5391858",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"375160"}, end: {id:"5391858"}, properties:{sequence_index:7}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5391858"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5391858"}, end: {id:"8435841627"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5391858"}, end: {id:"3605073197"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5391858"}, end: {id:"9847143017"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"6914144",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"375160"}, end: {id:"6914144"}, properties:{sequence_index:5}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"6914144"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"6914144"}, end: {id:"8368984890"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6914144"}, end: {id:"1190768176"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8648371",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"375160"}, end: {id:"8648371"}, properties:{sequence_index:8}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8648371"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8648371"}, end: {id:"9847143017"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8648371"}, end: {id:"9718685793"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9225696",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"375160"}, end: {id:"9225696"}, properties:{sequence_index:4}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9225696"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9225696"}, end: {id:"3497828859"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9225696"}, end: {id:"9781951738"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9225696"}, end: {id:"8368984890"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9872032",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"375160"}, end: {id:"9872032"}, properties:{sequence_index:2}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9872032"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9872032"}, end: {id:"8435841627"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1143551",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"387954"}, end: {id:"1143551"}, properties:{sequence_index:13}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1143551"}, end: {id:"111341"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1143551"}, end: {id:"4180845508"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1317920",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"387954"}, end: {id:"1317920"}, properties:{sequence_index:6}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1317920"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1317920"}, end: {id:"6348260313"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1317920"}, end: {id:"3046191961"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1317920"}, end: {id:"3080027960"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1909003",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"387954"}, end: {id:"1909003"}, properties:{sequence_index:12}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1909003"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1909003"}, end: {id:"6998364753"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1909003"}, end: {id:"4180845508"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3035476",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"387954"}, end: {id:"3035476"}, properties:{sequence_index:9}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3035476"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3035476"}, end: {id:"8721295221"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3035476"}, end: {id:"3080027960"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3035476"}, end: {id:"4593428198"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3198144",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:"circumference of a circle"}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"387954"}, end: {id:"3198144"}, properties:{sequence_index:3}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3198144"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3198144"}, end: {id:"6785303857"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5559943",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"387954"}, end: {id:"5559943"}, properties:{sequence_index:10}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5559943"}, end: {id:"111104"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5559943"}, end: {id:"3472836147"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5700345",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"387954"}, end: {id:"5700345"}, properties:{sequence_index:2}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5700345"}, end: {id:"111886"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5700345"}, end: {id:"5426308937"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5700345"}, end: {id:"1277713901"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5700345"}, end: {id:"7476820482"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5700345"}, end: {id:"6946088325"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"6292792",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"387954"}, end: {id:"6292792"}, properties:{sequence_index:7}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"6292792"}, end: {id:"111104"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"6292792"}, end: {id:"7175416299"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"6456434",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"387954"}, end: {id:"6456434"}, properties:{sequence_index:5}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"6456434"}, end: {id:"111236"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"6456434"}, end: {id:"6946088325"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6456434"}, end: {id:"4057686137"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6456434"}, end: {id:"7708501762"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6456434"}, end: {id:"9753878784"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6456434"}, end: {id:"9601500174"}, properties:{sequence_index:"3"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6456434"}, end: {id:"8135396036"}, properties:{sequence_index:"4"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6456434"}, end: {id:"4470433702"}, properties:{sequence_index:"5"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6456434"}, end: {id:"3046191961"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9488257",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"387954"}, end: {id:"9488257"}, properties:{sequence_index:4}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9488257"}, end: {id:"111984"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9488257"}, end: {id:"6785303857"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9488257"}, end: {id:"4057686137"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9488257"}, end: {id:"6239815585"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9488257"}, end: {id:"2346150725"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9488257"}, end: {id:"4202292449"}, properties:{sequence_index:"3"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9488257"}, end: {id:"6348260313"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9626463",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"387954"}, end: {id:"9626463"}, properties:{sequence_index:8}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9626463"}, end: {id:"111646"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9626463"}, end: {id:"7175416299"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9626463"}, end: {id:"3219318145"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9626463"}, end: {id:"8721295221"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9784411",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"387954"}, end: {id:"9784411"}, properties:{sequence_index:1}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9784411"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9784411"}, end: {id:"5426308937"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9955987",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"387954"}, end: {id:"9955987"}, properties:{sequence_index:11}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9955987"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9955987"}, end: {id:"3472836147"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9955987"}, end: {id:"4593428198"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9955987"}, end: {id:"6998364753"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1993589",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"513999"}, end: {id:"1993589"}, properties:{sequence_index:9}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1993589"}, end: {id:"111182"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1993589"}, end: {id:"3464107376"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1993589"}, end: {id:"5074423401"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1993589"}, end: {id:"6397683463"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2711162",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"513999"}, end: {id:"2711162"}, properties:{sequence_index:6}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2711162"}, end: {id:"111732"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2711162"}, end: {id:"1085150613"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2711162"}, end: {id:"5634116660"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2711162"}, end: {id:"9941599459"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2711162"}, end: {id:"5002539602"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4779130",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"513999"}, end: {id:"4779130"}, properties:{sequence_index:8}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4779130"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4779130"}, end: {id:"3464107376"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4965571",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"513999"}, end: {id:"4965571"}, properties:{sequence_index:1}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4965571"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4965571"}, end: {id:"1815398659"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5592617",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"513999"}, end: {id:"5592617"}, properties:{sequence_index:7}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5592617"}, end: {id:"111975"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5592617"}, end: {id:"5002539602"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5592617"}, end: {id:"8854422847"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5592617"}, end: {id:"6055078815"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"6605632",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"513999"}, end: {id:"6605632"}, properties:{sequence_index:11}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"6605632"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"6605632"}, end: {id:"2257410739"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6605632"}, end: {id:"7826132469"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"6666476",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"513999"}, end: {id:"6666476"}, properties:{sequence_index:5}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"6666476"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"6666476"}, end: {id:"5634116660"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"7017521",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"513999"}, end: {id:"7017521"}, properties:{sequence_index:10}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"7017521"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"7017521"}, end: {id:"6397683463"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7017521"}, end: {id:"6055078815"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7017521"}, end: {id:"2257410739"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"7164757",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:"hold volume constant in first term; hold temperature constant in second term"}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"513999"}, end: {id:"7164757"}, properties:{sequence_index:2}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"7164757"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"7164757"}, end: {id:"9941599459"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8168352",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"513999"}, end: {id:"8168352"}, properties:{sequence_index:3}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8168352"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8168352"}, end: {id:"3547519267"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9131071",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"513999"}, end: {id:"9131071"}, properties:{sequence_index:4}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9131071"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9131071"}, end: {id:"1085150613"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9782579",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"513999"}, end: {id:"9782579"}, properties:{sequence_index:12}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9782579"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9782579"}, end: {id:"9781951738"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1148993",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"522862"}, end: {id:"1148993"}, properties:{sequence_index:6}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1148993"}, end: {id:"111299"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1148993"}, end: {id:"8588429722"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1206301",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"522862"}, end: {id:"1206301"}, properties:{sequence_index:8}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1206301"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1206301"}, end: {id:"6831637424"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1206301"}, end: {id:"7696214507"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1206301"}, end: {id:"3061811650"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2068603",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"522862"}, end: {id:"2068603"}, properties:{sequence_index:15}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2068603"}, end: {id:"111341"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2068603"}, end: {id:"8495187962"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2215432",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"522862"}, end: {id:"2215432"}, properties:{sequence_index:3}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2215432"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2215432"}, end: {id:"6450985774"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2967028",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"522862"}, end: {id:"2967028"}, properties:{sequence_index:11}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2967028"}, end: {id:"111299"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2967028"}, end: {id:"4968680693"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3169869",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"522862"}, end: {id:"3169869"}, properties:{sequence_index:9}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3169869"}, end: {id:"111975"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3169869"}, end: {id:"3061811650"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3169869"}, end: {id:"7857757625"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"3169869"}, end: {id:"9756089533"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5001869",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"522862"}, end: {id:"5001869"}, properties:{sequence_index:5}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5001869"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5001869"}, end: {id:"1310571337"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5001869"}, end: {id:"2575937347"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5001869"}, end: {id:"7696214507"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5372769",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"522862"}, end: {id:"5372769"}, properties:{sequence_index:4}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5372769"}, end: {id:"111984"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5372769"}, end: {id:"6450985774"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5372769"}, end: {id:"7154592211"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5372769"}, end: {id:"6353701615"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5372769"}, end: {id:"2773628333"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5372769"}, end: {id:"9029795851"}, properties:{sequence_index:"3"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5372769"}, end: {id:"2575937347"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"6119314",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"522862"}, end: {id:"6119314"}, properties:{sequence_index:12}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"6119314"}, end: {id:"111886"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"6119314"}, end: {id:"4968680693"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6119314"}, end: {id:"7321695558"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6119314"}, end: {id:"9906920183"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6119314"}, end: {id:"4501377629"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"6146931",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"522862"}, end: {id:"6146931"}, properties:{sequence_index:13}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"6146931"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"6146931"}, end: {id:"4501377629"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6146931"}, end: {id:"2768857871"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6146931"}, end: {id:"3417126140"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"7919446",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"522862"}, end: {id:"7919446"}, properties:{sequence_index:1}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"7919446"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"7919446"}, end: {id:"8945218208"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8072315",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"522862"}, end: {id:"8072315"}, properties:{sequence_index:14}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8072315"}, end: {id:"111490"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8072315"}, end: {id:"3417126140"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8072315"}, end: {id:"5453995431"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8072315"}, end: {id:"6023986360"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8072315"}, end: {id:"8495187962"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8509796",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"522862"}, end: {id:"8509796"}, properties:{sequence_index:10}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8509796"}, end: {id:"111975"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8509796"}, end: {id:"9756089533"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8509796"}, end: {id:"5632428182"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8509796"}, end: {id:"2768857871"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9056504",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"522862"}, end: {id:"9056504"}, properties:{sequence_index:7}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9056504"}, end: {id:"111886"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9056504"}, end: {id:"8588429722"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9056504"}, end: {id:"7375348852"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9056504"}, end: {id:"1512581563"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9056504"}, end: {id:"6831637424"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9582699",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"522862"}, end: {id:"9582699"}, properties:{sequence_index:2}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9582699"}, end: {id:"111282"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9582699"}, end: {id:"8945218208"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9582699"}, end: {id:"9025853427"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9582699"}, end: {id:"1310571337"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1220683",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"527822"}, end: {id:"1220683"}, properties:{sequence_index:6}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1220683"}, end: {id:"111715"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1220683"}, end: {id:"9440616166"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1220683"}, end: {id:"2091584724"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1220683"}, end: {id:"9590696981"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1220683"}, end: {id:"7816982139"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1220683"}, end: {id:"7846240076"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1400184",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"527822"}, end: {id:"1400184"}, properties:{sequence_index:4}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1400184"}, end: {id:"111975"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1400184"}, end: {id:"9407192813"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1400184"}, end: {id:"3246378279"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1400184"}, end: {id:"2308660627"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1874718",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"527822"}, end: {id:"1874718"}, properties:{sequence_index:8}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1874718"}, end: {id:"111715"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1874718"}, end: {id:"7112613117"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1874718"}, end: {id:"7935917166"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1874718"}, end: {id:"3723096423"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1874718"}, end: {id:"7560908617"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1874718"}, end: {id:"1132941271"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2667299",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"527822"}, end: {id:"2667299"}, properties:{sequence_index:1}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2667299"}, end: {id:"111886"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2667299"}, end: {id:"5345738321"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2667299"}, end: {id:"9881106100"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2667299"}, end: {id:"5781435087"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2667299"}, end: {id:"2484824786"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3237021",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"527822"}, end: {id:"3237021"}, properties:{sequence_index:2}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3237021"}, end: {id:"111236"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3237021"}, end: {id:"6935745841"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3237021"}, end: {id:"3921072591"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"3237021"}, end: {id:"1193980495"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"3237021"}, end: {id:"4651061153"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"3237021"}, end: {id:"9903988330"}, properties:{sequence_index:"3"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"3237021"}, end: {id:"3353418803"}, properties:{sequence_index:"4"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"3237021"}, end: {id:"6535639720"}, properties:{sequence_index:"5"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"3237021"}, end: {id:"8661803554"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3858247",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"527822"}, end: {id:"3858247"}, properties:{sequence_index:9}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3858247"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3858247"}, end: {id:"1132941271"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3858247"}, end: {id:"3364286646"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5760226",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"527822"}, end: {id:"5760226"}, properties:{sequence_index:7}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5760226"}, end: {id:"111715"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5760226"}, end: {id:"7846240076"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5760226"}, end: {id:"7326066466"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5760226"}, end: {id:"9956609318"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5760226"}, end: {id:"2957211007"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5760226"}, end: {id:"7112613117"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"6200455",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"527822"}, end: {id:"6200455"}, properties:{sequence_index:0.5}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"6200455"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"6200455"}, end: {id:"5345738321"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"6715984",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"527822"}, end: {id:"6715984"}, properties:{sequence_index:3}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"6715984"}, end: {id:"111355"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"6715984"}, end: {id:"8661803554"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6715984"}, end: {id:"4800170179"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6715984"}, end: {id:"9407192813"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8079031",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"527822"}, end: {id:"8079031"}, properties:{sequence_index:1.5}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8079031"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8079031"}, end: {id:"6935745841"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9601593",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"527822"}, end: {id:"9601593"}, properties:{sequence_index:5}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9601593"}, end: {id:"111182"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9601593"}, end: {id:"2308660627"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9601593"}, end: {id:"2685587762"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9601593"}, end: {id:"9440616166"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9676005",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"527822"}, end: {id:"9676005"}, properties:{sequence_index:1.25}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9676005"}, end: {id:"111886"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9676005"}, end: {id:"2484824786"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9676005"}, end: {id:"9355039511"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9676005"}, end: {id:"2232825726"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9676005"}, end: {id:"4800170179"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1304801",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"539398"}, end: {id:"1304801"}, properties:{sequence_index:24}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1304801"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1304801"}, end: {id:"6774684564"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1304801"}, end: {id:"8497631728"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1304801"}, end: {id:"8283354808"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1330727",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"539398"}, end: {id:"1330727"}, properties:{sequence_index:13}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1330727"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1330727"}, end: {id:"7107090465"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1330727"}, end: {id:"5125940051"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1330727"}, end: {id:"1525861537"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1410856",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"539398"}, end: {id:"1410856"}, properties:{sequence_index:29}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1410856"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1410856"}, end: {id:"8602221482"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1410856"}, end: {id:"8497631728"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1410856"}, end: {id:"6240206408"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1791333",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"539398"}, end: {id:"1791333"}, properties:{sequence_index:18}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1791333"}, end: {id:"111797"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1791333"}, end: {id:"4192519596"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1791333"}, end: {id:"4504256452"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1791333"}, end: {id:"1357848476"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1791333"}, end: {id:"7621705408"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2270901",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"539398"}, end: {id:"2270901"}, properties:{sequence_index:15}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2270901"}, end: {id:"111886"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2270901"}, end: {id:"4182362050"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2270901"}, end: {id:"2064205392"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2270901"}, end: {id:"1894894315"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2270901"}, end: {id:"1357848476"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3099726",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"539398"}, end: {id:"3099726"}, properties:{sequence_index:25}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3099726"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3099726"}, end: {id:"2719691582"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3105609",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"539398"}, end: {id:"3105609"}, properties:{sequence_index:31}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3105609"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3105609"}, end: {id:"6529793063"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3105609"}, end: {id:"3060393541"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3232460",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"539398"}, end: {id:"3232460"}, properties:{sequence_index:22}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3232460"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3232460"}, end: {id:"2700934933"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3232460"}, end: {id:"3085575328"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3232460"}, end: {id:"8497631728"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3264098",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"539398"}, end: {id:"3264098"}, properties:{sequence_index:17}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3264098"}, end: {id:"111484"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3264098"}, end: {id:"4192519596"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3264098"}, end: {id:"4504256452"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3346106",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"539398"}, end: {id:"3346106"}, properties:{sequence_index:33}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3346106"}, end: {id:"111341"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3346106"}, end: {id:"6556875579"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3822400",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"539398"}, end: {id:"3822400"}, properties:{sequence_index:10}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3822400"}, end: {id:"111886"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3822400"}, end: {id:"3350830826"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3822400"}, end: {id:"9761485403"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"3822400"}, end: {id:"8710504862"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"3822400"}, end: {id:"4075539836"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3859105",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"539398"}, end: {id:"3859105"}, properties:{sequence_index:5}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3859105"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3859105"}, end: {id:"8396997949"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4037583",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"539398"}, end: {id:"4037583"}, properties:{sequence_index:19}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4037583"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4037583"}, end: {id:"7621705408"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4037583"}, end: {id:"3085575328"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4285950",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"539398"}, end: {id:"4285950"}, properties:{sequence_index:20}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4285950"}, end: {id:"111886"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4285950"}, end: {id:"4585932229"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4285950"}, end: {id:"4935235303"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4285950"}, end: {id:"2293352649"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4285950"}, end: {id:"3660957533"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4450503",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"539398"}, end: {id:"4450503"}, properties:{sequence_index:6}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4450503"}, end: {id:"111886"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4450503"}, end: {id:"3350830826"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4450503"}, end: {id:"4437214608"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4450503"}, end: {id:"5623794884"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4450503"}, end: {id:"2236639474"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4581255",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"539398"}, end: {id:"4581255"}, properties:{sequence_index:32}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4581255"}, end: {id:"111421"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4581255"}, end: {id:"1172039918"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4581255"}, end: {id:"3060393541"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4581255"}, end: {id:"6556875579"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5037316",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"539398"}, end: {id:"5037316"}, properties:{sequence_index:11}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5037316"}, end: {id:"111886"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5037316"}, end: {id:"3350830826"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5037316"}, end: {id:"6529120965"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5037316"}, end: {id:"1511199318"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5037316"}, end: {id:"7107090465"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5061134",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"539398"}, end: {id:"5061134"}, properties:{sequence_index:27}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5061134"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5061134"}, end: {id:"8046208134"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5061134"}, end: {id:"1172039918"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5273445",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"539398"}, end: {id:"5273445"}, properties:{sequence_index:3}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5273445"}, end: {id:"111253"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5273445"}, end: {id:"4182362050"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5273445"}, end: {id:"1928085940"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5273445"}, end: {id:"9191880568"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5464106",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"539398"}, end: {id:"5464106"}, properties:{sequence_index:8}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5464106"}, end: {id:"111474"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5464106"}, end: {id:"1020854560"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5464106"}, end: {id:"6306552185"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5816138",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"539398"}, end: {id:"5816138"}, properties:{sequence_index:23}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5816138"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5816138"}, end: {id:"6774684564"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"6945646",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"539398"}, end: {id:"6945646"}, properties:{sequence_index:1}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"6945646"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"6945646"}, end: {id:"4182362050"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"6988426",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"539398"}, end: {id:"6988426"}, properties:{sequence_index:14}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"6988426"}, end: {id:"111984"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"6988426"}, end: {id:"7607271250"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6988426"}, end: {id:"4182362050"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6988426"}, end: {id:"1742775076"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6988426"}, end: {id:"4583868070"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6988426"}, end: {id:"4192519596"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"7201861",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"539398"}, end: {id:"7201861"}, properties:{sequence_index:12}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"7201861"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"7201861"}, end: {id:"4075539836"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7201861"}, end: {id:"8065128065"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7201861"}, end: {id:"5125940051"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8130270",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"539398"}, end: {id:"8130270"}, properties:{sequence_index:28}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8130270"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8130270"}, end: {id:"8602221482"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8135505",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"539398"}, end: {id:"8135505"}, properties:{sequence_index:4}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8135505"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8135505"}, end: {id:"9191880568"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8135505"}, end: {id:"3350830826"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8475410",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"539398"}, end: {id:"8475410"}, properties:{sequence_index:7}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8475410"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8475410"}, end: {id:"2236639474"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8475410"}, end: {id:"8396997949"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8475410"}, end: {id:"1020854560"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8612576",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"539398"}, end: {id:"8612576"}, properties:{sequence_index:30}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8612576"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8612576"}, end: {id:"2719691582"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8612576"}, end: {id:"6240206408"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8612576"}, end: {id:"6529793063"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8712986",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"539398"}, end: {id:"8712986"}, properties:{sequence_index:26}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8712986"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8712986"}, end: {id:"2719691582"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8712986"}, end: {id:"8283354808"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8712986"}, end: {id:"8046208134"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8915037",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"539398"}, end: {id:"8915037"}, properties:{sequence_index:9}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8915037"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8915037"}, end: {id:"6306552185"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8915037"}, end: {id:"8065128065"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9260286",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"539398"}, end: {id:"9260286"}, properties:{sequence_index:2}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9260286"}, end: {id:"111484"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9260286"}, end: {id:"4182362050"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9260286"}, end: {id:"1928085940"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9512128",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"539398"}, end: {id:"9512128"}, properties:{sequence_index:16}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9512128"}, end: {id:"111484"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9512128"}, end: {id:"1357848476"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9512128"}, end: {id:"6555185548"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9585552",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"539398"}, end: {id:"9585552"}, properties:{sequence_index:21}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9585552"}, end: {id:"111182"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9585552"}, end: {id:"3660957533"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9585552"}, end: {id:"3967985562"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9585552"}, end: {id:"2700934933"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1336657",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:"based on the comparison of the t^2 terms"}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"551770"}, end: {id:"1336657"}, properties:{sequence_index:20}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1336657"}, end: {id:"111768"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1336657"}, end: {id:"4287102261"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1336657"}, end: {id:"1586866563"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1336657"}, end: {id:"1916173354"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1337934",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:"equation 1-13 on page 21 in \cite{1999_Tipler_Llewellyn}"}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"551770"}, end: {id:"1337934"}, properties:{sequence_index:1}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1337934"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1337934"}, end: {id:"4662369843"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2712078",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"551770"}, end: {id:"2712078"}, properties:{sequence_index:15}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2712078"}, end: {id:"111104"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2712078"}, end: {id:"8515803375"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3002960",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"551770"}, end: {id:"3002960"}, properties:{sequence_index:11}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3002960"}, end: {id:"111268"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3002960"}, end: {id:"8730201316"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3002960"}, end: {id:"5148266645"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3151962",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"551770"}, end: {id:"3151962"}, properties:{sequence_index:12}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3151962"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3151962"}, end: {id:"4287102261"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3201871",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"551770"}, end: {id:"3201871"}, properties:{sequence_index:25}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3201871"}, end: {id:"111530"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3201871"}, end: {id:"5763749235"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3201871"}, end: {id:"6408214498"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"3201871"}, end: {id:"2999795755"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3244831",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"551770"}, end: {id:"3244831"}, properties:{sequence_index:6}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3244831"}, end: {id:"111282"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3244831"}, end: {id:"7741202861"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3244831"}, end: {id:"7337056406"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"3244831"}, end: {id:"4139999399"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3464414",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"551770"}, end: {id:"3464414"}, properties:{sequence_index:23}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3464414"}, end: {id:"111975"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3464414"}, end: {id:"2417941373"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3464414"}, end: {id:"5787469164"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"3464414"}, end: {id:"1639827492"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4044426",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"551770"}, end: {id:"4044426"}, properties:{sequence_index:24}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4044426"}, end: {id:"111182"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4044426"}, end: {id:"1639827492"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4044426"}, end: {id:"5669500954"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4044426"}, end: {id:"5763749235"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4052521",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"551770"}, end: {id:"4052521"}, properties:{sequence_index:10}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4052521"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4052521"}, end: {id:"1974334644"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4052521"}, end: {id:"8730201316"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4777578",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"551770"}, end: {id:"4777578"}, properties:{sequence_index:4}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4777578"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4777578"}, end: {id:"3426941928"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4777578"}, end: {id:"2096918413"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4875843",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:"based on the comparison of the x^2 terms"}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"551770"}, end: {id:"4875843"}, properties:{sequence_index:19}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4875843"}, end: {id:"111768"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4875843"}, end: {id:"4287102261"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4875843"}, end: {id:"1586866563"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4875843"}, end: {id:"3182633789"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5029881",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:"solve for \gamma"}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"551770"}, end: {id:"5029881"}, properties:{sequence_index:22}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5029881"}, end: {id:"111282"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5029881"}, end: {id:"3182633789"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5029881"}, end: {id:"5284610349"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5029881"}, end: {id:"2417941373"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5211114",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"551770"}, end: {id:"5211114"}, properties:{sequence_index:29}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5211114"}, end: {id:"111524"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5211114"}, end: {id:"7906112355"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5211114"}, end: {id:"1528310784"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5211114"}, end: {id:"8360117126"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5537889",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:"expanded the squared terms"}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"551770"}, end: {id:"5537889"}, properties:{sequence_index:17}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5537889"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5537889"}, end: {id:"9805063945"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5537889"}, end: {id:"1935543849"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5619063",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:"Lorentz factor definition"}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"551770"}, end: {id:"5619063"}, properties:{sequence_index:30}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5619063"}, end: {id:"111341"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5619063"}, end: {id:"1528310784"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5637413",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"551770"}, end: {id:"5637413"}, properties:{sequence_index:13}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5637413"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5637413"}, end: {id:"1201689765"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5708661",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"551770"}, end: {id:"5708661"}, properties:{sequence_index:5}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5708661"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5708661"}, end: {id:"2096918413"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5708661"}, end: {id:"7741202861"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5796383",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"551770"}, end: {id:"5796383"}, properties:{sequence_index:14}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5796383"}, end: {id:"111104"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5796383"}, end: {id:"7057864873"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"6150706",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:"solve output expr for t'"}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"551770"}, end: {id:"6150706"}, properties:{sequence_index:3}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"6150706"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"6150706"}, end: {id:"4662369843"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6150706"}, end: {id:"2983053062"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6150706"}, end: {id:"3426941928"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"6431475",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"551770"}, end: {id:"6431475"}, properties:{sequence_index:9}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"6431475"}, end: {id:"111975"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"6431475"}, end: {id:"9409776983"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6431475"}, end: {id:"2226340358"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6431475"}, end: {id:"1974334644"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"7160101",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:"grouped by terms for x^2, xt, and t^2"}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"551770"}, end: {id:"7160101"}, properties:{sequence_index:18}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"7160101"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"7160101"}, end: {id:"1935543849"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7160101"}, end: {id:"1586866563"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"7599260",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"551770"}, end: {id:"7599260"}, properties:{sequence_index:27}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"7599260"}, end: {id:"111613"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"7599260"}, end: {id:"2542420160"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7599260"}, end: {id:"7743841045"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7599260"}, end: {id:"7513513483"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"7832193",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:"based on the comparison of the (x t) terms"}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"551770"}, end: {id:"7832193"}, properties:{sequence_index:21}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"7832193"}, end: {id:"111768"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"7832193"}, end: {id:"4287102261"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7832193"}, end: {id:"1586866563"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7832193"}, end: {id:"2076171250"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8057586",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"551770"}, end: {id:"8057586"}, properties:{sequence_index:16}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8057586"}, end: {id:"111797"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8057586"}, end: {id:"8515803375"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8057586"}, end: {id:"7057864873"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8057586"}, end: {id:"5148266645"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8057586"}, end: {id:"4662369843"}, properties:{sequence_index:"3"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8057586"}, end: {id:"1201689765"}, properties:{sequence_index:"4"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8057586"}, end: {id:"9805063945"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8199201",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"551770"}, end: {id:"8199201"}, properties:{sequence_index:8}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8199201"}, end: {id:"111530"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8199201"}, end: {id:"9031609275"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8199201"}, end: {id:"8014566709"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8199201"}, end: {id:"9409776983"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8488825",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"551770"}, end: {id:"8488825"}, properties:{sequence_index:26}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8488825"}, end: {id:"111282"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8488825"}, end: {id:"2999795755"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8488825"}, end: {id:"3412946408"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8488825"}, end: {id:"2542420160"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9486255",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"551770"}, end: {id:"9486255"}, properties:{sequence_index:28}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9486255"}, end: {id:"111975"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9486255"}, end: {id:"7513513483"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9486255"}, end: {id:"8571466509"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9486255"}, end: {id:"7906112355"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9520931",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"551770"}, end: {id:"9520931"}, properties:{sequence_index:7}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9520931"}, end: {id:"111613"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9520931"}, end: {id:"4139999399"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9520931"}, end: {id:"3495403335"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9520931"}, end: {id:"9031609275"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9869359",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:"equation 1-14 on page 21 in \cite{1999_Tipler_Llewellyn}"}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"551770"}, end: {id:"9869359"}, properties:{sequence_index:2}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9869359"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9869359"}, end: {id:"2983053062"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1346919",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"608598"}, end: {id:"1346919"}, properties:{sequence_index:11}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1346919"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1346919"}, end: {id:"8106885760"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1452028",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"608598"}, end: {id:"1452028"}, properties:{sequence_index:12}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1452028"}, end: {id:"111182"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1452028"}, end: {id:"8106885760"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1452028"}, end: {id:"8857931498"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1452028"}, end: {id:"5838268428"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2951905",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"608598"}, end: {id:"2951905"}, properties:{sequence_index:9}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2951905"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2951905"}, end: {id:"1556389363"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3423374",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"608598"}, end: {id:"3423374"}, properties:{sequence_index:7}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3423374"}, end: {id:"111634"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3423374"}, end: {id:"8688588981"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3423374"}, end: {id:"8090924099"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3423374"}, end: {id:"7837519722"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3709291",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"608598"}, end: {id:"3709291"}, properties:{sequence_index:19}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3709291"}, end: {id:"111773"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3709291"}, end: {id:"2897612567"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3709291"}, end: {id:"6259833695"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"3709291"}, end: {id:"7701249282"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4186156",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"608598"}, end: {id:"4186156"}, properties:{sequence_index:18}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4186156"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4186156"}, end: {id:"5646314683"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4186156"}, end: {id:"5789289057"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4186156"}, end: {id:"2897612567"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4663270",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"608598"}, end: {id:"4663270"}, properties:{sequence_index:20}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4663270"}, end: {id:"111341"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4663270"}, end: {id:"7701249282"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5023393",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"608598"}, end: {id:"5023393"}, properties:{sequence_index:13}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5023393"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5023393"}, end: {id:"4107032818"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5023393"}, end: {id:"1556389363"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5023393"}, end: {id:"3291685884"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5093643",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"608598"}, end: {id:"5093643"}, properties:{sequence_index:10}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5093643"}, end: {id:"111104"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5093643"}, end: {id:"4107032818"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5522705",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"608598"}, end: {id:"5522705"}, properties:{sequence_index:15}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5522705"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5522705"}, end: {id:"3935058307"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5522705"}, end: {id:"9640720571"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"6240791",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"608598"}, end: {id:"6240791"}, properties:{sequence_index:6}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"6240791"}, end: {id:"111182"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"6240791"}, end: {id:"8908736791"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6240791"}, end: {id:"2397692197"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6240791"}, end: {id:"8688588981"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"6342896",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"608598"}, end: {id:"6342896"}, properties:{sequence_index:2}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"6342896"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"6342896"}, end: {id:"9376481176"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"6394441",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"608598"}, end: {id:"6394441"}, properties:{sequence_index:5}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"6394441"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"6394441"}, end: {id:"8908736791"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"7117931",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"608598"}, end: {id:"7117931"}, properties:{sequence_index:4}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"7117931"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"7117931"}, end: {id:"9376481176"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7117931"}, end: {id:"6504442697"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7117931"}, end: {id:"8090924099"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"7232268",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"608598"}, end: {id:"7232268"}, properties:{sequence_index:1}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"7232268"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"7232268"}, end: {id:"4560648264"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"7588540",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"608598"}, end: {id:"7588540"}, properties:{sequence_index:14}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"7588540"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"7588540"}, end: {id:"3291685884"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7588540"}, end: {id:"9854442418"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7588540"}, end: {id:"3935058307"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8867459",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"608598"}, end: {id:"8867459"}, properties:{sequence_index:17}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8867459"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8867459"}, end: {id:"5646314683"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9057006",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"608598"}, end: {id:"9057006"}, properties:{sequence_index:8}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9057006"}, end: {id:"111782"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9057006"}, end: {id:"7837519722"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9057006"}, end: {id:"3685779219"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9057006"}, end: {id:"9854442418"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9182821",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"608598"}, end: {id:"9182821"}, properties:{sequence_index:3}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9182821"}, end: {id:"111782"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9182821"}, end: {id:"4560648264"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9182821"}, end: {id:"9674924517"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9182821"}, end: {id:"6504442697"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9573616",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"608598"}, end: {id:"9573616"}, properties:{sequence_index:16}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9573616"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9573616"}, end: {id:"5838268428"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9573616"}, end: {id:"9640720571"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9573616"}, end: {id:"5789289057"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1216158",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"670255"}, end: {id:"1216158"}, properties:{sequence_index:3}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1216158"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1216158"}, end: {id:"6831694380"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2315272",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:"what, when differentiated twice, yields a negative of itself? cosine"}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"670255"}, end: {id:"2315272"}, properties:{sequence_index:7}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2315272"}, end: {id:"111237"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2315272"}, end: {id:"8991236357"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2315272"}, end: {id:"5415824175"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3234596",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"670255"}, end: {id:"3234596"}, properties:{sequence_index:10}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3234596"}, end: {id:"111355"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3234596"}, end: {id:"5945893986"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3234596"}, end: {id:"8991236357"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3234596"}, end: {id:"1772973171"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4208810",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"670255"}, end: {id:"4208810"}, properties:{sequence_index:11}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4208810"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4208810"}, end: {id:"5415824175"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4208810"}, end: {id:"1772973171"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4208810"}, end: {id:"2148049269"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4482244",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"670255"}, end: {id:"4482244"}, properties:{sequence_index:13}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4482244"}, end: {id:"111524"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4482244"}, end: {id:"1931103031"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4482244"}, end: {id:"1784114349"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4482244"}, end: {id:"1888494137"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4514656",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"670255"}, end: {id:"4514656"}, properties:{sequence_index:1}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4514656"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4514656"}, end: {id:"5345738321"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4790069",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"670255"}, end: {id:"4790069"}, properties:{sequence_index:2}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4790069"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4790069"}, end: {id:"4428528271"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5272817",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"670255"}, end: {id:"5272817"}, properties:{sequence_index:6}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5272817"}, end: {id:"111355"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5272817"}, end: {id:"8655294002"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5272817"}, end: {id:"6831694380"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5272817"}, end: {id:"8991236357"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5376872",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"670255"}, end: {id:"5376872"}, properties:{sequence_index:4}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5376872"}, end: {id:"111355"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5376872"}, end: {id:"5345738321"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5376872"}, end: {id:"4428528271"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5376872"}, end: {id:"2334518266"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5391046",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"670255"}, end: {id:"5391046"}, properties:{sequence_index:12}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5391046"}, end: {id:"111182"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5391046"}, end: {id:"2148049269"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5391046"}, end: {id:"7473576008"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5391046"}, end: {id:"1931103031"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5435505",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"670255"}, end: {id:"5435505"}, properties:{sequence_index:9}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5435505"}, end: {id:"111649"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5435505"}, end: {id:"7652131521"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5435505"}, end: {id:"1451839362"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5435505"}, end: {id:"5945893986"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"6129880",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"670255"}, end: {id:"6129880"}, properties:{sequence_index:5}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"6129880"}, end: {id:"111975"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"6129880"}, end: {id:"2334518266"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6129880"}, end: {id:"3634715785"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6129880"}, end: {id:"8655294002"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8476862",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"670255"}, end: {id:"8476862"}, properties:{sequence_index:8}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8476862"}, end: {id:"111649"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8476862"}, end: {id:"5415824175"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8476862"}, end: {id:"5846177002"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8476862"}, end: {id:"7652131521"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8522636",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"670255"}, end: {id:"8522636"}, properties:{sequence_index:14}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8522636"}, end: {id:"111634"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8522636"}, end: {id:"1784114349"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8522636"}, end: {id:"5415824175"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8522636"}, end: {id:"6908055431"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8719992",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"670255"}, end: {id:"8719992"}, properties:{sequence_index:15}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8719992"}, end: {id:"111341"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8719992"}, end: {id:"6908055431"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1391174",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"681943"}, end: {id:"1391174"}, properties:{sequence_index:1}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1391174"}, end: {id:"111984"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1391174"}, end: {id:"4087145886"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1391174"}, end: {id:"2867848403"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1391174"}, end: {id:"1323602089"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1391174"}, end: {id:"7191277455"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1391174"}, end: {id:"5258419993"}, properties:{sequence_index:"3"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1391174"}, end: {id:"4128500715"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1468462",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"681943"}, end: {id:"1468462"}, properties:{sequence_index:10}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1468462"}, end: {id:"111341"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1468462"}, end: {id:"1457415749"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3724854",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:"current flows through both resistors"}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"681943"}, end: {id:"3724854"}, properties:{sequence_index:5}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3724854"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3724854"}, end: {id:"6753224061"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4777295",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"681943"}, end: {id:"4777295"}, properties:{sequence_index:7}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4777295"}, end: {id:"111975"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4777295"}, end: {id:"2271186630"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4777295"}, end: {id:"6546594355"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4777295"}, end: {id:"2809345867"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5478696",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"681943"}, end: {id:"5478696"}, properties:{sequence_index:9}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5478696"}, end: {id:"111975"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5478696"}, end: {id:"4866160902"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5478696"}, end: {id:"3433441359"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5478696"}, end: {id:"1457415749"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5878391",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"681943"}, end: {id:"5878391"}, properties:{sequence_index:8}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5878391"}, end: {id:"111246"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5878391"}, end: {id:"2809345867"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5878391"}, end: {id:"2051901211"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5878391"}, end: {id:"7002609475"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5878391"}, end: {id:"6753224061"}, properties:{sequence_index:"3"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5878391"}, end: {id:"4866160902"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"6114977",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"681943"}, end: {id:"6114977"}, properties:{sequence_index:4}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"6114977"}, end: {id:"111975"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"6114977"}, end: {id:"4128500715"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6114977"}, end: {id:"5181421075"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6114977"}, end: {id:"2051901211"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"7576732",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"681943"}, end: {id:"7576732"}, properties:{sequence_index:6}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"7576732"}, end: {id:"111984"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"7576732"}, end: {id:"4087145886"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7576732"}, end: {id:"9053099840"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7576732"}, end: {id:"7798615279"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7576732"}, end: {id:"1100332145"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7576732"}, end: {id:"7410124465"}, properties:{sequence_index:"3"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7576732"}, end: {id:"2271186630"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8121398",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"681943"}, end: {id:"8121398"}, properties:{sequence_index:2}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8121398"}, end: {id:"111984"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8121398"}, end: {id:"4087145886"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8121398"}, end: {id:"5585739998"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8121398"}, end: {id:"5463275819"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8121398"}, end: {id:"1377431959"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8121398"}, end: {id:"9746066299"}, properties:{sequence_index:"3"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8121398"}, end: {id:"9243879541"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8616052",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"681943"}, end: {id:"8616052"}, properties:{sequence_index:3}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8616052"}, end: {id:"111975"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8616052"}, end: {id:"9243879541"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8616052"}, end: {id:"3031116098"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8616052"}, end: {id:"7002609475"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1207155",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"713234"}, end: {id:"1207155"}, properties:{sequence_index:11}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1207155"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1207155"}, end: {id:"2103023049"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1756608",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"713234"}, end: {id:"1756608"}, properties:{sequence_index:26}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1756608"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1756608"}, end: {id:"1128605625"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1756608"}, end: {id:"4830221561"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1879109",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"713234"}, end: {id:"1879109"}, properties:{sequence_index:25}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1879109"}, end: {id:"111980"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1879109"}, end: {id:"3868998312"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1879109"}, end: {id:"2121790783"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1879109"}, end: {id:"1128605625"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2347440",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"713234"}, end: {id:"2347440"}, properties:{sequence_index:15}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2347440"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2347440"}, end: {id:"4585932229"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2584092",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"713234"}, end: {id:"2584092"}, properties:{sequence_index:19}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2584092"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2584092"}, end: {id:"6404535647"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2584092"}, end: {id:"7731226616"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2584092"}, end: {id:"4166155526"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2595607",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"713234"}, end: {id:"2595607"}, properties:{sequence_index:21}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2595607"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2595607"}, end: {id:"1038566242"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2595607"}, end: {id:"4872163189"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2595607"}, end: {id:"2902772962"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2606241",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"713234"}, end: {id:"2606241"}, properties:{sequence_index:27}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2606241"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2606241"}, end: {id:"4830221561"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2606241"}, end: {id:"5866629429"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2831850",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"713234"}, end: {id:"2831850"}, properties:{sequence_index:2}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2831850"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2831850"}, end: {id:"1038566242"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2845819",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"713234"}, end: {id:"2845819"}, properties:{sequence_index:12}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2845819"}, end: {id:"111886"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2845819"}, end: {id:"2103023049"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2845819"}, end: {id:"6976493023"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2845819"}, end: {id:"7159989263"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2845819"}, end: {id:"4878728014"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3159546",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"713234"}, end: {id:"3159546"}, properties:{sequence_index:24}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3159546"}, end: {id:"111253"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3159546"}, end: {id:"4166155526"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3159546"}, end: {id:"4166155526"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3159546"}, end: {id:"3868998312"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3428690",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"713234"}, end: {id:"3428690"}, properties:{sequence_index:28}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3428690"}, end: {id:"111341"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3428690"}, end: {id:"5866629429"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3636266",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"713234"}, end: {id:"3636266"}, properties:{sequence_index:14}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3636266"}, end: {id:"111182"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3636266"}, end: {id:"5323719091"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3636266"}, end: {id:"9885190237"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"3636266"}, end: {id:"1038566242"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3877159",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"713234"}, end: {id:"3877159"}, properties:{sequence_index:7}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3877159"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3877159"}, end: {id:"2762326680"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3877159"}, end: {id:"9413609246"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3919490",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"713234"}, end: {id:"3919490"}, properties:{sequence_index:3}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3919490"}, end: {id:"111253"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3919490"}, end: {id:"1038566242"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3919490"}, end: {id:"1038566242"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3919490"}, end: {id:"6031385191"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4596442",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"713234"}, end: {id:"4596442"}, properties:{sequence_index:16}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4596442"}, end: {id:"111886"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4596442"}, end: {id:"4585932229"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4596442"}, end: {id:"7453225570"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4596442"}, end: {id:"1716984328"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4596442"}, end: {id:"8651044341"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4598639",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"713234"}, end: {id:"4598639"}, properties:{sequence_index:8}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4598639"}, end: {id:"111341"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4598639"}, end: {id:"9413609246"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5415197",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"713234"}, end: {id:"5415197"}, properties:{sequence_index:10}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5415197"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5415197"}, end: {id:"8418527415"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5521272",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"713234"}, end: {id:"5521272"}, properties:{sequence_index:22}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5521272"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5521272"}, end: {id:"6404535647"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5521272"}, end: {id:"2902772962"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5521272"}, end: {id:"5349669879"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5783204",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"713234"}, end: {id:"5783204"}, properties:{sequence_index:13}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5783204"}, end: {id:"111355"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5783204"}, end: {id:"4878728014"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5783204"}, end: {id:"8418527415"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5783204"}, end: {id:"5323719091"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"6213336",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"713234"}, end: {id:"6213336"}, properties:{sequence_index:20}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"6213336"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"6213336"}, end: {id:"4872163189"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"6389859",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"713234"}, end: {id:"6389859"}, properties:{sequence_index:17}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"6389859"}, end: {id:"111355"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"6389859"}, end: {id:"8747785338"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6389859"}, end: {id:"8651044341"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6389859"}, end: {id:"6404535647"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"6625389",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"713234"}, end: {id:"6625389"}, properties:{sequence_index:18}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"6625389"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"6625389"}, end: {id:"7731226616"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8230503",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"713234"}, end: {id:"8230503"}, properties:{sequence_index:23}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8230503"}, end: {id:"111253"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8230503"}, end: {id:"5349669879"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8230503"}, end: {id:"5349669879"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8230503"}, end: {id:"2121790783"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8480572",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"713234"}, end: {id:"8480572"}, properties:{sequence_index:6}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8480572"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8480572"}, end: {id:"8563535636"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8480572"}, end: {id:"2762326680"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9173195",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"713234"}, end: {id:"9173195"}, properties:{sequence_index:9}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9173195"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9173195"}, end: {id:"8747785338"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9643987",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"713234"}, end: {id:"9643987"}, properties:{sequence_index:5}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9643987"}, end: {id:"111222"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9643987"}, end: {id:"6031385191"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9643987"}, end: {id:"8532702080"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9643987"}, end: {id:"8563535636"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9722132",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"713234"}, end: {id:"9722132"}, properties:{sequence_index:4}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9722132"}, end: {id:"111253"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9722132"}, end: {id:"6404535647"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9722132"}, end: {id:"6404535647"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9722132"}, end: {id:"8532702080"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9934180",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"713234"}, end: {id:"9934180"}, properties:{sequence_index:1}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9934180"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9934180"}, end: {id:"6404535647"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1573241",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"764666"}, end: {id:"1573241"}, properties:{sequence_index:10}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1573241"}, end: {id:"111975"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1573241"}, end: {id:"3488423948"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1573241"}, end: {id:"1945487024"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1573241"}, end: {id:"5085809757"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2080556",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:"definition of equilibrium"}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"764666"}, end: {id:"2080556"}, properties:{sequence_index:11}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2080556"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2080556"}, end: {id:"7924063906"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2371653",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"764666"}, end: {id:"2371653"}, properties:{sequence_index:6}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2371653"}, end: {id:"111975"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2371653"}, end: {id:"3488423948"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2371653"}, end: {id:"8162179726"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2371653"}, end: {id:"9562264720"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2420735",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"764666"}, end: {id:"2420735"}, properties:{sequence_index:16}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2420735"}, end: {id:"111483"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2420735"}, end: {id:"2114909846"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2420735"}, end: {id:"7564010952"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2420735"}, end: {id:"8131665171"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2537687",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"764666"}, end: {id:"2537687"}, properties:{sequence_index:12}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2537687"}, end: {id:"111483"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2537687"}, end: {id:"7924063906"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2537687"}, end: {id:"5516739892"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2537687"}, end: {id:"6240546932"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3651783",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"764666"}, end: {id:"3651783"}, properties:{sequence_index:18}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3651783"}, end: {id:"111886"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3651783"}, end: {id:"7928111771"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3651783"}, end: {id:"6346902704"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"3651783"}, end: {id:"7630953440"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"3651783"}, end: {id:"7267424860"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4202402",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"764666"}, end: {id:"4202402"}, properties:{sequence_index:14}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4202402"}, end: {id:"111975"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4202402"}, end: {id:"7517073655"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4202402"}, end: {id:"5426418187"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4202402"}, end: {id:"6457999644"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4242980",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"764666"}, end: {id:"4242980"}, properties:{sequence_index:17}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4242980"}, end: {id:"111634"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4242980"}, end: {id:"8131665171"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4242980"}, end: {id:"6457999644"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4242980"}, end: {id:"7928111771"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4463019",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"764666"}, end: {id:"4463019"}, properties:{sequence_index:19}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4463019"}, end: {id:"111483"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4463019"}, end: {id:"7267424860"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4463019"}, end: {id:"3911081515"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4463019"}, end: {id:"4689334676"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4708398",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"764666"}, end: {id:"4708398"}, properties:{sequence_index:3}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4708398"}, end: {id:"111104"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4708398"}, end: {id:"6783009163"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5303332",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"764666"}, end: {id:"5303332"}, properties:{sequence_index:5}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5303332"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5303332"}, end: {id:"6955192897"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5303332"}, end: {id:"3507029294"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5303332"}, end: {id:"3488423948"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5941581",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"764666"}, end: {id:"5941581"}, properties:{sequence_index:15}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5941581"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5941581"}, end: {id:"2114909846"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"6500091",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"764666"}, end: {id:"6500091"}, properties:{sequence_index:4}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"6500091"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"6500091"}, end: {id:"3736177473"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6500091"}, end: {id:"6783009163"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6500091"}, end: {id:"3507029294"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"6549607",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"764666"}, end: {id:"6549607"}, properties:{sequence_index:2}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"6549607"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"6549607"}, end: {id:"6955192897"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"7080403",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"764666"}, end: {id:"7080403"}, properties:{sequence_index:20}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"7080403"}, end: {id:"111341"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"7080403"}, end: {id:"4689334676"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"7766035",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:"The concentration of all sites by summing the concentration of free sites [S] and occupied sites"}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"764666"}, end: {id:"7766035"}, properties:{sequence_index:7}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"7766035"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"7766035"}, end: {id:"3599953931"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"7979473",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"764666"}, end: {id:"7979473"}, properties:{sequence_index:8}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"7979473"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"7979473"}, end: {id:"9562264720"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7979473"}, end: {id:"3599953931"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7979473"}, end: {id:"4301729661"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8400219",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"764666"}, end: {id:"8400219"}, properties:{sequence_index:9}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8400219"}, end: {id:"111432"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8400219"}, end: {id:"4301729661"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8400219"}, end: {id:"1268845856"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8400219"}, end: {id:"2168306601"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8982754",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"764666"}, end: {id:"8982754"}, properties:{sequence_index:13}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8982754"}, end: {id:"111634"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8982754"}, end: {id:"6240546932"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8982754"}, end: {id:"2168306601"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8982754"}, end: {id:"7517073655"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9643014",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"764666"}, end: {id:"9643014"}, properties:{sequence_index:1}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9643014"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9643014"}, end: {id:"3736177473"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1401711",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"820976"}, end: {id:"1401711"}, properties:{sequence_index:8}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1401711"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1401711"}, end: {id:"3132131132"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1401711"}, end: {id:"3896798826"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1401711"}, end: {id:"9070394000"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1630245",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"820976"}, end: {id:"1630245"}, properties:{sequence_index:19}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1630245"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1630245"}, end: {id:"2217103163"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1630245"}, end: {id:"4188580242"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1630245"}, end: {id:"5658865948"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1709854",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"820976"}, end: {id:"1709854"}, properties:{sequence_index:7}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1709854"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1709854"}, end: {id:"3132131132"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1785558",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"820976"}, end: {id:"1785558"}, properties:{sequence_index:12}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1785558"}, end: {id:"111646"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1785558"}, end: {id:"9170048197"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1785558"}, end: {id:"8122039815"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1785558"}, end: {id:"1811867899"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1810306",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"820976"}, end: {id:"1810306"}, properties:{sequence_index:3}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1810306"}, end: {id:"111984"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1810306"}, end: {id:"4393258808"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1810306"}, end: {id:"8916428651"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1810306"}, end: {id:"1635147226"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1810306"}, end: {id:"9884115626"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1810306"}, end: {id:"1036530438"}, properties:{sequence_index:"3"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1810306"}, end: {id:"3649797559"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3184002",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"820976"}, end: {id:"3184002"}, properties:{sequence_index:11}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3184002"}, end: {id:"111483"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3184002"}, end: {id:"9152823411"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3184002"}, end: {id:"7445388869"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"3184002"}, end: {id:"9170048197"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3800497",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"820976"}, end: {id:"3800497"}, properties:{sequence_index:6}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3800497"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3800497"}, end: {id:"3649797559"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3800497"}, end: {id:"6829281943"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3800497"}, end: {id:"3896798826"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"6033269",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"820976"}, end: {id:"6033269"}, properties:{sequence_index:17}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"6033269"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"6033269"}, end: {id:"5128670694"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"6781365",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"820976"}, end: {id:"6781365"}, properties:{sequence_index:16}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"6781365"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"6781365"}, end: {id:"3781109867"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6781365"}, end: {id:"4188580242"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"6873690",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"820976"}, end: {id:"6873690"}, properties:{sequence_index:1}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"6873690"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"6873690"}, end: {id:"1292735067"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"7496236",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"820976"}, end: {id:"7496236"}, properties:{sequence_index:10}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"7496236"}, end: {id:"111182"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"7496236"}, end: {id:"9838128064"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7496236"}, end: {id:"5684907106"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7496236"}, end: {id:"9152823411"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"7602695",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:"period squared propto distance cubed"}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"820976"}, end: {id:"7602695"}, properties:{sequence_index:20}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"7602695"}, end: {id:"111341"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"7602695"}, end: {id:"5658865948"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"7749118",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"820976"}, end: {id:"7749118"}, properties:{sequence_index:15}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"7749118"}, end: {id:"111646"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"7749118"}, end: {id:"2906548078"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7749118"}, end: {id:"9524810853"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7749118"}, end: {id:"3781109867"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"7784926",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"820976"}, end: {id:"7784926"}, properties:{sequence_index:13}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"7784926"}, end: {id:"111104"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"7784926"}, end: {id:"5586102077"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"7947474",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"820976"}, end: {id:"7947474"}, properties:{sequence_index:5}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"7947474"}, end: {id:"111634"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"7947474"}, end: {id:"3176662571"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7947474"}, end: {id:"1292735067"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7947474"}, end: {id:"6829281943"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8457537",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"820976"}, end: {id:"8457537"}, properties:{sequence_index:18}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8457537"}, end: {id:"111975"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8457537"}, end: {id:"5128670694"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8457537"}, end: {id:"8044416349"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8457537"}, end: {id:"2217103163"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9076010",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"820976"}, end: {id:"9076010"}, properties:{sequence_index:4}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9076010"}, end: {id:"111104"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9076010"}, end: {id:"3176662571"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9471787",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"820976"}, end: {id:"9471787"}, properties:{sequence_index:9}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9471787"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9471787"}, end: {id:"9070394000"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9471787"}, end: {id:"9838128064"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9781109",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"820976"}, end: {id:"9781109"}, properties:{sequence_index:14}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9781109"}, end: {id:"111634"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9781109"}, end: {id:"5586102077"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9781109"}, end: {id:"1811867899"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9781109"}, end: {id:"2906548078"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9893296",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"820976"}, end: {id:"9893296"}, properties:{sequence_index:2}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9893296"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9893296"}, end: {id:"4393258808"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2169431",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"884319"}, end: {id:"2169431"}, properties:{sequence_index:3}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2169431"}, end: {id:"111975"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2169431"}, end: {id:"2131616531"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2169431"}, end: {id:"9565166889"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2169431"}, end: {id:"2113211456"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4718871",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"884319"}, end: {id:"4718871"}, properties:{sequence_index:2}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4718871"}, end: {id:"111182"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4718871"}, end: {id:"3131111133"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4718871"}, end: {id:"9040079362"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4718871"}, end: {id:"2131616531"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"6286448",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"884319"}, end: {id:"6286448"}, properties:{sequence_index:4}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"6286448"}, end: {id:"111341"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"6286448"}, end: {id:"2113211456"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"9278347",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"884319"}, end: {id:"9278347"}, properties:{sequence_index:1}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"9278347"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"9278347"}, end: {id:"3131111133"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1300532",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"909006"}, end: {id:"1300532"}, properties:{sequence_index:7}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1300532"}, end: {id:"111975"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1300532"}, end: {id:"2715678478"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1300532"}, end: {id:"7844317489"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1300532"}, end: {id:"7217021879"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1423642",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:"I is the same across both resistors"}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"909006"}, end: {id:"1423642"}, properties:{sequence_index:2}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1423642"}, end: {id:"111984"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1423642"}, end: {id:"4087145886"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1423642"}, end: {id:"2698469612"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1423642"}, end: {id:"9830343096"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1423642"}, end: {id:"7774819339"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1423642"}, end: {id:"9174439158"}, properties:{sequence_index:"3"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1423642"}, end: {id:"7675171493"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2221674",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"909006"}, end: {id:"2221674"}, properties:{sequence_index:3}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2221674"}, end: {id:"111984"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2221674"}, end: {id:"4087145886"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2221674"}, end: {id:"7497687256"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2221674"}, end: {id:"1608399874"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2221674"}, end: {id:"5890617067"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2221674"}, end: {id:"1484794622"}, properties:{sequence_index:"3"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2221674"}, end: {id:"6061695358"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2247327",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"909006"}, end: {id:"2247327"}, properties:{sequence_index:6}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2247327"}, end: {id:"111246"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2247327"}, end: {id:"4939880586"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2247327"}, end: {id:"7675171493"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2247327"}, end: {id:"6061695358"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2247327"}, end: {id:"9063568209"}, properties:{sequence_index:"3"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2247327"}, end: {id:"2715678478"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3650891",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"909006"}, end: {id:"3650891"}, properties:{sequence_index:1}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3650891"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3650891"}, end: {id:"4087145886"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"6550809",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"909006"}, end: {id:"6550809"}, properties:{sequence_index:5}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"6550809"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"6550809"}, end: {id:"4939880586"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"6614719",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"909006"}, end: {id:"6614719"}, properties:{sequence_index:8}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"6614719"}, end: {id:"111341"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"6614719"}, end: {id:"7217021879"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"7233885",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:"voltage is measured across both resistors"}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"909006"}, end: {id:"7233885"}, properties:{sequence_index:4}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"7233885"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"7233885"}, end: {id:"9063568209"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1975942",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"918264"}, end: {id:"1975942"}, properties:{sequence_index:4}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1975942"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1975942"}, end: {id:"3274926090"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1975942"}, end: {id:"1405465835"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1975942"}, end: {id:"7354529102"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2879756",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"918264"}, end: {id:"2879756"}, properties:{sequence_index:2}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2879756"}, end: {id:"111975"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2879756"}, end: {id:"9882526611"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2879756"}, end: {id:"6050070428"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2879756"}, end: {id:"3274926090"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3092929",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:"expression is a second order polynomial; projecticle motion is parabolic"}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"918264"}, end: {id:"3092929"}, properties:{sequence_index:5}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3092929"}, end: {id:"111341"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3092929"}, end: {id:"7354529102"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4439032",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"918264"}, end: {id:"4439032"}, properties:{sequence_index:1}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4439032"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4439032"}, end: {id:"9882526611"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"6487343",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"918264"}, end: {id:"6487343"}, properties:{sequence_index:3}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"6487343"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"6487343"}, end: {id:"1405465835"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"1136729",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"920011"}, end: {id:"1136729"}, properties:{sequence_index:8}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"1136729"}, end: {id:"111732"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"1136729"}, end: {id:"7676652285"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1136729"}, end: {id:"4928007622"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1136729"}, end: {id:"4811121942"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1136729"}, end: {id:"3360172339"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"2756830",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"920011"}, end: {id:"2756830"}, properties:{sequence_index:2}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"2756830"}, end: {id:"111408"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"2756830"}, end: {id:"1590774089"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2756830"}, end: {id:"5542528160"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"3538142",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"920011"}, end: {id:"3538142"}, properties:{sequence_index:7}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"3538142"}, end: {id:"111457"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"3538142"}, end: {id:"9413699705"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3538142"}, end: {id:"4811121942"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"4403236",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"920011"}, end: {id:"4403236"}, properties:{sequence_index:9}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"4403236"}, end: {id:"111341"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"4403236"}, end: {id:"3360172339"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"5622476",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"920011"}, end: {id:"5622476"}, properties:{sequence_index:3}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"5622476"}, end: {id:"111662"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"5622476"}, end: {id:"5542528160"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5622476"}, end: {id:"3512166162"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"6093238",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"920011"}, end: {id:"6093238"}, properties:{sequence_index:1}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"6093238"}, end: {id:"111981"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"6093238"}, end: {id:"1590774089"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"6287856",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"920011"}, end: {id:"6287856"}, properties:{sequence_index:4}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"6287856"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"6287856"}, end: {id:"3512166162"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6287856"}, end: {id:"5345738321"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6287856"}, end: {id:"8953094349"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"6311864",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"920011"}, end: {id:"6311864"}, properties:{sequence_index:5}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"6311864"}, end: {id:"111236"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"6311864"}, end: {id:"5611024898"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6311864"}, end: {id:"9623791270"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6311864"}, end: {id:"8111389082"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6311864"}, end: {id:"3652511721"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6311864"}, end: {id:"6701855578"}, properties:{sequence_index:"3"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6311864"}, end: {id:"5398681502"}, properties:{sequence_index:"4"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6311864"}, end: {id:"3183197515"}, properties:{sequence_index:"5"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6311864"}, end: {id:"3253234559"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
UNWIND [{id:"8305798",
         properties:{note_after_step_latex:"",
                     author_name_latex:"ben",
                     note_before_step_latex:""}}] AS row
CREATE (n:step{id: row.id}) SET n += row.properties;
UNWIND [{start: {id:"920011"}, end: {id:"8305798"}, properties:{sequence_index:6}}] AS row
MATCH (start:derivation{id: row.start.id})
MATCH (end:step{id: row.end.id})
CREATE (start)-[r:HAS_STEP]->(end) SET r += row.properties;
UNWIND [{start: {id:"8305798"}, end: {id:"111556"}, properties:{}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:inference_rule{id: row.end.id})
CREATE (start)-[r:HAS_INFERENCE_RULE]->(end) SET r += row.properties;
UNWIND [{start: {id:"8305798"}, end: {id:"3253234559"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8305798"}, end: {id:"8953094349"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8305798"}, end: {id:"9413699705"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
