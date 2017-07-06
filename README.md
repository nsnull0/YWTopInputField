# YWTopInputField
[![CI Status](https://travis-ci.org/nsnull0/YWTopInputField.svg?branch=master)](https://travis-ci.org/nsnull0/YWTopInputField)
[![Version](https://img.shields.io/cocoapods/v/YWTopInputField.svg?style=flat)](https://cocoapods.org/pods/YWTopInputField)
[![License](https://img.shields.io/cocoapods/l/YWTopInputField.svg?style=flat)](https://cocoapods.org/pods/YWTopInputField)
[![Platform](https://img.shields.io/cocoapods/p/YWTopInputField.svg?style=flat)](https://cocoapods.org/pods/YWTopInputField)

Make your input value more  userfriendly with easy implementation.

Will be more generic day by day

## Availability
#### ⚠️ **This Library only Available to Swift > 3.0** ⚠️

## DEMO V0.1.0
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


## Example
```swift
import YWTopInputField

enum tagIdentity:Int {
    case textFieldTag
    case textViewTag
    case labelTag
}

class ViewController: UIViewController, YWInputProtocol {

        private var alert:YWTopInputFieldController?


        @IBOutlet weak var inputTextView: UITextView!
        @IBOutlet weak var inputText: UITextField!
        @IBOutlet weak var inputLabel: UILabel!


        override func viewDidLoad() {
            super.viewDidLoad()
            self.alert = YWTopInputFieldController(_contentController: self, _andDelegate: self)


            //Optional, it will setup to Default setting
            alert!.setupInputField(_chooseAutoCorrectionType: .no, _chooseSpellCheckingType: .no, _chooseKeyboardType: .default, _chooseKeyboardAppearance: .alert)

            //Optional, it will setup to Default setting
            alert!.setupContainer(_chooseBlurStyleEffectContainer: .dark, _chooseTitleColor: .white, _chooseMessageColor: .white, _chooseFontTitle: .boldSystemFont(ofSize: 15.0), _chooseFontMessage: .systemFont(ofSize: 12.0))


            inputText.delegate = self
            inputTextView.delegate = self

        }

        func didShowYWInputField() {

        }

        func doneAction(resultStr: String, _withTag: Int) {

            switch _withTag {
                case tagIdentity.labelTag.rawValue:
                    self.inputLabel.text = resultStr
                    break
                case tagIdentity.textViewTag.rawValue:
                    self.inputTextView.text = resultStr
                    break
                case tagIdentity.textFieldTag.rawValue:
                    self.inputText.text = resultStr
                    break
                default:
                    break
            }
        }

        func didCancel() {

        }

        @IBAction func EditLabelTouchUp(_ sender: UIButton) {
            self.alert!.showInput(_withTitle: "", _andMessage: "", _withContentString: self.inputLabel.text!, _withTag: tagIdentity.labelTag.rawValue, completion: {
            (finished) in

            })
        }

}


extension ViewController:UITextFieldDelegate{
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {

        guard textField != self.inputText else {
            self.alert!.showInput(_withTitle: "", _andMessage: "", _withContentString: textField.text!, _withTag: tagIdentity.textFieldTag.rawValue, completion: {
            (finished) in

            })
            return false
        }

        return true

    }
}

extension ViewController:UITextViewDelegate{
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        guard textView != self.inputTextView else {
            self.alert!.showInput(_withTitle: "TextView Boom", _andMessage: "", _withContentString: textView.text!, _withTag: tagIdentity.textViewTag.rawValue, completion: {
            (finished) in

            })
            return false
        }       

        return true
    }
}


```
## Support
- Updated occasionally for more Generic and developer-friendly
- leave comment or message me if you guys have wonderful ideas about this library.

## Credits
- Creator Yoseph Wijaya Savianto ([@yosephwijaya](http://yoseph.ws))

## License
- nsnull0/YWTopInputField is licensed under MIT LICENSE
