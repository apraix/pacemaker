/*
 * Copyright 2020 the Pacemaker project contributors
 *
 * The version control history for this file may have further details.
 *
 * This source code is licensed under the GNU General Public License version 2
 * or later (GPLv2+) WITHOUT ANY WARRANTY.
 *
 * Catch places where a string can either be NULL or can match some other
 * string.  In these cases, passing the right flag to pcmk__str_eq will get
 * the same result but without having to do the NULL comparison manually.
 */

@ string_null_matches_1 @
expression E1, E2;
@@
- ((E1 == NULL) || crm_str_eq(E1, E2, TRUE))
+ pcmk__str_eq(E1, E2, pcmk__str_null_matches)

@ string_null_matches_2 @
expression E1, E2;
@@
- ((E1 == NULL) || crm_str_eq(E2, E1, TRUE))
+ pcmk__str_eq(E1, E2, pcmk__str_null_matches)

@ string_null_matches_3 @
expression E1, E2;
@@
- ((E1 == NULL) || safe_str_eq(E1, E2))
+ pcmk__str_eq(E1, E2, pcmk__str_null_matches|pcmk__str_casei)

@ string_null_matches_4 @
expression E1, E2;
@@
- ((E1 == NULL) || safe_str_eq(E2, E1))
+ pcmk__str_eq(E1, E2, pcmk__str_null_matches|pcmk__str_casei)

@ string_null_matches_5 @
expression E1, E2;
@@
- ((E1 == NULL) || strcmp(E1, E2) == 0)
+ pcmk__str_eq(E1, E2, pcmk__str_null_matches)

@ string_null_matches_6 @
expression E1, E2;
@@
- ((E1 == NULL) || strcmp(E2, E1) == 0)
+ pcmk__str_eq(E1, E2, pcmk__str_null_matches)

@ string_null_matches_7 @
expression E1, E2;
@@
- ((E1 == NULL) || !strcmp(E1, E2))
+ pcmk__str_eq(E1, E2, pcmk__str_null_matches)

@ string_null_matches_8 @
expression E1, E2;
@@
- ((E1 == NULL) || !strcmp(E2, E1))
+ pcmk__str_eq(E1, E2, pcmk__str_null_matches)

@ string_null_matches_9 @
expression E1, E2;
@@
- ((E1 != NULL) && strcmp(E1, E2) != 0)
+ !pcmk__str_eq(E1, E2, pcmk__str_null_matches)

@ string_null_matches_10 @
expression E1, E2;
@@
- ((E1 != NULL) && strcmp(E2, E1) != 0)
+ !pcmk__str_eq(E1, E2, pcmk__str_null_matches)
