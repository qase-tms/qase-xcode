import XCTest

public extension XCTestCase {
    
    func startQaseTest(id: Int) {
    
        addTeardownBlock { [weak self] in
            var config = [String: Any]()
            config["caseId"] = id
            
            guard let data = try? JSONSerialization.data(withJSONObject: config, options: []) else { return }
            let attachment = XCTAttachment(data: data)
            attachment.name = "Qase config"
            attachment.lifetime = .keepAlways
            
            self?.add(attachment)
        }
    }
    
    func step(_ name: String? = nil, block: (XCTActivity) -> Void) {
        let activityName = name.map { "Step: \($0)"} ?? "Step"
        
        XCTContext.runActivity(named: activityName) { activity in
            block(activity)
            markQaseStep()
        }
    }
    
    func markQaseStep() {
        let attachment = XCTAttachment(string: "")
        attachment.name = "Qase step marker"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
