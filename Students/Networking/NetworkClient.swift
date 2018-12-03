import Foundation

struct NetworkClient {
    
    static let url = URL(string: "https://studentdirectory.vapor.cloud/students")!
    
    func fetchRecipes(completion: @escaping ([Student]?, Error?) -> Void) {
        URLSession.shared.dataTask(with: NetworkClient.url) { (data, _, error) in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                completion(nil, NSError())
                return
            }
            
            do {
                let recipes = try JSONDecoder().decode([Student].self, from: data)
                completion(recipes, nil)
            } catch {
                completion(nil, error)
                return
            }
        }.resume()
    }
}
