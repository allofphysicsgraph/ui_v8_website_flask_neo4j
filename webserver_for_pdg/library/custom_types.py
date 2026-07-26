#!/usr/bin/env python3

# Ben Payne
# Physics Derivation Graph
# https://allofphysics.com
# Creative Commons Attribution 4.0 International License
# https://creativecommons.org/licenses/by/4.0/

# for type hinting
from typing import TypeAlias

# ORDERING: this has to come before the functions that use this type
unique_numeric_id_as_str: TypeAlias = str
query_timing_result_type: TypeAlias = dict[str, float]
# originally these were
# unique_numeric_id_as_str = NewType("unique_numeric_id_as_str", str)
# query_timing_result_type = NewType("query_timing_result_type", Dict[str, float])
# Gemini 3 flash says
#    When you use NewType, you are creating a distinct subtype.
#    Mypy treats `query_timing_result_type` as a "child" of `dict[str, float]`.
#    However, a regular dictionary (like `{}`) is the "parent" type.
#    In type theory, you cannot assign a parent type to a variable expecting a specific child type without an explicit conversion.
#    so
#       `query_timing_result_type` is a unique type that contains a dict.
#       `{}` is a standard dict.
#       Mypy sees this as trying to put a generic object into a specific "branded" container.
#    If you want Mypy to complain if you accidentally mix this dict up with other dictionaries
#    then keep the `NewType` declarations here, and elsewhere in the code initialize the variable using
#       `query_time_dict = query_timing_result_type({})`
#    An example of why NewType is relevant:
#    if you have two different things that are both `Dict[str, float]`
#    (e.g., `PriceMap` and `WeightMap`) and you want to make sure you
#    never accidentally pass a `PriceMap` into a function that expects a `WeightMap`.
