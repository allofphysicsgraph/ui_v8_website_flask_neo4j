[
  {
    "variable": "F",
    "description": "Net force acting on the object.",
    "references": [
      "eq_newton_second_law",
      "eq_force_ma_derivative",
      "eq_hookes_law",
      "eq_force_equality"
    ],
    "category_type": "scalar",
    "scalar_type": "variable",
    "value_type": "real",
    "sign_type": "any",
    "dimensionality": {
      "mass": 1,
      "time": -2,
      "length": 1,
      "temperature": 0,
      "electric_charge": 0,
      "amount_of_substance": 0,
      "luminous_intensity": 0
    }
  },
  {
    "variable": "m",
    "description": "Mass of the oscillator.",
    "references": [
      "eq_newton_second_law",
      "eq_force_ma_derivative",
      "eq_force_equality",
      "eq_normalized_ode",
      "eq_omega_squared_def",
      "eq_omega_definition",
      "eq_specific_solution",
      "eq_freq_derivation_step",
      "eq_frequency_formula",
      "eq_period_formula"
    ],
    "category_type": "scalar",
    "scalar_type": "constant",
    "value_type": "real",
    "sign_type": "positive",
    "dimensionality": {
      "mass": 1,
      "time": 0,
      "length": 0,
      "temperature": 0,
      "electric_charge": 0,
      "amount_of_substance": 0,
      "luminous_intensity": 0
    }
  },
  {
    "variable": "a",
    "description": "Acceleration of the object.",
    "references": [
      "eq_newton_second_law",
      "eq_a_derivative_op",
      "eq_accel_cos",
      "eq_acceleration_pos_form",
      "eq_a_max"
    ],
    "category_type": "scalar",
    "scalar_type": "variable",
    "value_type": "real",
    "sign_type": "any",
    "dimensionality": {
      "mass": 0,
      "time": -2,
      "length": 1,
      "temperature": 0,
      "electric_charge": 0,
      "amount_of_substance": 0,
      "luminous_intensity": 0
    }
  },
  {
    "variable": "x",
    "description": "Displacement from the equilibrium position.",
    "references": [
      "eq_force_ma_derivative",
      "eq_hookes_law",
      "eq_force_equality",
      "eq_normalized_ode",
      "eq_ode_with_omega",
      "eq_general_solution",
      "eq_eval_pos_zero",
      "eq_c1_is_x0",
      "eq_specific_solution",
      "eq_amplitude_phase_form",
      "eq_trig_expansion",
      "x_squared",
      "eq_v_squared_final",
      "eq_speed_pos_form",
      "eq_acceleration_pos_form"
    ],
    "category_type": "scalar",
    "scalar_type": "variable",
    "value_type": "real",
    "sign_type": "any",
    "dimensionality": {
      "mass": 0,
      "time": 0,
      "length": 1,
      "temperature": 0,
      "electric_charge": 0,
      "amount_of_substance": 0,
      "luminous_intensity": 0
    }
  },
  {
    "variable": "t",
    "description": "Time.",
    "references": [
      "eq_force_ma_derivative",
      "eq_normalized_ode",
      "eq_ode_with_omega",
      "eq_general_solution",
      "eq_velocity_def",
      "eq_velocity_derivation",
      "eq_specific_solution",
      "eq_amplitude_phase_form",
      "eq_trig_expansion",
      "eq_velocity_time_form",
      "eq_v_squared",
      "eq_v_squared_trig",
      "x_squared",
      "eq_accel_cos"
    ],
    "category_type": "scalar",
    "scalar_type": "variable",
    "value_type": "real",
    "sign_type": "non-negative",
    "dimensionality": {
      "mass": 0,
      "time": 1,
      "length": 0,
      "temperature": 0,
      "electric_charge": 0,
      "amount_of_substance": 0,
      "luminous_intensity": 0
    }
  },
  {
    "variable": "k",
    "description": "Spring constant (restoring force constant).",
    "references": [
      "eq_hookes_law",
      "eq_force_equality",
      "eq_normalized_ode",
      "eq_omega_squared_def",
      "eq_omega_definition",
      "eq_specific_solution",
      "eq_freq_derivation_step",
      "eq_frequency_formula",
      "eq_period_formula"
    ],
    "category_type": "scalar",
    "scalar_type": "constant",
    "value_type": "real",
    "sign_type": "positive",
    "dimensionality": {
      "mass": 1,
      "time": -2,
      "length": 0,
      "temperature": 0,
      "electric_charge": 0,
      "amount_of_substance": 0,
      "luminous_intensity": 0
    }
  },
  {
    "variable": "\\omega",
    "description": "Angular frequency.",
    "references": [
      "eq_omega_squared_def",
      "eq_omega_definition",
      "eq_ode_with_omega",
      "eq_general_solution",
      "eq_velocity_derivation",
      "eq_eval_vel_zero",
      "eq_vel_c2_relation",
      "eq_c2_is_v0_omega",
      "eq_amplitude_phase_form",
      "eq_trig_expansion",
      "eq_velocity_time_form",
      "eq_v_max",
      "eq_v_squared",
      "eq_v_squared_trig",
      "eq_v_squared_final",
      "eq_speed_pos_form",
      "eq_accel_cos",
      "eq_acceleration_pos_form",
      "eq_a_max",
      "eq_omega_frequency_relation",
      "eq_freq_derivation_step"
    ],
    "category_type": "scalar",
    "scalar_type": "constant",
    "value_type": "real",
    "sign_type": "positive",
    "dimensionality": {
      "mass": 0,
      "time": -1,
      "length": 0,
      "temperature": 0,
      "electric_charge": 0,
      "amount_of_substance": 0,
      "luminous_intensity": 0
    }
  },
  {
    "variable": "c_1",
    "description": "First constant of integration, representing initial position.",
    "references": [
      "eq_general_solution",
      "eq_eval_pos_zero",
      "eq_c1_is_x0",
      "eq_velocity_derivation",
      "eq_eval_vel_zero",
      "eq_coeff_c1",
      "eq_pythagorean_sum",
      "eq_pythagorean_factor",
      "eq_amplitude_def",
      "eq_tangent_ratio",
      "eq_phase_def",
      "eq_complex_magnitude",
      "eq_complex_argument"
    ],
    "category_type": "scalar",
    "scalar_type": "constant",
    "value_type": "real",
    "sign_type": "any",
    "dimensionality": {
      "mass": 0,
      "time": 0,
      "length": 1,
      "temperature": 0,
      "electric_charge": 0,
      "amount_of_substance": 0,
      "luminous_intensity": 0
    }
  },
  {
    "variable": "c_2",
    "description": "Second constant of integration, related to initial velocity.",
    "references": [
      "eq_general_solution",
      "eq_eval_pos_zero",
      "eq_velocity_derivation",
      "eq_eval_vel_zero",
      "eq_vel_c2_relation",
      "eq_c2_is_v0_omega",
      "eq_coeff_c2",
      "eq_pythagorean_sum",
      "eq_pythagorean_factor",
      "eq_amplitude_def",
      "eq_tangent_ratio",
      "eq_phase_def",
      "eq_complex_magnitude",
      "eq_complex_argument"
    ],
    "category_type": "scalar",
    "scalar_type": "constant",
    "value_type": "real",
    "sign_type": "any",
    "dimensionality": {
      "mass": 0,
      "time": 0,
      "length": 1,
      "temperature": 0,
      "electric_charge": 0,
      "amount_of_substance": 0,
      "luminous_intensity": 0
    }
  },
  {
    "variable": "x_0",
    "description": "Initial position at t=0.",
    "references": [
      "eq_c1_is_x0",
      "eq_specific_solution"
    ],
    "category_type": "scalar",
    "scalar_type": "constant",
    "value_type": "real",
    "sign_type": "any",
    "dimensionality": {
      "mass": 0,
      "time": 0,
      "length": 1,
      "temperature": 0,
      "electric_charge": 0,
      "amount_of_substance": 0,
      "luminous_intensity": 0
    }
  },
  {
    "variable": "v",
    "description": "Velocity of the object.",
    "references": [
      "eq_velocity_def",
      "eq_velocity_derivation",
      "eq_eval_vel_zero",
      "eq_vel_c2_relation",
      "eq_v_derivative_op",
      "eq_velocity_time_form",
      "eq_v_squared",
      "eq_v_squared_trig",
      "eq_v_squared_final",
      "eq_speed_pos_form",
      "eq_a_derivative_op"
    ],
    "category_type": "scalar",
    "scalar_type": "variable",
    "value_type": "real",
    "sign_type": "any",
    "dimensionality": {
      "mass": 0,
      "time": -1,
      "length": 1,
      "temperature": 0,
      "electric_charge": 0,
      "amount_of_substance": 0,
      "luminous_intensity": 0
    }
  },
  {
    "variable": "v_0",
    "description": "Initial velocity at t=0.",
    "references": [
      "eq_c2_is_v0_omega",
      "eq_specific_solution"
    ],
    "category_type": "scalar",
    "scalar_type": "constant",
    "value_type": "real",
    "sign_type": "any",
    "dimensionality": {
      "mass": 0,
      "time": -1,
      "length": 1,
      "temperature": 0,
      "electric_charge": 0,
      "amount_of_substance": 0,
      "luminous_intensity": 0
    }
  },
  {
    "variable": "A",
    "description": "Amplitude of the oscillation.",
    "references": [
      "eq_amplitude_phase_form",
      "eq_trig_expansion",
      "eq_coeff_c1",
      "eq_coeff_c2",
      "eq_pythagorean_sum",
      "eq_pythagorean_factor",
      "eq_amplitude_def",
      "eq_tangent_ratio",
      "eq_complex_magnitude",
      "eq_velocity_time_form",
      "eq_v_max",
      "eq_v_squared",
      "eq_v_squared_trig",
      "x_squared",
      "eq_v_squared_final",
      "eq_speed_pos_form",
      "eq_accel_cos",
      "eq_a_max"
    ],
    "category_type": "scalar",
    "scalar_type": "constant",
    "value_type": "real",
    "sign_type": "non-negative",
    "dimensionality": {
      "mass": 0,
      "time": 0,
      "length": 1,
      "temperature": 0,
      "electric_charge": 0,
      "amount_of_substance": 0,
      "luminous_intensity": 0
    }
  },
  {
    "variable": "\\phi",
    "description": "Phase shift constant.",
    "references": [
      "eq_amplitude_phase_form",
      "eq_trig_expansion",
      "eq_coeff_c1",
      "eq_coeff_c2",
      "eq_pythagorean_sum",
      "eq_pythagorean_factor",
      "euler_eq",
      "eq_tangent_ratio",
      "eq_phase_def",
      "eq_complex_argument",
      "eq_velocity_time_form",
      "eq_v_squared",
      "eq_v_squared_trig",
      "x_squared",
      "eq_accel_cos"
    ],
    "category_type": "scalar",
    "scalar_type": "constant",
    "value_type": "real",
    "sign_type": "any",
    "dimensionality": {
      "mass": 0,
      "time": 0,
      "length": 0,
      "temperature": 0,
      "electric_charge": 0,
      "amount_of_substance": 0,
      "luminous_intensity": 0
    }
  },
  {
    "variable": "\\alpha",
    "description": "Arbitrary variable used in trigonometric identity.",
    "references": [
      "cos_difference"
    ],
    "category_type": "scalar",
    "scalar_type": "variable",
    "value_type": "real",
    "sign_type": "any",
    "dimensionality": {
      "mass": 0,
      "time": 0,
      "length": 0,
      "temperature": 0,
      "electric_charge": 0,
      "amount_of_substance": 0,
      "luminous_intensity": 0
    }
  },
  {
    "variable": "\\beta",
    "description": "Arbitrary variable used in trigonometric identity.",
    "references": [
      "cos_difference",
      "sin_squared"
    ],
    "category_type": "scalar",
    "scalar_type": "variable",
    "value_type": "real",
    "sign_type": "any",
    "dimensionality": {
      "mass": 0,
      "time": 0,
      "length": 0,
      "temperature": 0,
      "electric_charge": 0,
      "amount_of_substance": 0,
      "luminous_intensity": 0
    }
  },
  {
    "variable": "i",
    "description": "The imaginary unit.",
    "references": [
      "eq_complex_magnitude",
      "eq_complex_argument"
    ],
    "category_type": "scalar",
    "scalar_type": "constant",
    "value_type": "complex",
    "sign_type": "any",
    "dimensionality": {
      "mass": 0,
      "time": 0,
      "length": 0,
      "temperature": 0,
      "electric_charge": 0,
      "amount_of_substance": 0,
      "luminous_intensity": 0
    }
  },
  {
    "variable": "v_{\\rm max}",
    "description": "Maximum speed of the oscillator.",
    "references": [
      "eq_v_max"
    ],
    "category_type": "scalar",
    "scalar_type": "constant",
    "value_type": "real",
    "sign_type": "positive",
    "dimensionality": {
      "mass": 0,
      "time": -1,
      "length": 1,
      "temperature": 0,
      "electric_charge": 0,
      "amount_of_substance": 0,
      "luminous_intensity": 0
    }
  },
  {
    "variable": "a_{\\rm max}",
    "description": "Maximum acceleration of the oscillator.",
    "references": [
      "eq_a_max"
    ],
    "category_type": "scalar",
    "scalar_type": "constant",
    "value_type": "real",
    "sign_type": "positive",
    "dimensionality": {
      "mass": 0,
      "time": -2,
      "length": 1,
      "temperature": 0,
      "electric_charge": 0,
      "amount_of_substance": 0,
      "luminous_intensity": 0
    }
  },
  {
    "variable": "f",
    "description": "Frequency of oscillation.",
    "references": [
      "eq_omega_frequency_relation",
      "eq_freq_derivation_step",
      "eq_frequency_formula",
      "eq_period_def"
    ],
    "category_type": "scalar",
    "scalar_type": "constant",
    "value_type": "real",
    "sign_type": "positive",
    "dimensionality": {
      "mass": 0,
      "time": -1,
      "length": 0,
      "temperature": 0,
      "electric_charge": 0,
      "amount_of_substance": 0,
      "luminous_intensity": 0
    }
  },
  {
    "variable": "T",
    "description": "Period of oscillation.",
    "references": [
      "eq_period_def",
      "eq_period_formula"
    ],
    "category_type": "scalar",
    "scalar_type": "constant",
    "value_type": "real",
    "sign_type": "positive",
    "dimensionality": {
      "mass": 0,
      "time": 1,
      "length": 0,
      "temperature": 0,
      "electric_charge": 0,
      "amount_of_substance": 0,
      "luminous_intensity": 0
    }
  },
  {
    "variable": "\\pi",
    "description": "Mathematical constant pi.",
    "references": [
      "eq_omega_frequency_relation",
      "eq_freq_derivation_step",
      "eq_frequency_formula",
      "eq_period_formula"
    ],
    "category_type": "scalar",
    "scalar_type": "constant",
    "value_type": "real",
    "sign_type": "positive",
    "dimensionality": {
      "mass": 0,
      "time": 0,
      "length": 0,
      "temperature": 0,
      "electric_charge": 0,
      "amount_of_substance": 0,
      "luminous_intensity": 0
    }
  }
]