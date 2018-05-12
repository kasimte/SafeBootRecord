# SafeBootRecord

[![CI Status](https://img.shields.io/travis/kasimte/SafeBootRecord.svg?style=flat)](https://travis-ci.org/kasimte/SafeBootRecord)
[![Version](https://img.shields.io/cocoapods/v/SafeBootRecord.svg?style=flat)](https://cocoapods.org/pods/SafeBootRecord)
[![License](https://img.shields.io/cocoapods/l/SafeBootRecord.svg?style=flat)](https://cocoapods.org/pods/SafeBootRecord)
[![Platform](https://img.shields.io/cocoapods/p/SafeBootRecord.svg?style=flat)](https://cocoapods.org/pods/SafeBootRecord)

SafeBootRecord provides a convenience class for tracking an app boot. Manually mark the app boot mark and finish like so:

```swift
// Somewhere in the App Delegate
let record: BootRecord = BootRecord()
record.markStart()

... do some boot configuration here ...

record.markFinish()
```

`markStart()` records a log in the UserDefaults and `markFinish()`
clears it. If a record remains on start, then app booting has failed.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

* Swift 3+
* iOS 10.0+

## Installation

SafeBootRecord is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SafeBootRecord'
```

## Author

Kasim Te, kasimte@gmail.com

## License

SafeBootRecord is available under the MIT license. See the LICENSE file for more info.
