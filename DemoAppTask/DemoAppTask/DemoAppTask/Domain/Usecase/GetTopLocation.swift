//
//  GetTopLocation.swift
//  DemoAppTask
//
//  Created by Dharani dharan R on 16/05/24.
//

import Foundation


public class GetTopLocationRequest: Request {
    
}


public class GetTopLocationResponse: Response {
    
    var topLocation: String
    
    public init(topLocation: String) {
        self.topLocation = topLocation
    }
}


public class GetTopLocation: ParentUsecase {
    
    var dataManager: DashboardDataManagerContract
    
    public init(dataManager: DashboardDataManagerContract) {
        self.dataManager = dataManager
    }
    
    public func getTopLocation(handler: @escaping (String?) -> Void) {
        dataManager.getTopLocation() { (data) in
            handler(data)
        }
    }
    
    public override func run(request: Request, completionHandler: @escaping (Response) -> Void) {
        getTopLocation { [self] (data) in
            let topLocation = data ?? "Top location"
            let response = GetTopLocationResponse(topLocation: topLocation)
            invoke(response: response, completionHandler: completionHandler)
        }
    }
}
