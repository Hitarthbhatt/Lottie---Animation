//
//  UsersViewModel.swift
//  Senpiper - Users
//
//  Created by Hitarth on 11/05/21.
//

import Foundation


class UserViewModel: ObservableObject {
    
    
    @Published var users: [String] = []
    @Published var showProgress: Bool = false
    @Published var showLottie: Bool = false
    
    func fetchUsers(completion: @escaping (Result<[String], Error>) -> Void) {
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
            let url = "https://api.jsonbin.io/b/5ec3b9a9e91d1e45d10d0700"
            
            let session = URLSession(configuration: .default)
            
            session.dataTask(with: URL(string: url)!) { (data, _, error) in
                
                guard let apiData = data else {
                    print("No Data Found")
                    return
                }

                do {
                    
                    let data = try JSONDecoder().decode(Users.self, from: apiData)
                    print(data)
                    completion(.success(data.names))
                    
                }catch {
                    print(error.localizedDescription)
                    completion(.failure("Error in Decoding" as! Error))
                    return
                }
                
                
                //Session Task
            }.resume()
            
            //Time Threading Task
        }
        
        
    }
    
    
}
