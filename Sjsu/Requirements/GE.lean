import Sjsu.Categories

namespace Requirements

namespace Standing

def freshman (_ : Plan) := True
def sophomore (p : Plan) := cat_units Set.univ p ≥ 30
def junior (p : Plan) := cat_units Set.univ p ≥ 60
def senior (p : Plan) := cat_units Set.univ p ≥ 90

def strictly_freshman (p : Plan) := freshman p ∧ cat_units Set.univ p < 30
def strictly_sophomore (p : Plan) := sophomore p ∧ cat_units Set.univ p < 60
def strictly_junior (p : Plan) := junior p ∧ cat_units Set.univ p < 90
def strictly_senior (p : Plan) := senior p

abbrev upperdiv := junior

instance (p : Plan) : Decidable (freshman p) := by rw [freshman]; infer_instance
instance (p : Plan) : Decidable (sophomore p) := by rw [sophomore]; infer_instance
instance (p : Plan) : Decidable (junior p) := by rw [junior]; infer_instance
instance (p : Plan) : Decidable (senior p) := by rw [senior]; infer_instance
instance (p : Plan) : Decidable (strictly_freshman p) := by rw [strictly_freshman]; infer_instance
instance (p : Plan) : Decidable (strictly_sophomore p) := by rw [strictly_sophomore]; infer_instance
instance (p : Plan) : Decidable (strictly_junior p) := by rw [strictly_junior]; infer_instance
instance (p : Plan) : Decidable (strictly_senior p) := by rw [strictly_senior]; infer_instance

end Standing

namespace GeneralEducation

-- Core GE reqs
def Core (p : Plan) : Prop :=
  cat_units ge_1a p ≥ 3
  -- ∧ cat_units ge_1b p ≥ 3  -- fulfilled upon completion of major
  ∧ cat_units ge_1c p ≥ 3
  ∧ cat_units ge_2 p ≥ 3
  ∧ cat_units ge_3a p ≥ 3
  ∧ cat_units ge_3b p ≥ 3
  ∧ cat_units ge_4 p ≥ 6
  ∧ cat_units ge_5a p ≥ 3
  ∧ cat_units ge_5b p ≥ 3
  ∧ cat_units ge_5c p ≥ 1
  ∧ cat_units ge_6 p ≥ 3

instance (p : Plan) : Decidable (Core p) := by
  rw [Core]
  infer_instance

-- Upper Division GE reqs
def UpperDivision (p : Plan) : Prop :=
  cat_units (ge_ud_2 ∪ ge_ud_5 ∪ ge_ud_3 ∪ ge_ud_4) p ≥ 9
  ∧ (cat_units ge_ud_2 p ≥ 3 ∨ cat_units ge_ud_5 p ≥ 3)
  ∧ cat_units ge_ud_3 p ≥ 3
  ∧ cat_units ge_ud_4 p ≥ 3

instance (p : Plan) : Decidable (UpperDivision p) := by
  rw [UpperDivision]
  infer_instance

-- American Institutions GE reqs
def AmericanInstitutions (p : Plan) : Prop :=
  cat_units us1 p > 0
  ∧ cat_units us2 p > 0
  ∧ cat_units us3 p > 0
  ∧ (cat_units us1 p + cat_units us2 p + cat_units us3 p) ≥ 6

instance (p : Plan) : Decidable (AmericanInstitutions p) := by
  rw [AmericanInstitutions]
  infer_instance

end GeneralEducation

def GeneralEducation (p : Plan) : Prop :=
  -- assume good standing (gpa ≥ 2.0)
  cat_units Set.univ p ≥ 120
  ∧ cat_units wid p > 0
  ∧ GeneralEducation.Core p
  ∧ GeneralEducation.UpperDivision p
  ∧ GeneralEducation.AmericanInstitutions p

instance (p : Plan) : Decidable (GeneralEducation p) := by
  rw [GeneralEducation]
  infer_instance

end Requirements
