import Sjsu.Types
import Sjsu.Courses

def prereqs : List (Course × Finset Course) := [
  (biol_10, {}),
  (chem_1a, {}), -- high-school chem or chem 010, assuming high school chem is taken
  (ise_130, {}), -- math 32
  (phys_50, {})
]
