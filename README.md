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

# Bitrise CI

1. Open dashboard.
2. Click on workflow
3. Add a workflow step
4. Search for `Codecov`
5. Paste the `Codecov Token`
6. You are all set

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

# Caveats

### Xcode8/Swift3 resulting in `0%` coverage.

1. Update the test scheme with Xcode 8
2. Do not use `xcpretty`. Seems broken with code coverage Xcode 8...

Example project with Xcode8/Swift3: [yannickl/DynamicColor](https://github.com/yannickl/DynamicColor/blob/6ac768ba5c14941be5ebe169aca408655e185b20/.travis.yml)

----

Have questions? Support at https://codecov.io/support

[1]: https://codecov.io/
[4]: https://github.com/codecov/codecov-python
