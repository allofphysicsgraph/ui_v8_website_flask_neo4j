#!/usr/bin/python3

"""
docker exec -it CONTAINER_ID /bin/bash
cd /scratch/conversion_of_data_formats
python3 v7_json_to_cypher_expressions.py
"""

import json
import re
import sympy
from sympy.parsing.sympy_parser import parse_expr
import tokenize

SYMBOL_PREFIX="000"
INFRULE_PREFIX="111"
OPERATOR_PREFIX="2222"

# from v7_pickle_web_interface/flask/
with open('data.json','r') as file_handle:
    data = json.loads(file_handle.read())

str_to_prnt = ""
for expr_ID, expr_dict in data['expressions'].items():

    expr_dict['latex'] = expr_dict['latex'].replace(r"\frac",r"\\frac")
    expr_dict['latex'] = expr_dict['latex'].replace(r"\n",r"\\n") # \nabla
    expr_dict['latex'] = expr_dict['latex'].replace(r"\r",r"\\r") # \rho
    expr_dict['latex'] = expr_dict['latex'].replace(r"\t",r"\\t") # \times
    expr_dict['latex'] = expr_dict['latex'].replace(r"\b",r"\\b") # \times
    
    #print(expr_dict['latex'])
    
    result_AST = re.sub(r"pdg(\d\d\d\d)", r"pdg"+SYMBOL_PREFIX+"\\1", expr_dict['AST'])

    #print("\n")
    #print(result_AST)

#    result_AST = result_AST.replace(r"Equality(",r"sympy.Equality(")
#    result_AST = result_AST.replace(r"Symbol(",r"sympy.Symbol(")
#    result_AST = result_AST.replace(r"Mul(",r"sympy.Mul(")

#    print(result_AST)

    sympy_error=False
    try:
        #expr = sympy.sympify(result_AST, evaluate=False)
        expr = parse_expr(result_AST, evaluate=False)
    except ValueError as e:
        print("\nValue Error for "+expr_ID+" :")
        print(result_AST)
        print(e)
        sympy_error=True
    except TypeError as e:
        print("\nTypeError for "+expr_ID+" :")
        print(result_AST)
        print(e)
        sympy_error=True
    except AttributeError as e:
        print("\nAttributeError for "+expr_ID+" :")
        print(result_AST)
        print(e)
        sympy_error=True
    except tokenize.TokenError as e:
        print("\tokenize.TokenError for "+expr_ID+" :")
        print(result_AST)
        print(e)
        sympy_error=True

    print(expr_ID)
    print(expr_dict['latex'])
    if "=" not in expr_dict['latex']:
#        print("feed")
        #str_to_prnt += ":begin"+"\n"
        str_to_prnt += 'UNWIND [{id:"'+expr_ID+'",\n'
        str_to_prnt += '         properties:{lean:"", '+'\n'
        str_to_prnt += '                     author_name_latex:"ben.is.located@gmail.com", '+'\n'
        str_to_prnt += '                     sympy:"'+result_AST+'", '+'\n'
        str_to_prnt += '                     latex:"'+expr_dict['latex']+'"}}] AS row'+'\n'
        str_to_prnt += 'CREATE (n:feed{id: row.id}) SET n += row.properties;'+'\n'
        #str_to_prnt += ':commit'+'\n'
        str_to_prnt += 'CALL db.awaitIndexes(300);'+'\n'
        
    else:
#        print("expr")
        list_of_latex = expr_dict['latex'].split("=")
        if len(list_of_latex)!=2:
            #print(expr_dict['latex'])
            list_of_latex = expr_dict['latex'].split(" = ")

        print(sympy_error)
        print(result_AST)
        if sympy_error:
            sympy_LHS = str(result_AST)
            sympy_RHS = ""
        else:
            try:
                sympy_LHS = str(sympy.srepr(expr.lhs))
                sympy_RHS = str(sympy.srepr(expr.rhs))
            except AttributeError as e:
                sympy_LHS = str(result_AST)
                sympy_RHS = ""

        #str_to_prnt += ":begin"+"\n"
        str_to_prnt += 'UNWIND [{id:"'+expr_ID+'",\n'
        str_to_prnt += '         properties:{sympy_lhs:"'+sympy_LHS+'",'+'\n'
        str_to_prnt += '                     reference_latex:"",'+'\n'
        str_to_prnt += '                     sympy_rhs:"'+sympy_RHS+'",'+'\n'
        str_to_prnt += '                     description_latex:"'+expr_dict['notes']+'",'+'\n'
        str_to_prnt += '                     latex_lhs:"'+list_of_latex[0].strip()+'",'+'\n'
        str_to_prnt += '                     latex_rhs:"'+list_of_latex[1].strip()+'",'+'\n'
        str_to_prnt += '                     latex_condition:"",'+'\n'
        str_to_prnt += '                     name_latex:"'+expr_dict['name']+'",'+'\n'
        str_to_prnt += '                     lean:"",'+'\n'
        str_to_prnt += '                     author_name_latex:"ben.is.located@gmail.com",'+'\n'
        str_to_prnt += '                     latex_relation:"="}}] AS row'+'\n'
        str_to_prnt += 'CREATE (n:expression{id: row.id}) SET n += row.properties;'+'\n'
        #str_to_prnt += ':commit'+'\n'
        str_to_prnt += 'CALL db.awaitIndexes(300);'+'\n'
        
with open("expr_and_feed.cypher","w") as file_handle:
    file_handle.write(str_to_prnt)