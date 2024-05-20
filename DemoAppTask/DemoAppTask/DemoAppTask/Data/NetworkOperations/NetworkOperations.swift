//
//  NetworkOperations.swift
//  DemoAppTask
//
//  Created by Dharani dharan R on 16/05/24.
//

import Foundation


public class NetworkOperations: NetworkOperationsProtocol {
    
    private let dashboardApi = "https://api.inopenapp.com/api/v1/dashboardNew"
    private let auth = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjU5MjcsImlhdCI6MTY3NDU1MDQ1MH0.dCkW0ox8tbjJA2GgUx2UEwNlbTZ7Rr38PVFJevYcXFI"
    
    public func getTodayClicks(handler: @escaping(Int?) -> Void) {
        guard let url = URL(string: dashboardApi) else {
            fatalError("Invalid url")
        }
        var request = URLRequest(url: url)
        let session = URLSession.shared
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue( "Bearer \(auth)", forHTTPHeaderField: "Authorization")
        session.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            guard let data = data else {
                print("No data")
                return
            }
            do {
                guard let json = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                    print("Data parsing error")
                    return
                }
                guard let todayClicks = json["today_clicks"] as? Int
                else {
                    print("No proper data recieved from network for todaysClick")
                    return
                }
                print(todayClicks, "NetworkOperations class")
            } catch {
                print("Data parsing error")
            }
        }.resume()
    }
    
    public func getTopLocation(handler: @escaping(String?) -> Void) {
        guard let url = URL(string: dashboardApi) else {
            fatalError("Invalid url")
        }
        var request = URLRequest(url: url)
        let session = URLSession.shared
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue( "Bearer \(auth)", forHTTPHeaderField: "Authorization")
        session.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            guard let data = data else {
                print("No data")
                return
            }
            do {
                guard let json = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                    print("Data parsing error")
                    return
                }
                guard let topLocation = json["top_location"] as? Int
                else {
                    print("No proper data recieved from network for topLocation")
                    return
                }
                print(topLocation, "NetworkOperations class")
            } catch {
                print("Data parsing error")
            }
        }.resume()
    }
    
    public func getTopSource(handler: @escaping(String?) -> Void) {
        guard let url = URL(string: dashboardApi) else {
            fatalError("Invalid url")
        }
        var request = URLRequest(url: url)
        let session = URLSession.shared
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue( "Bearer \(auth)", forHTTPHeaderField: "Authorization")
        session.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            guard let data = data else {
                print("No data")
                return
            }
            do {
                guard let json = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                    print("Data parsing error")
                    return
                }
                guard let topSource = json["top_source"] as? Int
                else {
                    print("No proper data recieved from network for topSource")
                    return
                }
                print(topSource, "NetworkOperations class")
            } catch {
                print("Data parsing error")
            }
        }.resume()
    }
    
    public func getTopLinks(handler: @escaping([URLData]?) -> Void) {
        guard let url = URL(string: dashboardApi) else {
            fatalError("Invalid url")
        }
        var request = URLRequest(url: url)
        let session = URLSession.shared
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue( "Bearer \(auth)", forHTTPHeaderField: "Authorization")
        session.dataTask(with: request) {[self] data, response, error in
            guard error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            guard let data = data else {
                print("No data")
                return
            }
            do {
                guard let json = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                    print("Data parsing error")
                    return
                }
                guard let topLinks = json["top_links"] as? [[String: Any]]
                else {
                    print("No proper data recieved from network for topLinks")
                    return
                }
                guard let data = getURLJsondata(json: topLinks) else {
                    print("json converion error top links")
                    return
                }
                handler(data)
            } catch {
                print("Data parsing error")
            }
        }.resume()
    }
    
    public func getRecentLinks(handler: @escaping([URLData]?) -> Void) {
        guard let url = URL(string: dashboardApi) else {
            fatalError("Invalid url")
        }
        var request = URLRequest(url: url)
        let session = URLSession.shared
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue( "Bearer \(auth)", forHTTPHeaderField: "Authorization")
        session.dataTask(with: request) {[self] data, response, error in
            guard error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            guard let data = data else {
                print("No data")
                return
            }
            do {
                guard let json = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                    print("Data parsing error")
                    return
                }
                guard let recentLinks = json["recent_links"] as? [[String: Any]]
                else {
                    print("No proper data recieved from network for recentLinks")
                    return
                }
                guard let data = getURLJsondata(json: recentLinks) else {
                    print("json converion error top links")
                    return
                }
                handler(data)
            } catch {
                print("Data parsing error")
            }
        }.resume()
    }
    
    public func getOverallUrlChartData(handler: @escaping([String: Int]?) -> Void) {
        guard let url = URL(string: dashboardApi) else {
            fatalError("Invalid url")
        }
        var request = URLRequest(url: url)
        let session = URLSession.shared
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue( "Bearer \(auth)", forHTTPHeaderField: "Authorization")
        session.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            guard let data = data else {
                print("No data")
                return
            }
            do {
                guard let json = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                    print("Data parsing error")
                    return
                }
                let overallUrlChart = json["overall_url_chart"] as? [String: Int] ?? [:]
                handler(overallUrlChart)
            } catch {
                print("Data parsing error")
            }
        }.resume()
    }
    
    private func getURLJsondata(json: [[String: Any]]) -> [URLData]? {
        var links: [URLData] = []
        for link in json {
            guard let urlId = link["url_id"] as? Int,
                  let webLink = link["web_link"] as? String,
                  let smartLink = link["smart_link"] as? String,
                  let title = link["title"] as? String,
                  let totalClicks = link["total_clicks"] as? Int,
                  let originalImage = link["original_image"] as? String,
                  let timesAgo = link["times_ago"] as? String,
                  let createdAt = link["created_at"] as? String,
                  let domainId = link["domain_id"] as? String,
                  let app = link["app"] as? String,
                  let isFavourite = link["is_favourite"] as? Bool
            else {
                print("No proper data recieved from network for link")
                return nil
            }
            let thumbnail = link["thumbnail"] as? String ?? "null"
            let urlPrefix = link["url_prefix"] as? String ?? "null"
            let urlSuffix = link["url_suffix"] as? String ?? "null"
            let tempLink = URLData(urlId: urlId, webLink: webLink, smartLink: smartLink, title: title, totalClicks: totalClicks, originalImage: originalImage, thumbnail: thumbnail, timesAgo: timesAgo, createdAt: createdAt, domainId: domainId, urlPrefix: urlPrefix, urlSuffix: urlSuffix, app: app, isFavourite: isFavourite)
            links.append(tempLink)
        }
        return links
    }
}
