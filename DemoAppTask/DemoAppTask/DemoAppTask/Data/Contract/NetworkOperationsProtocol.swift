//
//  NetworkOperationsProtocol.swift
//  DemoAppTask
//
//  Created by Dharani dharan R on 16/05/24.
//

import Foundation


public protocol NetworkOperationsProtocol {
    
    func getTodayClicks(handler: @escaping(Int?) -> Void)
    
    func getTopLocation(handler: @escaping(String?) -> Void)
    
    func getTopSource(handler: @escaping(String?) -> Void)
    
    func getTopLinks(handler: @escaping([URLData]?) -> Void)
    
    func getRecentLinks(handler: @escaping([URLData]?) -> Void)
    
    func getOverallUrlChartData(handler: @escaping([String: Int]?) -> Void)
    
}
