
python3 ../introspection/remove_comments.py ../webserver_for_pdg/library/pdg_api_not_HATEOAS.py > pdg_api_not_HATEOAS.py
python3 ../introspection/remove_comments.py ../test_web_interface/playwrightbased/test_pdg_api_not_HATEOAS.py > test_pdg_api_not_HATEOAS.py

python3 ../introspection/remove_comments.py ../webserver_for_pdg/library/compute.py > compute.py
python3 ../introspection/remove_comments.py ../test_python/test_compute.py > test_compute.py

python3 ../introspection/remove_comments.py ../webserver_for_pdg/library/neo4j_query.py > neo4j_query.py


python3 ../introspection/remove_comments.py ../webserver_for_pdg/library/pdg_api.py > pdg_api.py
python3 ../introspection/remove_comments.py ../test_web_interface/playwrightbased/test_pdg_api.py  > test_pdg_api.py
