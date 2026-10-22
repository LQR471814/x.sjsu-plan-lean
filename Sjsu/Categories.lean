import Mathlib.Data.Set.Basic
import Mathlib.Data.Finset.Basic
import Sjsu.Types
import Sjsu.Courses

def ge_1a : Finset Course := {
  engl_1a
}
def ge_1b : Finset Course := {
  hist_50
}
def ge_1c : Finset Course := {
  comm_20
}
def ge_2 : Finset Course := {
  math_30,
  math_31,
  math_32,
  stat_95,
  cs_22a,
  cs_22b,
  cs_46a,
  cs_49a,
  cs_49j,
  math_016_trld_2,
  math_141_trld_2,
  math_242_trld_2
}
def ge_3a : Finset Course := {
  arth_70a,
  arth_70b
}
def ge_3b : Finset Course := {
  engl_1b,
  chin_1a,
  phil_271_trld_3b
}
def ge_4 : Finset Course := {
  trai_us2_trld_4,
  geog_10,
  hist_20a,
  econ_1b
}
def ge_5a : Finset Course := {
  phys_50,
  phys_51,
  trld_5a_5c
}
def ge_5b : Finset Course := {
  biol_10
}
def ge_5c : Finset Course := {
  chem_1a,
  phys_50,
  phys_51,
  trld_5a_5c
}
def ge_6 : Finset Course := {
  afam_162,
  ccs_25
}
def us1 : Finset Course := {
  hist_20b
}
def us2 : Finset Course := {
  trai_us2_trld_4
}
def us3 : Finset Course := {
  pols_102,
  hist_189b
}
def ge_ud_2 : Finset Course := {
  nufs_163
}
def ge_ud_3 : Finset Course := {
  ee_198b,
  cmpe_195b,
  engr_195b
}
def ge_ud_4 : Finset Course := {
  nufs_114b,
  ee_198a,
  cmpe_195a,
  engr_195a
}
def ge_ud_5 : Finset Course := {
  nufs_163
}

def lower_div : Finset Course :=
  ge_1a ∪ ge_1b ∪ ge_1c ∪
  ge_2 ∪
  ge_3a ∪ ge_3b ∪
  ge_4 ∪
  ge_5a ∪ ge_5b ∪ ge_5c ∪
  ge_6 ∪
  us1 ∪ us2 ∪ us3

-- note: ge upper div area 1 doesn't exist I guess
def upper_div : Finset Course := ge_ud_2 ∪ ge_ud_3 ∪ ge_ud_4 ∪ ge_ud_5

def wid : Finset Course := {
  engr_100w,
  cs_100w,
  phys_100w
}

