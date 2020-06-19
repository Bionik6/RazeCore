import Foundation

extension RazeCore {
	
	public class Networking {
		
		public class Manager {
			public init() { }
			
			private let session = URLSession.shared
			
			public func loadData(from url: URL, completion: @escaping (NetworkResult<Data>)->Void) {
				let task = session.dataTask(with: url) { (data, response, error) in
					let result = data.map(NetworkResult<Data>.success) ?? .failure(error)
					completion(result)
				}
				task.resume()
			}
		}
		
	}
	
	public enum NetworkResult<Value> {
		case success(Value)
		case failure(Error?)
	}
}
