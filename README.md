# YWTopInputField
[![CI Status](https://travis-ci.org/nsnull0/YWTopInputField.svg?branch=master)](https://travis-ci.org/nsnull0/YWTopInputField)
[![Version](https://img.shields.io/cocoapods/v/YWTopInputField.svg?style=flat)](https://cocoapods.org/pods/YWTopInputField)
[![License](https://img.shields.io/cocoapods/l/YWTopInputField.svg?style=flat)](https://cocoapods.org/pods/YWTopInputField)
[![Platform](https://img.shields.io/cocoapods/p/YWTopInputField.svg?style=flat)](https://cocoapods.org/pods/YWTopInputField)

Make your input value more  userfriendly with easy implementation.

Will be more generic day by day

## Availability
#### ⚠️ **This Library only Available to Swift > 3.0** ⚠️

## DEMO V0.3.0
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
    pod 'YWTopInputField'
end
```

Then, run the following command:

```bash
$ pod install
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
alert!.setContainer(_height: 250)
```


## Support
- Updated occasionally for more Generic and developer-friendly
- Pull me request if you guys want to contribute too.
- More detail about usage can be seen at example workspace.

## Credits
- Creator Yoseph Wijaya Savianto ([@yosephwijaya](http://yoseph.ws))

## License
- nsnull0/YWTopInputField is licensed under MIT LICENSE
