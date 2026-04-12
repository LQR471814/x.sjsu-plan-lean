# SJSU Academic Plan (Lean)

Graduation requirements for many universities are often a long
list of logical predicates of non-uniform structure.

Due to the complexity of academic policy, there may exist a
meaningful gap between what school policy allows for and the
actual plans students make. This is supposedly where academic
advisors, experts on policy, come in, but advisors are frequently
stretched thin during course registration times.

As such, one may think of building an automated policy-based
checking program to help a student build their academic plan and
to catch errors before they happen. However, there is reason why
these programs are not more widespread, and that is largely due to
the fact that academic policy contains many "edge-case"
structures. Consider the following:

It may be tempting to model the pre-requisites and co-requisites
of a course as simple sets of courses. However, you may end up
finding a line in the course catalog like:

> CMPE major: CMPE 126 (C- or better); SE major: CS 46B (C- or
> better); other majors: CMPE 30, and MATH 32 or MATH 32H (C- or
> better).
>
> - SJSU Course Catalog 2025-26 (CMPE 131)

Here, there are multiple ways you can fulfill the pre-requisites
for this class, and in particular, these ways involve the checking
    the grade of the class involved! In most cases the logic for
    checking pre-requisites is the same, but not always. This
    means that attempting to structure your program around a few
    common patterns will almost certainly lead to edge cases in
    which the human must get involved.

Here is another example:

> You must fulfill 9 units of upper-division general-ed courses
> ... These are: UD 2 or 5, UD 3, and UD 4. ... Students must
> complete 1, 3-unit course in each category.
>
> - SJSU Upper Division GE Requirements

Notice how it specifically says that students must complete 1,
3-unit course in each category, and *not* that students must have
at least 3-units of credit. If you were to naively assume that
checking unit requirements is just a matter of finding the sum of
the course units taken in a category and comparing it to a
threshold, one would be blind-sided by this example.

In any case, due to the flexibility of the logic involved. It
seems like it is more suitable to model these requirements with a
more flexible formal language rather than trying to model the
requirements and be stuck perpetually refactoring with every edge
case.

[Lean](https://lean-lang.org/) is a good choice for this.
Originally used as a theorem checker and proof assistant, it is
also remarkably good at modelling arbitrary mathematics and
logic.

This project aims to provide a simple demonstration of the use of
formal methods to solve bureaucratic problems in a relatively
simple and efficient way.

> [!NOTE]
> This project is purely meant for personal and educational
> purposes and does not make any significant attempt to be SJSU or
> campus-generic.

## WIP

- Co-req/pre-req checks.

