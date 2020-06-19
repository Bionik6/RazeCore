import XCTest
@testable import RazeCore

final class RazeCoreTests: XCTestCase {
	
	func test_color_from_hex_string() {
		let color = RazeCore.colorFromHexString("FF0000")
		XCTAssertEqual(color, .red)
	}
	
	
	
	static var allTests = [
		("test_color_from_hex_string", test_color_from_hex_string),
	]
}
