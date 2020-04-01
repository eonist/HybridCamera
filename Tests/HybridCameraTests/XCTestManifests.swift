import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    [
        testCase(HybridCameraTests.allTests)
    ]
}
#endif
