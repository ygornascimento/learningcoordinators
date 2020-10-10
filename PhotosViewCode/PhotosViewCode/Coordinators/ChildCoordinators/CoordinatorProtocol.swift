//
//  Coordinator.swift
//  PhotosViewCode
//
//  Created by Ygor Nascimento on 10/10/20.
//

import Foundation

protocol CoordinatorProtocol: AnyObject {
    var didFinish: ((CoordinatorProtocol) -> Void)? { get set }
    func start()
}
