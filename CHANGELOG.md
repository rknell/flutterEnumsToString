## [2.0.1]

- No reason not to be bumped to prod with null safety

## [2.0.0-nullsafety.1]

- Big version bump to try and get pub's outdated check to recognise a null safe version is available.

## [1.0.14-nullsafety.0]

- First attempt at moving to nullsafety. Cheers to @Sameerkash for spearheading the effort.

## [1.0.14] - 2020-11-20

- Added camelCase flag in "fromString" function to properly handle conversion back of a string with spaces to enum

## [1.0.13] - 2020-09-25

- Fixed previous bug by replacing exception with an assertion. The library will no longer break in release mode with minified code, but it will also not throw an exception in production if you try to parse a non enum item.

## [1.0.12] - 2020-09-24

- Fixing issue where minification in the web breaks the app. Unfortunately we can't safely check if the object type is an enum when compiled in release mode using type.toString as a result of this change.
More information can be found here:
https://github.com/flutter/flutter/issues/66236#issuecomment-697967770


## [1.0.11] - 2020-09-14

- Fixing major mistake, renaming new function to convertToString so as not to conflict with system calls

## [1.0.10] - 2020-09-14

    BROKEN BUILD DO NOT USE

- Added .fromString function (Thanks @amoslai5128)
- Better error handling (Thanks @lironhl)
- Improved documentation
- Deprecated parseCamelCase function in favour of toString(enumItem, camelCase: true)
- Deprecated parse in favour of toString

## [1.0.9] - 2020-02-21

- Added .toList function (Thanks @CodeGrue)

## [1.0.8] - 2019-11-03

- Better type handling in fromString method (Thanks @Sergey-Schirmer)

## [1.0.7+1] - 2019-10-21

- Improving code robustness (Thanks @ewertonrp)

## [1.0.7] - 2019-05-30

- Improving examples

## [1.0.6] - 2019-05-30

- Added support for getting an enum from a string

## [1.0.5] - 2019-05-29

- Better readme formatting

## [1.0.4] - 2019-05-29

- Better handling of null types

## [1.0.3] - 2019-05-26

- Adding explicit types

## [1.0.2] - 2019-05-24

- Improving my dart score

## [1.0.1] - 2019-05-24

- Initial library release
