import XCTest
@testable import RazeCore

final class RazeColorTests: XCTestCase {
	
	func test_color_from_hex_string() {
		let color = RazeCore.Color.fromHexString("FF0000")
		XCTAssertEqual(color, .red)
	}
	
	func test_Raze_code_colors_are_equal() {
		let color = RazeCore.Color.fromHexString("006736")
		XCTAssertEqual(color, RazeCore.Color.razeColor)
	}
	
	func test_secondary_raze_colors_are_equal() {
		let color = RazeCore.Color.fromHexString("FCFFFD")
		XCTAssertEqual(color, RazeCore.Color.secondaryRazeColor)
	}
	
}
