import Mathlib.Data.Finset.Basic
import Mathlib.Data.Finset.Image

-- logical predicate types:
-- 1. courses (bool flag)
-- 2. course areas (in a particular set)
-- 3. institution where units were taken (set)
-- 4. lower/upper div (set)
-- 5. years

-- plan: (monad)
-- 1. list of taken courses + year they were taken

inductive Institution where
  | sjsu
  | community_college
  | non_cc_transfer

structure Course where
  name : String
  units : Nat
  deriving DecidableEq -- makes it so that two courses can be compared to be equal

structure Semester where
  name : String
  unit_capacity : Nat
  idx : Nat
  deriving DecidableEq

structure CourseRegistration where
  course : Course
  sem : Semester
  deriving DecidableEq

structure Plan where
  name : String
  taken : Finset CourseRegistration
  deriving DecidableEq

def add (r : CourseRegistration) (p : Plan) : Plan :=
  { p with taken := insert r p.taken }

def get_course (r : CourseRegistration) := r.course
def course_regs (sr : Finset CourseRegistration) : Finset Course :=
  Finset.image get_course sr
