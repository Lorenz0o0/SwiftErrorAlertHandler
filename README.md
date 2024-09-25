# ErrorAlertHandler

ErrorAlertHandler is a Swift package that simplifies handling errors in your SwiftUI applications by providing an easy-to-use alert modifier. This package introduces a custom view modifier and environment value to streamline error presentation using SwiftUI's `Alert`.

## Features

- Easily handle and display error alerts in SwiftUI views.
- Use environment-based error handling for flexibility and convenience.
- Customize how errors are presented within your app.

## Installation

### Swift Package Manager (SPM)

To add **ErrorAlertHandler** to your project:

1. Open your Xcode project.
2. Navigate to `File > Add Packages...`
3. Enter the repository URL: `https://github.com/Lorenz0o0/SwiftErrorAlertHandler`
4. Select the version you want to install.
5. Click **Add Package**.

Alternatively, you can add the following line to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/Lorenz0o0/SwiftErrorAlertHandler", from: "1.0.0")
]
```

## Usage

To use **ErrorAlertHandler** in your SwiftUI views, follow these steps:

1. **Import ErrorAlertHandler in your SwiftUI file:**

    ```swift
    import ErrorAlertHandler
    ```

2. **Apply the `errorAlertHandler()` modifier to your `ContentView` in your app's `@main` entry point:**

    ```swift
    @main
    struct MyApp: App {
        var body: some Scene {
            WindowGroup {
                ContentView()
                    .errorAlertHandler()
            }
        }
    }
    ```

3. **Use the `showAlert` environment value to trigger an alert when an error occurs:**

    ```swift
    struct ContentView: View {
        @Environment(\.showAlert) private var showAlert
        
        var body: some View {
            VStack {
                Button("Trigger Error") {
                    showAlert(MyError.sampleError)
                }
            }
        }
    }
    
    enum MyError: Error, LocalizedError {
        case sampleError
        
        var errorDescription: String? {
            switch self {
            case .sampleError:
                return "This is a sample error."
            }
        }
    }
    ```

## Example

Here’s a complete example of how to use the package, including the `errorAlertHandler()` modifier in the `@main` app entry point:

```swift
import SwiftUI
import ErrorAlertHandler

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .errorAlertHandler()
        }
    }
}

struct ContentView: View {
    @Environment(\.showAlert) private var showAlert
    
    var body: some View {
        VStack {
            Text("Tap the button to trigger an error alert.")
                .padding()
            
            Button("Trigger Error") {
                showAlert(MyError.sampleError)
            }
        }
    }
}

enum MyError: Error, LocalizedError {
    case sampleError
    
    var errorDescription: String? {
        switch self {
        case .sampleError:
            return "This is a sample error."
        }
    }
}
```

## Notes

- `errorAlertHandler()` should be applied to the root view in the SwiftUI hierarchy, ensuring that all children can use the `showAlert` environment value to trigger errors.
- The alert will display the `localizedDescription` of the error passed into the `showAlert` closure.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
