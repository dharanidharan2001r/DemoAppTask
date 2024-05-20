//
//  DashboardDataManager.swift
//  DemoAppTask
//
//  Created by Dharani dharan R on 16/05/24.
//

import Foundation


public class DashboardDataManager: DashboardDataManagerContract {
    
    public var network: NetworkOperationsProtocol?
    
    public init(network: NetworkOperationsProtocol) {
        self.network = network
    }
    
    public func getGreetings(handler: @escaping(String) -> Void) {
        var greeting = ""
        let hour = NSCalendar.current.component(.hour, from: NSDate() as Date)
        if hour >= 0 && hour < 12 {
        greeting = "Good Morning"
        } else if hour >= 12 && hour < 17 {
        greeting = "Good Afternoon"
        } else if hour >= 17 {
        greeting = "Good Evening"
        }
        handler(greeting)
    }
    
    public func getTodayClicks(handler: @escaping(Int?) -> Void) {
        network?.getTodayClicks { (data) in
            handler(data)
        }
    }
    
    public func getTopLocation(handler: @escaping(String?) -> Void) {
        network?.getTopLocation { (data) in
            handler(data)
        }
    }
    
    public func getTopSource(handler: @escaping(String?) -> Void) {
        network?.getTopSource { (data) in
            handler(data)
        }
    }
    
    public func getTopLinks(handler: @escaping([URLData]?) -> Void) {
        network?.getTopLinks { (data) in
            handler(data)
        }
    }
    
    public func getRecentLinks(handler: @escaping([URLData]?) -> Void) {
        network?.getRecentLinks { (data) in
            handler(data)
        }
    }
    
    public func getOverallUrlChartData(handler: @escaping([String: Int]?) -> Void) {
        network?.getOverallUrlChartData { (data) in
            handler(data)
        }
    }
    
}
