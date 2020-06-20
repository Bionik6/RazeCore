import Foundation

public protocol NetworkSession {
	func get(from url: URL, completionHandler: @escaping (Data?, Error?) -> Void)
}

extension URLSession: NetworkSession {
	public func get(from url: URL, completionHandler: @escaping (Data?, Error?) -> Void) {
		let task = dataTask(with: url) { data, _, error in
			completionHandler(data, error)
		}
		task.resume()
	}
}

extension RazeCore {
	
	
	/// Responsible for handling all networking call
	/// - Warning: Must create before using any public APIs
	public class Networking {
		
		public class Manager {
			public init() { }
			
			internal var session: NetworkSession = URLSession.shared
			
 			/// Calls to the live internet to retrieve Data from a specific location
			/// - Parameters:
			///   - url: The location you wish to fetch data from
			///   - completion: Returns a result ofject which signifies the status of the request
			public func loadData(from url: URL, completion: @escaping (NetworkResult<Data>)->Void) {
				session.get(from: url) { data, error in
					let result = data.map(NetworkResult<Data>.success) ?? .failure(error)
					completion(result)
				}
			}
		}
		
	}
	
	public enum NetworkResult<Value> {
		case success(Value)
		case failure(Error?)
	}
}
