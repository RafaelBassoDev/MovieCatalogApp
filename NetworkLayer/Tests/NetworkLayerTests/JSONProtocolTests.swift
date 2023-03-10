import XCTest
@testable import NetworkLayer

class JSONFileLoadingMock: JSONFileLoading {}
class JSONDataParsingMock: JSONDataParsing {}

class JSONResponse: Codable {
    let id: Int
    let title: String
    let completed: Bool
}

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
    
    func testParseValidJSONFile() {
        
        let jsonFileName = "json_response"
        
        guard let loadedData = mockLoader.loadDataFromFile(named: jsonFileName, bundle: bundle) else {
            XCTFail("Failed to load JSON file.")
            return
        }
        
        let parsedData = mockParser.parse(data: loadedData, from: JSONResponse.self)
        
        XCTAssertNotNil(parsedData)
    }
    
    func testParsedJSONDataMatchesInitialData() {
        
        let data = """
            {
                "id": 1,
                "title": "SomeTitle",
                "completed": true
            }
            """.data(using: .utf8)
        
        guard let jsonData = data, let parsedData = mockParser.parse(data: jsonData, from: JSONResponse.self) else {
            XCTFail("Failed to parse JSON data.")
            return
        }
        
        XCTAssertEqual(parsedData.id, 1)
        XCTAssertEqual(parsedData.title, "SomeTitle")
        XCTAssertEqual(parsedData.completed, true)
        
    }
    
}
