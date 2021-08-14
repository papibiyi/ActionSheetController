# ActionSheetController

A Swift package that mimics the `UIAlertController Actionsheet`  with added features.

ActionSheetController gives you the ability to add extra features like custom views, images, custom view actions and headers to your UIAlertController not originally available out of the box.

Platforms supported:

* iOS 13+


## Adding to your project

Follow [Apple's guidance](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app) 
to add the package to your project through SPM.

## Usage

### Basic usage

Basic `ActionSheetController`. Directly mimics the  `UIAlertController Actionsheet`

```swift
import ActionSheetController

let alert = ActionSheetController(title: "Backup Data", message: "How often do you want to backup your data?")
alert.addAction(title: "Daily", type: .normal, action: {
    // Backup Daily
})
alert.addAction(title: "Weekly", type: .normal, action: {
    // Backup Weekly
})
alert.addAction(title: "Monthly", type: .normal, action: {
    // Backup Monthly
})
alert.addAction(title: "Never", type: .destructive, action: nil)
alert.launch()
```
<img width="250" height="500" src="https://raw.githubusercontent.com/papibiyi/ActionSheetController/main/Sources/Screenshots/sc1.png" alt="">


### ActionSheetController with done action

`ActionSheetController` with `addAction` . Replaces the Cancel text with a custom title and an action to be performed if needed
```swift
let alert = ActionSheetController(title: "Log Session", message: "Do you want to continue logging your session?")
alert.addAction(title: "Yes", type: .normal, action: nil)
alert.addAction(title: "No", type: .normal, action: nil)
alert.addDoneAction(title: "Ask me later", type: .normal) {
    //Perform Action
}
alert.launch()
```
<img width="250" height="500" src="https://raw.githubusercontent.com/papibiyi/ActionSheetController/main/Sources/Screenshots/sc2.png" alt="">

### ActionSheetController with header view

`ActionSheetController` with `addHeader(view: UIView)` . Adds a custom header to the ActionSheetController
```swift
let block: UIView = {
    let view = UIView()
    view.layer.cornerRadius = 50
    view.backgroundColor = .yellow
    view.heightAnchor.constraint(equalToConstant: 100).isActive = true
    view.widthAnchor.constraint(equalToConstant: 100).isActive = true
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
}()

let alert = ActionSheetController(title: "Yellow Header Here", message: "Awesome!")
alert.addHeader(view: block)
alert.launch()
```
<img width="250" height="500" src="https://raw.githubusercontent.com/papibiyi/ActionSheetController/main/Sources/Screenshots/sc3.png" alt="">

```swift
let block: UIView = {
    let view = UIView()
    view.layer.cornerRadius = 50
    view.backgroundColor = .yellow
    view.heightAnchor.constraint(equalToConstant: 100).isActive = true
    view.widthAnchor.constraint(equalToConstant: 100).isActive = true
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
}()

let alert = ActionSheetController(title: "Yellow Header Here", message: "Awesome!")
alert.addAction(title: "Yes", type: .normal, action: nil)
alert.addAction(title: "No", type: .normal, action: nil)
alert.addHeader(view: block)
alert.launch()
```
<img width="250" height="500" src="https://raw.githubusercontent.com/papibiyi/ActionSheetController/main/Sources/Screenshots/sc4.png" alt="">

### ActionSheetController with customAction view

`ActionSheetController` with `addCustomAction(view: UIView)` . Adds a custom action view to the ActionSheetController

```swift
let textfield: UITextField = {
    let view = UITextField()
    view.borderStyle = .bezel
    view.placeholder = "Enter contact name"
    view.widthAnchor.constraint(equalToConstant: 300).isActive = true
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
}()

let alert = ActionSheetController(title: "Edit Contact", message: "Enter new contact name")
alert.addCustomAction(view: textfield)
alert.addAction(title: "Cancel", type: .normal, action: nil)
alert.addDoneAction(title: "Save", type: .normal, action: {
    let name = textfield.text
    //Save contact
})
alert.launch()
```
<img width="250" height="500" src="https://raw.githubusercontent.com/papibiyi/ActionSheetController/main/Sources/Screenshots/sc5.png" alt="">

```swift
let slider: UISlider = {
    let view = UISlider(frame: .zero)
    view.widthAnchor.constraint(equalToConstant: 300).isActive = true
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
}()
let alert = ActionSheetController(title: "Background Opacity", message: "Drag slider to adjust opacity")
alert.addCustomAction(view: slider)
alert.addAction(title: "Cancel", type: .normal, action: nil)
alert.addDoneAction(title: "Save", type: .normal, action: {
    //Save
})
alert.launch()
```
<img width="250" height="500" src="https://raw.githubusercontent.com/papibiyi/ActionSheetController/main/Sources/Screenshots/sc6.png" alt="">

### ActionSheetController with header image

`ActionSheetController` with `addHeader(image: UIImage?, size: Size? = nil, cornerRadius: CGFloat? = nil, title: String?, message: String?)` . Adds a custom header image to the ActionSheetController

```swift
let alert = ActionSheetController(title: nil, message: nil)
alert.addHeader(image: UIImage(named: "pic"), cornerRadius: 50, title: "John Doe", message: "iOS Developer")
alert.addAction(title: "Follow", type: .normal, action: nil)
alert.addAction(title: "Unfollow", type: .destructive, action: nil)
alert.launch()
```
<img width="250" height="500" src="https://raw.githubusercontent.com/papibiyi/ActionSheetController/main/Sources/Screenshots/sc7.png" alt="">

```swift
let alert = ActionSheetController(title: nil, message: nil)
alert.addHeader(image: UIImage(named: "success-2"), title: "Yay!", message: "You've opened the app for 3 consecutive days")
alert.addAction(title: "Claim Reward", type: .normal, action: {
    //Claim Reward
})
alert.launch()
```
<img width="250" height="500" src="https://raw.githubusercontent.com/papibiyi/ActionSheetController/main/Sources/Screenshots/sc8.png" alt="">
