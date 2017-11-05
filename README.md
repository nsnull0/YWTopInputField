# YWTopInputField

[![Version](https://img.shields.io/cocoapods/v/YWTopInputField.svg?style=flat)](https://cocoapods.org/pods/YWTopInputField)
[![License](https://img.shields.io/cocoapods/l/YWTopInputField.svg?style=flat)](https://cocoapods.org/pods/YWTopInputField)
[![Platform](https://img.shields.io/cocoapods/p/YWTopInputField.svg?style=flat)](https://cocoapods.org/pods/YWTopInputField)

Make your input value more  userfriendly with easy implementation.

Will be more generic day by day

## Availability
#### ⚠️ **This Library only Available to Swift > 3.0** ⚠️

## DEMO V0.4.0
![Demo](https://s7.postimg.org/fhodjzcsr/YWTop_Input_Field_1.gif)

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

```ruby
platform :ios, '9.0'
use_frameworks!

target '<Your Target Name>' do
    pod 'YWTopInputField', ~> "0.4"
end
```

Then, run the following command:

```bash
$ pod install
```

## Swift 4.0 Compatibility for more stable version
```ruby
platform :ios, '9.0'
use_frameworks!

target '<Your Target Name>' do
pod 'YWTopInputField', ~> "1.0"
end
```

## Latest Version
```ruby
pod 'YWTopInputField', ~> "2.0"
```

## Initialization
```swift

var alert:YWTopInputFieldController?

self.alert = YWTopInputFieldController(_contentController: self, _andDelegate: self)


//Optional, it will setup to Default setting
alert!.setupInputField(_chooseAutoCorrectionType: .no, _chooseSpellCheckingType: .no, _chooseKeyboardType: .default, _chooseKeyboardAppearance: .alert)

//Optional, it will setup to Default setting
alert!.setupContainer(_chooseBlurStyleEffectContainer: .dark, _chooseTitleColor: .white, _chooseMessageColor: .white, _chooseFontTitle: .boldSystemFont(ofSize: 15.0), _chooseFontMessage: .systemFont(ofSize: 12.0))


```

## Delegation
```swift
    func didShowYWInputField()

    func doneAction(resultStr: String,_withTag tag:Int)

    func didCancel()
```

## Property Setup
```swift
//Optional, it will setup to Default setting
alert!.setupInputField(_chooseAutoCorrectionType: .no, _chooseSpellCheckingType: .no, _chooseKeyboardType: .default, _chooseKeyboardAppearance: .alert)

//Optional, it will setup to Default setting
alert!.setupContainer(_chooseBlurStyleEffectContainer: .dark, _chooseTitleColor: .white, _chooseMessageColor: .white, _chooseFontTitle: .boldSystemFont(ofSize: 15.0), _chooseFontMessage: .systemFont(ofSize: 12.0))

//Optional, it will setup to Default setting <200>
alert!.setContainer(height: 250)

```

## Property Setup for Version > 2.0

ADDED 'customize' property as builder object
```swift
alert!.customize.setCorrectionType(_type: .no)
                .setSpellCheckType(_type: .no)
                .setKeyboardType(_type: .default)
                .setKeyboardAppearance(_type: .alert)
                .setBlurStyleEffectContainer(_type: .dark)
                .setTitleColor(_color: .white)
                .setMessageColor(_color: .white)
                .setFontTitle(_font: .boldSystemFont(ofSize: 15.0))
                .setMessageFont(_font: .systemFont(ofSize: 12.0))
                .setHeightTextContainer(_height: 400)
                .validate()
```

SNAPSHOT EXAMPLE
```swift

self.alert!.customize.setKeyboardType(_type: .numberPad).validate()

self.alert!.showInput(_withTitle: "", _andMessage: "", _withContentString: textField.text!, _withTag:           tagIdentity.textFieldTag.rawValue, completion: {
(finished) in

})
```

## Support
- Updated occasionally for more Generic and developer-friendly
- Pull me request if you guys want to contribute too.
- More detail about usage can be seen at example workspace.

## Credits
- Creator Yoseph Wijaya Savianto ([@yosephwijaya](http://yoseph.ws))

## License
- nsnull0/YWTopInputField is licensed under MIT LICENSE
