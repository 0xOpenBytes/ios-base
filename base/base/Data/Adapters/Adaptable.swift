//
//  Adaptable.swift
//  base
//
//  Created by Leif on 12/20/22.
//

protocol Adaptable {
    associatedtype NetworkModel
    associatedtype DeviceModel

    static func device(from: NetworkModel) throws -> DeviceModel
}

protocol BiDirectionallyAdaptable: Adaptable {
    associatedtype NetworkModel
    associatedtype DeviceModel

    static func network(from: DeviceModel) throws -> NetworkModel
}
