import Sjsu.Categories

namespace Requirements

namespace GeneralEducation

-- Core GE reqs
structure Core (p : Plan) where
  req_1a : cat_units ge_1a p ≥ 3
  -- req_1b : cat_units ge_1b p ≥ 3  -- fulfilled upon completion of major
  req_1c : cat_units ge_1c p ≥ 3
  req_2 : cat_units ge_2 p ≥ 3
  req_3a : cat_units ge_3a p ≥ 3
  req_3b : cat_units ge_3b p ≥ 3
  req_4 : cat_units ge_4 p ≥ 6
  req_5a : cat_units ge_5a p ≥ 3
  req_5b : cat_units ge_5b p ≥ 3
  req_5c : cat_units ge_5c p ≥ 1
  req_6 : cat_units ge_6 p ≥ 3

-- Upper Division GE reqs
structure UpperDivision (p : Plan) where
  req_1 : cat_units (ge_ud_2 ∪ ge_ud_5 ∪ ge_ud_3 ∪ ge_ud_4) p ≥ 9
  req_2 : (cat_units ge_ud_2 p ≥ 3 ∨ cat_units ge_ud_5 p ≥ 3)
  req_3 : cat_units ge_ud_3 p ≥ 3
  req_4 : cat_units ge_ud_4 p ≥ 3

-- American Institutions GE reqs
structure AmericanInstitutions (p : Plan) where
  req_1 : cat_units us1 p > 0
  req_2 : cat_units us2 p > 0
  req_3 : cat_units us3 p > 0
  req_4 : (cat_units us1 p + cat_units us2 p + cat_units us3 p) ≥ 6

end GeneralEducation

structure GeneralEducation (p : Plan) where
  -- assume good standing (gpa ≥ 2.0)
  req_units : cat_units Set.univ p ≥ 120
  req_wid : cat_units wid p > 0
  req_core : GeneralEducation.Core p
  req_ud : GeneralEducation.UpperDivision p
  req_us : GeneralEducation.AmericanInstitutions p

end Requirements

