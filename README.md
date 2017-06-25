# YWTopInputField
[![CI Status](https://travis-ci.org/nsnull0/YWTopInputField.svg?branch=master)](https://travis-ci.org/nsnull0/YWTopInputField)
[![Version](https://img.shields.io/cocoapods/v/YWTopInputField.svg?style=flat)](https://cocoapods.org/pods/YWTopInputField)
[![License](https://img.shields.io/cocoapods/l/YWTopInputField.svg?style=flat)](https://cocoapods.org/pods/YWTopInputField)
[![Platform](https://img.shields.io/cocoapods/p/YWTopInputField.svg?style=flat)](https://cocoapods.org/pods/YWTopInputField)

Make your input value more  userfriendly with easy implementation.


Currently still on development

To Try Example using UITextfield(For Now): (For Generic type still in progress)

## Usage
## Initialization
```swift
import YWTopInputField

class ViewController: UIViewController, YWInputProtocol {

        private var alert:YWTopInputFieldController?

        @IBOutlet weak var inputText: UITextField!
        override func viewDidLoad() {
            super.viewDidLoad()
            self.alert = YWTopInputFieldController(_contentController: self, _andDelegate: self)

            inputText.delegate = self
        }


        func doneAction(resultStr: String) {

        }

        func didShowYWInputField() {

        }

        func didDismiss(resultStr: String) {
            self.inputText.text = resultStr
        }
}


extension ViewController:UITextFieldDelegate{
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {

        guard textField != self.inputText else {
            self.alert!.showInput(_withTitle: "", _andMessage: "", _withContentString: textField.text!, completion: {
            (finished) in

            })
            return false
        }

        return true

    }
}

```

## Credits
- Yoseph Wijaya Savianto ([@yosephwijaya](http://yoseph.ws))

## License
- nsnull0/YWTopInputField is licensed under MIT LICENSE
