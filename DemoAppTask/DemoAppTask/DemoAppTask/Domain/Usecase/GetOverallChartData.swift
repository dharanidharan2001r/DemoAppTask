//
//  GetOverallChartData.swift
//  DemoAppTask
//
//  Created by Dharani dharan R on 16/05/24.
//

import Foundation


public class GetOverallUrlChartDataRequest: Request {
    
}

public class GetOverallUrlChartDataResponse: Response {
    
    var data: [String: Int]
    
    public init(data: [String : Int]) {
        self.data = data
    }
}

public class GetOverallUrlChartData: ParentUsecase {
    
    var dataManager: DashboardDataManagerContract
    
    public init(dataManager: DashboardDataManagerContract) {
        self.dataManager = dataManager
    }
    
    public func getOverallUrlChartData(handler: @escaping ([String: Int]?) -> Void) {
        dataManager.getOverallUrlChartData { (data) in
            handler(data)
        }
    }
    
    public override func run(request: Request, completionHandler: @escaping (Response) -> Void) {
        getOverallUrlChartData { [self] (data) in
            let overallUrlChartData = data ?? [:]
            let response = GetOverallUrlChartDataResponse(data: overallUrlChartData)
            invoke(response: response, completionHandler: completionHandler)
        }
    }
}
