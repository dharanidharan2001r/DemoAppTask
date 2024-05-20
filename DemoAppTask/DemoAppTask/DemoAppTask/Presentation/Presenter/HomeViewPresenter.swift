//
//  HomeViewPresenter.swift
//  DemoAppTask
//
//  Created by Dharani dharan R on 16/05/24.
//

import Foundation


public class HomeViewPresenter: HomeViewPresenterContract {
    
    var getGreetings: GetGreetings
    var getTodayClicks: GetTodayClicks
    var getTopLocation: GetTopLocation
    var getTopSource: GetTopSource
    var getTopLinks: GetTopLinks
    var getRecentLinks: GetRecentLinks
    var getOverallUrlChartData: GetOverallUrlChartData
    
    public init(getGreetings: GetGreetings, getTodayClicks: GetTodayClicks, getTopLocation: GetTopLocation, getTopSource: GetTopSource, getTopLinks: GetTopLinks, getRecentLinks: GetRecentLinks, getOverallUrlChartData: GetOverallUrlChartData) {
        self.getGreetings = getGreetings
        self.getTodayClicks = getTodayClicks
        self.getTopLocation = getTopLocation
        self.getTopSource = getTopSource
        self.getTopLinks = getTopLinks
        self.getRecentLinks = getRecentLinks
        self.getOverallUrlChartData = getOverallUrlChartData
    }
    
}

extension HomeViewPresenter {
    
    public func getGreetings(handler: @escaping (String) -> Void) {
        let request = GetGreetingsRequest()
        getGreetings.execute(request: request) { (response) in
            guard let greetings = (response as? GetGreetingsResponse)?.greetings else {
                fatalError("No greetings from the dataManager")
            }
            handler(greetings)
        }
    }
    
    public func getTodayClicks(handler: @escaping (Int) -> Void) {
        let request = GetTodayClicksRequest()
        getTodayClicks.execute(request: request) { (response) in
            guard let todayClicks = (response as? GetTodayClicksResponse)?.todayClicks else {
                fatalError("No todayClicks from the dataManager")
            }
            handler(todayClicks)
        }
    }
    
    public func getTopLocation(handler: @escaping (String) -> Void) {
        let request = GetTopLocationRequest()
        getTopLocation.execute(request: request) { (response) in
            guard let topLocation = (response as? GetTopLocationResponse)?.topLocation else {
                fatalError("No topLocation from the dataManager")
            }
            handler(topLocation)
        }
    }
    
    public func getTopSource(handler: @escaping (String) -> Void) {
        let request = GetTopSourceRequest()
        getTopSource.execute(request: request) { (response) in
            guard let topSource = (response as? GetTopSourceResponse)?.topSource else {
                fatalError("No topSource from the dataManager")
            }
            handler(topSource)
        }
    }
    
    public func getTopLinks(handler: @escaping ([URLData]) -> Void) {
        let request = GetTopLinksRequest()
        getTopLinks.execute(request: request) { (response) in
            guard let topLinks = (response as? GetTopLinksResponse)?.links else {
                fatalError("No topLinks from the dataManager")
            }
            handler(topLinks)
        }
    }
    
    public func getRecentLinks(handler: @escaping ([URLData]) -> Void) {
        let request = GetRecentLinksRequest()
        getRecentLinks.execute(request: request) { (response) in
            guard let recentLinks = (response as? GetRecentLinksResponse)?.links else {
                fatalError("No recentLinks from the dataManager")
            }
            handler(recentLinks)
        }
    }
    
    public func getOverallUrlChartData(handler: @escaping ([String : Int]) -> Void) {
        let request = GetOverallUrlChartDataRequest()
        getOverallUrlChartData.execute(request: request) { (response) in
            guard let overallUrlChartData = (response as? GetOverallUrlChartDataResponse)?.data else {
                fatalError("No overallUrlChartData from the dataManager")
            }
            handler(overallUrlChartData)
        }
    }
    
}
