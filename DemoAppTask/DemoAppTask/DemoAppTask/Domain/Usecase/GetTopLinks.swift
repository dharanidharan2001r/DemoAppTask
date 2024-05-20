//
//  GetTopLinks.swift
//  DemoAppTask
//
//  Created by Dharani dharan R on 16/05/24.
//

import Foundation


public class GetTopLinksRequest: Request {
    
}


public class GetTopLinksResponse: Response {
    
    var links: [URLData]
    
    public init(links: [URLData]) {
        self.links = links
    }
}


public class GetTopLinks: ParentUsecase {
    
    var dataManager: DashboardDataManagerContract
    
    public init(dataManager: DashboardDataManagerContract) {
        self.dataManager = dataManager
    }
    
    public func getTopLinks(handler: @escaping ([URLData]?) -> Void) {
        dataManager.getTopLinks { (data) in
            handler(data)
        }
    }
    
    public override func run(request: Request, completionHandler: @escaping (Response) -> Void) {
        getTopLinks { [self] (data) in
            let topLinks = data ?? []
            let response = GetTopLinksResponse(links: topLinks)
            invoke(response: response, completionHandler: completionHandler)
        }
    }
}
