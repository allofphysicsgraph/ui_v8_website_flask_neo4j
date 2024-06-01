node_types = [
    "derivation",
    "inference_rule",
    "operation",
    "feed",
    "scalar",
    "vector",
    "matrix",
    "value_with_units",
    "step",
    "expression",
]

symbol_categories = ["operation", "scalar", "vector", "matrix"]

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
dimension_electric_charge_units = ["coulomb"]
dimension_amount_of_substance_units = ["mol"]
dimension_luminous_intensity_units = ["candela"]
