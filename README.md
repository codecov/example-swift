[Codecov][1] Swift Example
==========================

[![Build Status](https://travis-ci.org/codecov/example-swift.svg)](https://travis-ci.org/codecov/example-swift) [![codecov.io](https://codecov.io/gh/codecov/example-swift/branch/master/graphs/badge.svg)](https://codecov.io/gh/codecov/example-swift/branch/master)

This repository serves as an **example** on how to use [Codecov Global][4] for Swift.

## Usage
Enable "Gather coverage data" in your test scheme:

![gather coverage data](docs/gather_coverage_data.png)

# Travis CI

Add to your `.travis.yml` file.
```yml
language: swift # or objective-c
osx_image: xcode7
script:
  - xcodebuild -scheme SwiftExample -workspace SwiftExample.xcworkspace -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone 6S,OS=9.1' build test
after_success:
  - bash <(curl -s https://codecov.io/bash)
```

## Private Repos
> Set `CODECOV_TOKEN` in your environment variables.

Add to your `.travis.yml` file.
```yml
after_success:
  - bash <(curl -s https://codecov.io/bash) -t uuid-repo-token
```
> Or you can set the environment variable `CODECOV_TOKEN` to your token.

# Speed up the build
The uploader has a *boil-the-ocean* approach, which can take a longer time to complete coverage report processing.
We suggest you add the following to only build reports for the project being tested:

```sh
bash <(curl -s https://codecov.io/bash) -J 'SwiftExample'
```
> Use your project name instead of `SwiftExample`. You can also provide multiple arguments via `-J 'ProjA' -J 'ProjB'`

----

Have questions? Support at https://codecov.io/support

[1]: https://codecov.io/
[4]: https://github.com/codecov/codecov-python
