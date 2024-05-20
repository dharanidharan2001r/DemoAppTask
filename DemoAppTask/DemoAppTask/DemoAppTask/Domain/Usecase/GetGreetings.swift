//
//  GetGreetings.swift
//  DemoAppTask
//
//  Created by Dharani dharan R on 16/05/24.
//

import Foundation


public class GetGreetingsRequest: Request {
    
}


public class GetGreetingsResponse: Response {
    
    var greetings: String
    
    public init(greetings: String) {
        self.greetings = greetings
    }
}


public class GetGreetings: ParentUsecase {
    
    var dataManager: DashboardDataManagerContract
    
    public init(dataManager: DashboardDataManagerContract) {
        self.dataManager = dataManager
    }
    
    public func getGreetings(handler: @escaping (String) -> Void) {
        dataManager.getGreetings() { (data) in
            handler(data)
        }
    }
    
    public override func run(request: Request, completionHandler: @escaping (Response) -> Void) {
        getGreetings { [self] (data) in
            let greetings = data
            let response = GetGreetingsResponse(greetings: greetings)
            invoke(response: response, completionHandler: completionHandler)
        }
    }
}
