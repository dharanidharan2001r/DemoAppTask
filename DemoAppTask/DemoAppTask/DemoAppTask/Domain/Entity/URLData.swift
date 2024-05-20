//
//  URLData.swift
//  DemoAppTask
//
//  Created by Dharani dharan R on 16/05/24.
//

import Foundation


public class URLData {
    let id = UUID().uuidString
    var urlId: Int
    var webLink: String
    var smartLink: String
    var title: String
    var totalClicks: Int
    var originalImage: String
    var thumbnail: String
    var timesAgo: String
    var createdAt: String
    var domainId: String
    var urlPrefix: String
    var urlSuffix: String
    var app: String
    var isFavourite: Bool
    
    public init(urlId: Int, webLink: String, smartLink: String, title: String, totalClicks: Int, originalImage: String, thumbnail: String, timesAgo: String, createdAt: String, domainId: String, urlPrefix: String, urlSuffix: String, app: String, isFavourite: Bool) {
        self.urlId = urlId
        self.webLink = webLink
        self.smartLink = smartLink
        self.title = title
        self.totalClicks = totalClicks
        self.originalImage = originalImage
        self.thumbnail = thumbnail
        self.timesAgo = timesAgo
        self.createdAt = createdAt
        self.domainId = domainId
        self.urlPrefix = urlPrefix
        self.urlSuffix = urlSuffix
        self.app = app
        self.isFavourite = isFavourite
    }
}
