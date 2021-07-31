//
//  ActionSheetCellType.swift
//  CustomAlertController
//
//  Created by Mojisola Adebiyi on 24/07/2021.
//

import UIKit

enum ActionSheetCellType {
    case defaultAction(title: String?, type: ActionSheetActionType, action: (() -> ())?)
    case custom(view: UIView, action: (() -> ())?)
    case headerView(view: UIView)
    case headerImage(image: UIImage?, size: Size? = nil, cornerRadius: CGFloat? = nil, title: String?, message: String?)
    case title(title: String?, message: String?)
}
