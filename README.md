# SJSU Academic Plan (Lean)

Often is the case graduation requirements for many universities
are effectively a long list of potentially logical predicates of
non-uniform structure.

Due to the complexity of academic policy, there exists a
meaningful gap between the academic plans policy allows for and
the actual plans students will make.

This is supposedly where academic advisors, experts on policy,
come in, but advisors are frequently stretched thin during course
registration times precisely due to the complexity of policy.

As such, one may think of building an automated policy-based
checking program to help the student build their academic plan and
to catch errors before they happen.

However, there is a reason why these programs are not more
widespread, and that is largely due to the fact that academic
policy contains many "edge-case" structures. See the following:

It may be tempting to model the pre-requisites and co-requisites
of a course as simple sets of courses. However, then you may end
up with a line in the course catalog stating:

> CMPE major: CMPE 126 (C- or better); SE major: CS 46B (C- or
> better); other majors: CMPE 30, and MATH 32 or MATH 32H (C- or
> better).
>
> - SJSU Course Catalog 2025-26 (CMPE 131)

Here, there are multiple ways you can fulfill the pre-requisites
for this class, and in particular, these ways involve the checking
    the grade of the class involved! In most cases you can re-use
    the logic for checking pre-requisites, but not in this
    particular case, which often means that you must restructure
    your program to be more flexible.

Or something like:

> You must fulfill 9 units of upper-division general-ed courses
> ... These are: UD 2 or 5, UD 3, and UD 4. ... Students must
> complete 1, 3-unit course in each category.
>
> - SJSU Upper Division GE Requirements

Notice how it specifically says that students must complete 1,
3-unit course in each category, and *not* that students must have
at least 3-units of credit. If you were to naively assume that the
checking of units is just a matter of finding the courses taken in
a category, finding the total number of units and checking if it
passes a threshold, one would be blind-sided by this example.

In any case, it seems like it is more suitable to model these
requirements with logic and mathematics than it is with code. In
particular, representing a particular academic plan as a structure
which logical predicates can be checked against. This can be done
with [Lean](https://lean-lang.org/).

