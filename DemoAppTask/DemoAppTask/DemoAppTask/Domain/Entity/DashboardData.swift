//
//  DashboardData.swift
//  DemoAppTask
//
//  Created by Dharani dharan R on 16/05/24.
//

import Foundation


public class DashboardData {
    let id = UUID().uuidString
    var status: Bool
    var statusCode: Int
    var message: String
    var supportWhatsappNumber: String
    var extraIncome: Double
    var totalLinks: Int
    var totalClicks: Int
    var todayClicks: Int
    var topSource: String
    var topLocation: String
    var startTime: String
    var linksCreatedToday: Int
    var appliedCampaign: Int
    var data: URLsData
    
    public init(status: Bool, statusCode: Int, message: String, supportWhatsappNumber: String, extraIncome: Double, totalLinks: Int, totalClicks: Int, todayClicks: Int, topSource: String, topLocation: String, startTime: String, linksCreatedToday: Int, appliedCampaign: Int, data: URLsData) {
        self.status = status
        self.statusCode = statusCode
        self.message = message
        self.supportWhatsappNumber = supportWhatsappNumber
        self.extraIncome = extraIncome
        self.totalLinks = totalLinks
        self.totalClicks = totalClicks
        self.todayClicks = todayClicks
        self.topSource = topSource
        self.topLocation = topLocation
        self.startTime = startTime
        self.linksCreatedToday = linksCreatedToday
        self.appliedCampaign = appliedCampaign
        self.data = data
    }
}
