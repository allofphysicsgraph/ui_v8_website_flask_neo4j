:begin
UNWIND [{id:"000001",
         properties:{abstract_latex:"",
                     name_latex:"Euler equation proof",
                     reference_latex:"",
                     author_name_latex:"ben"}}] AS row
CREATE (n:derivation{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"000002",
         properties:{abstract_latex:"",
                     name_latex:"Euler equation: trig square root",
                     reference_latex:"",
                     author_name_latex:"ben"}}] AS row
CREATE (n:derivation{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"000003",
         properties:{abstract_latex:"",
                     name_latex:"Euler equation: trigonometric relations",
                     reference_latex:"",
                     author_name_latex:"ben"}}] AS row
CREATE (n:derivation{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"000004",
         properties:{abstract_latex:"",
                     name_latex:"Maxwell equations to electric field wave equation",
                     reference_latex:"",
                     author_name_latex:"ben"}}] AS row
CREATE (n:derivation{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"000005",
         properties:{abstract_latex:"",
                     name_latex:"curl curl identity",
                     reference_latex:"",
                     author_name_latex:"ben"}}] AS row
CREATE (n:derivation{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"000006",
         properties:{abstract_latex:"",
                     name_latex:"derivation of Schrodinger Equation",
                     reference_latex:"",
                     author_name_latex:"ben"}}] AS row
CREATE (n:derivation{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"000007",
         properties:{abstract_latex:"",
                     name_latex:"electric field wave equation: from time dependent to time independent",
                     reference_latex:"",
                     author_name_latex:"ben"}}] AS row
CREATE (n:derivation{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"000008",
         properties:{abstract_latex:"",
                     name_latex:"frequency relations",
                     reference_latex:"",
                     author_name_latex:"ben"}}] AS row
CREATE (n:derivation{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"000009",
         properties:{abstract_latex:"",
                     name_latex:"integration by parts",
                     reference_latex:"",
                     author_name_latex:"ben"}}] AS row
CREATE (n:derivation{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"000010",
         properties:{abstract_latex:"",
                     name_latex:"particle in a 1D box",
                     reference_latex:"",
                     author_name_latex:"ben"}}] AS row
CREATE (n:derivation{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"000011",
         properties:{abstract_latex:"",
                     name_latex:"quadratic equation derivation",
                     reference_latex:"https://en.wikipedia.org/wiki/Quadratic_formula#Derivations_of_the_formula",
                     author_name_latex:"ben"}}] AS row
CREATE (n:derivation{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"000012",
         properties:{abstract_latex:"",
                     name_latex:"quantum basics Hermitian operators have realvalued observables",
                     reference_latex:"",
                     author_name_latex:"ben"}}] AS row
CREATE (n:derivation{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"000013",
         properties:{abstract_latex:"",
                     name_latex:"quantum basics orthogonality",
                     reference_latex:"",
                     author_name_latex:"ben"}}] AS row
CREATE (n:derivation{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"000014",
         properties:{abstract_latex:"",
                     name_latex:"variance relation",
                     reference_latex:"",
                     author_name_latex:"ben"}}] AS row
CREATE (n:derivation{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"000015",
         properties:{abstract_latex:"",
                     name_latex:"Compton's equation for scattering",
                     reference_latex:"",
                     author_name_latex:"ben"}}] AS row
CREATE (n:derivation{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"000016",
         properties:{abstract_latex:"",
                     name_latex:"identity sin(2 x) = 2 sin(x) cos(x) using Euler's equation",
                     reference_latex:"",
                     author_name_latex:"ben"}}] AS row
CREATE (n:derivation{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"000017",
         properties:{abstract_latex:"",
                     name_latex:"Euler equation to e^(i pi) + 1 = 0",
                     reference_latex:"",
                     author_name_latex:"ben"}}] AS row
CREATE (n:derivation{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"000018",
         properties:{abstract_latex:"",
                     name_latex:"time invariant force conserves energy",
                     reference_latex:"",
                     author_name_latex:"ben"}}] AS row
CREATE (n:derivation{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"129143",
         properties:{abstract_latex:"",
                     name_latex:"escape velocity",
                     reference_latex:"",
                     author_name_latex:"ben"}}] AS row
CREATE (n:derivation{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"142831",
         properties:{abstract_latex:"",
                     name_latex:"Schwarzschild radius for non-rotating black hole",
                     reference_latex:"https://en.wikipedia.org/wiki/Derivation_of_the_Schwarzschild_solution",
                     author_name_latex:"ben"}}] AS row
CREATE (n:derivation{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"146432",
         properties:{abstract_latex:"",
                     name_latex:"coefficient of thermal expansion using the equation of state for an ideal gas",
                     reference_latex:"https://notendur.hi.is/hj/EE2/HD1lausn.pdf",
                     author_name_latex:"ben"}}] AS row
CREATE (n:derivation{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"187793",
         properties:{abstract_latex:"",
                     name_latex:"equations of motion in 2D (calculus)",
                     reference_latex:"",
                     author_name_latex:"ben"}}] AS row
CREATE (n:derivation{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"201726",
         properties:{abstract_latex:"",
                     name_latex:"angle of maximum distance for projectile motion",
                     reference_latex:"",
                     author_name_latex:"ben"}}] AS row
CREATE (n:derivation{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"207210",
         properties:{abstract_latex:"from https://www.youtube.com/watch?v=fJYdFIZlD8k",
                     name_latex:"Newton's Law of Gravitation",
                     reference_latex:"",
                     author_name_latex:"ben"}}] AS row
CREATE (n:derivation{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"282755",
         properties:{abstract_latex:"",
                     name_latex:"radius for satellite in geostationary orbit",
                     reference_latex:"https://en.wikipedia.org/wiki/Geostationary_orbit#Derivation_of_geostationary_altitude",
                     author_name_latex:"ben"}}] AS row
CREATE (n:derivation{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"332170",
         properties:{abstract_latex:"",
                     name_latex:"equations of motion in 1D with constant acceleration - SUVAT (algebra)",
                     reference_latex:"https://en.wikipedia.org/wiki/Equations_of_motion",
                     author_name_latex:"ben"}}] AS row
CREATE (n:derivation{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"374317",
         properties:{abstract_latex:"https://www.youtube.com/watch?v=5F1XcTjpJs4 - Derivation of Gravitational Potential Energy by Rhett Allain",
                     name_latex:"velocity at distance r of object dropped from infinity",
                     reference_latex:"",
                     author_name_latex:"ben"}}] AS row
CREATE (n:derivation{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"375160",
         properties:{abstract_latex:"",
                     name_latex:"coefficient of isothermal compressibility using the equation of state for an ideal gas",
                     reference_latex:"https://notendur.hi.is/hj/EE2/HD1lausn.pdf",
                     author_name_latex:"ben"}}] AS row
CREATE (n:derivation{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"387954",
         properties:{abstract_latex:"from \cite{1999_Tipler_Llewellyn}, page 9",
                     name_latex:"speed of Earth around Sun",
                     reference_latex:"",
                     author_name_latex:"ben"}}] AS row
CREATE (n:derivation{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"513999",
         properties:{abstract_latex:"https://www.youtube.com/watch?v=QTiqF-HtkS0 and https://www.youtube.com/watch?v=3Yls-t3B49U",
                     name_latex:"first law of thermodynamics",
                     reference_latex:"",
                     author_name_latex:"ben"}}] AS row
CREATE (n:derivation{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"522862",
         properties:{abstract_latex:"\cite{2001_HRW}; see figure 34-27 on page 824",
                     name_latex:"optics: Law of refraction to Brewster's angle",
                     reference_latex:"",
                     author_name_latex:"ben"}}] AS row
CREATE (n:derivation{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"527822",
         properties:{abstract_latex:"",
                     name_latex:"mass of the Earth",
                     reference_latex:"",
                     author_name_latex:"ben"}}] AS row
CREATE (n:derivation{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"539398",
         properties:{abstract_latex:"",
                     name_latex:"double intensity when phase is coherent (optics)",
                     reference_latex:"",
                     author_name_latex:"ben"}}] AS row
CREATE (n:derivation{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"551770",
         properties:{abstract_latex:"source: \cite{1999_Tipler_Llewellyn}, page 21; see also https://en.wikipedia.org/wiki/Lorentz_transformation and https://en.wikipedia.org/wiki/Derivations_of_the_Lorentz_transformations",
                     name_latex:"Lorentz transformation",
                     reference_latex:"",
                     author_name_latex:"ben"}}] AS row
CREATE (n:derivation{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"608598",
         properties:{abstract_latex:"",
                     name_latex:"upper limit on velocity in condensed matter",
                     reference_latex:"https://arxiv.org/pdf/2004.04818.pdf",
                     author_name_latex:"ben"}}] AS row
CREATE (n:derivation{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"670255",
         properties:{abstract_latex:"",
                     name_latex:"equation of motion for a spring",
                     reference_latex:"",
                     author_name_latex:"ben"}}] AS row
CREATE (n:derivation{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"681943",
         properties:{abstract_latex:"",
                     name_latex:"total electrical resistance for circuit with two resistors in parallel",
                     reference_latex:"http://www.dfcd.net/articles/derivations/resistors.html",
                     author_name_latex:"ben"}}] AS row
CREATE (n:derivation{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"713234",
         properties:{abstract_latex:"",
                     name_latex:"hyperbolic trigonometric identities",
                     reference_latex:"http://www.physics.miami.edu/~nearing/mathmethods/mathematical_methods-one.pdf",
                     author_name_latex:"ben"}}] AS row
CREATE (n:derivation{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"764666",
         properties:{abstract_latex:"from https://arxiv.org/pdf/2210.12150.pdf",
                     name_latex:"Langmuir Adsorption",
                     reference_latex:"",
                     author_name_latex:"ben"}}] AS row
CREATE (n:derivation{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"820976",
         properties:{abstract_latex:"",
                     name_latex:"Kepler's Third Law: period squared propto distance cubed",
                     reference_latex:"https://en.wikipedia.org/wiki/Kepler%27s_laws_of_planetary_motion#Third_law",
                     author_name_latex:"ben"}}] AS row
CREATE (n:derivation{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"884319",
         properties:{abstract_latex:"subset of the frequency relation derivation. Intended for display on the homepage",
                     name_latex:"frequency and period",
                     reference_latex:"",
                     author_name_latex:"ben"}}] AS row
CREATE (n:derivation{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"909006",
         properties:{abstract_latex:"",
                     name_latex:"total electrical resistance for circuit with two resistors in series",
                     reference_latex:"http://www.dfcd.net/articles/derivations/resistors.html",
                     author_name_latex:"ben"}}] AS row
CREATE (n:derivation{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"918264",
         properties:{abstract_latex:"Using the 2D equations of motion, show that projectile path is second order polynomial of the form y = a x^2 + b x + c",
                     name_latex:"projectile path in 2D is parabolic",
                     reference_latex:"",
                     author_name_latex:"ben"}}] AS row
CREATE (n:derivation{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
:begin
UNWIND [{id:"920011",
         properties:{abstract_latex:"",
                     name_latex:"work and force and energy",
                     reference_latex:"",
                     author_name_latex:"ben"}}] AS row
CREATE (n:derivation{id: row.id}) SET n += row.properties;
:commit
CALL db.awaitIndexes(300);
