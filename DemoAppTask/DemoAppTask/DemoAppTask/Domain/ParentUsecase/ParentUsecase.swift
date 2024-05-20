//
//  ParentUsecase.swift
//  DemoAppTask
//
//  Created by Dharani dharan R on 16/05/24.
//

import Foundation


public class ParentUsecase {
    
    let queue = DispatchQueue(label: "ParentUsecaseQueue", attributes: .concurrent)
    
    public func execute(request: Request, completionHandler: @escaping (Response) -> Void) {
        queue.async { [self] in
            run(request: request, completionHandler: completionHandler)
        }
    }
    
    public func run(request: Request, completionHandler: @escaping (Response) -> Void) {}
    
    public func invoke(response: Response, completionHandler: @escaping (Response) -> Void) {
        DispatchQueue.main.async {
             completionHandler(response)
        }
    }
}
