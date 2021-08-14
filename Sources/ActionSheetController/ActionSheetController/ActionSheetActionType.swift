//
//  ActionSheetActionType.swift
//  CustomAlertController
//
//  Created by Mojisola Adebiyi on 24/07/2021.
//

import UIKit

public enum ActionSheetActionType {
    case normal
    case destructive

    func color() -> UIColor {
        switch self {
        case .normal:
            return UIColor.systemBlue
        case .destructive:
            return UIColor.systemRed
        }
    }
}
