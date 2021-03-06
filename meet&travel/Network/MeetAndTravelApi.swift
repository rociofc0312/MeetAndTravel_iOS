//
//  MeetAndTravelApi.swift
//  meet&travel
//
//  Created by Developer User on 11/20/18.
//  Copyright © 2018 UPC. All rights reserved.
//

import Foundation
import os
import Alamofire

class MeetAndTravelApi {
    static let baseUrl = "https://movilesapp-220219.appspot.com/api"
    static let allEventsUrl = "\(baseUrl)/events"
    static let registerUrl = "\(baseUrl)/users"
    static let loginUrl = "\(baseUrl)/users/auth"
    
    static private func get<T: Decodable>(
        from urlString: String,
        parameters: [String : String],
        responseType: T.Type,
        responseHandler: @escaping ((T) -> Void),
        errorHandler: @escaping ((Error) -> Void)) {
        // Validate URL
        guard let url = URL(string: urlString) else {
            let message = "Error on URL"
            os_log("%@", message)
            return
        }
        
        // Make the Request
        Alamofire.request(url, parameters: parameters)
            .validate()
            .responseJSON(completionHandler: { response in
                switch response.result {
                case .success(_):
                    do {
                        let decoder = JSONDecoder()
                        if let data = response.data {
                            let dataResponse = try decoder.decode(responseType, from: data)
                            responseHandler(dataResponse)
                        }
                    } catch {
                        errorHandler(error)
                    }
                case .failure(let error):
                    errorHandler(error)
                }
            })
    }
    
    static private func getNoAuth<T: Decodable>(
        from urlString: String,
        responseType: T.Type,
        responseHandler: @escaping ((T) -> Void),
        errorHandler: @escaping ((Error) -> Void)) {
        // Validate URL
        guard let url = URL(string: urlString) else {
            let message = "Error on URL"
            os_log("%@", message)
            return
        }
        // Make the Request
        Alamofire.request(url)
            .validate()
            .responseJSON(completionHandler: { response in
                switch response.result {
                case .success(_):
                    do {
                        let decoder = JSONDecoder()
                        if let data = response.data {
                            let dataResponse = try decoder.decode(responseType, from: data)
                            print(data)
                            responseHandler(dataResponse)
                        }
                    } catch {
                        errorHandler(error)
                    }
                case .failure(let error):
                    errorHandler(error)
                }
            })
    }
    
    static private func postNoAuth<T: Decodable>(
        from urlString: String,
        authorization: String,
        parameters: [String: String],
        responseType: T.Type,
        responseHandler: @escaping ((T) -> Void),
        errorHandler: @escaping ((Error) -> Void)) {
        // Validate URL
        guard let url = URL(string: urlString) else {
            let message = "Error on URL"
            os_log("%@", message)
            return
        }
        let headers: HTTPHeaders = ["Content-Type":"application/json","Authorization": authorization]
        
        // Make the Request
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default , headers: headers)
            .validate()
            .responseJSON(completionHandler: { response in
                switch response.result {
                case .success(_):
                    do {
                        let decoder = JSONDecoder()
                        if let data = response.data {
                            let dataResponse = try decoder.decode(responseType, from: data)
                            print(data)
                            responseHandler(dataResponse)
                        }
                    } catch {
                        errorHandler(error)
                    }
                case .failure(let error):
                    errorHandler(error)
                }
            })
    }

    static func getEvents(
        responseHandler: @escaping ((NetworkResponse) -> Void),
        errorHandler: @escaping ((Error) -> Void)) {
        self.getNoAuth(
            from: allEventsUrl,
            responseType: NetworkResponse.self,
            responseHandler: responseHandler,
            errorHandler: errorHandler)
    }
    
    static func requestRegister(authorization: String, parameters: Parameters,
                                responseHandler: @escaping ((NetworkResponse) -> Void),
                                errorHandler: @escaping ((Error) -> Void)){
        self.postNoAuth(from: registerUrl, authorization: authorization, parameters: parameters as! [String : String], responseType: NetworkResponse.self, responseHandler: responseHandler, errorHandler: errorHandler)
    }
    
    static func requestLogin(authorization: String, parameters: Parameters,
                                responseHandler: @escaping ((NetworkResponse) -> Void),
                                errorHandler: @escaping ((Error) -> Void)){
        self.postNoAuth(from: loginUrl, authorization: authorization, parameters: parameters as! [String : String], responseType: NetworkResponse.self, responseHandler: responseHandler, errorHandler: errorHandler)
    }
    
}

