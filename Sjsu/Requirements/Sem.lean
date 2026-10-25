import Sjsu.Semesters

def Requirements.Semesters (p : Plan) : Prop :=
  sem_units fall_2025 p ≤ 17
  ∧ sem_units spring_2026 p ≤ 19
  ∧ sem_units fall_2026 p ≤ 19
  ∧ sem_units summer_2027 p ≤ 12
  ∧ sem_units spring_2027 p ≤ 19
  ∧ sem_units fall_2027 p ≤ 19
  ∧ sem_units spring_2028 p ≤ 19

instance (p : Plan) : Decidable (Requirements.Semesters p) := by
  rw [Requirements.Semesters]
  infer_instance

