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
UNWIND [{start: {id:"1029890"}, end: {id:"3784785"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1029890"}, end: {id:"6656532"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1029890"}, end: {id:"9587572"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1848471"}, end: {id:"8883737"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1848471"}, end: {id:"4264724"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1848471"}, end: {id:"9984877"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2741906"}, end: {id:"9038289"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2741906"}, end: {id:"3954314"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2741906"}, end: {id:"1111289"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4614728"}, end: {id:"1838300"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4614728"}, end: {id:"7563791"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4614728"}, end: {id:"2948271"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"6462728"}, end: {id:"9984877"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6462728"}, end: {id:"6563727"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6462728"}, end: {id:"3747585"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"6463728"}, end: {id:"1029383"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6463728"}, end: {id:"7636749"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6463728"}, end: {id:"1838300"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"6466378"}, end: {id:"1111289"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6466378"}, end: {id:"9877781"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6466378"}, end: {id:"8883737"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"7364656"}, end: {id:"1029383"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"7466748"}, end: {id:"1029383"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7466748"}, end: {id:"2948271"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7466748"}, end: {id:"9038289"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"7561612"}, end: {id:"8888888"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"7563728"}, end: {id:"3747585"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7563728"}, end: {id:"3784785"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"7566272"}, end: {id:"9587572"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7566272"}, end: {id:"1029383"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7566272"}, end: {id:"8888888"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1383414"}, end: {id:"1231131"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3040493"}, end: {id:"9385720"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3841414"}, end: {id:"7472666"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3841414"}, end: {id:"3838111"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"3841414"}, end: {id:"1231131"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3984721"}, end: {id:"4890284"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3984721"}, end: {id:"2936550"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5832058"}, end: {id:"3333333"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5832058"}, end: {id:"4444444"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"6839583"}, end: {id:"8888888"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6839583"}, end: {id:"4089571"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6839583"}, end: {id:"4582412"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6839583"}, end: {id:"9999999"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"7563628"}, end: {id:"9481000"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7563628"}, end: {id:"6466214"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7563628"}, end: {id:"7472641"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"7566277"}, end: {id:"1029911"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7566277"}, end: {id:"8842811"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7566277"}, end: {id:"7472666"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"7572728"}, end: {id:"7472641"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7572728"}, end: {id:"7471778"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7572728"}, end: {id:"1029911"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"7663728"}, end: {id:"8888888"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8374590"}, end: {id:"2222222"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8374590"}, end: {id:"5828294"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8374625"}, end: {id:"5828294"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8374625"}, end: {id:"7894942"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8374625"}, end: {id:"4890284"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8492847"}, end: {id:"8888888"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8492847"}, end: {id:"8888888"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8492847"}, end: {id:"3333333"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"9483240"}, end: {id:"2936550"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9483240"}, end: {id:"9123670"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9483240"}, end: {id:"9481000"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"9582956"}, end: {id:"4444444"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9582956"}, end: {id:"9999999"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9582956"}, end: {id:"2222222"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"9832430"}, end: {id:"9385720"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9832430"}, end: {id:"1111111"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9832430"}, end: {id:"9123670"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1928392"}, end: {id:"2939484"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1928392"}, end: {id:"4829194"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1928392"}, end: {id:"4383592"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2384942"}, end: {id:"4849888"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2384942"}, end: {id:"4849959"}, properties:{sequence_index:"1"}}] AS row
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
UNWIND [{start: {id:"2849492"}, end: {id:"4825483"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2849492"}, end: {id:"1921933"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2849492"}, end: {id:"1133483"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2939404"}, end: {id:"8888888"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2939404"}, end: {id:"3194924"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2939404"}, end: {id:"4825483"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2949492"}, end: {id:"4383592"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2949492"}, end: {id:"4849888"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3848592"}, end: {id:"8888888"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3848592"}, end: {id:"8888883"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3848592"}, end: {id:"2939484"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3848924"}, end: {id:"8888883"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3848924"}, end: {id:"3747849"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"3848924"}, end: {id:"3194924"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3848927"}, end: {id:"8888888"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3848927"}, end: {id:"2393922"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"3848927"}, end: {id:"3949052"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"3848927"}, end: {id:"8888881"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4294921"}, end: {id:"1133483"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4294921"}, end: {id:"4849959"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4747288"}, end: {id:"8888882"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4747288"}, end: {id:"3919391"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4747288"}, end: {id:"3981813"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4747288"}, end: {id:"2919191"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4747288"}, end: {id:"8888883"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"7473895"}, end: {id:"8888888"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"9595949"}, end: {id:"8888881"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9595949"}, end: {id:"4849392"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9595949"}, end: {id:"1030901"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9595949"}, end: {id:"3413423"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9595949"}, end: {id:"8888882"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1010301"}, end: {id:"1199299"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1010301"}, end: {id:"5626421"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1010301"}, end: {id:"4642245"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1939442"}, end: {id:"2392932"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1939442"}, end: {id:"4642245"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1939442"}, end: {id:"2962831"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2932848"}, end: {id:"4757562"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2932849"}, end: {id:"1199299"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2932850"}, end: {id:"4857731"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3737384"}, end: {id:"3738373"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3737384"}, end: {id:"2962831"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3737384"}, end: {id:"4758592"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3837471"}, end: {id:"3984852"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3948573"}, end: {id:"1939485"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3948584"}, end: {id:"4758592"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4224853"}, end: {id:"4757562"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4224853"}, end: {id:"2392932"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4655746"}, end: {id:"1939485"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4655746"}, end: {id:"2837471"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4655746"}, end: {id:"3738373"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5656372"}, end: {id:"4857731"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5656372"}, end: {id:"3984852"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5656372"}, end: {id:"2837471"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1393411"}, end: {id:"3948472"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1393411"}, end: {id:"2109231"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2339482"}, end: {id:"1939485"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2339482"}, end: {id:"9485482"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2930454"}, end: {id:"2934842"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2930454"}, end: {id:"2941319"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2930454"}, end: {id:"3949292"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3838233"}, end: {id:"3844221"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3838233"}, end: {id:"3948472"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3848292"}, end: {id:"3949292"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3848292"}, end: {id:"3844221"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3948552"}, end: {id:"9485482"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3948552"}, end: {id:"2941319"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3948572"}, end: {id:"1939485"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3949211"}, end: {id:"2109231"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4295822"}, end: {id:"2934842"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1039774"}, end: {id:"4948325"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1039774"}, end: {id:"2948487"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1203100"}, end: {id:"2100421"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1203100"}, end: {id:"4499582"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1203100"}, end: {id:"1291313"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1204921"}, end: {id:"2934848"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1204929"}, end: {id:"1039948"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1204945"}, end: {id:"1203491"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1204945"}, end: {id:"1039485"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1204945"}, end: {id:"2901049"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1294844"}, end: {id:"2949002"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1294945"}, end: {id:"2939402"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1294945"}, end: {id:"3499522"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1294945"}, end: {id:"2949821"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1341141"}, end: {id:"1291313"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1341141"}, end: {id:"1305534"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1347587"}, end: {id:"1305534"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1347587"}, end: {id:"6544644"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1347587"}, end: {id:"2364546"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1395335"}, end: {id:"1353583"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1923945"}, end: {id:"3940505"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2030624"}, end: {id:"1039013"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2030624"}, end: {id:"1304952"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2030624"}, end: {id:"4948325"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2322434"}, end: {id:"1353583"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2322434"}, end: {id:"2342425"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2322434"}, end: {id:"2326309"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2394495"}, end: {id:"4938589"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2394495"}, end: {id:"1495034"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2422434"}, end: {id:"1039948"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2422434"}, end: {id:"2239424"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2422434"}, end: {id:"1432042"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2449858"}, end: {id:"1432042"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2449858"}, end: {id:"2326309"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2449858"}, end: {id:"3576787"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2454535"}, end: {id:"1305534"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2454535"}, end: {id:"5577584"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2455452"}, end: {id:"2344324"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2464445"}, end: {id:"2364546"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2464445"}, end: {id:"1305534"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2464445"}, end: {id:"5345567"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2900428"}, end: {id:"2934848"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2900428"}, end: {id:"1209482"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2900428"}, end: {id:"1039485"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2919311"}, end: {id:"9214650"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2930492"}, end: {id:"2949002"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2930492"}, end: {id:"2949821"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2930492"}, end: {id:"3741728"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2938341"}, end: {id:"3940505"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2938341"}, end: {id:"2948487"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2938341"}, end: {id:"2100421"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2939400"}, end: {id:"2901049"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2939400"}, end: {id:"2949002"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2939400"}, end: {id:"1039013"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2954835"}, end: {id:"2344324"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2954835"}, end: {id:"1304924"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2954835"}, end: {id:"2456546"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3294932"}, end: {id:"5535257"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3294932"}, end: {id:"4938589"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3454353"}, end: {id:"3576787"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3454353"}, end: {id:"5345567"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3454353"}, end: {id:"2495835"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3919384"}, end: {id:"3741728"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3919384"}, end: {id:"3949921"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"3919384"}, end: {id:"4499582"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3934948"}, end: {id:"3499522"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3949482"}, end: {id:"9214650"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3949482"}, end: {id:"2940021"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"3949482"}, end: {id:"2939402"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4059592"}, end: {id:"5535257"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4059592"}, end: {id:"1495034"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4059592"}, end: {id:"1049553"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4305953"}, end: {id:"1049553"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4305953"}, end: {id:"4959593"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4358635"}, end: {id:"2495835"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4358635"}, end: {id:"2436656"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4358635"}, end: {id:"3429538"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4939459"}, end: {id:"4959593"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4939459"}, end: {id:"5938585"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4939459"}, end: {id:"4349493"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5354635"}, end: {id:"3454565"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5354635"}, end: {id:"1305534"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5354635"}, end: {id:"5535257"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5858694"}, end: {id:"5577584"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5858694"}, end: {id:"3454565"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"6756574"}, end: {id:"2456546"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"9394834"}, end: {id:"3429538"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9394834"}, end: {id:"4349493"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9394834"}, end: {id:"1304924"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"9394842"}, end: {id:"1203491"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1002928"}, end: {id:"3994928"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1002928"}, end: {id:"3839493"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1002928"}, end: {id:"1029393"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2319391"}, end: {id:"1029393"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2319391"}, end: {id:"3232241"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2319391"}, end: {id:"2939392"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3568093"}, end: {id:"9393848"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4585829"}, end: {id:"4758592"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4585829"}, end: {id:"3994928"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4858282"}, end: {id:"9393848"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4858282"}, end: {id:"4758592"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4858282"}, end: {id:"3839493"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4955966"}, end: {id:"2939392"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4955966"}, end: {id:"3232242"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4955966"}, end: {id:"4958573"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4958883"}, end: {id:"9495903"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4958883"}, end: {id:"3949492"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5495827"}, end: {id:"3949492"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5839535"}, end: {id:"4958573"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5839535"}, end: {id:"4949582"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5839535"}, end: {id:"9495903"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"7419980"}, end: {id:"4758592"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8485758"}, end: {id:"4949582"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2303943"}, end: {id:"3293094"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2939482"}, end: {id:"8482459"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2939482"}, end: {id:"3294004"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2939482"}, end: {id:"3993940"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3049480"}, end: {id:"3294004"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3832748"}, end: {id:"8374556"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3832748"}, end: {id:"3293094"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3832748"}, end: {id:"8394853"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"6822583"}, end: {id:"8482459"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6822583"}, end: {id:"5749291"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6822583"}, end: {id:"8341200"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8332941"}, end: {id:"9214650"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8345721"}, end: {id:"2934848"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8946983"}, end: {id:"3993940"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8946983"}, end: {id:"8394853"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8946983"}, end: {id:"2934848"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"9103516"}, end: {id:"8482459"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"9483715"}, end: {id:"8341200"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9483715"}, end: {id:"8837284"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9483715"}, end: {id:"9380032"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"9483843"}, end: {id:"9380032"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9483843"}, end: {id:"9214650"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9483843"}, end: {id:"8374556"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2839422"}, end: {id:"3848329"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4842942"}, end: {id:"3494854"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4842942"}, end: {id:"9492929"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4842942"}, end: {id:"2938188"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4848592"}, end: {id:"2938188"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4848592"}, end: {id:"2938190"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4952082"}, end: {id:"3494854"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8483953"}, end: {id:"2938190"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8483953"}, end: {id:"3848329"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1003049"}, end: {id:"1231131"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1003049"}, end: {id:"9484724"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1003049"}, end: {id:"4934845"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1003049"}, end: {id:"0100404"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1293948"}, end: {id:"1029384"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1293948"}, end: {id:"9394857"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1293948"}, end: {id:"9394858"}, properties:{sequence_index:"1"}}] AS row
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
UNWIND [{start: {id:"1384011"}, end: {id:"7572748"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1384011"}, end: {id:"7572118"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1384935"}, end: {id:"9394857"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1384935"}, end: {id:"3452131"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1384935"}, end: {id:"8474766"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1911919"}, end: {id:"0021030"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1911919"}, end: {id:"2929944"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1911919"}, end: {id:"4948585"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1911919"}, end: {id:"9339495"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2029394"}, end: {id:"2838288"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2029394"}, end: {id:"8474762"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3048100"}, end: {id:"0021030"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3048800"}, end: {id:"3992939"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3329831"}, end: {id:"9339495"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3329831"}, end: {id:"0203020"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3329831"}, end: {id:"8584733"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3847567"}, end: {id:"9394858"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3847567"}, end: {id:"3452131"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3847567"}, end: {id:"8474765"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3949284"}, end: {id:"0495054"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3949284"}, end: {id:"0203020"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4434559"}, end: {id:"7575626"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4455453"}, end: {id:"3452131"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4455453"}, end: {id:"0595847"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4455453"}, end: {id:"0495950"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4485722"}, end: {id:"3992939"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4485722"}, end: {id:"9485858"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4485722"}, end: {id:"4831494"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4485722"}, end: {id:"4948377"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4757567"}, end: {id:"7575626"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4757567"}, end: {id:"5577567"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4757743"}, end: {id:"7572748"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4757743"}, end: {id:"7572118"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4757743"}, end: {id:"2838288"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4948339"}, end: {id:"3452132"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4948339"}, end: {id:"0495950"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4948339"}, end: {id:"8478550"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5751725"}, end: {id:"3452131"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5751725"}, end: {id:"9587738"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5751725"}, end: {id:"3452132"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5859994"}, end: {id:"9493949"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5859994"}, end: {id:"9485857"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5859994"}, end: {id:"1029384"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5940300"}, end: {id:"9485800"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5940300"}, end: {id:"0040490"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5940300"}, end: {id:"0495054"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"7374289"}, end: {id:"1214762"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"7455643"}, end: {id:"5577567"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7455643"}, end: {id:"9458842"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7455643"}, end: {id:"0595847"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"7474753"}, end: {id:"8474765"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8373472"}, end: {id:"0405049"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8373472"}, end: {id:"9493949"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8485725"}, end: {id:"1231131"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8485747"}, end: {id:"4948377"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8485747"}, end: {id:"8584733"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8485747"}, end: {id:"0405049"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8571277"}, end: {id:"8577781"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8571277"}, end: {id:"7572118"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8571277"}, end: {id:"7547581"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8572265"}, end: {id:"7572859"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8572265"}, end: {id:"7572118"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8572265"}, end: {id:"7562671"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8572771"}, end: {id:"7572748"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8572771"}, end: {id:"8577781"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8572778"}, end: {id:"7572748"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8572778"}, end: {id:"8585727"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8575627"}, end: {id:"8577672"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8575627"}, end: {id:"8577711"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8575627"}, end: {id:"9847600"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8575717"}, end: {id:"8577711"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8575761"}, end: {id:"9495882"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8575761"}, end: {id:"7562671"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8575761"}, end: {id:"3452131"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8576571"}, end: {id:"7547581"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8576571"}, end: {id:"7572859"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8576627"}, end: {id:"7572748"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8576741"}, end: {id:"0100404"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8576741"}, end: {id:"8478550"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8576741"}, end: {id:"9485800"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"9114413"}, end: {id:"9847600"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9114413"}, end: {id:"1334112"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9114413"}, end: {id:"9495882"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"9394948"}, end: {id:"8474762"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9394948"}, end: {id:"1214762"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"9686782"}, end: {id:"8585727"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9686782"}, end: {id:"7562671"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9686782"}, end: {id:"8577672"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2200910"}, end: {id:"6608123"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2200910"}, end: {id:"2838490"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2200910"}, end: {id:"4433112"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2200911"}, end: {id:"6608102"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2200911"}, end: {id:"2449291"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2200911"}, end: {id:"2657355"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2211910"}, end: {id:"2657355"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2211910"}, end: {id:"8811221"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2211911"}, end: {id:"4433112"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2211911"}, end: {id:"8761200"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2500423"}, end: {id:"1212129"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2500423"}, end: {id:"4307451"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2500423"}, end: {id:"1120000"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5829110"}, end: {id:"7777621"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5829110"}, end: {id:"6644853"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5829110"}, end: {id:"1212129"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"7487443"}, end: {id:"2985412"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7487443"}, end: {id:"6608123"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7487443"}, end: {id:"6608102"}, properties:{sequence_index:"1"}}] AS row
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
UNWIND [{start: {id:"7777777"}, end: {id:"1120000"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7777777"}, end: {id:"1734000"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7777777"}, end: {id:"2985412"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"7996484"}, end: {id:"1239010"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7996484"}, end: {id:"1734000"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8321038"}, end: {id:"9091270"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8321038"}, end: {id:"4858592"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8321038"}, end: {id:"0999900"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8321038"}, end: {id:"1239010"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8359402"}, end: {id:"8811221"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8359403"}, end: {id:"8761200"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8492932"}, end: {id:"8882098"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8492932"}, end: {id:"2424922"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8492932"}, end: {id:"7777621"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8494551"}, end: {id:"8882098"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8494552"}, end: {id:"9091270"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1294984"}, end: {id:"2484892"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2394942"}, end: {id:"2495954"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2394942"}, end: {id:"2390094"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2485909"}, end: {id:"2484892"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2485909"}, end: {id:"2390094"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2485909"}, end: {id:"2494040"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2490098"}, end: {id:"2494040"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2490098"}, end: {id:"3402919"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2490098"}, end: {id:"4930585"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2939493"}, end: {id:"4930585"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3403595"}, end: {id:"3402919"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"9538385"}, end: {id:"3402919"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9538385"}, end: {id:"2495954"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1301442"}, end: {id:"3849595"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1301442"}, end: {id:"4349300"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2304934"}, end: {id:"4940359"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2304934"}, end: {id:"2409402"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2384852"}, end: {id:"3494855"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2455366"}, end: {id:"3849595"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3848591"}, end: {id:"3849595"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3848591"}, end: {id:"4940359"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4838499"}, end: {id:"3495045"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4838499"}, end: {id:"5395034"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4838499"}, end: {id:"4939583"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4938400"}, end: {id:"4349300"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4938400"}, end: {id:"4934893"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"9878900"}, end: {id:"2409402"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9878900"}, end: {id:"4934893"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9878900"}, end: {id:"3495045"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"9888730"}, end: {id:"4939583"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9888730"}, end: {id:"3494855"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2004989"}, end: {id:"3493498"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2349059"}, end: {id:"3493498"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2349059"}, end: {id:"5049530"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2390498"}, end: {id:"5049530"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2390498"}, end: {id:"6757584"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3848494"}, end: {id:"6757584"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3848494"}, end: {id:"3294824"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4948384"}, end: {id:"3294824"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4948384"}, end: {id:"5949484"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4948955"}, end: {id:"5949484"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3445641"}, end: {id:"2840008"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3667395"}, end: {id:"2491904"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3667395"}, end: {id:"1209604"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3667395"}, end: {id:"5610925"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3871228"}, end: {id:"4068150"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3871228"}, end: {id:"4200334"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4733986"}, end: {id:"1209604"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4738354"}, end: {id:"4200334"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4738354"}, end: {id:"4200334"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4738354"}, end: {id:"4218805"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"7952658"}, end: {id:"5610925"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7952658"}, end: {id:"2338514"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7952658"}, end: {id:"4068150"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"7958085"}, end: {id:"2840008"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7958085"}, end: {id:"4978059"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7958085"}, end: {id:"2491904"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8668018"}, end: {id:"4978059"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1541045"}, end: {id:"6060683"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1541045"}, end: {id:"5011637"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1541045"}, end: {id:"6350246"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2750343"}, end: {id:"6229292"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2750343"}, end: {id:"1414263"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2750343"}, end: {id:"7647794"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5887774"}, end: {id:"6060683"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"6131891"}, end: {id:"5011637"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"6240603"}, end: {id:"6060683"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6240603"}, end: {id:"2597988"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6240603"}, end: {id:"7992949"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6240603"}, end: {id:"1414263"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"6790653"}, end: {id:"5714636"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6790653"}, end: {id:"6229292"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"7763037"}, end: {id:"7647794"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8636739"}, end: {id:"6350246"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8636739"}, end: {id:"8830175"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8636739"}, end: {id:"7867574"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"9916897"}, end: {id:"7867574"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9916897"}, end: {id:"5714636"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1530591"}, end: {id:"1148677"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1530591"}, end: {id:"8524301"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5103914"}, end: {id:"1580045"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5103914"}, end: {id:"9050111"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5103914"}, end: {id:"9850626"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5103914"}, end: {id:"1148677"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"6831079"}, end: {id:"1580045"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8465659"}, end: {id:"9610540"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8465659"}, end: {id:"2097240"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8465659"}, end: {id:"9472905"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8755752"}, end: {id:"8524301"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8755752"}, end: {id:"9610540"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"9932332"}, end: {id:"9472905"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1466499"}, end: {id:"6154610"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1466499"}, end: {id:"7539016"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1466499"}, end: {id:"9383749"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1560617"}, end: {id:"8696678"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1560617"}, end: {id:"3040361"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1560617"}, end: {id:"6246951"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1702334"}, end: {id:"6973462"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1702334"}, end: {id:"6733685"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1702334"}, end: {id:"4876963"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1882970"}, end: {id:"5300304"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1882970"}, end: {id:"6495233"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2343637"}, end: {id:"6495233"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2343637"}, end: {id:"8639236"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2343637"}, end: {id:"2075807"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2410249"}, end: {id:"6559987"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3258083"}, end: {id:"3484339"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3258083"}, end: {id:"6246951"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3258083"}, end: {id:"6733685"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4729245"}, end: {id:"9383749"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4729245"}, end: {id:"2692856"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4729245"}, end: {id:"9714818"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4803359"}, end: {id:"6559987"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4803359"}, end: {id:"7874068"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4803359"}, end: {id:"5938957"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4803359"}, end: {id:"3735003"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4803359"}, end: {id:"6377535"}, properties:{sequence_index:"3"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4803359"}, end: {id:"6632540"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4909770"}, end: {id:"9602854"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4909770"}, end: {id:"1633402"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4909770"}, end: {id:"3040361"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5181988"}, end: {id:"8844119"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5590554"}, end: {id:"8844119"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5590554"}, end: {id:"9398614"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5590554"}, end: {id:"2436173"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5590554"}, end: {id:"7874067"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5590554"}, end: {id:"1353291"}, properties:{sequence_index:"3"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5590554"}, end: {id:"7552472"}, properties:{sequence_index:"4"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5590554"}, end: {id:"6597230"}, properties:{sequence_index:"5"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5590554"}, end: {id:"5642407"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5826700"}, end: {id:"2443387"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5826700"}, end: {id:"1092386"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5826700"}, end: {id:"2692856"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5851086"}, end: {id:"4208138"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5851086"}, end: {id:"6632540"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5851086"}, end: {id:"9602854"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5867939"}, end: {id:"6973462"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5879978"}, end: {id:"1550851"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5879978"}, end: {id:"5117358"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5879978"}, end: {id:"7539016"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5969230"}, end: {id:"8497204"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5969230"}, end: {id:"7978426"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5969230"}, end: {id:"3017178"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5969230"}, end: {id:"7633243"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5969230"}, end: {id:"7396349"}, properties:{sequence_index:"3"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5969230"}, end: {id:"9081932"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"6718378"}, end: {id:"8447573"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"6719788"}, end: {id:"8497204"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6719788"}, end: {id:"7552471"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6719788"}, end: {id:"7956811"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6719788"}, end: {id:"7519917"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6719788"}, end: {id:"3171432"}, properties:{sequence_index:"3"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6719788"}, end: {id:"3988671"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"6886472"}, end: {id:"1298003"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6886472"}, end: {id:"5642407"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6886472"}, end: {id:"2443387"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"7014882"}, end: {id:"1781127"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"7067324"}, end: {id:"8447573"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7067324"}, end: {id:"4876963"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7067324"}, end: {id:"7034924"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"7085632"}, end: {id:"2776565"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"7113502"}, end: {id:"6559987"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7113502"}, end: {id:"6566357"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7113502"}, end: {id:"3381732"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7113502"}, end: {id:"1988214"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7113502"}, end: {id:"9120447"}, properties:{sequence_index:"3"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7113502"}, end: {id:"4208138"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"7171014"}, end: {id:"8497204"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"7184509"}, end: {id:"9081932"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7184509"}, end: {id:"3988671"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7184509"}, end: {id:"1550851"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"7511478"}, end: {id:"2075807"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7511478"}, end: {id:"3423567"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7511478"}, end: {id:"1781127"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"7835026"}, end: {id:"2776565"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7835026"}, end: {id:"4758524"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7835026"}, end: {id:"9746924"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7835026"}, end: {id:"3257704"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7835026"}, end: {id:"9704581"}, properties:{sequence_index:"3"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7835026"}, end: {id:"8696678"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"7965863"}, end: {id:"6154610"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8337849"}, end: {id:"3484339"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8346419"}, end: {id:"8844119"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8346419"}, end: {id:"8946473"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8346419"}, end: {id:"5080789"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8346419"}, end: {id:"6566358"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8346419"}, end: {id:"4405571"}, properties:{sequence_index:"3"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8346419"}, end: {id:"7978425"}, properties:{sequence_index:"4"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8346419"}, end: {id:"6935293"}, properties:{sequence_index:"5"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8346419"}, end: {id:"1298003"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"9646681"}, end: {id:"7034924"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9646681"}, end: {id:"9714818"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9646681"}, end: {id:"5300304"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1078239"}, end: {id:"3358651"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1078239"}, end: {id:"3908344"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1179540"}, end: {id:"6310702"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1179540"}, end: {id:"5160388"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1179540"}, end: {id:"6330719"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1179540"}, end: {id:"4840471"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1518987"}, end: {id:"7682341"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1868693"}, end: {id:"6773616"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3270895"}, end: {id:"7567097"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3270895"}, end: {id:"6213797"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"3270895"}, end: {id:"3358651"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3324084"}, end: {id:"4803506"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3324084"}, end: {id:"1089445"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4165232"}, end: {id:"2190752"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4165232"}, end: {id:"2238158"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4334762"}, end: {id:"6389964"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4437085"}, end: {id:"6389964"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4437085"}, end: {id:"3537009"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4437085"}, end: {id:"3478117"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4437085"}, end: {id:"9092600"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4437085"}, end: {id:"4750165"}, properties:{sequence_index:"3"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4437085"}, end: {id:"1619188"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4505146"}, end: {id:"3908344"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4505146"}, end: {id:"6389964"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4505146"}, end: {id:"8779043"}, properties:{sequence_index:"1"}}] AS row
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
UNWIND [{start: {id:"4650277"}, end: {id:"3279838"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4650277"}, end: {id:"2123766"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4650277"}, end: {id:"3686928"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5854765"}, end: {id:"6523887"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5854765"}, end: {id:"7567097"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"6008233"}, end: {id:"3686928"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6008233"}, end: {id:"4803506"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"6200985"}, end: {id:"2238158"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6200985"}, end: {id:"6773616"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6200985"}, end: {id:"9437784"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"6881790"}, end: {id:"3279838"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"6988834"}, end: {id:"9324316"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"7320847"}, end: {id:"7682341"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7320847"}, end: {id:"9324316"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7320847"}, end: {id:"4840471"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7320847"}, end: {id:"8369684"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8039319"}, end: {id:"1089445"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8039319"}, end: {id:"9544390"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8039319"}, end: {id:"9358085"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8039319"}, end: {id:"3268428"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8039319"}, end: {id:"6786890"}, properties:{sequence_index:"3"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8039319"}, end: {id:"2341415"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8184884"}, end: {id:"5106827"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8184884"}, end: {id:"9437784"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8184884"}, end: {id:"9967559"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8184884"}, end: {id:"3493665"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8498604"}, end: {id:"3778087"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8498604"}, end: {id:"6306015"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8498604"}, end: {id:"5916018"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8498604"}, end: {id:"4487753"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8498604"}, end: {id:"4994113"}, properties:{sequence_index:"3"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8498604"}, end: {id:"5106827"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8921345"}, end: {id:"3493665"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8921345"}, end: {id:"7445550"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8921345"}, end: {id:"6523887"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"9534004"}, end: {id:"2341415"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9534004"}, end: {id:"2190752"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"9709070"}, end: {id:"8369684"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9709070"}, end: {id:"7262448"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9709070"}, end: {id:"9126778"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9709070"}, end: {id:"6756248"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9709070"}, end: {id:"7220243"}, properties:{sequence_index:"3"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9709070"}, end: {id:"9967559"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2544795"}, end: {id:"2478510"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2544795"}, end: {id:"8050243"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2544795"}, end: {id:"2954561"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2544795"}, end: {id:"8988316"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2544795"}, end: {id:"2522307"}, properties:{sequence_index:"3"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2544795"}, end: {id:"5459812"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2775447"}, end: {id:"9932666"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2775447"}, end: {id:"8824597"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2775447"}, end: {id:"9994959"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4980032"}, end: {id:"1044984"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4980032"}, end: {id:"7891922"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4980032"}, end: {id:"2478510"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8627172"}, end: {id:"5459812"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8627172"}, end: {id:"3067885"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8627172"}, end: {id:"9932666"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1997333"}, end: {id:"7845152"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1997333"}, end: {id:"2491768"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2439511"}, end: {id:"5130250"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3037920"}, end: {id:"5927974"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3078632"}, end: {id:"8283443"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3078632"}, end: {id:"4600503"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3078632"}, end: {id:"7845152"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3744460"}, end: {id:"5888046"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5311790"}, end: {id:"7236464"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5311790"}, end: {id:"4600503"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5713113"}, end: {id:"5130250"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5713113"}, end: {id:"4656601"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5713113"}, end: {id:"8283443"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"6216231"}, end: {id:"2491768"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8295331"}, end: {id:"5927974"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8295331"}, end: {id:"5888046"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8295331"}, end: {id:"7236464"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1117397"}, end: {id:"8435615"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1117397"}, end: {id:"4895553"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1117397"}, end: {id:"5123314"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1136226"}, end: {id:"3936380"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1138623"}, end: {id:"8742281"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1138623"}, end: {id:"6139485"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1138623"}, end: {id:"5239397"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1298567"}, end: {id:"7516260"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1298567"}, end: {id:"5359560"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1662112"}, end: {id:"5123314"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1662112"}, end: {id:"5587641"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1662112"}, end: {id:"8062944"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2139033"}, end: {id:"1321587"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2139033"}, end: {id:"8163462"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2139033"}, end: {id:"2682139"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2304792"}, end: {id:"2060958"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2304792"}, end: {id:"5765841"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2304792"}, end: {id:"8742281"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2739184"}, end: {id:"8062944"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2739184"}, end: {id:"2732393"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2766390"}, end: {id:"2378061"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2766390"}, end: {id:"9035634"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2766390"}, end: {id:"3041148"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2851041"}, end: {id:"6277762"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2851041"}, end: {id:"3011802"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2904437"}, end: {id:"1439312"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2904437"}, end: {id:"2080932"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2904437"}, end: {id:"3939933"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3356600"}, end: {id:"4904941"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3356600"}, end: {id:"5765841"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3356600"}, end: {id:"2080932"}, properties:{sequence_index:"1"}}] AS row
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
UNWIND [{start: {id:"3500836"}, end: {id:"3939933"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3500836"}, end: {id:"8813112"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"3500836"}, end: {id:"4777195"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3504214"}, end: {id:"6010171"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3504214"}, end: {id:"3011802"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3504214"}, end: {id:"6795282"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3673220"}, end: {id:"4777195"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3673220"}, end: {id:"3366698"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4385306"}, end: {id:"7541692"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4385306"}, end: {id:"1910429"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4389482"}, end: {id:"8638087"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4389482"}, end: {id:"1650323"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4389482"}, end: {id:"7541692"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4553137"}, end: {id:"3366698"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4553137"}, end: {id:"1321587"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4576718"}, end: {id:"2060958"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4691130"}, end: {id:"1439312"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5219345"}, end: {id:"5523081"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5219345"}, end: {id:"2788936"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5219345"}, end: {id:"6010171"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5993111"}, end: {id:"2740672"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5993111"}, end: {id:"7526914"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5993111"}, end: {id:"6277762"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"6387363"}, end: {id:"5359560"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6387363"}, end: {id:"4755350"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6387363"}, end: {id:"4904941"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"6514260"}, end: {id:"5239397"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6514260"}, end: {id:"3137944"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"6571218"}, end: {id:"9780510"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"6601736"}, end: {id:"6795282"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"6602846"}, end: {id:"8167187"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6602846"}, end: {id:"4862823"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"6781797"}, end: {id:"3936380"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6781797"}, end: {id:"2682139"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6781797"}, end: {id:"5010170"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"6801838"}, end: {id:"4895553"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"7192805"}, end: {id:"3137944"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7192805"}, end: {id:"9737190"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"7320561"}, end: {id:"6758737"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7320561"}, end: {id:"4862823"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7320561"}, end: {id:"4755350"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"7412638"}, end: {id:"5577963"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7412638"}, end: {id:"8020644"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"7852750"}, end: {id:"1381925"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7852750"}, end: {id:"4315501"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7852750"}, end: {id:"5523081"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7852750"}, end: {id:"2378061"}, properties:{sequence_index:"1"}}] AS row
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
UNWIND [{start: {id:"8183035"}, end: {id:"3041148"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8183035"}, end: {id:"1910429"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8183035"}, end: {id:"9780510"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8200501"}, end: {id:"8020644"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8200501"}, end: {id:"8638087"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8369238"}, end: {id:"2732393"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8369238"}, end: {id:"2740672"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8974812"}, end: {id:"8345214"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8974812"}, end: {id:"1381925"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"9095941"}, end: {id:"5010170"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9095941"}, end: {id:"8727369"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9095941"}, end: {id:"5577963"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"9736733"}, end: {id:"6758737"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"9911907"}, end: {id:"9737190"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9911907"}, end: {id:"7247144"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9911907"}, end: {id:"8435615"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2825295"}, end: {id:"7465542"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2825295"}, end: {id:"1548440"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2825295"}, end: {id:"5115586"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2888455"}, end: {id:"8592617"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2888455"}, end: {id:"4911015"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2888455"}, end: {id:"7336772"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2933842"}, end: {id:"6972103"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3635128"}, end: {id:"6199255"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3645843"}, end: {id:"2022953"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3846508"}, end: {id:"9834994"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3846508"}, end: {id:"6972103"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4274767"}, end: {id:"1654988"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4274767"}, end: {id:"5891715"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5424962"}, end: {id:"5891715"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5424962"}, end: {id:"2293278"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5424962"}, end: {id:"6742208"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5447490"}, end: {id:"6742208"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5447490"}, end: {id:"5195494"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5447490"}, end: {id:"6756414"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5860845"}, end: {id:"2022953"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5860845"}, end: {id:"5327191"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5860845"}, end: {id:"7949442"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5860845"}, end: {id:"2411880"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5860845"}, end: {id:"7379457"}, properties:{sequence_index:"3"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5860845"}, end: {id:"2293278"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5937834"}, end: {id:"1292901"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5937834"}, end: {id:"2028521"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5937834"}, end: {id:"8356816"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5937834"}, end: {id:"9370914"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5937834"}, end: {id:"1536006"}, properties:{sequence_index:"3"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5937834"}, end: {id:"8592617"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"6398792"}, end: {id:"7336772"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6398792"}, end: {id:"2601896"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6398792"}, end: {id:"7465542"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"6672580"}, end: {id:"7596368"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6672580"}, end: {id:"4362314"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6672580"}, end: {id:"5129639"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"7068872"}, end: {id:"7946350"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7068872"}, end: {id:"4911015"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"7996351"}, end: {id:"2728170"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8131060"}, end: {id:"3904454"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8131060"}, end: {id:"4824772"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8131060"}, end: {id:"8982886"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8352636"}, end: {id:"8982886"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8352636"}, end: {id:"6756414"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8352636"}, end: {id:"4362314"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8794366"}, end: {id:"1292901"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"9270409"}, end: {id:"5115586"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9270409"}, end: {id:"7072262"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9270409"}, end: {id:"3904454"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"9551659"}, end: {id:"2728170"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9551659"}, end: {id:"5129639"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9551659"}, end: {id:"9834994"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"9561765"}, end: {id:"2601896"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"9760197"}, end: {id:"6199255"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9760197"}, end: {id:"7109663"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9760197"}, end: {id:"8655530"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9760197"}, end: {id:"7596368"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"9804800"}, end: {id:"5129639"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9804800"}, end: {id:"4113753"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9804800"}, end: {id:"2728170"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1345199"}, end: {id:"8320848"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1345199"}, end: {id:"5440061"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1345199"}, end: {id:"6174613"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1345199"}, end: {id:"1206000"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1388833"}, end: {id:"3755872"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1388833"}, end: {id:"5891249"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1388833"}, end: {id:"2239910"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1894519"}, end: {id:"5154120"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2320827"}, end: {id:"9055493"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2431777"}, end: {id:"5891249"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2676398"}, end: {id:"8373934"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2901381"}, end: {id:"6969192"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2901381"}, end: {id:"2020292"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2901381"}, end: {id:"3755872"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3408108"}, end: {id:"4470678"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3408108"}, end: {id:"7324555"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3492706"}, end: {id:"5154120"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3492706"}, end: {id:"9055493"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3492706"}, end: {id:"7653722"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4575140"}, end: {id:"5546471"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4575140"}, end: {id:"4627450"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4575140"}, end: {id:"6309279"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4575140"}, end: {id:"8320848"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4705210"}, end: {id:"1206000"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4705210"}, end: {id:"8373934"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5400789"}, end: {id:"9170078"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5400789"}, end: {id:"5175707"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5550676"}, end: {id:"5175707"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5550676"}, end: {id:"7991420"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5550676"}, end: {id:"4470678"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5863314"}, end: {id:"2020292"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"6715674"}, end: {id:"6969192"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"7387809"}, end: {id:"5546471"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7387809"}, end: {id:"4770215"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7387809"}, end: {id:"3625079"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7387809"}, end: {id:"5440061"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"7878437"}, end: {id:"7653722"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7878437"}, end: {id:"2239910"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7878437"}, end: {id:"9170078"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8162484"}, end: {id:"7324555"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8162484"}, end: {id:"6174613"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"9492883"}, end: {id:"2020292"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9492883"}, end: {id:"5546471"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1306821"}, end: {id:"8242154"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1306821"}, end: {id:"2995236"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1306821"}, end: {id:"6777096"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1306821"}, end: {id:"2460941"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1306821"}, end: {id:"4257540"}, properties:{sequence_index:"3"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1306821"}, end: {id:"7008990"}, properties:{sequence_index:"4"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1306821"}, end: {id:"9633268"}, properties:{sequence_index:"5"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1306821"}, end: {id:"6845877"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1608311"}, end: {id:"2871066"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1608311"}, end: {id:"9152268"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1608311"}, end: {id:"7188516"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1834675"}, end: {id:"6238570"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1834675"}, end: {id:"1393618"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1834675"}, end: {id:"7139326"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2499406"}, end: {id:"4948724"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2499406"}, end: {id:"2502147"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2499406"}, end: {id:"2009493"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3688405"}, end: {id:"7139326"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3688405"}, end: {id:"4499742"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"3688405"}, end: {id:"4868465"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"3688405"}, end: {id:"6714950"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"3688405"}, end: {id:"6613807"}, properties:{sequence_index:"3"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"3688405"}, end: {id:"4507350"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4469272"}, end: {id:"5369477"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4469272"}, end: {id:"5114041"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4469272"}, end: {id:"8090893"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4586003"}, end: {id:"2820438"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4586003"}, end: {id:"2150270"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4586003"}, end: {id:"2040029"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4586003"}, end: {id:"1853847"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4586003"}, end: {id:"6646457"}, properties:{sequence_index:"3"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4586003"}, end: {id:"1832423"}, properties:{sequence_index:"4"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4586003"}, end: {id:"3130389"}, properties:{sequence_index:"5"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4586003"}, end: {id:"1832424"}, properties:{sequence_index:"6"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4586003"}, end: {id:"1380211"}, properties:{sequence_index:"7"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4586003"}, end: {id:"1917654"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"6127864"}, end: {id:"8090893"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6127864"}, end: {id:"4544527"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6127864"}, end: {id:"5607083"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6127864"}, end: {id:"2392562"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"7853333"}, end: {id:"2392562"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7853333"}, end: {id:"7248942"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7853333"}, end: {id:"6390693"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8603083"}, end: {id:"2009493"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8603083"}, end: {id:"6390693"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8603083"}, end: {id:"2871066"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8643391"}, end: {id:"9978909"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8659528"}, end: {id:"1917654"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8659528"}, end: {id:"6845877"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8659528"}, end: {id:"2154616"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8659528"}, end: {id:"4948724"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8796814"}, end: {id:"7188516"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8796814"}, end: {id:"3314982"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8796814"}, end: {id:"6238570"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"9698967"}, end: {id:"8242154"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"9835541"}, end: {id:"1115424"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9835541"}, end: {id:"1893411"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9835541"}, end: {id:"8115404"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9835541"}, end: {id:"5369477"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"9847336"}, end: {id:"2154616"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1044455"}, end: {id:"4127918"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1044455"}, end: {id:"5666935"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1643757"}, end: {id:"8442394"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1643757"}, end: {id:"3917794"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2416859"}, end: {id:"7864125"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2562830"}, end: {id:"5666935"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2562830"}, end: {id:"1515971"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2562830"}, end: {id:"3386860"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2591191"}, end: {id:"8873965"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2743537"}, end: {id:"8873965"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2743537"}, end: {id:"3267212"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2743537"}, end: {id:"4385757"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2812689"}, end: {id:"5666935"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2812689"}, end: {id:"5979850"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2812689"}, end: {id:"8222540"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2848379"}, end: {id:"6881977"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2848379"}, end: {id:"5385244"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3304384"}, end: {id:"3917794"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3636217"}, end: {id:"8222540"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3636217"}, end: {id:"1476448"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3636217"}, end: {id:"9270356"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5355580"}, end: {id:"5385244"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5369106"}, end: {id:"6814979"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5369106"}, end: {id:"2590216"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5369106"}, end: {id:"7086842"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5379322"}, end: {id:"9796063"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5379322"}, end: {id:"5385244"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5379322"}, end: {id:"7702534"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5815479"}, end: {id:"4622149"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5815479"}, end: {id:"7874342"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5815479"}, end: {id:"1476448"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"6053987"}, end: {id:"7702534"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"6224974"}, end: {id:"8007427"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6224974"}, end: {id:"5385244"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6224974"}, end: {id:"5577530"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"6814904"}, end: {id:"5577530"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6814904"}, end: {id:"8442394"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"6829719"}, end: {id:"8658331"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6829719"}, end: {id:"5013638"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6829719"}, end: {id:"4622149"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"6932861"}, end: {id:"8873965"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6932861"}, end: {id:"1476448"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6932861"}, end: {id:"3069767"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"7095007"}, end: {id:"7103968"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7095007"}, end: {id:"1522729"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7095007"}, end: {id:"6814979"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"7173255"}, end: {id:"7864125"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7173255"}, end: {id:"1647066"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7173255"}, end: {id:"5666935"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"7275831"}, end: {id:"8873965"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7275831"}, end: {id:"9050104"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7275831"}, end: {id:"8007427"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"7602827"}, end: {id:"9270356"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7602827"}, end: {id:"7103968"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"7962856"}, end: {id:"8873965"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7962856"}, end: {id:"4852828"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7962856"}, end: {id:"4127918"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"7991401"}, end: {id:"3386860"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7991401"}, end: {id:"8873965"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8096380"}, end: {id:"7086842"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8096380"}, end: {id:"7702534"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8205479"}, end: {id:"4385757"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8205479"}, end: {id:"9796063"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8839945"}, end: {id:"1476448"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"9357941"}, end: {id:"3069767"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9357941"}, end: {id:"6881977"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"9381314"}, end: {id:"5013638"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"9823399"}, end: {id:"8658331"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1153771"}, end: {id:"3470082"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1153771"}, end: {id:"6798426"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1153771"}, end: {id:"7300369"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1302085"}, end: {id:"3470082"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1322174"}, end: {id:"9781919"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1322174"}, end: {id:"9835406"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1322174"}, end: {id:"8118190"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1875894"}, end: {id:"1712972"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1962578"}, end: {id:"5818573"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1962578"}, end: {id:"2429271"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2603561"}, end: {id:"5104592"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2893958"}, end: {id:"3435796"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3433370"}, end: {id:"9707318"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3433370"}, end: {id:"5818573"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3576436"}, end: {id:"2429271"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3576436"}, end: {id:"4947999"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3577090"}, end: {id:"7112224"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3577090"}, end: {id:"1383337"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"3577090"}, end: {id:"6547572"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"3577090"}, end: {id:"3435796"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3633525"}, end: {id:"7300369"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3633525"}, end: {id:"9707318"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3641174"}, end: {id:"8462685"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3641174"}, end: {id:"1712972"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3641174"}, end: {id:"6923850"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3660209"}, end: {id:"9835406"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3724598"}, end: {id:"7110498"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3724598"}, end: {id:"8118190"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3724598"}, end: {id:"2751634"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4513518"}, end: {id:"9781919"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5188363"}, end: {id:"5104592"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5188363"}, end: {id:"8771215"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5188363"}, end: {id:"2089366"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5188363"}, end: {id:"1530135"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5188363"}, end: {id:"4230607"}, properties:{sequence_index:"3"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5188363"}, end: {id:"5239069"}, properties:{sequence_index:"4"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5188363"}, end: {id:"2668466"}, properties:{sequence_index:"5"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5188363"}, end: {id:"9031887"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5454987"}, end: {id:"6536576"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5454987"}, end: {id:"2619766"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5454987"}, end: {id:"8655239"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5679035"}, end: {id:"2619766"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"6228957"}, end: {id:"4947999"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6228957"}, end: {id:"8655239"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6228957"}, end: {id:"2942416"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"7795985"}, end: {id:"6923850"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7795985"}, end: {id:"9031887"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7795985"}, end: {id:"7110498"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"7925705"}, end: {id:"5104592"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7925705"}, end: {id:"5647474"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7925705"}, end: {id:"1175033"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7925705"}, end: {id:"4353144"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7925705"}, end: {id:"1515675"}, properties:{sequence_index:"3"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7925705"}, end: {id:"3538025"}, properties:{sequence_index:"4"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7925705"}, end: {id:"1983598"}, properties:{sequence_index:"5"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7925705"}, end: {id:"1397156"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"7936249"}, end: {id:"6798426"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8435512"}, end: {id:"4594601"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8435512"}, end: {id:"7112224"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8435512"}, end: {id:"1366396"}, properties:{sequence_index:"1"}}] AS row
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
UNWIND [{start: {id:"9878340"}, end: {id:"1397156"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9878340"}, end: {id:"2751634"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9878340"}, end: {id:"6536576"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"9887933"}, end: {id:"2942416"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9887933"}, end: {id:"3542696"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9887933"}, end: {id:"4594601"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"9935422"}, end: {id:"8462685"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1059017"}, end: {id:"2206759"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1873674"}, end: {id:"3915956"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1873674"}, end: {id:"6275836"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3831533"}, end: {id:"4239912"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3862516"}, end: {id:"4454896"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3862516"}, end: {id:"6719179"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"3862516"}, end: {id:"5840241"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5391858"}, end: {id:"4454896"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5391858"}, end: {id:"6275836"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5391858"}, end: {id:"1003658"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"6914144"}, end: {id:"5196207"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6914144"}, end: {id:"3915956"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8648371"}, end: {id:"1003658"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8648371"}, end: {id:"2206759"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"9225696"}, end: {id:"5840241"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9225696"}, end: {id:"4239912"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9225696"}, end: {id:"5196207"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"9872032"}, end: {id:"4454896"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1143551"}, end: {id:"1001745"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1317920"}, end: {id:"5753220"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1317920"}, end: {id:"5320197"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1317920"}, end: {id:"9129246"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1909003"}, end: {id:"8698819"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1909003"}, end: {id:"1001745"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3035476"}, end: {id:"9417128"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3035476"}, end: {id:"9129246"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3035476"}, end: {id:"1441436"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3198144"}, end: {id:"7959026"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5559943"}, end: {id:"4133484"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5700345"}, end: {id:"1131405"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5700345"}, end: {id:"8635770"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5700345"}, end: {id:"1022830"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5700345"}, end: {id:"7360652"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"6292792"}, end: {id:"9494155"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"6456434"}, end: {id:"7360652"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6456434"}, end: {id:"3915320"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6456434"}, end: {id:"8725566"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6456434"}, end: {id:"6364366"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6456434"}, end: {id:"4451366"}, properties:{sequence_index:"3"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6456434"}, end: {id:"4443760"}, properties:{sequence_index:"4"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6456434"}, end: {id:"1489039"}, properties:{sequence_index:"5"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6456434"}, end: {id:"5320197"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"9488257"}, end: {id:"7959026"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9488257"}, end: {id:"3915321"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9488257"}, end: {id:"5440162"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9488257"}, end: {id:"3383852"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9488257"}, end: {id:"9586925"}, properties:{sequence_index:"3"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9488257"}, end: {id:"5753220"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"9626463"}, end: {id:"9494155"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9626463"}, end: {id:"4603243"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9626463"}, end: {id:"9417128"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"9784411"}, end: {id:"1131405"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"9955987"}, end: {id:"4133484"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9955987"}, end: {id:"1441436"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9955987"}, end: {id:"8698819"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1993589"}, end: {id:"2714175"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1993589"}, end: {id:"5246571"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1993589"}, end: {id:"7939101"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2711162"}, end: {id:"4576755"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2711162"}, end: {id:"7384950"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2711162"}, end: {id:"2445123"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2711162"}, end: {id:"5358683"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4779130"}, end: {id:"2714175"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4965571"}, end: {id:"7368252"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5592617"}, end: {id:"5358683"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5592617"}, end: {id:"9803021"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5592617"}, end: {id:"3830663"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"6605632"}, end: {id:"1136968"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6605632"}, end: {id:"1189259"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"6666476"}, end: {id:"7384950"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"7017521"}, end: {id:"7939101"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7017521"}, end: {id:"3830663"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7017521"}, end: {id:"1136968"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"7164757"}, end: {id:"2445123"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8168352"}, end: {id:"8155541"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"9131071"}, end: {id:"4576755"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"9782579"}, end: {id:"9670239"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1148993"}, end: {id:"3940135"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1206301"}, end: {id:"7426234"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1206301"}, end: {id:"4962698"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1206301"}, end: {id:"9701820"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2068603"}, end: {id:"8186016"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2215432"}, end: {id:"9932375"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2967028"}, end: {id:"2621708"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3169869"}, end: {id:"9701820"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3169869"}, end: {id:"2502645"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"3169869"}, end: {id:"9314305"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5001869"}, end: {id:"3893026"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5001869"}, end: {id:"4176694"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5001869"}, end: {id:"4962698"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5372769"}, end: {id:"9932375"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5372769"}, end: {id:"1539856"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5372769"}, end: {id:"3700347"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5372769"}, end: {id:"9873426"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5372769"}, end: {id:"8587761"}, properties:{sequence_index:"3"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5372769"}, end: {id:"4176694"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"6119314"}, end: {id:"2621708"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6119314"}, end: {id:"4429055"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6119314"}, end: {id:"1588002"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6119314"}, end: {id:"1898054"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"6146931"}, end: {id:"1898054"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6146931"}, end: {id:"8585856"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6146931"}, end: {id:"5179630"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"7919446"}, end: {id:"5563180"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8072315"}, end: {id:"5179630"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8072315"}, end: {id:"2844676"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8072315"}, end: {id:"9430397"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8072315"}, end: {id:"8186016"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8509796"}, end: {id:"9314305"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8509796"}, end: {id:"6763636"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8509796"}, end: {id:"8585856"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"9056504"}, end: {id:"3940135"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9056504"}, end: {id:"8421271"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9056504"}, end: {id:"9516318"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9056504"}, end: {id:"7426234"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"9582699"}, end: {id:"5563180"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9582699"}, end: {id:"7475090"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9582699"}, end: {id:"3893026"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1220683"}, end: {id:"9133599"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1220683"}, end: {id:"1042264"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1220683"}, end: {id:"3982459"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1220683"}, end: {id:"7373814"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1220683"}, end: {id:"2593741"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1400184"}, end: {id:"7388891"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1400184"}, end: {id:"2061733"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1400184"}, end: {id:"9159337"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1874718"}, end: {id:"1218257"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1874718"}, end: {id:"4110249"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1874718"}, end: {id:"3566114"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1874718"}, end: {id:"8415948"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1874718"}, end: {id:"9815516"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2667299"}, end: {id:"3843242"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2667299"}, end: {id:"9132281"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2667299"}, end: {id:"4041665"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2667299"}, end: {id:"6779814"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3237021"}, end: {id:"2737346"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3237021"}, end: {id:"9478532"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"3237021"}, end: {id:"4879958"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"3237021"}, end: {id:"8914722"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"3237021"}, end: {id:"2716715"}, properties:{sequence_index:"3"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"3237021"}, end: {id:"1333038"}, properties:{sequence_index:"4"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"3237021"}, end: {id:"7054973"}, properties:{sequence_index:"5"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"3237021"}, end: {id:"6771172"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3858247"}, end: {id:"9815516"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3858247"}, end: {id:"1635641"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5760226"}, end: {id:"2593741"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5760226"}, end: {id:"2156099"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5760226"}, end: {id:"5000579"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5760226"}, end: {id:"1522932"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5760226"}, end: {id:"1218257"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"6200455"}, end: {id:"3843242"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"6715984"}, end: {id:"6771172"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6715984"}, end: {id:"6086107"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6715984"}, end: {id:"7388891"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8079031"}, end: {id:"2737346"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"9601593"}, end: {id:"9159337"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9601593"}, end: {id:"8784765"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9601593"}, end: {id:"9133599"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"9676005"}, end: {id:"6779814"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9676005"}, end: {id:"4510044"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9676005"}, end: {id:"8916427"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9676005"}, end: {id:"6086107"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1304801"}, end: {id:"7781977"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1304801"}, end: {id:"5493675"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1304801"}, end: {id:"2413866"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1330727"}, end: {id:"2303305"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1330727"}, end: {id:"4729665"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1330727"}, end: {id:"8296872"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1410856"}, end: {id:"4842351"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1410856"}, end: {id:"5493675"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1410856"}, end: {id:"8093224"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1791333"}, end: {id:"7875296"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1791333"}, end: {id:"1174231"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1791333"}, end: {id:"2018605"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1791333"}, end: {id:"1405078"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2270901"}, end: {id:"4809503"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2270901"}, end: {id:"4787865"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2270901"}, end: {id:"9108208"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2270901"}, end: {id:"2018605"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3099726"}, end: {id:"9739736"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3105609"}, end: {id:"5409843"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3105609"}, end: {id:"3246829"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3232460"}, end: {id:"8635275"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3232460"}, end: {id:"5595798"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3232460"}, end: {id:"5493675"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3264098"}, end: {id:"7875296"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3264098"}, end: {id:"1174231"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3346106"}, end: {id:"6088608"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3822400"}, end: {id:"4362190"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3822400"}, end: {id:"5235989"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"3822400"}, end: {id:"4014685"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"3822400"}, end: {id:"3404497"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3859105"}, end: {id:"6461198"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4037583"}, end: {id:"1405078"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4037583"}, end: {id:"5595798"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4285950"}, end: {id:"7002927"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4285950"}, end: {id:"4506735"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4285950"}, end: {id:"3003461"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4285950"}, end: {id:"9190817"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4450503"}, end: {id:"4362190"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4450503"}, end: {id:"1490071"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4450503"}, end: {id:"7219466"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4450503"}, end: {id:"4137499"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4581255"}, end: {id:"7442815"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4581255"}, end: {id:"3246829"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4581255"}, end: {id:"6088608"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5037316"}, end: {id:"4362190"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5037316"}, end: {id:"1916131"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5037316"}, end: {id:"5191462"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5037316"}, end: {id:"2303305"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5061134"}, end: {id:"2139818"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5061134"}, end: {id:"7442815"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5273445"}, end: {id:"4809503"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5273445"}, end: {id:"5663009"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5273445"}, end: {id:"4577339"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5464106"}, end: {id:"9192406"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5464106"}, end: {id:"2300056"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5816138"}, end: {id:"7781977"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"6945646"}, end: {id:"4809503"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"6988426"}, end: {id:"5513927"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6988426"}, end: {id:"4809503"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6988426"}, end: {id:"8712395"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6988426"}, end: {id:"8685004"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6988426"}, end: {id:"7875296"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"7201861"}, end: {id:"3404497"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7201861"}, end: {id:"9934418"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7201861"}, end: {id:"4729665"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8130270"}, end: {id:"4842351"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8135505"}, end: {id:"4577339"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8135505"}, end: {id:"4362190"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8475410"}, end: {id:"4137499"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8475410"}, end: {id:"6461198"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8475410"}, end: {id:"9192406"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8612576"}, end: {id:"9739736"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8612576"}, end: {id:"8093224"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8612576"}, end: {id:"5409843"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8712986"}, end: {id:"9739736"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8712986"}, end: {id:"2413866"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8712986"}, end: {id:"2139818"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8915037"}, end: {id:"2300056"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8915037"}, end: {id:"9934418"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"9260286"}, end: {id:"4809503"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9260286"}, end: {id:"5663009"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"9512128"}, end: {id:"2018605"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9512128"}, end: {id:"1584527"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"9585552"}, end: {id:"9190817"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9585552"}, end: {id:"4399863"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9585552"}, end: {id:"8635275"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1336657"}, end: {id:"6319661"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1336657"}, end: {id:"4202425"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1336657"}, end: {id:"3640931"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1337934"}, end: {id:"5427510"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2712078"}, end: {id:"7666907"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3002960"}, end: {id:"7546640"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3002960"}, end: {id:"1693888"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3151962"}, end: {id:"6319661"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3201871"}, end: {id:"8195408"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3201871"}, end: {id:"5277900"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"3201871"}, end: {id:"6913493"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3244831"}, end: {id:"6463955"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3244831"}, end: {id:"8548879"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"3244831"}, end: {id:"8494407"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3464414"}, end: {id:"7403799"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3464414"}, end: {id:"3550368"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"3464414"}, end: {id:"4052253"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4044426"}, end: {id:"4052253"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4044426"}, end: {id:"7396508"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4044426"}, end: {id:"8195408"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4052521"}, end: {id:"5995189"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4052521"}, end: {id:"7546640"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4777578"}, end: {id:"4471422"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4777578"}, end: {id:"7169020"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4875843"}, end: {id:"6319661"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4875843"}, end: {id:"4202425"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4875843"}, end: {id:"2562123"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5029881"}, end: {id:"2562123"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5029881"}, end: {id:"9371489"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5029881"}, end: {id:"7403799"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5211114"}, end: {id:"7595841"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5211114"}, end: {id:"3040283"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5211114"}, end: {id:"6010461"}, properties:{sequence_index:"1"}}] AS row
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
UNWIND [{start: {id:"5537889"}, end: {id:"4326342"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5537889"}, end: {id:"6066191"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5619063"}, end: {id:"3040283"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5637413"}, end: {id:"5649086"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5708661"}, end: {id:"7169020"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5708661"}, end: {id:"6463955"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5796383"}, end: {id:"6316097"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"6150706"}, end: {id:"5427510"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6150706"}, end: {id:"2283140"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6150706"}, end: {id:"4471422"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"6431475"}, end: {id:"6047713"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6431475"}, end: {id:"9446753"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6431475"}, end: {id:"5995189"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"7160101"}, end: {id:"6066191"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7160101"}, end: {id:"4202425"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"7599260"}, end: {id:"5207615"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7599260"}, end: {id:"1650804"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7599260"}, end: {id:"8842089"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"7832193"}, end: {id:"6319661"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7832193"}, end: {id:"4202425"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7832193"}, end: {id:"6685577"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8057586"}, end: {id:"7666907"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8057586"}, end: {id:"6316097"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8057586"}, end: {id:"1693888"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8057586"}, end: {id:"5427510"}, properties:{sequence_index:"3"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8057586"}, end: {id:"5649086"}, properties:{sequence_index:"4"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8057586"}, end: {id:"4326342"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8199201"}, end: {id:"3992172"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8199201"}, end: {id:"4820907"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8199201"}, end: {id:"6047713"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8488825"}, end: {id:"6913493"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8488825"}, end: {id:"8026131"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8488825"}, end: {id:"5207615"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"9486255"}, end: {id:"8842089"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9486255"}, end: {id:"5253559"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9486255"}, end: {id:"7595841"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"9520931"}, end: {id:"8494407"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9520931"}, end: {id:"6980367"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9520931"}, end: {id:"3992172"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"9869359"}, end: {id:"2283140"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1346919"}, end: {id:"9431422"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1452028"}, end: {id:"9431422"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1452028"}, end: {id:"8320432"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1452028"}, end: {id:"6181437"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2951905"}, end: {id:"5961293"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3423374"}, end: {id:"7834577"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3423374"}, end: {id:"5077893"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3423374"}, end: {id:"5020923"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3709291"}, end: {id:"8323044"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3709291"}, end: {id:"1809997"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"3709291"}, end: {id:"9568206"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4186156"}, end: {id:"6979804"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4186156"}, end: {id:"5883117"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4186156"}, end: {id:"8323044"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4663270"}, end: {id:"9568206"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5023393"}, end: {id:"6901924"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5023393"}, end: {id:"5961293"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5023393"}, end: {id:"3642765"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5093643"}, end: {id:"6901924"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5522705"}, end: {id:"2063484"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5522705"}, end: {id:"4586348"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"6240791"}, end: {id:"2438445"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6240791"}, end: {id:"7822040"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6240791"}, end: {id:"7834577"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"6342896"}, end: {id:"2178289"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"6394441"}, end: {id:"2438445"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"7117931"}, end: {id:"2178289"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7117931"}, end: {id:"9155336"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7117931"}, end: {id:"5077893"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"7232268"}, end: {id:"1719451"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"7588540"}, end: {id:"3642765"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7588540"}, end: {id:"4534919"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7588540"}, end: {id:"2063484"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8867459"}, end: {id:"6979804"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"9057006"}, end: {id:"5020923"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9057006"}, end: {id:"7076437"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9057006"}, end: {id:"4534919"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"9182821"}, end: {id:"1719451"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9182821"}, end: {id:"9255270"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"9182821"}, end: {id:"9155336"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"9573616"}, end: {id:"6181437"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9573616"}, end: {id:"4586348"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9573616"}, end: {id:"5883117"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1216158"}, end: {id:"9761157"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2315272"}, end: {id:"4154219"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2315272"}, end: {id:"2877569"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3234596"}, end: {id:"4836115"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3234596"}, end: {id:"4154219"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3234596"}, end: {id:"7792692"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4208810"}, end: {id:"2877569"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4208810"}, end: {id:"7792692"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4208810"}, end: {id:"7745098"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4482244"}, end: {id:"8360924"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4482244"}, end: {id:"7243628"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4482244"}, end: {id:"2051755"}, properties:{sequence_index:"1"}}] AS row
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
UNWIND [{start: {id:"4514656"}, end: {id:"3065061"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4790069"}, end: {id:"2664105"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5272817"}, end: {id:"5403312"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5272817"}, end: {id:"9761157"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5272817"}, end: {id:"4154219"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5376872"}, end: {id:"3065061"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5376872"}, end: {id:"2664105"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5376872"}, end: {id:"7273319"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5391046"}, end: {id:"7745098"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5391046"}, end: {id:"9713990"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5391046"}, end: {id:"8360924"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5435505"}, end: {id:"4463004"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5435505"}, end: {id:"9332704"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5435505"}, end: {id:"4836115"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"6129880"}, end: {id:"7273319"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6129880"}, end: {id:"1294073"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6129880"}, end: {id:"5403312"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8476862"}, end: {id:"2877569"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8476862"}, end: {id:"5689050"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8476862"}, end: {id:"4463004"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8522636"}, end: {id:"7243628"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8522636"}, end: {id:"2877569"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8522636"}, end: {id:"5872898"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8719992"}, end: {id:"5872898"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1391174"}, end: {id:"8922008"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1391174"}, end: {id:"4152602"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1391174"}, end: {id:"5140250"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1391174"}, end: {id:"3693601"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1391174"}, end: {id:"1100444"}, properties:{sequence_index:"3"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1391174"}, end: {id:"8148802"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1468462"}, end: {id:"8713399"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3724854"}, end: {id:"3843569"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4777295"}, end: {id:"8002723"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4777295"}, end: {id:"4577073"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4777295"}, end: {id:"1708642"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5478696"}, end: {id:"6759349"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5478696"}, end: {id:"3308740"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"5478696"}, end: {id:"8713399"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5878391"}, end: {id:"1708642"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5878391"}, end: {id:"5168370"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5878391"}, end: {id:"4037937"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5878391"}, end: {id:"3843569"}, properties:{sequence_index:"3"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5878391"}, end: {id:"6759349"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"6114977"}, end: {id:"8148802"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6114977"}, end: {id:"7969677"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6114977"}, end: {id:"5168370"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"7576732"}, end: {id:"8922008"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7576732"}, end: {id:"1987304"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7576732"}, end: {id:"2060382"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7576732"}, end: {id:"5679513"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7576732"}, end: {id:"7037795"}, properties:{sequence_index:"3"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7576732"}, end: {id:"8002723"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8121398"}, end: {id:"8922008"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8121398"}, end: {id:"7586662"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8121398"}, end: {id:"8551025"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8121398"}, end: {id:"9962307"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8121398"}, end: {id:"9354200"}, properties:{sequence_index:"3"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8121398"}, end: {id:"6313158"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8616052"}, end: {id:"6313158"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8616052"}, end: {id:"6815205"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8616052"}, end: {id:"4037937"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1207155"}, end: {id:"3077940"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1756608"}, end: {id:"6426652"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1756608"}, end: {id:"6070484"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1879109"}, end: {id:"5395954"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1879109"}, end: {id:"9317216"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1879109"}, end: {id:"6426652"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2347440"}, end: {id:"4731536"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2584092"}, end: {id:"4319733"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2584092"}, end: {id:"3909583"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2584092"}, end: {id:"7222556"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2595607"}, end: {id:"3145608"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2595607"}, end: {id:"3867418"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2595607"}, end: {id:"6831354"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2606241"}, end: {id:"6070484"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2606241"}, end: {id:"8702257"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2831850"}, end: {id:"3145608"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2845819"}, end: {id:"3077940"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2845819"}, end: {id:"5183800"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2845819"}, end: {id:"5404156"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2845819"}, end: {id:"5823930"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3159546"}, end: {id:"7222556"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3159546"}, end: {id:"7222556"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3159546"}, end: {id:"5395954"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3428690"}, end: {id:"8702257"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3636266"}, end: {id:"2016533"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3636266"}, end: {id:"9699965"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"3636266"}, end: {id:"3145608"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3877159"}, end: {id:"4009221"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3877159"}, end: {id:"6300507"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3919490"}, end: {id:"3145608"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3919490"}, end: {id:"3145608"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3919490"}, end: {id:"7844176"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4596442"}, end: {id:"4731536"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4596442"}, end: {id:"1091475"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4596442"}, end: {id:"8392798"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4596442"}, end: {id:"6479977"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4598639"}, end: {id:"6300507"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5415197"}, end: {id:"5377003"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5521272"}, end: {id:"4319733"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5521272"}, end: {id:"6831354"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5521272"}, end: {id:"5313211"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5783204"}, end: {id:"5823930"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5783204"}, end: {id:"5377003"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5783204"}, end: {id:"2016533"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"6213336"}, end: {id:"3867418"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"6389859"}, end: {id:"7404421"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6389859"}, end: {id:"6479977"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6389859"}, end: {id:"4319733"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"6625389"}, end: {id:"3909583"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8230503"}, end: {id:"5313211"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8230503"}, end: {id:"5313211"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8230503"}, end: {id:"9317216"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8480572"}, end: {id:"4001109"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8480572"}, end: {id:"4009221"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"9173195"}, end: {id:"7404421"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"9643987"}, end: {id:"7844176"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9643987"}, end: {id:"9245668"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9643987"}, end: {id:"4001109"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"9722132"}, end: {id:"4319733"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9722132"}, end: {id:"4319733"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9722132"}, end: {id:"9245668"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"9934180"}, end: {id:"4319733"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1573241"}, end: {id:"2575148"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1573241"}, end: {id:"5179934"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1573241"}, end: {id:"2552367"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2080556"}, end: {id:"5044727"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2371653"}, end: {id:"2575148"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2371653"}, end: {id:"1990849"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2371653"}, end: {id:"5003983"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2420735"}, end: {id:"7042641"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2420735"}, end: {id:"1707483"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2420735"}, end: {id:"4039036"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2537687"}, end: {id:"5044727"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2537687"}, end: {id:"6943575"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2537687"}, end: {id:"8620451"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3651783"}, end: {id:"8754546"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3651783"}, end: {id:"8164525"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"3651783"}, end: {id:"4008926"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"3651783"}, end: {id:"4829867"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4202402"}, end: {id:"4487508"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4202402"}, end: {id:"3240507"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4202402"}, end: {id:"5382248"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4242980"}, end: {id:"4039036"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4242980"}, end: {id:"5382248"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4242980"}, end: {id:"8754546"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4463019"}, end: {id:"4829867"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4463019"}, end: {id:"1437372"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4463019"}, end: {id:"8722827"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4708398"}, end: {id:"9492936"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5303332"}, end: {id:"8859060"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5303332"}, end: {id:"1615903"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5303332"}, end: {id:"2575148"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5941581"}, end: {id:"7042641"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"6500091"}, end: {id:"7133735"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6500091"}, end: {id:"9492936"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6500091"}, end: {id:"1615903"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"6549607"}, end: {id:"8859060"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"7080403"}, end: {id:"8722827"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"7766035"}, end: {id:"7265984"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"7979473"}, end: {id:"5003983"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7979473"}, end: {id:"7265984"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7979473"}, end: {id:"1337055"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8400219"}, end: {id:"1337055"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8400219"}, end: {id:"5460074"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8400219"}, end: {id:"9195751"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8982754"}, end: {id:"8620451"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8982754"}, end: {id:"9195751"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8982754"}, end: {id:"4487508"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"9643014"}, end: {id:"7133735"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1401711"}, end: {id:"2340248"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1401711"}, end: {id:"9388996"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1401711"}, end: {id:"4575586"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1630245"}, end: {id:"9110206"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1630245"}, end: {id:"1709969"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1630245"}, end: {id:"8711868"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1709854"}, end: {id:"2340248"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1785558"}, end: {id:"7795202"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1785558"}, end: {id:"3601544"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1785558"}, end: {id:"6577160"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1810306"}, end: {id:"8072137"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1810306"}, end: {id:"2217101"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1810306"}, end: {id:"1379855"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1810306"}, end: {id:"4166166"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1810306"}, end: {id:"4537297"}, properties:{sequence_index:"3"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1810306"}, end: {id:"6652843"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3184002"}, end: {id:"7556753"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3184002"}, end: {id:"6803169"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"3184002"}, end: {id:"7795202"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3800497"}, end: {id:"6652843"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3800497"}, end: {id:"4382594"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3800497"}, end: {id:"9388996"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"6033269"}, end: {id:"4476518"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"6781365"}, end: {id:"6644719"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6781365"}, end: {id:"1709969"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"6873690"}, end: {id:"5331094"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"7496236"}, end: {id:"6210646"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7496236"}, end: {id:"5360317"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7496236"}, end: {id:"7556753"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"7602695"}, end: {id:"8711868"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"7749118"}, end: {id:"8324356"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7749118"}, end: {id:"1729739"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"7749118"}, end: {id:"6644719"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"7784926"}, end: {id:"8233899"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"7947474"}, end: {id:"2600680"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7947474"}, end: {id:"5331094"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"7947474"}, end: {id:"4382594"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8457537"}, end: {id:"4476518"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8457537"}, end: {id:"7400943"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"8457537"}, end: {id:"9110206"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"9076010"}, end: {id:"2600680"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"9471787"}, end: {id:"4575586"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9471787"}, end: {id:"6210646"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"9781109"}, end: {id:"8233899"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9781109"}, end: {id:"6577160"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"9781109"}, end: {id:"8324356"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"9893296"}, end: {id:"8072137"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2169431"}, end: {id:"2414344"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2169431"}, end: {id:"8147899"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2169431"}, end: {id:"5564581"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4718871"}, end: {id:"6650345"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"4718871"}, end: {id:"4277577"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"4718871"}, end: {id:"2414344"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"6286448"}, end: {id:"5564581"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"9278347"}, end: {id:"6650345"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1300532"}, end: {id:"4870091"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1300532"}, end: {id:"7266552"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1300532"}, end: {id:"5454988"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1423642"}, end: {id:"3843961"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1423642"}, end: {id:"4224430"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1423642"}, end: {id:"9805089"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1423642"}, end: {id:"3841737"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1423642"}, end: {id:"9544818"}, properties:{sequence_index:"3"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"1423642"}, end: {id:"8012785"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2221674"}, end: {id:"3843961"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2221674"}, end: {id:"6580231"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2221674"}, end: {id:"9164799"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2221674"}, end: {id:"4845850"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2221674"}, end: {id:"6553310"}, properties:{sequence_index:"3"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2221674"}, end: {id:"6379878"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2247327"}, end: {id:"4107950"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2247327"}, end: {id:"8012785"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2247327"}, end: {id:"6379878"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2247327"}, end: {id:"1124189"}, properties:{sequence_index:"3"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2247327"}, end: {id:"4870091"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3650891"}, end: {id:"3843961"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"6550809"}, end: {id:"4107950"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"6614719"}, end: {id:"5454988"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"7233885"}, end: {id:"1124189"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1975942"}, end: {id:"8858248"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1975942"}, end: {id:"5756391"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1975942"}, end: {id:"9683207"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2879756"}, end: {id:"4718749"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2879756"}, end: {id:"4648848"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"2879756"}, end: {id:"8858248"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3092929"}, end: {id:"9683207"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4439032"}, end: {id:"4718749"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"6487343"}, end: {id:"5756391"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"1136729"}, end: {id:"8207477"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1136729"}, end: {id:"8883350"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1136729"}, end: {id:"4236963"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"1136729"}, end: {id:"4943050"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"2756830"}, end: {id:"2237799"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"2756830"}, end: {id:"2565189"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"3538142"}, end: {id:"6760874"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"3538142"}, end: {id:"4236963"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"4403236"}, end: {id:"4943050"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"5622476"}, end: {id:"2565189"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"5622476"}, end: {id:"7362045"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"6093238"}, end: {id:"2237799"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"6287856"}, end: {id:"7362045"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6287856"}, end: {id:"3086821"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6287856"}, end: {id:"6167182"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"6311864"}, end: {id:"4741344"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"6311864"}, end: {id:"5597968"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6311864"}, end: {id:"3063741"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6311864"}, end: {id:"2007644"}, properties:{sequence_index:"2"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6311864"}, end: {id:"2483388"}, properties:{sequence_index:"3"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6311864"}, end: {id:"5398681"}, properties:{sequence_index:"4"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6311864"}, end: {id:"2724984"}, properties:{sequence_index:"5"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_FEED]->(end) SET r += row.properties;
UNWIND [{start: {id:"6311864"}, end: {id:"5997798"}, properties:{sequence_index:"0"}}] AS row
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
UNWIND [{start: {id:"8305798"}, end: {id:"5997798"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8305798"}, end: {id:"6167182"}, properties:{sequence_index:"1"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_INPUT]->(end) SET r += row.properties;
UNWIND [{start: {id:"8305798"}, end: {id:"6760874"}, properties:{sequence_index:"0"}}] AS row
MATCH (start:step{id: row.start.id})
MATCH (end:expression{id: row.end.id})
CREATE (start)-[r:HAS_OUTPUT]->(end) SET r += row.properties;
CALL db.awaitIndexes(300);
