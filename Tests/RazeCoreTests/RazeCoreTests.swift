import XCTest
@testable import RazeCore

final class RazeCoreTests: XCTestCase {
	
	func test_color_from_hex_string() {
		let color = RazeCore.colorFromHexString("FF0000")
		XCTAssertEqual(color, .red)
	}
	
	func test_Raze_code_colors_are_equal() {
		let color = RazeCore.colorFromHexString("006736")
		XCTAssertEqual(color, RazeCore.razeColor)
	}
	
}
