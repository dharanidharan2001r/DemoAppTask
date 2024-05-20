//
//  HomeViewController.swift
//  DemoAppTask
//
//  Created by Dharani dharan R on 16/05/24.
//

import Foundation
import UIKit

public class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, HomeViewControllerContract {
    
    public var presenter: HomeViewPresenterContract?
    
    public var links: [URLData] = []
    
    lazy public var homeView: HomeView = {
        let view =  HomeView()
        return view
    }()
    
    public init(presenter: HomeViewPresenterContract? = nil) {
        super.init(nibName: nil, bundle: nil)
        self.presenter = presenter
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func loadView() {
        view = homeView
        setUpViewData()
    }
    
    public func setUpViewData() {
        getTopLinks { (links) in
            self.links = links
        }
        (view as? HomeView)?.navBarView.title.text = "Dashboard"
        getGreetings { [self] (greeting) in
            (view as? HomeView)?.contentView.analyticsView.greeting.text = greeting
        }
        (view as? HomeView)?.contentView.analyticsView.userName.text = "Ajay Manva"
    }
    
}


extension HomeViewController {
    
    public func getGreetings(handler: @escaping (String) -> Void) {
        presenter?.getGreetings(handler: { (greeting) in
            handler(greeting)
        })
    }
    
    public func getTodayClicks(handler: @escaping (Int) -> Void) {
        presenter?.getTodayClicks() { (todayClicks) in
            handler(todayClicks)
        }
    }
    
    public func getTopLocation(handler: @escaping (String) -> Void) {
        presenter?.getTopLocation() { (topLocation) in
            handler(topLocation)
        }
    }
    
    public func getTopSource(handler: @escaping (String) -> Void) {
        presenter?.getTopSource(){ (topSource) in
            handler(topSource)
        }
    }
    
    public func getTopLinks(handler: @escaping ([URLData]) -> Void) {
        presenter?.getTopLinks() { (topLinks) in
            handler(topLinks)
        }
    }
    
    public func getRecentLinks(handler: @escaping ([URLData]) -> Void) {
        presenter?.getRecentLinks(){ (recentLinks) in
            handler(recentLinks)
        }
    }
    
    public func getOverallUrlChartData(handler: @escaping ([String : Int]) -> Void) {
        presenter?.getOverallUrlChartData(){ (overallChartData) in
            handler(overallChartData)
        }
    }
}

extension HomeViewController {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return LinksTableViewCell()
    }
}
