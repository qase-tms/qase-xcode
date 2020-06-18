import XCTest
import Qase

class Tests: XCTestCase {
    
    func testExample() {
        // Test Id
        startQaseTest(id: 123)
        
        // Without name
        step { _ in
            
            // Add attachment
            let screenshot = XCUIScreen.main.screenshot()
            let fullScreenshotAttachment = XCTAttachment(screenshot: screenshot)
            fullScreenshotAttachment.lifetime = .keepAlways
            add(fullScreenshotAttachment)
            
            // Your checks
        }
        
        // With name
        step("Some checks") { _ in
            // Your checks
        }
        
        // Or you can mark activity as a step.
        // Only first level activities can be market as a step.
        // All inner marks will be ignored.
        XCTContext.runActivity(named: "Some checks") { _ in
            markQaseStep()
            // Your checks
            
            // This is part of step.
            XCTContext.runActivity(named: "Substep") { _ in
                // This mark is incorrect.
                // markQaseStep()
                
                // Your checks
            }
        }
    }
}
