## How to install

1 . Install alpha version [qase-xctest](https://github.com/qase-tms/qase-xctest) utils.

```bash
pip3 install -i https://test.pypi.org/simple/ qase-xctest==1.0.0a2
```

2. Add this pod to your test target.

```
target 'Tests' do
    pod 'Qase'    
end
```

## How to use

### Prepare your tests

Add qase testId at the beginning of the test. You can find testId in your project in [qase.io](https://qase.io).

```swift
import Qase

class Tests: XCTestCase {
    
    func testExample() {
        // Test Id
        startQaseTest(id: 123)
        ...
    }
}
```


Add steps. 

```swift
func testExample() {
    ...
    step("Some step") { _ in
        // Your checks
    }
    ...
}
        
```

Or you can add mark in your activiy.

```swift
func testExample() {
    ...
    // Or you can mark activity as a step.
    // Only first level activities can be market as a step.
    // All inner marks will be ignored.
    XCTContext.runActivity(named: "Some step") { _ in
        markQaseStep()
        // Your checks
        
        // This is part of step.
        XCTContext.runActivity(named: "Substep") { _ in
            // This mark is incorrect.
            // markQaseStep()
            
            // Your checks
        }
    }
    ...
}
```

### Send report to [qase.io](https://qase.io)

Use `qasexcode` tool for send your last report from build directory.

```bash
qasexcode --build $BUILD_ROOT \
  --api_token YOUR_API_TOKEN \ 
  --project_code YOUR_PROJECT_CODE \ 
  --run_name From_Xcode \
  --upload_attachments
```

Get api token here https://app.qase.io/user/api/token.

* You can send last report after your test run every time. [Video manual](https://www.youtube.com/watch?v=lV6pyiuD9Uk).
    1. Select `Edit Scheme...` -> `Test` -> `Post-Action`
    4. Add bash script 
    5. Select test target in `Provide Build Seting From`
    5. Run tests
    6. Check in [qase.io](https://qase.io)

* You can send last report when you want, not every time. [Video manual](https://www.youtube.com/watch?v=DN1Z_2TPy_g).
    1. Add `Aggregate` target
    2. Add `Run script` in `Build Phases`
    3. Add bash script 
    4. Run tests
    5. Check in [qase.io](https://qase.io)



