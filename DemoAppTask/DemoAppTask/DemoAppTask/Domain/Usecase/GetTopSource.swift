//
//  GetTopSource.swift
//  DemoAppTask
//
//  Created by Dharani dharan R on 16/05/24.
//

import Foundation


public class GetTopSourceRequest: Request {
    
}

public class GetTopSourceResponse: Response {
    
    var topSource: String
    
    public init(topSource: String) {
        self.topSource = topSource
    }
}

public class GetTopSource: ParentUsecase {
    
    var dataManager: DashboardDataManagerContract
    
    public init(dataManager: DashboardDataManagerContract) {
        self.dataManager = dataManager
    }
    
    public func getTopSource(handler: @escaping (String?) -> Void) {
        dataManager.getTopSource() { (data) in
            handler(data)
        }
    }
    
    public override func run(request: Request, completionHandler: @escaping (Response) -> Void) {
        getTopSource { [self] (data) in
            let topSource = data ?? "Top source"
            let response = GetTopSourceResponse(topSource: topSource)
            invoke(response: response, completionHandler: completionHandler)
        }
    }
}
