import XCTest
@testable import NetworkLayer

class JSONFileLoadingMock: JSONFileLoading {}
class JSONDataParsingMock: JSONDataParsing {}

final class JSONProtocolTests: XCTestCase {
    
    var bundle = Bundle.module
    
    var mockLoader = JSONFileLoadingMock()
    var mockParser = JSONDataParsingMock()
    
    func testLoadInvalidJSONFile() {
        
        let invalidJSONName = "some_invalid_name"
        
        let loadedData = mockLoader.loadDataFromFile(named: invalidJSONName, bundle: bundle)
        
        XCTAssertNil(loadedData)
    }

    func testLoadValidJSONFile() {
        
        let validJSONName = "json_response"
        
        let loadedData = mockLoader.loadDataFromFile(named: validJSONName, bundle: bundle)
        
        XCTAssertNotNil(loadedData)
    }
    
}
