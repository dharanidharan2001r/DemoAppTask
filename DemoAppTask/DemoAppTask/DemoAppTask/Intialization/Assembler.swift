//
//  Assembler.swift
//  DemoAppTask
//
//  Created by Dharani dharan R on 16/05/24.
//

import Foundation


public class Assembler {
    
    public static let manager = Assembler()
    private let network = NetworkOperations()
    
    private init() {}
    
    public func getHomeViewController() -> HomeViewController {
        let dataManager = DashboardDataManager(network: network)
        
        let getGreetings = GetGreetings(dataManager: dataManager)
        let getTodayClicks = GetTodayClicks(dataManager: dataManager)
        let getTopLocation = GetTopLocation(dataManager: dataManager)
        let getTopSource = GetTopSource(dataManager: dataManager)
        let getTopLinks = GetTopLinks(dataManager: dataManager)
        let getRecentLinks = GetRecentLinks(dataManager: dataManager)
        let getOverAllChartdata = GetOverallUrlChartData(dataManager: dataManager)
        
        let presenter = HomeViewPresenter(getGreetings: getGreetings, getTodayClicks: getTodayClicks, getTopLocation: getTopLocation, getTopSource: getTopSource, getTopLinks: getTopLinks, getRecentLinks: getRecentLinks, getOverallUrlChartData: getOverAllChartdata)
        
        let viewController = HomeViewController(presenter: presenter)
        return viewController
    }
}
