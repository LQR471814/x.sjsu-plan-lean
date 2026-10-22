import Sjsu.Categories

namespace Requirements.CMPE

-- All required courses for CMPE
def req_courses : Finset Course := {
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

def ud_electives : Finset Course := {
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

structure Major (p : Plan) where
  req_courses : req_courses ⊆ course_regs p.taken
  req_electives : cat_units ud_electives p ≥ 7

end Requirements.CMPE
