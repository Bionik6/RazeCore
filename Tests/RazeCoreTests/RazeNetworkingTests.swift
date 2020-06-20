import XCTest
@testable import RazeCore

class NetworkSessionMock: NetworkSession {
	private var data: Data?
	private var error: Error?
	
	func get(from url: URL, completionHandler: @escaping (Data?, Error?) -> Void) {
		completionHandler(data, error)
	}
	
}



final class RazeNetworkingTests: XCTestCase {
	
	func test_load_data_call() {
		let manager = RazeCore.Networking.Manager()
		let session = NetworkSessionMock()
		manager.session = session
		let expectation = XCTestExpectation(description: "called for data")
		let data = Data([0, 1, 0, 1])
		let url = URL(fileURLWithPath: "url")
		manager.loadData(from: url) { result in
			expectation.fulfill()
			switch result {
				case .success(let returnedData):
					XCTAssertEqual(data, returnedData, "manager returned unexpected data")
				case .failure(let error):
					XCTFail(error?.localizedDescription ?? "Error forming error result")
			}
		}
		wait(for: [expectation], timeout: 5.0)
	}

}
 
