import Sjsu.Semesters

structure Requirements.Semesters (p : Plan) where
  sem_fa25 : sem_units fall_2025 p ≤ 17
  sem_sp26 : sem_units spring_2026 p ≤ 19
  sem_fa26 : sem_units fall_2026 p ≤ 19
  sem_sp27 : sem_units spring_2027 p ≤ 19
  sem_fa27 : sem_units fall_2027 p ≤ 19
  sem_sp218 : sem_units spring_2028 p ≤ 19
