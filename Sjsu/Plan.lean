import Mathlib.Data.Finset.Basic
import Sjsu.Types
import Sjsu.Courses
import Sjsu.Semesters
import Sjsu.Requirements

def courses_taken (sem : Semester) (courses : Finset Course) :=
  Finset.image
    ({ course := ·, sem := sem : CourseRegistration })
    courses

def transfer_credit : Finset CourseRegistration :=
  courses_taken before_college {
    arth_70a,
    arth_70b,
    chin_1a,
    chin_1a_trld_test,
    cs_46a,
    trld_5a_5c,
    trai_us2_trld_4,
    geog_10,
    hist_20a,
    hist_20b,
    math_30,
    math_31,
    music_theory_trld_test,
    phys_50,
    phys_51,
    stat_95,
    econ_1b,
    math_016_trld_2,
    phil_271_trld_3b,
    math_141_trld_2,
    math_242_trld_2
  }

def fall_25 : Finset CourseRegistration :=
  courses_taken fall_2025 {
    biol_10,
    math_42,
    math_33la,
    ise_130,
    cmpe_30
  }

def spring_26 : Finset CourseRegistration :=
  courses_taken spring_2026 {
    cmpe_50,
    ee_97,
    ee_98,
    engl_1a,
    comm_20,
    engr_10
  }

def fall_26 : Finset CourseRegistration :=
  courses_taken fall_2026 {
    engl_1b,
    math_32,
    cmpe_70,
    cmpe_110,
    -- cmpe_124, (removed)
    cmpe_126
  }

def spring_27 : Finset CourseRegistration :=
  courses_taken spring_2027 {
    cmpe_152, -- elective (compiler design)
    cmpe_138, -- elective (database systems)
    cmpe_188, -- elective (machine learning)
    cmpe_125,
    cmpe_131,
    engr_100w
  }

def summer_27 : Finset CourseRegistration :=
  courses_taken summer_2027 {
    hist_189b, -- us_3
    ccs_25, -- ge_6
    nufs_163 -- ge_ud_2_5
  }

def fall_27 : Finset CourseRegistration :=
  courses_taken fall_2027 {
    cmpe_195a, -- senior design (also GE UD 4)
    engr_195a,
    cmpe_127, -- microproc design
    cmpe_140, -- computer architecture
    cmpe_142 -- operating systems
  }

def spring_28 : Finset CourseRegistration :=
  courses_taken spring_2028 {
    cmpe_195b,
    engr_195b,
    cmpe_148, -- computer networks I
    cmpe_146 -- real-time embedded
  }

def current_plan : Plan := {
  name := "current",
  taken := transfer_credit
    ∪ fall_25
    ∪ spring_26
    ∪ fall_26
    ∪ spring_27
    ∪ summer_27
    ∪ fall_27
    ∪ spring_28
}

set_option maxRecDepth 10000

theorem current_plan_ges : ge_req_met current_plan := by
  rw [ge_req_met, ge_core_req, ge_req_ud, ge_req_us]
  repeat
    constructor
    decide
  decide

theorem current_plan_cmpe : cmpe_req_met current_plan := by
  constructor
  · decide
  · decide

