//
//  GetTodayClicks.swift
//  DemoAppTask
//
//  Created by Dharani dharan R on 16/05/24.
//

import Foundation


public class GetTodayClicksRequest: Request {
    
}


public class GetTodayClicksResponse: Response {
    
    var todayClicks: Int
    
    public init(todayClicks: Int) {
        self.todayClicks = todayClicks
    }
}


public class GetTodayClicks: ParentUsecase {
    
    var dataManager: DashboardDataManagerContract
    
    public init(dataManager: DashboardDataManagerContract) {
        self.dataManager = dataManager
    }
    
    public func getTodayClicks(handler: @escaping (Int?) -> Void) {
        dataManager.getTodayClicks() { (data) in
            handler(data)
        }
    }
    
    public override func run(request: Request, completionHandler: @escaping (Response) -> Void) {
        getTodayClicks { [self] (data) in
            let todayClicks = data ?? 0
            let response = GetTodayClicksResponse(todayClicks: todayClicks)
            invoke(response: response, completionHandler: completionHandler)
        }
    }
}
