//
//  NativeRequestable.swift
//  GitHubTask
//
//  Created by Eslam Mohamed on 29/07/2025.
//

import Foundation

protocol Requestable {
    var requestTimeOut: Float { get }
    func request<T: Codable>(_ req: NetworkRequest,_ decodeResponse:Bool) async throws -> T?
}

class NativeRequestable: Requestable {
    
    public var requestTimeOut: Float = 10
    
    func request<T>(_ req: NetworkRequest,_ decodeResponse:Bool = true) async throws -> T?
    where T?: Decodable, T?: Encodable {
        
        print("Request : \(req)")
        if let requestBodyData = req.body{
            if let dataString = String(data: requestBodyData, encoding: .utf8) {
                print("Request body : \(dataString)")
            }
        }
        
        guard let url = URL(string: req.url) else {
            // Return a fail publisher if the url is invalid
            throw NetworkError(message: "Invalid Url")
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(for: req.buildURLRequest(with: url))
            //checks for HTTPstatus errors
            guard let response = response as? HTTPURLResponse else {
                throw NetworkError(message: "no result")
            }
            
            print("Response : \(response)")
            if let dataString = String(data: data, encoding: .utf8) {
                print("Data : \(dataString)")
            }
            
            switch response.statusCode {
            case 200...299:
                if decodeResponse {
                    do {
                        let decoder = JSONDecoder()
                        let decodedResponse = try decoder.decode(T.self, from: data)
                        return decodedResponse
                    } catch {
                        print("JSON Error \(error)")
                        throw NetworkError(code : response.statusCode , message: "parse error")
                    }
                    
                } else {
                    return true as? T
                }
                
            case 400,404,402,403,401:
                if decodeResponse {
                    do {
                        let decoder = JSONDecoder()
                        let decodedResponse = try decoder.decode(T.self, from: data)
                        return decodedResponse
                    } catch {
                        do {
                            let decoder = JSONDecoder()
                            let decodedResponse = try decoder.decode(GeneralModel.self, from: data)
                            return decodedResponse as? T
                        } catch {
                            print("JSON Error \(error)")
                            throw NetworkError(code : response.statusCode , message: "parse error")
                        }
                    }
                    
                } else {
                    throw NetworkError(code : response.statusCode ,message: String.init(data: data, encoding: .utf8))
                }
            default:
                guard let decodedError = try? JSONDecoder().decode(ErrorModel.self, from: data) else {
                    throw NetworkError(code : response.statusCode ,message: String.init(data: data, encoding: .utf8))
                }
                print("Request Failed with : status code (\(response.statusCode)) & the error is \(decodedError.error ?? "")")
                throw NetworkError(code: response.statusCode,message: decodedError.error,description: decodedError.error_description)
            }
        } catch let error {
            if error is URLError {
                throw NetworkError(message: error.localizedDescription)
                
            } else if error is NetworkError {
                throw error
                
            } else {
                throw NetworkError(message: error.localizedDescription)
            }
        }
    }
}


