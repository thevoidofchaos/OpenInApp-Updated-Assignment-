//
//  APICall.swift
//  OpenInApp (Assignment)
//
//  Created by Kushagra Shukla on 31/05/24.
//

import Foundation

final class APICall {
    
    // Define the API endpoint
    let urlString = "https://api.inopenapp.com/api/v1/dashboardNew"
    
    // Define the access token
    let accessToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjU5MjcsImlhdCI6MTY3NDU1MDQ1MH0.dCkW0ox8tbjJA2GgUx2UEwNlbTZ7Rr38PVFJevYcXFI"
    
    
    func callAPI(completion: @escaping (OIANetworkModel?, Error?) -> Void) {
        // Check if the URL is valid
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        // Create a URLRequest object
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        // Set the Authorization header
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        
        // Create a URLSession data task
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            // Handle any errors
            if let error = error {
                print("Error: \(error.localizedDescription)")
                completion(nil, error)
                return
            }
            
            // Check the response status code
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode != 200 {
                    print("HTTP Error: \(httpResponse.statusCode)")
                    completion(nil, error)
                    return
                }
            }
            
            // Print the raw JSON data
            if let data = data {
                    do {
                        let decodedData = try JSONDecoder().decode(OIANetworkModel.self, from: data)
                        print("Succesfully decoded data.")
                        print(decodedData)
                        completion(decodedData, nil)
                    } catch {
                        print("JSON Error: \(error.localizedDescription)")
                        completion(nil, error)
                    }
                }
        }
        
        // Start the task
        task.resume()
    }
    
}
