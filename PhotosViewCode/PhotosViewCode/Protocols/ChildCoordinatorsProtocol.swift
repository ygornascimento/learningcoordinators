//
//  ChildCoordinatorsProtocol.swift
//  PhotosViewCode
//
//  Created by Ygor Nascimento on 10/10/20.
//

import Foundation

protocol ChildCoordinatorsProtocol: AnyObject {
    var didFinish: ((ChildCoordinatorsProtocol) -> Void)? { get set }
    func start()
}
