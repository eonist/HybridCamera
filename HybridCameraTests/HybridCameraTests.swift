import XCTest
import HybridCamLib
import ResultSugariOS

class HybridCameraTests: XCTestCase {
   override func setUp() {
      super.setUp()
      // Put setup code here. This method is called before the invocation of each test method in the class.
   }
   override func tearDown() {
      super.tearDown()
      // Put teardown code here. This method is called after the invocation of each test method in the class.
   }
   func testExample() {
      let fileURL: URL? = FileUtil.tempURL(suffix: ".jpeg").value()
      XCTAssertNotNil(fileURL)
      XCTAssertFalse(FileManager().fileExists(atPath: fileURL!.path))
      //      XCTAssertEqual("Hello, World!", "Hello, World!")
   }
}
