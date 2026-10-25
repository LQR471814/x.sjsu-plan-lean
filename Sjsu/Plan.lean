import Mathlib.Data.Finset.Basic
import Mathlib.Data.Finset.Sort
import Mathlib.Data.String.Basic
import Sjsu.Types
import Sjsu.Courses
import Sjsu.Semesters
import Sjsu.Requirements.GE
import Sjsu.Requirements.Sem
import Sjsu.Requirements.CMPE
import Sjsu.Requirements.Prereqs

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
    ccs_25 -- ge_6
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
    engr_195b, cmpe_148, -- computer networks I
    cmpe_146, -- real-time embedded
    nufs_163 -- ge_ud_2_5
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

theorem current_plan_ge_core : Requirements.GeneralEducation.Core current_plan :=
  ⟨by native_decide,   -- req_1a
   by native_decide,   -- req_1c
   by native_decide,   -- req_2
   by native_decide,   -- req_3a
   by native_decide,   -- req_3b
   by native_decide,   -- req_4
   by native_decide,   -- req_5a
   by native_decide,   -- req_5b
   by native_decide,   -- req_5c
   by native_decide⟩   -- req_6

theorem current_plan_ge_ud : Requirements.GeneralEducation.UpperDivision current_plan :=
  ⟨by native_decide,   -- req_1
   by native_decide,   -- req_2
   by native_decide,   -- req_3
   by native_decide⟩   -- req_4

theorem current_plan_ge_us : Requirements.GeneralEducation.AmericanInstitutions current_plan :=
  ⟨by native_decide,   -- req_1
   by native_decide,   -- req_2
   by native_decide,   -- req_3
   by native_decide⟩   -- req_4

theorem current_plan_ges : Requirements.GeneralEducation current_plan :=
  ⟨by native_decide,          -- req_units
   by native_decide,          -- req_wid
   current_plan_ge_core,      -- req_core
   current_plan_ge_ud,        -- req_ud
   current_plan_ge_us⟩        -- req_us

theorem current_plan_cmpe : Requirements.CMPE.Major current_plan :=
  ⟨by native_decide,   -- req_courses
   by native_decide⟩   -- req_electives

theorem current_plan_prereqs : Requirements.Prereqs current_plan :=
  ⟨by native_decide,          -- prq_cmpe_152
   by native_decide,          -- prq_cmpe_138
   by native_decide,          -- prq_cmpe_188
   by native_decide,          -- prq_cmpe_125
   by native_decide,          -- prq_cmpe_131
   by native_decide,          -- prq_engr_100w
   current_plan_ge_ud,        -- prq_hist_189b
   trivial,                   -- prq_ccs_25
   trivial,                   -- prq_nufs_163
   ⟨by native_decide,         -- prq_cmpe_195a (proof_cmpe_195a)
    by native_decide,
    by native_decide⟩,
   by native_decide,          -- prq_cmpe_195b
   by native_decide,          -- prq_cmpe_127
   by native_decide,          -- prq_cmpe_140
   ⟨by native_decide,         -- prq_cmpe_142 (proof_cmpe_142)
    by native_decide,
    by native_decide⟩,
   by native_decide⟩

def Finset.sortByKey
  {α β : Type} [DecidableEq α] [LinearOrder β]
  (set : Finset α)
  (key : set → β)
  (key_injective : Function.Injective key) :
    List set :=
  have nameOf_injective : Function.Injective key :=
    fun a b h =>
      key_injective h
  letI : LinearOrder set :=
    LinearOrder.lift' key nameOf_injective
  set.attach.sort

#eval ((current_plan.taken.filter (fun c => c.course ∈ upper_div)).sortByKey
  (fun c => c.val.course.name)
  (by native_decide)).map
    (fun c =>
      let c := c.val
      let p := current_plan.before c.sem
      (c.course.name, c.sem.name,
        decide (Requirements.GeneralEducation.Core p),
        decide (Requirements.Standing.upperdiv p)))

