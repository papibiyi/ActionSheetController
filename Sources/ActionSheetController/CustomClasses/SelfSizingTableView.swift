//
//  SelfSizingTableView.swift
//  CustomAlertController
//
//  Created by Mojisola Adebiyi on 24/07/2021.
//

import UIKit

class SelfSizedTableView: UITableView {
    var maxHeight: CGFloat = UIScreen.main.bounds.size.height
  
    override var intrinsicContentSize: CGSize {
        let height = min(contentSize.height, maxHeight)
        return CGSize(width: contentSize.width, height: height)
      }

      override var contentSize: CGSize {
        didSet {
            self.invalidateIntrinsicContentSize()
        }
      }
    
}
