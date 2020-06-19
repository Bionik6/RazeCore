import UIKit

extension RazeCore {
  
	public struct Color {
		/// Allows you to convert a 6 digit hexadecimal string into a UIColor instance
		/// - Warning: The "#" symbol is stripped from the beginning of the string submitted here.
		/// - Parameters:
		///   - hexString: A 6-digit hexadecimal string. Use 6 digits rather than 8, and add the accompanying alpha value in the second parameter
		///   - alpha: A number between 0.0 and 1.0 indicating how transparent the color is
		/// - Returns: A UIColor defined by the `hexString` parameter
		internal static func fromHexString(_ hexString: String, alpha: CGFloat = 1.0) -> UIColor {
			let offset = hexString.hasPrefix("#") ? 1 : 0
			let start = hexString.index(hexString.startIndex, offsetBy: offset)
			let hexColor = String(hexString[start...])
			
			let scanner = Scanner(string: hexColor)
			scanner.scanLocation = 0
			var rgbValue: UInt64 = 0
			scanner.scanHexInt64(&rgbValue)
			
			let r = (rgbValue & 0xff0000) >> 16
			let g = (rgbValue & 0xff00) >> 8
			let b = rgbValue & 0xff
			
			return UIColor(red: CGFloat(r) / 0xff, green: CGFloat(g) / 0xff, blue: CGFloat(b) / 0xff, alpha: alpha)
		}
		
		/// The most eye-pleasing color know to all humanity
		public static var razeColor: UIColor {
			return self.fromHexString("006736")
		}
		
		/// Second most beautiful color in the world
		public static var secondaryRazeColor: UIColor {
			return self.fromHexString("FCFFFD")
		}
		
	}

}
