//
//  APIRequestRetrier.swift
//  Osminog3SDK
//
//  Created by Alexander Khiger on 18.02.2022.
//

import Alamofire

class APIRequestRetrier: RequestInterceptor {
    
    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        urlRequest
    }
    
    func retry(
        _ request: Request,
        for session: Session,
        dueTo error: Error,
        completion: @escaping (RetryResult) -> Void
    ) {
        // If task failed 3 attempts to finish, everything is very bad (connection is dead).
        
        guard request.retryCount < 3 else {
            print("OSMINOG3_DEBUG: BaseRequestRetrier failed to regain connection in 4 attempts. RIP")
            return completion(.doNotRetry)
        }
        
        // If task was not completed at all (probably because of unstable connection), try it again.
        
        guard request.task?.response as? HTTPURLResponse != nil else {
            print("OSMINOG3_DEBUG: Task returned no response. Trying again. Attempt \(request.retryCount + 1)")
            return completion(.retryWithDelay(Double(request.retryCount) * 3.0))
        }
        
        completion(.doNotRetry)
    }
    
}
