#! /bin/bash

TEST_CMD="xcodebuild -scheme SwiftExample -project SwiftExample.xcodeproj -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone 6S,OS=9.1' build test"

if [[ $TRAVIS ]]; then
  eval "${TEST_CMD} | xcpretty"
else
  eval "$TEST_CMD"
fi
