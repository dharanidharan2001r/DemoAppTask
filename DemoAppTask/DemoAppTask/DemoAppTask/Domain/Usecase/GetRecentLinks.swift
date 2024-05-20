//
//  GetRecentLinks.swift
//  DemoAppTask
//
//  Created by Dharani dharan R on 16/05/24.
//

import Foundation


public class GetRecentLinksRequest: Request {
    
}


public class GetRecentLinksResponse: Response {
    
    var links: [URLData]
    
    public init(links: [URLData]) {
        self.links = links
    }
}


public class GetRecentLinks: ParentUsecase {
    
    var dataManager: DashboardDataManagerContract
    
    public init(dataManager: DashboardDataManagerContract) {
        self.dataManager = dataManager
    }
    
    public func getRecentLinks(handler: @escaping ([URLData]?) -> Void) {
        dataManager.getRecentLinks { (data) in
            handler(data)
        }
    }
    
    public override func run(request: Request, completionHandler: @escaping (Response) -> Void) {
        getRecentLinks { [self] (data) in
            let topLinks = data ?? []
            let response = GetTopLinksResponse(links: topLinks)
            invoke(response: response, completionHandler: completionHandler)
        }
    }
}
