#! /bin/bash

xcodebuild -scheme SwiftExample -project SwiftExample.xcodeproj -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone 6S,OS=9.0' test