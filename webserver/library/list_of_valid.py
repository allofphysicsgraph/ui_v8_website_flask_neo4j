symbol_categories = ["operation", "relation", "scalar", "vector", "matrix"]

scalar_scope = ["real", "complex", "integer", "arbitrary"]

scalar_domain = ["any", "positive", "negative", "non-negative"]

node_types = [
    "derivation",
    "step",
    "inference_rule",
    "feed",
    "expression",
    "value_with_units",
] + symbol_categories


dimension_mass_units = [
    "kilogram",
    "gram",
    "stone",  # https://en.wikipedia.org/wiki/Stone_(unit)
    "ton",  # https://en.wikipedia.org/wiki/Long_ton
    "ounce",  # https://en.wikipedia.org/wiki/Ounce
    "pound",
]  # https://en.wikipedia.org/wiki/Pound_(mass)

dimension_time_units = [
    "year",
    "month",
    "fortnight",
    "week",
    "day",
    "hour",
    "minute",
    "second",
    "millisecond",
    "microsecond",
    "picosecond",
    "femptosecond",
]

# https://en.wikipedia.org/wiki/Length
dimension_length_units = [
    "meter",
    "centimeter",
    "millimeter",
    "feet",
    "foot",  # https://en.wikipedia.org/wiki/Foot_(unit)
    "furlong",  # https://en.wikipedia.org/wiki/Furlong
    "mile",  # https://en.wikipedia.org/wiki/Mile
    "league",  # https://en.wikipedia.org/wiki/League_(unit)
    "fathom",  # https://en.wikipedia.org/wiki/Fathom
    "nautical mile",  # https://en.wikipedia.org/wiki/Nautical_mile
    "yard",  # https://en.wikipedia.org/wiki/Yard
]

dimension_temperature_units = ["fahrenheit", "celsius", "kelvin"]
dimension_electric_charge_units = ["coulomb"]  # https://en.wikipedia.org/wiki/Coulomb
dimension_amount_of_substance_units = ["mol"]
dimension_luminous_intensity_units = ["candela"]


# Would it be appropriate to constrain list of valid latex relations?
# =, \lt, \leq, \gt, \geq
# https://en.wikipedia.org/wiki/Equals_sign
# https://en.wikipedia.org/wiki/Glossary_of_mathematical_symbols

# EOF
