//
//  Coordinator.swift
//  InnerCircleApp
//
//  Created by Josevin Johny on 19/12/2025.
//
import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get }
    var coordinators: [Coordinator] {get set}
    
    func start()
    func coordinate(to coordinator: Coordinator)
    func removeChild(_ coordinator: Coordinator)
}

extension Coordinator {
    func coordinate(to coordinator: Coordinator) {
        coordinators.append(coordinator)
        coordinator.start()
    }
    
    func removeChild(_ coordinator: Coordinator) {
        coordinators.removeAll { $0 === coordinator }
    }
}
