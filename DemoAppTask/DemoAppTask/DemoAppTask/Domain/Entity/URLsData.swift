//
//  URLsData.swift
//  DemoAppTask
//
//  Created by Dharani dharan R on 16/05/24.
//

import Foundation


public class URLsData {
    var recentLinks: [URLData]
    var topLinks: [URLData]
    var favouriteLinks: [URLData]
    var overallUrlChart: [String: Int]
    
    public init(recentLinks: [URLData], topLinks: [URLData], favouriteLinks: [URLData], overallUrlChart: [String : Int]) {
        self.recentLinks = recentLinks
        self.topLinks = topLinks
        self.favouriteLinks = favouriteLinks
        self.overallUrlChart = overallUrlChart
    }
}
