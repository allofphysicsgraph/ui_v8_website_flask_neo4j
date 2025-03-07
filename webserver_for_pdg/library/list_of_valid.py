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
    "kilogram (kg)",  # https://www.wikidata.org/wiki/Q11570 and https://en.wikipedia.org/wiki/Kilogram
    "gram (g)",
    "stone",  # https://en.wikipedia.org/wiki/Stone_(unit)
    "ton",  # https://en.wikipedia.org/wiki/Long_ton
    "ounce (oz)",  # https://en.wikipedia.org/wiki/Ounce
    "pound (lb)",
]  # https://en.wikipedia.org/wiki/Pound_(mass)

dimension_time_units = [
    "year",
    "month",
    "fortnight",
    "week",
    "day",
    "sol",  # https://en.wikipedia.org/wiki/Mars_sol
    "hour",
    "minute",
    "second (s)",  # https://en.wikipedia.org/wiki/Second
    "millisecond (ms)",
    "microsecond (us)",
    "picosecond (ps)",
    "femptosecond (fs)",
]

# https://en.wikipedia.org/wiki/Length
dimension_length_units = [
    "kilometer (km)",
    "meter (m)",  # https://en.wikipedia.org/wiki/Metre
    "centimeter (cm)",
    "millimeter (mm)",
    "light-year (ly)",  # https://en.wikipedia.org/wiki/Light-year
    "parsec (pc)",  # https://en.wikipedia.org/wiki/Parsec
    "hand",  # https://en.wikipedia.org/wiki/Hand_(unit)
    "feet",
    "foot",  # https://en.wikipedia.org/wiki/Foot_(unit)
    "furlong",  # https://en.wikipedia.org/wiki/Furlong
    "mile (mi)",  # https://en.wikipedia.org/wiki/Mile
    "league",  # https://en.wikipedia.org/wiki/League_(unit)
    "fathom",  # https://en.wikipedia.org/wiki/Fathom
    "nautical mile",  # https://en.wikipedia.org/wiki/Nautical_mile
    "yard",  # https://en.wikipedia.org/wiki/Yard
]

dimension_temperature_units = [
    "fahrenheit (F)",
    "celsius (C)",
    "kelvin (K)",  # https://en.wikipedia.org/wiki/Kelvin
]
dimension_electric_charge_units = ["coulomb"]  # https://en.wikipedia.org/wiki/Coulomb
dimension_amount_of_substance_units = [
    "mol"
]  # https://en.wikipedia.org/wiki/Mole_(unit)
dimension_luminous_intensity_units = ["candela"]


# Would it be appropriate to constrain list of valid latex relations?
# =, \lt, \leq, \gt, \geq
# https://en.wikipedia.org/wiki/Equals_sign
# https://en.wikipedia.org/wiki/Glossary_of_mathematical_symbols

# EOF
