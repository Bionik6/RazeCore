import XCTest
@testable import RazeCore

final class RazeNetworkingTests: XCTestCase {
	
	func test_load_data_call() {
		let manager = RazeCore.Networking.Manager()
		let expectation = XCTestExpectation(description: "called for data")
		guard let url = URL(string: "https://raywernderlich.com") else {
			return XCTFail("could not load URL properly")
		}
		manager.loadData(from: url) { result in
			expectation.fulfill()
			switch result {
				case .success(let data):
					XCTAssertNotNil(data, "Response data is nil")
				case .failure(let error):
					XCTFail(error?.localizedDescription ?? "Error forming error result")
			}
		}
		wait(for: [expectation], timeout: 5.0)
	}

}
