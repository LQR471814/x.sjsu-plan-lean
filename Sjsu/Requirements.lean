import Mathlib.Data.Finset.Basic
import Mathlib.Data.Set.Basic
import Mathlib.Data.Set.Finite.Basic
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Sjsu.Types
import Sjsu.Courses
import Sjsu.Categories
import Sjsu.Semesters

def cat_units (cat : Set Course) (p : Plan) [DecidablePred (· ∈ cat)] :=
  let courses : Finset Course := course_regs p.taken
  let present : Finset Course := Finset.filter (· ∈ cat) courses
  Finset.sum present (·.units)

def sem_units (sem : Semester) (p : Plan) :=
  let sem_reg := Finset.filter (·.sem = sem) p.taken
  Finset.sum sem_reg (·.course.units)

-- Core GE reqs
def ge_core_req (p : Plan) := (
  (
    cat_units ge_1a p ≥ 3 ∧
    -- cat_units ge_1b p ≥ 3 ∧  -- fulfilled upon completion of major
    cat_units ge_1c p ≥ 3
  ) ∧ (
    cat_units ge_2 p ≥ 3
  ) ∧ (
    cat_units ge_3a p ≥ 3 ∧
    cat_units ge_3b p ≥ 3
  ) ∧ (
    cat_units ge_4 p ≥ 6
  ) ∧ (
    cat_units ge_5a p ≥ 3 ∧
    cat_units ge_5b p ≥ 3 ∧
    cat_units ge_5c p ≥ 1
  ) ∧ (
    cat_units ge_6 p ≥ 3
  )
)

-- Upper Division GE reqs
def ge_req_ud (p : Plan) := (
  cat_units (ge_ud_2 ∪ ge_ud_5 ∪ ge_ud_3 ∪ ge_ud_4) p ≥ 9 ∧
  (cat_units ge_ud_2 p ≥ 3 ∨ cat_units ge_ud_5 p ≥ 3) ∧
  cat_units ge_ud_3 p ≥ 3 ∧
  cat_units ge_ud_4 p ≥ 3
)

-- American Institutions GE reqs
def ge_req_us (p : Plan) := (
  cat_units us1 p > 0 ∧
  cat_units us2 p > 0 ∧
  cat_units us3 p > 0 ∧
  (cat_units us1 p + cat_units us2 p + cat_units us3 p) ≥ 6
)

-- All GE requirements
def ge_req_met (p : Plan) :=
  cat_units Set.univ p ≥ 120 ∧
  cat_units wid p > 0 ∧
  ge_core_req p ∧
  ge_req_ud p ∧
  ge_req_us p ∧
  sem_units fall_2025 p ≤ 17 ∧
  sem_units spring_2026 p ≤ 19 ∧
  sem_units fall_2026 p ≤ 19 ∧
  sem_units spring_2027 p ≤ 19 ∧
  sem_units fall_2027 p ≤ 19 ∧
  sem_units spring_2028 p ≤ 19
  -- assume good standing (gpa ≥ 2.0)

-- All required courses for CMPE
def cmpe_req_courses : Finset Course := {
  -- CMPE core courses
  -- biol_10, (removed for CMPE)
  cmpe_30,
  cmpe_50,
  engl_1b,
  ee_97,
  ee_98,
  engr_10,
  -- CMPE required courses
  cmpe_70,
  cmpe_110,
  -- cmpe_124, (combined into CMPE 125)
  cmpe_125,
  cmpe_126,
  cmpe_127,
  -- cmpe_130, (removed)
  cmpe_131,
  cmpe_140,
  cmpe_142,
  cmpe_146,
  cmpe_148,
  -- cmpe_152, (removed)
  cmpe_195a,
  engr_195a,
  cmpe_195b,
  engr_195b
}

def cmpe_ud_electives : Finset Course := {
  cmpe_130,
  cmpe_132,
  cmpe_133,
  cmpe_135,
  cmpe_137,
  cmpe_138,
  cmpe_139,
  cmpe_152,
  cmpe_163,
  cmpe_165,
  cmpe_172,
  cmpe_181,
  cmpe_182,
  cmpe_183,
  cmpe_184,
  cmpe_185,
  cmpe_187,
  cmpe_188,
  cmpe_189,
  se_139
}

def cmpe_req_met (p : Plan) :=
  cmpe_req_courses ⊆ course_regs p.taken ∧
  cat_units cmpe_ud_electives p ≥ 7

-- pre-req: other class must be taken strictly before taking this class
-- co-req: pre-req but class can also be taken simultaneously

