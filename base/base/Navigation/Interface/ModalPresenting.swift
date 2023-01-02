//
//  ModalPresenting.swift
//  base
//
//  Created by Leif on 12/15/22.
//

import SwiftUI

protocol ModalPresenting {
    func modal<Content: View>(
        body: @escaping () -> Content
    )
}
