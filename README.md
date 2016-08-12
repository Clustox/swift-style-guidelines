# Swift Style and guidelines

## Introduction

Swift is a new programming language, first introduced by Apple in June 2014 for development on iOS, OSX, tVOS and WatchOS. We can call it the future of mobile development in Apple. Here are a few guidelines for programmers starting to learn this language.

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

* Parameter names must be there in function definition to clear ambiguity and provide clarity about nature and type of a certain parameter.

#### Avoid Using
```swift
manager.remove(x)
```

#### Instead Use
```swift
manager.remove(notificationId: x)
```

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
* Values of Enum must be in Camel case.

#### Avoid Using
```swift
public enum titles: String {
	case settings = "Settings"
	case feed = "Feed"
	case friends = "Friends"
}
```

#### Instead Use
```swift
public enum Titles: String {
	case Settings = "Settings"
	case Feed = "Feed"
	case Friends = "Friends"
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
* If no specifier is provided by default, it would be public.

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

* Avoid force unwrapping of Optional values instead Use ***guard***  to unwrap the values.

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
In Swift, the structs are way more powerful than their counterparts. Like class, struct can also have properties, methods, protocols, extensions and initialisers. So except inheritance, structs are very much classes in Swift and are really light-weight and faster when it comes to processing. Inheritance itself is not a good enough reason to use classes. It can be achieved by using protocols and Composition, which is highly supported in Swift.
</p>

### Error Handling

* Preferred way to handle an error is to throw. The object thrown must conform to the ErrorType protocol. NSError conforms to this protocol. Enums are used for classifying errors. 

```swift
enum SomeError: ErrorType {
	case LowLevel
	case MiddleLevel
    case HighLevel
}
```

```swift
func doSomeStuff(argument: String) throws {
	guard !argument.notRequired else {
  		throw SomeError.LowLevel
	}

	guard !argument.notRecommended else {
  		throw SomeError.MiddleLevel
	}

	guard !argument.restricted else {
  		throw SomeError.HighLevel
	}
	// do your stuff
}
```

* Use ***try*** ***catch*** ***finally*** to handle exceptions.

```swift
	do {
  		let response = try argument.doSomeStuff
	}

	catch SomeError.LowLevel {
  		// handle Exception
	}
	
	catch SomeError.MiddleLevel {
  		// handle Exception
	}

	catch SomeError.HighLevel {
  		// handle Exception
	}
	// do your stuff
```

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
*	A class must not exceed 200 lines of code. If it does, it's time to refactor.
*	If you want to add any functionality to the existing code, add a new extension of that class instead of changing the current one.
*	Separate business logic completely from controller code.

### Credits

This guide is established through a collaborative effort of Team Clustox. Following are some of the sources we have taken inspiration from:

* [Github](https://github.com/github/swift-style-guide)
* [Swift](https://swift.org/documentation/api-design-guidelines/#follow-case-conventions)
* [Apple](https://developer.apple.com/swift/)
* [Raywenderlich](https://github.com/raywenderlich/swift-style-guide#code-organization)
* [AppsFoundation](https://www.appsfoundation.com/post/swift-code-convention-and-guidelines)
* [BigNerdRanch](https://www.bignerdranch.com/blog/error-handling-in-swift-2/)
