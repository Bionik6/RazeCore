import XCTest
@testable import RazeCore

class NetworkSessionMock: NetworkSession {
	var data: Data?
	var error: Error?
	
	func get(from url: URL, completionHandler: @escaping (Data?, Error?) -> Void) {
		completionHandler(data, error)
	}
	
	func post(with request: URLRequest, completionHandler: @escaping (Data?, Error?) -> Void) {
		completionHandler(data, error)
	}
	
}

struct MockData: Codable & Equatable {
	var id: Int
	var name: String
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
					guard let error = error else { return }
					XCTFail(error.localizedDescription)
			}
		}
		wait(for: [expectation], timeout: 5.0)
	}
	
	func test_send_data_call() {
		let session = NetworkSessionMock()
		let manager = RazeCore.Networking.Manager()
		let fixture = MockData(id: 1, name: "David")
		let data = try? JSONEncoder().encode(fixture)
		session.data = data
		manager.session = session
		let url = URL(fileURLWithPath: "url")
		let expectation = XCTestExpectation(description: "send data")
		manager.sendData(to: url, body: fixture) { result in
			expectation.fulfill()
			switch result {
				case .success(let returnedData):
					let object = try? JSONDecoder().decode(MockData.self, from: returnedData)
					XCTAssertEqual(object, fixture)
					break
				case .failure(let error):
					guard let error = error else { return }
					XCTFail(error.localizedDescription)
			}
		}
		wait(for: [expectation], timeout: 5)
	}
	
}

