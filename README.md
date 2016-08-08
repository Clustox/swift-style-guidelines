# Swift Style and guidelines

## Introduction

Swift is a new programming language, first introduced by Apple in June 2014 for development on iOS, OSX, tVOS and WatchOS. We can call it as future of mobile development with Apple. Here are a few guidelines for programmers starting to learn this language.

<br>
Want to work in Objective-C, here is our [Objective-C guideline](https://github.com/Clustox/objective-c-style-guidelines)

- - - -
### Naming Conventions

* Name of a variable, parameter or type must be self-descriptive i.e., looking at name of the variable should inform reader about its nature.

#### Avoid Using
```swift
let y = 5
let x = 10
let z = x + y
```

#### Instead Use
```swift
let firstNumber = 5
let secondNumber = 10
let sum = firstNumber + secondNumber
```
<br>
* Avoid spelling mistakes and abbreviations for variable names.

#### Avoid Using
```swift
let tblView
let srchBar
var amnt
```

#### Instead Use
```swift
let tableView
let searchBar
var amount
```
<br>
* Parameter names must be there in function definition to clear ambiguity and provide clarity about nature and type of a certain parameter name.

#### Avoid Using
```swift
manager.remove(x)
```

#### Instead Use
```swift
manager.remove(notificationId: x)
```
<br>
* Function names must be short and precise.  Avoid repetition of information.

#### Avoid Using
```swift
manager.removeNotificationID(notificationId: x)
```

#### Instead Use
```swift
manager.remove(notificationId: x)
```

### Enums

* Enum name must be Camel case.
* Values of Enum must be in lower case.

#### Avoid Using
```swift
public enum titles: String {
	case Settings = "Settings"
	case Feed = "Feed"
	case Friends = "Friends"
}
```

#### Instead Use
```swift
public enum Titles: String {
	case settings = "Settings"
	case feed = "Feed"
	case friends = "Friends"
}
```

### Spaces

* Avoid trailing white spaces.
* You can add as much of vertical spaces as you want.
* Using [swiftlint](https://github.com/realm/SwiftLint) will help you a lot in removing trailing spaces.

### Use var only when sure. 
Swift differentiates constants from variables through keywords ***let*** and ***var*** respectively.

* Prefer using ***let*** unless you are sure that this identifer’s value is going to change in future.
* Easiest way to achieve is by declaring every parameter as ***let***. Change only when compiler asks you to do so.

### Prefer guard on if /else when possible.
Swift has introduced a new idea of early exit by using keyword ***guard***. 

* ***guard*** works by executing else part first and then make an early exit if condition not met.

#### Avoid Using
```swift
if self.childId != nil {
  // do yur work
} else {
	return
}
```

#### Instead Use
```swift
guard let childId = self.childId else {
  return
}
// do your work
```

### Access Specifier 

* Use access specifier on class level types, variables and functions to clear their scope.
* If no specifier is provided, by default it would be public.

### Defining Variables

* When defining variables, colon will be attached to the identifier instead of the type.

#### Avoid Using
```swift
@IBOutlet weak var tableView :UITableView
```

#### Instead Use
```swift
@IBOutlet weak var tableView: UITableView
```

### Force Unwrapping

* Avoid force unwrapping of Optional values. Use ***guard*** instead to unwrap the values.

#### Avoid Using
```swift
let index = self.index
students.remove(at: index) //Crash if index is null
```

#### Instead Use
```swift
guard let index = self.index else {
  return
}
students.remove(at: index)
```

### Prefer structs over classes

<p>
In Swift, struct are way more powerful than their counterparts. Like class, struct can also have properties, methods, protocols, extensions and initialisers.

So except inheritance, structs are very much classes in Swift and are really lightweight and faster when it comes to processing. Inheritance itself is not a good enough reason to use classes. It can be achieved by using protocols and Composition, which is highly supported in Swift.
</p>

### Documentation

* Try documenting the code as much as you can. Every public variable, type, method must be documented. 
* If changing an existing code or doing something in a way which is not recommended, make sure to document the reason properly. 
*	Follow a standard documentation style through out the app. Using three slash documentation will help you adding a default template for documentation.
*	Documentation must add enough information about method name, variables types, function they perform and expected output of any method.
*	Install [VVDocumenter](https://github.com/onevcat/VVDocumenter-Xcode) for standard documentation style

### General Guidelines

* Class, types and protocol names must be in camel case.

#### Avoid Using
```swift
Notificationviewcontroller
onAPIcallcompleted
Errortype
```

#### Instead Use
```swift
NotificationViewController
onAPICallCompleted
ErrorType
```

* Variables, parameters and method names must start with a small letter. Rest of the name will be in camel case.

#### Avoid Using
```swift
let Count, tableview
manager.Fetch(NotificationID: x)
manager.FetchAllNotifications()
```

#### Instead Use
```swift
let count, tableView
manager.fetch(notificationId: x)
manager.fetchAllNotifications()
```

*	Remove commented and unused code from project.
*	Switch, while, for, if, else and methods must have open brackets on same line but closing brackets on next line.
