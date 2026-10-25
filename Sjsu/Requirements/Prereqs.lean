import Sjsu.Types
import Sjsu.Courses
import Sjsu.Requirements.GE

namespace Requirements

def has_prereq (plan : Plan) (target prereq : Course) : Prop :=
  if target ∈ course_regs plan.taken then
    ∃ t p : plan.taken,
      target = t.val.course ∧ prereq = p.val.course →
        p.val.sem < t.val.sem
  else
    True

instance (p : Plan) target prereq :
    Decidable (has_prereq p target prereq) :=
  by
    rw [has_prereq]
    infer_instance

def has_coreq (plan : Plan) (target prereq : Course) : Prop :=
  if target ∈ course_regs plan.taken then
    ∃ t p : plan.taken,
      target = t.val.course ∧ prereq = p.val.course →
        p.val.sem ≤ t.val.sem
  else
    True

instance (p : Plan) target prereq :
    Decidable (has_coreq p target prereq) :=
  by
    rw [has_coreq]
    infer_instance

-- UDGE are prerequisites for all upper division GE courses
def Prereqs.UDGE (p : Plan) : Prop :=
  Requirements.GeneralEducation.Core p
  ∧ Requirements.Standing.upperdiv p

instance (p : Plan) : Decidable (Prereqs.UDGE p) := by
  rw [Prereqs.UDGE]
  infer_instance

def all_udge_fulfilled (p : Plan) :=
  ∀ c : p.taken, c.val.course ∈ upper_div →
    Prereqs.UDGE (p.before c.val.sem)

instance (p : Plan) : Decidable (all_udge_fulfilled p) := by
  rw [all_udge_fulfilled]
  infer_instance

def Prereqs.proof_cmpe_195a (p : Plan) : Prop :=
  has_prereq p cmpe_195a cmpe_125
  ∧ has_prereq p cmpe_195a cmpe_131
  ∧ has_prereq p cmpe_195a engr_100w

instance (p : Plan) : Decidable (Prereqs.proof_cmpe_195a p) := by
  rw [Prereqs.proof_cmpe_195a]
  infer_instance

def Prereqs.proof_cmpe_142 (p : Plan) : Prop :=
  has_prereq p cmpe_142 cmpe_70
  ∧ has_prereq p cmpe_142 cmpe_126
  ∧ has_coreq p cmpe_142 cmpe_130

instance (p : Plan) : Decidable (Prereqs.proof_cmpe_142 p) := by
  rw [Prereqs.proof_cmpe_142]
  infer_instance

def Prereqs (p : Plan) : Prop :=
  has_prereq p cmpe_152 cmpe_126        -- prq_cmpe_152
  ∧ has_prereq p cmpe_138 cmpe_126      -- prq_cmpe_138
  ∧ has_prereq p cmpe_188 cmpe_126      -- prq_cmpe_188
  ∧ has_prereq p cmpe_125 cmpe_70       -- prq_cmpe_125
  ∧ has_prereq p cmpe_131 cmpe_50       -- prq_cmpe_131
  ∧ has_prereq p engr_100w engl_1b      -- prq_engr_100w
  ∧ Requirements.GeneralEducation.UpperDivision p  -- prq_hist_189b
  ∧ True                                -- prq_ccs_25
  ∧ True                                -- prq_nufs_163
  ∧ Prereqs.proof_cmpe_195a p           -- prq_cmpe_195a
  ∧ has_prereq p cmpe_195b cmpe_195a    -- prq_cmpe_195b
  ∧ has_prereq p cmpe_127 cmpe_125      -- prq_cmpe_127
  ∧ has_prereq p cmpe_140 cmpe_125      -- prq_cmpe_140
  ∧ Prereqs.proof_cmpe_142 p            -- prq_cmpe_142
  ∧ all_udge_fulfilled p

instance (p : Plan) : Decidable (Prereqs p) := by
  rw [Prereqs]
  infer_instance

def Coreqs (p : Plan) : Prop :=
  has_coreq p cmpe_195a engr_195a       -- crq_cmpe_195a
  ∧ has_coreq p cmpe_195b engr_195b     -- crq_cmpe_195b

instance (p : Plan) : Decidable (Coreqs p) := by
  rw [Coreqs]
  infer_instance

end Requirements
