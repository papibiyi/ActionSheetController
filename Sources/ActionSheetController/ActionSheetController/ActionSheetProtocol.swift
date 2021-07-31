//
//  ActionSheetProtocol.swift
//  CustomAlertController
//
//  Created by Mojisola Adebiyi on 24/07/2021.
//

import UIKit

protocol ActionSheetActions {
    func addHeader(image: UIImage?, size: Size?, cornerRadius: CGFloat?, title: String?, message: String?)
    func addHeader(view: UIView)
    func addAction(title: String, type: ActionSheetActionType, action: (() -> ())?)
    func addCustomAction(view: UIView, action: (() -> ())?)
    func addDoneAction(title: String, type: ActionSheetActionType, action: (() -> ())?)
}
