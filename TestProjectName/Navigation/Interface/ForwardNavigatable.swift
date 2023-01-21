//
//  ForwardNavigatable.swift
//  TestProjectName
//
//  Created by Leif on 12/15/22.
//

import SwiftUI

protocol ForwardNavigatable {
    func push<V>(_ value: V) where V: Hashable
    func push<V>(_ value: V) where V: Codable, V: Hashable
}
