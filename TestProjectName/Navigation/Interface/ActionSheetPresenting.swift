//
//  ActionSheetPresenting.swift
//  TestProjectName
//
//  Created by Leif on 12/15/22.
//

import SwiftUI

protocol ActionSheetPresenting {
    func actionSheet<ActionContent: View, MessageContent: View>(
        title: String,
        actions: @escaping () -> ActionContent,
        message: @escaping () -> MessageContent
    )
}
