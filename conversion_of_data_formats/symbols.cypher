:begin
UNWIND [{id:"0001054",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Planck_constant#Value",
                     dimension_time: -1,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:2,
                     dimension_amount_of_substance:0,
                     dimension_mass:1,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"\hbar",
                     name_latex:"Reduced Planck's constant",
                     variable_or_constant:"constant",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
UNWIND [{id:"699159",
// [{'units': 'meter^2 kilogram second^-1', 'value': '1.0545718*10^{-34}'}]
         properties:{number_power:,
                     number_decimal:,
                     author_name_latex:"ben",
                     dimension__unit:"",
                     dimension__unit:""}}] AS row
CREATE (n:value_with_units{id: row.id}) SET n += row.properties;
:begin
UNWIND [{start: {id:"0001054"}, end: {id:"699159"}, properties:{}}] AS row
MATCH (start:scalar{id: row.start.id})
MATCH (end:value_with_units{id: row.end.id})
CREATE (start)-[r:HAS_VALUE]->(end) SET r += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0001088",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Work_(thermodynamics)",
                     dimension_time: -2,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:2,
                     dimension_amount_of_substance:0,
                     dimension_mass:1,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"W",
                     name_latex:"work done to a system",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0001115",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Wavelength",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"\lambda",
                     name_latex:"wavelength",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0001134",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Momentum",
                     dimension_time: -1,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:1,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"p",
                     name_latex:"momentum",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0001157",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Boltzmann_constant",
                     dimension_time: -2,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:2,
                     dimension_amount_of_substance:0,
                     dimension_mass:1,
                     dimension_temperature:-1,
                     description_latex:"",
                     latex:"k_{Boltzmann}",
                     name_latex:"Boltzmann constant",
                     variable_or_constant:"constant",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
UNWIND [{id:"134167",
// [{'units': 'meter^2 kilogram second^-2 Kelvin^-1', 'value': '1.38064852 10^{-23}'}]
         properties:{number_power:,
                     number_decimal:,
                     author_name_latex:"ben",
                     dimension__unit:"",
                     dimension__unit:""}}] AS row
CREATE (n:value_with_units{id: row.id}) SET n += row.properties;
:begin
UNWIND [{start: {id:"0001157"}, end: {id:"134167"}, properties:{}}] AS row
MATCH (start:scalar{id: row.start.id})
MATCH (end:value_with_units{id: row.end.id})
CREATE (start)-[r:HAS_VALUE]->(end) SET r += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0001302",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Momentum",
                     dimension_time: -1,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:1,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"\vec{p}_{\rm before}",
                     name_latex:"momentum before collision",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0001352",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Kinetic_energy",
                     dimension_time: -2,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:2,
                     dimension_amount_of_substance:0,
                     dimension_mass:1,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"KE_2",
                     name_latex:"kinetic energy",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0001356",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Stiffness",
                     dimension_time: -2,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:1,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"k",
                     name_latex:"linear stiffness, aka spring constant",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0001357",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Velocity",
                     dimension_time: -1,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"v",
                     name_latex:"velocity",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0001370",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Fine-structure_constant",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"\alpha",
                     name_latex:"fine-structure constant",
                     variable_or_constant:"constant",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
UNWIND [{id:"549722",
// [{'units': 'dimensionless', 'value': '1/137.03599999'}]
         properties:{number_power:,
                     number_decimal:,
                     author_name_latex:"ben",
                     dimension__unit:"",
                     dimension__unit:""}}] AS row
CREATE (n:value_with_units{id: row.id}) SET n += row.properties;
:begin
UNWIND [{start: {id:"0001370"}, end: {id:"549722"}, properties:{}}] AS row
MATCH (start:scalar{id: row.start.id})
MATCH (end:value_with_units{id: row.end.id})
CREATE (start)-[r:HAS_VALUE]->(end) SET r += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0001394",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Entropy",
                     dimension_time: -2,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:2,
                     dimension_amount_of_substance:0,
                     dimension_mass:1,
                     dimension_temperature:-1,
                     description_latex:"",
                     latex:"S",
                     name_latex:"entropy",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0001434",
         properties:{reference_latex:"",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"\hat{x}_n",
                     name_latex:"nth unit vector",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0001452",
         properties:{reference_latex:"",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"y",
                     name_latex:"",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0001464",
         properties:{reference_latex:"",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"x",
                     name_latex:"",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0001466",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Bulk_modulus",
                     dimension_time: -2,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:-1,
                     dimension_amount_of_substance:0,
                     dimension_mass:1,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"K",
                     name_latex:"bulk modulus",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0001467",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Time_in_physics",
                     dimension_time: 1,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"t",
                     name_latex:"time",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0001469",
         properties:{reference_latex:"",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"y_0",
                     name_latex:"initial position",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0001534",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Earth%27s_orbit",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"C_{\rm Earth\ orbit}",
                     name_latex:"circumference of Earth's orbit",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0001552",
         properties:{reference_latex:"",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"j",
                     name_latex:"index",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"integer",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0001567",
         properties:{reference_latex:"",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"i",
                     name_latex:"index",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"integer",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0001572",
         properties:{reference_latex:"",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"x_0",
                     name_latex:"initial position",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0001575",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Angle",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"\theta",
                     name_latex:"angle",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0001592",
         properties:{reference_latex:"",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"n",
                     name_latex:"index",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"integer",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0001649",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Gravity",
                     dimension_time: -2,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"g",
                     name_latex:"acceleration due to gravity",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0001687",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Centripetal_force",
                     dimension_time: -2,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:1,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"F_{\rm centripetal}",
                     name_latex:"centripetal force",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0001700",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Unit_vector",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"\hat{y}",
                     name_latex:"unit vector",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0001790",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Lorentz_factor",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"\gamma",
                     name_latex:"Lorentz factor",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0001791",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Langmuir_adsorption_model",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"\theta_A",
                     name_latex:"the fraction of the surface sites covered with A",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0001888",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Frame_of_reference",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"y'",
                     name_latex:"position in moving reference frame",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0001900",
         properties:{reference_latex:"",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"d",
                     name_latex:"",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0001908",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Electrical_resistance_and_conductance",
                     dimension_time: -1,
                     dimension_electric_charge:-2,
                     dimension_luminous_intensity:0,
                     dimension_length:2,
                     dimension_amount_of_substance:0,
                     dimension_mass:1,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"R_{\rm total}",
                     name_latex:"electrical resistance",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0001934",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Velocity",
                     dimension_time: -1,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"v_{\rm initial}",
                     name_latex:"initial velocity",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0001939",
         properties:{reference_latex:"",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"b",
                     name_latex:"",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0001943",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Displacement_(geometry)",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"d",
                     name_latex:"displacement",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0001955",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Kinetic_energy",
                     dimension_time: -2,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:2,
                     dimension_amount_of_substance:0,
                     dimension_mass:1,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"KE_1",
                     name_latex:"kinetic energy",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0001958",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Refractive_index",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"n_2",
                     name_latex:" index of refraction for material 2",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0001966",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Langmuir_adsorption_model",
                     dimension_time: -1,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"r_{\rm desorption}",
                     name_latex:"rate of desorption",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0001999",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Elementary_charge",
                     dimension_time: 0,
                     dimension_electric_charge:1,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"e",
                     name_latex:"charge of an electron",
                     variable_or_constant:"constant",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
UNWIND [{id:"606002",
// [{'units': 'Columb', 'value': '1.602*10^{-19}'}]
         properties:{number_power:,
                     number_decimal:,
                     author_name_latex:"ben",
                     dimension__unit:"",
                     dimension__unit:""}}] AS row
CREATE (n:value_with_units{id: row.id}) SET n += row.properties;
:begin
UNWIND [{start: {id:"0001999"}, end: {id:"606002"}, properties:{}}] AS row
MATCH (start:scalar{id: row.start.id})
MATCH (end:value_with_units{id: row.end.id})
CREATE (start)-[r:HAS_VALUE]->(end) SET r += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0002046",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Momentum",
                     dimension_time: -1,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:1,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"\vec{p}",
                     name_latex:"momentum",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0002069",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Magnetic_field",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"\vec{H}",
                     name_latex:"magnetic field",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0002077",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Speed_of_sound",
                     dimension_time: -1,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"v",
                     name_latex:"longitudinal speed of sound in condensed matter",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0002090",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Bra%E2%80%93ket_notation",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"| \psi_{\beta} \rangle",
                     name_latex:"ket",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"complex",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0002097",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Momentum",
                     dimension_time: -1,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:1,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"\vec{p}_2",
                     name_latex:"momentum 2",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0002241",
         properties:{reference_latex:"",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"E",
                     name_latex:"bonding energy",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0002243",
         properties:{reference_latex:"",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"\theta_{\rm refracted}",
                     name_latex:"refracted angle",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0002321",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Angular_frequency",
                     dimension_time: -1,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"\omega",
                     name_latex:"angular frequency",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0002380",
         properties:{reference_latex:"",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"\hat{x}_m",
                     name_latex:"mth unit vector",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0002423",
         properties:{reference_latex:"",
                     dimension_time: -2,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"\vec{a}",
                     name_latex:"acceleration",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0002427",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Quantum_mechanics",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"a_{\alpha}",
                     name_latex:"none",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"complex",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0002435",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Intensity_(physics)",
                     dimension_time: -3,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:1,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"I_{\rm incoherent}",
                     name_latex:"intensity of incoherent waves",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0002467",
         properties:{reference_latex:"",
                     dimension_time: 1,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"t_f",
                     name_latex:"final time",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0002473",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Velocity",
                     dimension_time: -1,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"v_1",
                     name_latex:"velocity 1",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0002515",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Electron",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:1,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"m_e",
                     name_latex:"mass of electron",
                     variable_or_constant:"constant",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
UNWIND [{id:"706172",
// [{'units': 'kg', 'value': '9.1093837015E^{-31}'}]
         properties:{number_power:,
                     number_decimal:,
                     author_name_latex:"ben",
                     dimension__unit:"",
                     dimension__unit:""}}] AS row
CREATE (n:value_with_units{id: row.id}) SET n += row.properties;
:begin
UNWIND [{start: {id:"0002515"}, end: {id:"706172"}, properties:{}}] AS row
MATCH (start:scalar{id: row.start.id})
MATCH (end:value_with_units{id: row.end.id})
CREATE (start)-[r:HAS_VALUE]->(end) SET r += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0002523",
         properties:{reference_latex:"",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"W",
                     name_latex:"width",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0002530",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Radius",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"r",
                     name_latex:"radius",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0002718",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/E_(mathematical_constant)",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"\exp",
                     name_latex:"e",
                     variable_or_constant:"constant",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
UNWIND [{id:"115552",
// [{'units': 'unitless', 'value': '2.71828'}]
         properties:{number_power:,
                     number_decimal:,
                     author_name_latex:"ben",
                     dimension__unit:"",
                     dimension__unit:""}}] AS row
CREATE (n:value_with_units{id: row.id}) SET n += row.properties;
:begin
UNWIND [{start: {id:"0002718"}, end: {id:"115552"}, properties:{}}] AS row
MATCH (start:scalar{id: row.start.id})
MATCH (end:value_with_units{id: row.end.id})
CREATE (start)-[r:HAS_VALUE]->(end) SET r += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0002798",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Distance",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"d_2",
                     name_latex:"distance",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0002834",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Amount_of_substance",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"n",
                     name_latex:"amount of substance",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0002851",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Debye_model",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"k_{\rm Debye}",
                     name_latex:"Debye wavevector",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0002867",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Gravity",
                     dimension_time: -2,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:1,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"F_{\rm gravity}",
                     name_latex:"force due to gravity",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0002875",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Debye_model",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"r_{\rm Bohr}",
                     name_latex:"Bohr radius",
                     variable_or_constant:"constant",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
UNWIND [{id:"316109",
// [{'units': 'm', 'value': '5.29E^{-11}'}]
         properties:{number_power:,
                     number_decimal:,
                     author_name_latex:"ben",
                     dimension__unit:"",
                     dimension__unit:""}}] AS row
CREATE (n:value_with_units{id: row.id}) SET n += row.properties;
:begin
UNWIND [{start: {id:"0002875"}, end: {id:"316109"}, properties:{}}] AS row
MATCH (start:scalar{id: row.start.id})
MATCH (end:value_with_units{id: row.end.id})
CREATE (start)-[r:HAS_VALUE]->(end) SET r += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0002911",
         properties:{reference_latex:"",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"\vec{x}",
                     name_latex:"position",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"vector",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0002941",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Refractive_index",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"n_1",
                     name_latex:"index of refraction for material 1",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0002958",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Velocity",
                     dimension_time: -1,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"v_{0, x}",
                     name_latex:"initial velocity along x axis",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0003033",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Shear_modulus",
                     dimension_time: -2,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:-1,
                     dimension_amount_of_substance:0,
                     dimension_mass:1,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"G",
                     name_latex:"shear modulus",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0003034",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Circumference",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"C",
                     name_latex:"circumference",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0003037",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Langmuir_adsorption_model",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:1,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"[S_0]",
                     name_latex:"total number of sites",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0003141",
         properties:{reference_latex:"",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"\pi",
                     name_latex:"pi",
                     variable_or_constant:"constant",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
UNWIND [{id:"585050",
// [{'units': 'dimensionless', 'value': '3.1415'}]
         properties:{number_power:,
                     number_decimal:,
                     author_name_latex:"ben",
                     dimension__unit:"",
                     dimension__unit:""}}] AS row
CREATE (n:value_with_units{id: row.id}) SET n += row.properties;
:begin
UNWIND [{start: {id:"0003141"}, end: {id:"585050"}, properties:{}}] AS row
MATCH (start:scalar{id: row.start.id})
MATCH (end:value_with_units{id: row.end.id})
CREATE (start)-[r:HAS_VALUE]->(end) SET r += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0003192",
         properties:{reference_latex:"https://farside.ph.utexas.edu/teaching/315/Waveshtml/node88.html",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"Z",
                     name_latex:"none",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"complex",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0003236",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Earth_radius",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"r_{\rm Earth}",
                     name_latex:"radius of Earth",
                     variable_or_constant:"constant",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
UNWIND [{id:"952829",
// [{'units': 'm', 'value': '6.3781*10^{6}'}]
         properties:{number_power:,
                     number_decimal:,
                     author_name_latex:"ben",
                     dimension__unit:"",
                     dimension__unit:""}}] AS row
CREATE (n:value_with_units{id: row.id}) SET n += row.properties;
:begin
UNWIND [{start: {id:"0003236"}, end: {id:"952829"}, properties:{}}] AS row
MATCH (start:scalar{id: row.start.id})
MATCH (end:value_with_units{id: row.end.id})
CREATE (start)-[r:HAS_VALUE]->(end) SET r += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0003285",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Atomic_mass",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:1,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"A",
                     name_latex:"atomic mass",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0003410",
         properties:{reference_latex:"",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"h",
                     name_latex:"none",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0003434",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Microstate_(statistical_mechanics)",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"\Omega",
                     name_latex:"number of microscopic configurations (known as microstates) that are consistent with the macroscopic quantities that characterize the system",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0003461",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Electrical_resistance_and_conductance",
                     dimension_time: -1,
                     dimension_electric_charge:-2,
                     dimension_luminous_intensity:0,
                     dimension_length:2,
                     dimension_amount_of_substance:0,
                     dimension_mass:1,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"R_2",
                     name_latex:"electrical resistance",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0003474",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Levi-Civita_symbol",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"\epsilon",
                     name_latex:"Levi-Civita",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0003509",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Angle",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"\theta_1",
                     name_latex:"angle",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0003569",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Mass",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:1,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"m_{\rm satellite}",
                     name_latex:"mass of satellite",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0003652",
         properties:{reference_latex:"",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"x_f",
                     name_latex:"final position on x axis",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0003852",
         properties:{reference_latex:"",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"x_1",
                     name_latex:"position 1",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0003935",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Density",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:-3,
                     dimension_amount_of_substance:0,
                     dimension_mass:1,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"\rho",
                     name_latex:"density",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0003978",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Electric_current",
                     dimension_time: -1,
                     dimension_electric_charge:1,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"I_1",
                     name_latex:"electric current",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0003981",
         properties:{reference_latex:"",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"h",
                     name_latex:"index",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"integer",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0004037",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Position_(geometry)",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"x",
                     name_latex:"position",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0004065",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Bra%E2%80%93ket_notation",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"\langle \psi|",
                     name_latex:"bra",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"complex",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0004082",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Velocity",
                     dimension_time: -1,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"v_{\rm satellite}",
                     name_latex:"velocity of satellite",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0004093",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Potential_energy",
                     dimension_time: -2,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:2,
                     dimension_amount_of_substance:0,
                     dimension_mass:1,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"PE_1",
                     name_latex:"kinetic energy",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0004121",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Kinetic_energy",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"KE_{\rm initial}",
                     name_latex:"initial kinetic energy",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0004183",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Hooke%27s_law",
                     dimension_time: -2,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:1,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"F_{\rm{spring}}",
                     name_latex:"force of a spring",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0004200",
         properties:{reference_latex:"",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"f",
                     name_latex:"",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0004201",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Frequency",
                     dimension_time: -1,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"f",
                     name_latex:"frequency",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0004202",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Force",
                     dimension_time: -2,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:1,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"F",
                     name_latex:"force",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0004221",
         properties:{reference_latex:"",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"u",
                     name_latex:"",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0004231",
         properties:{reference_latex:"",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"c",
                     name_latex:"",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0004291",
         properties:{reference_latex:"",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"g",
                     name_latex:"",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0004299",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Momentum",
                     dimension_time: -1,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:1,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"\vec{p}_{\rm electron}",
                     name_latex:"momentum of electron",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0004306",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Frame_of_reference",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"z'",
                     name_latex:"position in moving reference frame",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0004326",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Electric_field",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"\vec{E}",
                     name_latex:"electric field",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"complex",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0004413",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Planck_constant",
                     dimension_time: -1,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:2,
                     dimension_amount_of_substance:0,
                     dimension_mass:1,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"h",
                     name_latex:"Planck's constant",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0004453",
         properties:{reference_latex:"https://farside.ph.utexas.edu/teaching/315/Waveshtml/node88.html",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"A",
                     name_latex:"none",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"complex",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0004501",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Electric_current",
                     dimension_time: -1,
                     dimension_electric_charge:1,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"I",
                     name_latex:"electric current",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0004518",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Schwarzschild_radius",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"r_{\rm Schwarzschild}",
                     name_latex:"Schwarzschild radius; event horizon",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0004550",
         properties:{reference_latex:"",
                     dimension_time: -2,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:2,
                     dimension_amount_of_substance:0,
                     dimension_mass:1,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"E_2",
                     name_latex:"energy 2",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0004567",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Speed_of_light and https://www.wikidata.org/wiki/Q2111 and https://id.loc.gov/authorities/subjects/sh85076878.html",
                     dimension_time: -1,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"c",
                     name_latex:"speed of light in vacuum",
                     variable_or_constant:"constant",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
UNWIND [{id:"615161",
// [{'units': 'meters/second', 'value': '299792458'}]
         properties:{number_power:,
                     number_decimal:,
                     author_name_latex:"ben",
                     dimension__unit:"",
                     dimension__unit:""}}] AS row
CREATE (n:value_with_units{id: row.id}) SET n += row.properties;
:begin
UNWIND [{start: {id:"0004567"}, end: {id:"615161"}, properties:{}}] AS row
MATCH (start:scalar{id: row.start.id})
MATCH (end:value_with_units{id: row.end.id})
CREATE (start)-[r:HAS_VALUE]->(end) SET r += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0004568",
         properties:{reference_latex:"",
                     dimension_time: 1,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"t_0",
                     name_latex:"time 0",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0004610",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Joule%E2%80%93Thomson_effect",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"\mu_T",
                     name_latex:"isothermal Joule-Thomson coefficient",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0004621",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Imaginary_unit",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"i",
                     name_latex:"imaginary unit",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"imaginary",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0004635",
         properties:{reference_latex:"https://arxiv.org/pdf/2004.04818.pdf",
                     dimension_time: -1,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"v_u",
                     name_latex:"upper limit on velocity in condensed matter",
                     variable_or_constant:"constant",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
UNWIND [{id:"963595",
// [{'units': 'm/s', 'value': '36100'}]
         properties:{number_power:,
                     number_decimal:,
                     author_name_latex:"ben",
                     dimension__unit:"",
                     dimension__unit:""}}] AS row
CREATE (n:value_with_units{id: row.id}) SET n += row.properties;
:begin
UNWIND [{start: {id:"0004635"}, end: {id:"963595"}, properties:{}}] AS row
MATCH (start:scalar{id: row.start.id})
MATCH (end:value_with_units{id: row.end.id})
CREATE (start)-[r:HAS_VALUE]->(end) SET r += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0004645",
         properties:{reference_latex:"",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"\kappa_T",
                     name_latex:"coefficient of isothermal compressibility",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0004679",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Bra%E2%80%93ket_notation",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"\langle \psi_{\alpha} |",
                     name_latex:"bra",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"complex",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0004686",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Thermal_expansion",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:-1,
                     description_latex:"",
                     latex:"\alpha",
                     name_latex:"expansion coefficient",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0004691",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Voltage",
                     dimension_time: -2,
                     dimension_electric_charge:-1,
                     dimension_luminous_intensity:0,
                     dimension_length:2,
                     dimension_amount_of_substance:0,
                     dimension_mass:1,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"V_{\rm total}",
                     name_latex:"voltage",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0004698",
         properties:{reference_latex:"https://farside.ph.utexas.edu/teaching/315/Waveshtml/node88.html",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"B",
                     name_latex:"none",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"complex",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0004711",
         properties:{reference_latex:"",
                     dimension_time: 1,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"dt",
                     name_latex:"differential time",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0004770",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Velocity",
                     dimension_time: -1,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"v_2",
                     name_latex:"velocity 2",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0004851",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Mass",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:1,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"m_2",
                     name_latex:"mass",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0004856",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Electric_current",
                     dimension_time: -1,
                     dimension_electric_charge:1,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"I_2",
                     name_latex:"electric current",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0004928",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Brewster%27s_angle",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"\theta_{\rm Brewster}",
                     name_latex:"Brewster's angle",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0004929",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Kinetic_energy",
                     dimension_time: -2,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:2,
                     dimension_amount_of_substance:0,
                     dimension_mass:1,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"KE",
                     name_latex:"kinetic energy",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0004930",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Potential_energy",
                     dimension_time: -2,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:2,
                     dimension_amount_of_substance:0,
                     dimension_mass:1,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"PE",
                     name_latex:"potential energy",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0004931",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Energy and https://www.wikidata.org/wiki/Q11379 and https://schema.org/Energy",
                     dimension_time: -2,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:2,
                     dimension_amount_of_substance:0,
                     dimension_mass:1,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"E",
                     name_latex:"energy",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0004933",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Langmuir_adsorption_model",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"K_{\rm equilibrium}",
                     name_latex:"constant for equilibrium when rate of adsorption equals the rate of desorption ",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0004940",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Langmuir_adsorption_model",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:2,
                     dimension_amount_of_substance:1,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"[A_{\rm adsorption}]",
                     name_latex:"surface concentration of A in molecules per square meter",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0004989",
         properties:{reference_latex:"",
                     dimension_time: 1,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"t'",
                     name_latex:"time in moving reference frame",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0005005",
         properties:{reference_latex:"",
                     dimension_time: -1,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"d v_x",
                     name_latex:"differential velocity along x axis",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0005022",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Mass",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:1,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"m_1",
                     name_latex:"mass",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0005153",
         properties:{reference_latex:"",
                     dimension_time: -1,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"v_0",
                     name_latex:"initial velocity",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0005156",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Mass and https://www.wikidata.org/wiki/Q11423 and https://schema.org/Mass",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:1,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"m",
                     name_latex:"mass",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0005177",
         properties:{reference_latex:"",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"v",
                     name_latex:"none",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0005321",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Wavenumber",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:-1,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"k",
                     name_latex:"angular wavenumber",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0005332",
         properties:{reference_latex:"",
                     dimension_time: -2,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:2,
                     dimension_amount_of_substance:0,
                     dimension_mass:1,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"KE_{\rm escape}",
                     name_latex:"kinetic energy of escape velocity",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0005340",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Kinetic_energy",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"KE_{\rm final}",
                     name_latex:"final kinetic energy",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0005344",
         properties:{reference_latex:"",
                     dimension_time: 1,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"t_{\rm Earth\ orbit}",
                     name_latex:"time of Earth's orbit around sun",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0005456",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Frame_of_reference",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"x'",
                     name_latex:"position in moving reference frame",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0005458",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Earth",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:2,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"m_{\rm Earth}",
                     name_latex:"mass of Earth",
                     variable_or_constant:"constant",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
UNWIND [{id:"391001",
// [{'units': 'kg', 'value': '5.97237*10^24'}]
         properties:{number_power:,
                     number_decimal:,
                     author_name_latex:"ben",
                     dimension__unit:"",
                     dimension__unit:""}}] AS row
CREATE (n:value_with_units{id: row.id}) SET n += row.properties;
:begin
UNWIND [{start: {id:"0005458"}, end: {id:"391001"}, properties:{}}] AS row
MATCH (start:scalar{id: row.start.id})
MATCH (end:value_with_units{id: row.end.id})
CREATE (start)-[r:HAS_VALUE]->(end) SET r += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0005467",
         properties:{reference_latex:"",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"x_2",
                     name_latex:"position 2",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0005480",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Internal_pressure",
                     dimension_time: -2,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:1,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"\pi_T",
                     name_latex:"internal pressure at constant temperature",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0005493",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Momentum",
                     dimension_time: -1,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:1,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"\vec{p}_{\rm after}",
                     name_latex:"momentum after collision",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0005505",
         properties:{reference_latex:"",
                     dimension_time: -1,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"v_x",
                     name_latex:"velocity along x axis",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0005563",
         properties:{reference_latex:"",
                     dimension_time: 1,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"t_i",
                     name_latex:"initial time",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0005579",
         properties:{reference_latex:"",
                     dimension_time: -2,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:2,
                     dimension_amount_of_substance:0,
                     dimension_mass:1,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"E_1",
                     name_latex:"energy 1",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0005595",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Orbital_period",
                     dimension_time: 1,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"T_{\rm geostationary\ orbit}",
                     name_latex:"geostationary orbital period",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0005598",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Operator_(physics)",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"\hat{A}",
                     name_latex:"observerable operator",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0005647",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Position_(geometry)",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"y",
                     name_latex:"position",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0005674",
         properties:{reference_latex:"",
                     dimension_time: -1,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"d v_y",
                     name_latex:"differential velocity along y axis",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0005734",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Kinetic_energy",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"\Delta KE",
                     name_latex:"change in kinetic energy",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0005786",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Internal_energy",
                     dimension_time: -2,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:2,
                     dimension_amount_of_substance:0,
                     dimension_mass:1,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"U",
                     name_latex:"internal energy",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0005842",
         properties:{reference_latex:"",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"dy",
                     name_latex:"differential displacement along y axis",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0005854",
         properties:{reference_latex:"",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"a",
                     name_latex:"atomic separation",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0005916",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Proton",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:1,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"m_p",
                     name_latex:"mass of proton",
                     variable_or_constant:"constant",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
UNWIND [{id:"785215",
// [{'units': 'kg', 'value': '1.67262192369E^{-27}'}]
         properties:{number_power:,
                     number_decimal:,
                     author_name_latex:"ben",
                     dimension__unit:"",
                     dimension__unit:""}}] AS row
CREATE (n:value_with_units{id: row.id}) SET n += row.properties;
:begin
UNWIND [{start: {id:"0005916"}, end: {id:"785215"}, properties:{}}] AS row
MATCH (start:scalar{id: row.start.id})
MATCH (end:value_with_units{id: row.end.id})
CREATE (start)-[r:HAS_VALUE]->(end) SET r += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0006022",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Avogadro_constant",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:-1,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"N_A",
                     name_latex:"Avagadro's constant",
                     variable_or_constant:"constant",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
UNWIND [{id:"949995",
// [{'units': 'mol^-1', 'value': '6.02214086*10^{23}'}]
         properties:{number_power:,
                     number_decimal:,
                     author_name_latex:"ben",
                     dimension__unit:"",
                     dimension__unit:""}}] AS row
CREATE (n:value_with_units{id: row.id}) SET n += row.properties;
:begin
UNWIND [{start: {id:"0006022"}, end: {id:"949995"}, properties:{}}] AS row
MATCH (start:scalar{id: row.start.id})
MATCH (end:value_with_units{id: row.end.id})
CREATE (start)-[r:HAS_VALUE]->(end) SET r += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0006029",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Momentum",
                     dimension_time: -1,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:1,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"\vec{p}_1",
                     name_latex:"momentum 1",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0006081",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Earth%27s_orbit",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"r_{\rm Earth\ orbit}",
                     name_latex:"radius of Earth's orbit",
                     variable_or_constant:"constant",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
UNWIND [{id:"268012",
// [{'units': 'km', 'value': '1.496*10^8'}]
         properties:{number_power:,
                     number_decimal:,
                     author_name_latex:"ben",
                     dimension__unit:"",
                     dimension__unit:""}}] AS row
CREATE (n:value_with_units{id: row.id}) SET n += row.properties;
:begin
UNWIND [{start: {id:"0006081"}, end: {id:"268012"}, properties:{}}] AS row
MATCH (start:scalar{id: row.start.id})
MATCH (end:value_with_units{id: row.end.id})
CREATE (start)-[r:HAS_VALUE]->(end) SET r += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0006091",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Velocity",
                     dimension_time: -1,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"\vec{v}_0",
                     name_latex:"initial velocity",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0006191",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Work_(physics)",
                     dimension_time: -2,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:2,
                     dimension_amount_of_substance:0,
                     dimension_mass:1,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"W_{\rm by\ system}",
                     name_latex:"work done by system",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0006197",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Vacuum_permeability",
                     dimension_time: 0,
                     dimension_electric_charge:-2,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:1,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"\mu_0",
                     name_latex:"vacuum permeability, permeability of free space, permeability of vacuum, or magnetic constant",
                     variable_or_constant:"constant",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
UNWIND [{id:"136074",
// [{'units': 'N/A^2', 'value': '1.25663706212E^{-6}'}]
         properties:{number_power:,
                     number_decimal:,
                     author_name_latex:"ben",
                     dimension__unit:"",
                     dimension__unit:""}}] AS row
CREATE (n:value_with_units{id: row.id}) SET n += row.properties;
:begin
UNWIND [{start: {id:"0006197"}, end: {id:"136074"}, properties:{}}] AS row
MATCH (start:scalar{id: row.start.id})
MATCH (end:value_with_units{id: row.end.id})
CREATE (start)-[r:HAS_VALUE]->(end) SET r += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0006235",
         properties:{reference_latex:"",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"f",
                     name_latex:"proportionality constant",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0006238",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Electric_field",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"E",
                     name_latex:"electric field",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0006277",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Gravitational_constant",
                     dimension_time: -2,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:3,
                     dimension_amount_of_substance:0,
                     dimension_mass:-1,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"G",
                     name_latex:"gravitational constant",
                     variable_or_constant:"constant",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
UNWIND [{id:"645961",
// [{'units': 'm^3 * kg^-1 * s^-2', 'value': '6.67430*10^{-11}'}]
         properties:{number_power:,
                     number_decimal:,
                     author_name_latex:"ben",
                     dimension__unit:"",
                     dimension__unit:""}}] AS row
CREATE (n:value_with_units{id: row.id}) SET n += row.properties;
:begin
UNWIND [{start: {id:"0006277"}, end: {id:"645961"}, properties:{}}] AS row
MATCH (start:scalar{id: row.start.id})
MATCH (end:value_with_units{id: row.end.id})
CREATE (start)-[r:HAS_VALUE]->(end) SET r += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0006373",
         properties:{reference_latex:"",
                     dimension_time: -1,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"\vec{v}",
                     name_latex:"velocity",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0006431",
         properties:{reference_latex:"",
                     dimension_time: -2,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:2,
                     dimension_amount_of_substance:0,
                     dimension_mass:1,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"PE_{\rm Earth\ surface}",
                     name_latex:"potential energy at the Earth's surface",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0006458",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Electrical_resistance_and_conductance",
                     dimension_time: -1,
                     dimension_electric_charge:-2,
                     dimension_luminous_intensity:0,
                     dimension_length:2,
                     dimension_amount_of_substance:0,
                     dimension_mass:1,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"R",
                     name_latex:"electrical resistance",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0006599",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Voltage",
                     dimension_time: -2,
                     dimension_electric_charge:-1,
                     dimension_luminous_intensity:0,
                     dimension_length:2,
                     dimension_amount_of_substance:0,
                     dimension_mass:1,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"V",
                     name_latex:"voltage",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0006682",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Heat_capacity",
                     dimension_time: -2,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:2,
                     dimension_amount_of_substance:0,
                     dimension_mass:1,
                     dimension_temperature:-1,
                     description_latex:"",
                     latex:"C_V",
                     name_latex:"heat capacity at constant volume",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0006687",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Langmuir_adsorption_model",
                     dimension_time: -1,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"r_{\rm adsorption}",
                     name_latex:"rate of adsorption",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0006694",
         properties:{reference_latex:"",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"dv",
                     name_latex:"differential of v",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0006709",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Velocity",
                     dimension_time: -1,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"v_{\rm average}",
                     name_latex:"velocity average",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0006722",
         properties:{reference_latex:"",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"du",
                     name_latex:"differential of u",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0006728",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Position_(geometry)",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"z",
                     name_latex:"position",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0006777",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Force and https://www.wikidata.org/wiki/Q11402",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"\vec{F}",
                     name_latex:"force",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0006789",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Work_(physics)",
                     dimension_time: -2,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:2,
                     dimension_amount_of_substance:0,
                     dimension_mass:1,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"W",
                     name_latex:"work",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0006799",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Hamiltonian_(quantum_mechanics)",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"{\cal H}",
                     name_latex:"operator",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"complex",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0006850",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Langmuir_adsorption_model",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"k_{\rm adsorption}",
                     name_latex:"constant of forward adsorption reaction",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0007055",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Acceleration",
                     dimension_time: -2,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"a_y",
                     name_latex:"acceleration along y axis",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0007092",
         properties:{reference_latex:"",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"y_f",
                     name_latex:"final position on y axis",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0007110",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Geostationary_orbit",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"r_{\rm geostationary\ orbit}",
                     name_latex:"geostationary orbital radius",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0007159",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Acceleration",
                     dimension_time: -2,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"a_x",
                     name_latex:"acceleration along x axis",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0007343",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Temperature",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:1,
                     description_latex:"",
                     latex:"T",
                     name_latex:"temperature",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0007394",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Wavenumber",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:-1,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"\vec{k}",
                     name_latex:"wavenumber",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0007427",
         properties:{reference_latex:"",
                     dimension_time: -1,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"v_{\rm Earth\ orbit}",
                     name_latex:"velocity of Earth's orbit around sun",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0007545",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Angle",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"\theta_2",
                     name_latex:"angle",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0007557",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Gravity_of_Earth",
                     dimension_time: -2,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"g_{\rm Earth}",
                     name_latex:"average acceleration due to gravity on Earth",
                     variable_or_constant:"constant",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
UNWIND [{id:"613891",
// [{'units': 'm * s^-2', 'value': '9.80665'}]
         properties:{number_power:,
                     number_decimal:,
                     author_name_latex:"ben",
                     dimension__unit:"",
                     dimension__unit:""}}] AS row
CREATE (n:value_with_units{id: row.id}) SET n += row.properties;
:begin
UNWIND [{start: {id:"0007557"}, end: {id:"613891"}, properties:{}}] AS row
MATCH (start:scalar{id: row.start.id})
MATCH (end:value_with_units{id: row.end.id})
CREATE (start)-[r:HAS_VALUE]->(end) SET r += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0007586",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Volume_(thermodynamics)",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:3,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"V",
                     name_latex:"volume",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0007652",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Distance",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"d_1",
                     name_latex:"distance",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0007752",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Quantum_mechanics",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"a_{\beta}",
                     name_latex:"none",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"complex",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0007882",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Intensity_(physics)",
                     dimension_time: -3,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:1,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"I",
                     name_latex:"intensity",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0007930",
         properties:{reference_latex:"",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"m",
                     name_latex:"index",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"integer",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0007940",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Vacuum_permittivity",
                     dimension_time: 2,
                     dimension_electric_charge:2,
                     dimension_luminous_intensity:0,
                     dimension_length:-3,
                     dimension_amount_of_substance:0,
                     dimension_mass:-1,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"\epsilon_0",
                     name_latex:"vacuum permittivity, permittivity of free space or electric constant or the distributed capacitance of the vacuum",
                     variable_or_constant:"constant",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
UNWIND [{id:"443694",
// [{'units': 'F/m', 'value': '8.8541878128E-{12}'}]
         properties:{number_power:,
                     number_decimal:,
                     author_name_latex:"ben",
                     dimension__unit:"",
                     dimension__unit:""}}] AS row
CREATE (n:value_with_units{id: row.id}) SET n += row.properties;
:begin
UNWIND [{start: {id:"0007940"}, end: {id:"443694"}, properties:{}}] AS row
MATCH (start:scalar{id: row.start.id})
MATCH (end:value_with_units{id: row.end.id})
CREATE (start)-[r:HAS_VALUE]->(end) SET r += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0007984",
         properties:{reference_latex:"",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"i",
                     name_latex:"index",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"integer",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0008039",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Enthalpy",
                     dimension_time: -2,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:2,
                     dimension_amount_of_substance:0,
                     dimension_mass:1,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"H",
                     name_latex:"enthalpy",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0008134",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Pressure",
                     dimension_time: -2,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:-1,
                     dimension_amount_of_substance:0,
                     dimension_mass:1,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"P",
                     name_latex:"pressure",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0008179",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Gas_constant",
                     dimension_time: -2,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:2,
                     dimension_amount_of_substance:-1,
                     dimension_mass:1,
                     dimension_temperature:-1,
                     description_latex:"",
                     latex:"R",
                     name_latex:"ideal gas constant",
                     variable_or_constant:"constant",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
UNWIND [{id:"179785",
// [{'units': 'J⋅K^{−1} mol^{−1}', 'value': '8.31446261815324'}]
         properties:{number_power:,
                     number_decimal:,
                     author_name_latex:"ben",
                     dimension__unit:"",
                     dimension__unit:""}}] AS row
CREATE (n:value_with_units{id: row.id}) SET n += row.properties;
:begin
UNWIND [{start: {id:"0008179"}, end: {id:"179785"}, properties:{}}] AS row
MATCH (start:scalar{id: row.start.id})
MATCH (end:value_with_units{id: row.end.id})
CREATE (start)-[r:HAS_VALUE]->(end) SET r += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0008251",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Intensity_(physics)",
                     dimension_time: -3,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:1,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"I_{\rm coherent}",
                     name_latex:"intensity of coherent waves",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0008257",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Voltage",
                     dimension_time: -2,
                     dimension_electric_charge:-1,
                     dimension_luminous_intensity:0,
                     dimension_length:2,
                     dimension_amount_of_substance:0,
                     dimension_mass:1,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"V_1",
                     name_latex:"voltage",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0008304",
         properties:{reference_latex:"",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"l",
                     name_latex:"index",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"integer",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0008330",
         properties:{reference_latex:"",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"\psi_0",
                     name_latex:"amplitude of wavefunction",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"complex",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0008339",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Unit_vector",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"\hat{x}",
                     name_latex:"unit vector",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0008349",
         properties:{reference_latex:"",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"\hat{x}_i",
                     name_latex:"ith unit vector",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0008379",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Langmuir_adsorption_model",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"k_{\rm desorption}",
                     name_latex:"constant of backward desorption reaction",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0008586",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Angle",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"\phi",
                     name_latex:"angle",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0008656",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Escape_velocity",
                     dimension_time: -1,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"v_{\rm escape}",
                     name_latex:"escape velocity",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0008697",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Electrical_resistance_and_conductance",
                     dimension_time: -1,
                     dimension_electric_charge:-2,
                     dimension_luminous_intensity:0,
                     dimension_length:2,
                     dimension_amount_of_substance:0,
                     dimension_mass:1,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"R_1",
                     name_latex:"electrical resistance",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0008721",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Voltage",
                     dimension_time: -2,
                     dimension_electric_charge:-1,
                     dimension_luminous_intensity:0,
                     dimension_length:2,
                     dimension_amount_of_substance:0,
                     dimension_mass:1,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"V_2",
                     name_latex:"voltage",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0008762",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Orbital_period",
                     dimension_time: 1,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"T_{\rm orbit}",
                     name_latex:"orbital period",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0008849",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Potential_energy",
                     dimension_time: -2,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:2,
                     dimension_amount_of_substance:0,
                     dimension_mass:1,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"PE_2",
                     name_latex:"potential energy",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0008909",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Velocity",
                     dimension_time: -1,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"v_{\rm final}",
                     name_latex:"final velocity",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0009046",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Langmuir_adsorption_model",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"p_A",
                     name_latex:"partial pressure of A over the surface",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0009067",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Langmuir_adsorption_model",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:-2,
                     dimension_amount_of_substance:1,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"[S]",
                     name_latex:"concentration of free sites in number per square meter",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0009107",
         properties:{reference_latex:"",
                     dimension_time: -1,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"v_y",
                     name_latex:"velocity along y axis",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0009139",
         properties:{reference_latex:"",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"a",
                     name_latex:"",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0009140",
         properties:{reference_latex:"",
                     dimension_time: -2,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"a",
                     name_latex:"acceleration",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0009189",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Debye_model#Debye_frequency",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"\omega_{\rm Debye}",
                     name_latex:"Debye frequency",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0009199",
         properties:{reference_latex:"",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"dx",
                     name_latex:"",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0009329",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Bra%E2%80%93ket_notation",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"|\psi \rangle",
                     name_latex:"ket",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"complex",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0009372",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Work_(physics)",
                     dimension_time: -2,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:2,
                     dimension_amount_of_substance:0,
                     dimension_mass:1,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"W_{\rm to\ system}",
                     name_latex:"work done to system",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0009398",
         properties:{reference_latex:"",
                     dimension_time: -2,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:2,
                     dimension_amount_of_substance:0,
                     dimension_mass:1,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"dW",
                     name_latex:"differential work",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0009431",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Velocity",
                     dimension_time: -1,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"v_{0, y}",
                     name_latex:"initial velocity along y axis",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0009432",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Heat",
                     dimension_time: -2,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:2,
                     dimension_amount_of_substance:0,
                     dimension_mass:1,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"Q",
                     name_latex:"heat flow",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0009472",
         properties:{reference_latex:"",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"\vec{r}",
                     name_latex:"radius vector",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0009489",
         properties:{reference_latex:"",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"\psi",
                     name_latex:"none",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"complex",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0009491",
         properties:{reference_latex:"",
                     dimension_time: 1,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"T",
                     name_latex:"period",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0009647",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Electric_current",
                     dimension_time: -1,
                     dimension_electric_charge:1,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"I_{\rm total}",
                     name_latex:"electric current",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0009669",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Kronecker_delta",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"\delta",
                     name_latex:"Kronecker delta",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0009690",
         properties:{reference_latex:"",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"k",
                     name_latex:"index",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"integer",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0009838",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Rydberg_constant",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"E_{\rm Rydberg}",
                     name_latex:"Rydberg energy",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0009843",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Joule%E2%80%93Thomson_effect#The_Joule%E2%80%93Thomson_(Kelvin)_coefficient",
                     dimension_time: 2,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:1,
                     dimension_amount_of_substance:0,
                     dimension_mass:-1,
                     dimension_temperature:1,
                     description_latex:"",
                     latex:"\mu_{JT}",
                     name_latex:"Joule-Thomson coefficient",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0009863",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Mass",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:1,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"m",
                     name_latex:"mass of atom or molecule",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"0009885",
         properties:{reference_latex:"https://en.wikipedia.org/wiki/Amplitude",
                     dimension_time: 0,
                     dimension_electric_charge:0,
                     dimension_luminous_intensity:0,
                     dimension_length:0,
                     dimension_amount_of_substance:0,
                     dimension_mass:0,
                     dimension_temperature:0,
                     description_latex:"",
                     latex:"A",
                     name_latex:"amplitude",
                     variable_or_constant:"variable",
                     author_name_latex:"ben",
                     scope:"real",
                     domain:"any"}}] AS row
CREATE (n:scalar{id: row.id}) SET n += row.properties SET n:symbol;
:commit
CALL db.awaitIndexes(300);
