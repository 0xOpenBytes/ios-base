//
//  ToastPresenting.swift
//  base
//
//  Created by Rob Maltese on 12/20/22.
//

import SwiftUI

protocol ToastPreseting {
    func toast(
        title: String,
        message: String,
        style: ToastStyle,
        duration: Double?
    )
}
