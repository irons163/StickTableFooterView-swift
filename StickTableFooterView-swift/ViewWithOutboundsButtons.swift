//
//  ViewWithOutboundsButtons.swift
//  StickTableFooterView-swift
//
//  Created by Phil Chang on 2022/7/13.
//  Copyright © 2022 . All rights reserved.
//

import UIKit

class ViewWithOutboundsButtons: UIView {

    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        guard let view = self.hitTestOutbounds(point, with: event) else {
            return super.hitTest(point, with: event)
        }
        return view
    }

    func hitTestOutbounds(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        for subview in self.subviews {
            guard subview.frame.contains(point) else { continue }
            if subview.isKind(of: ViewWithOutboundsButtons.self) {
                let convertPoint = self.convert(point, to: subview)
                return subview.hitTest(convertPoint, with: event)
            } else if subview.isKind(of: UIControl.self) {
                return subview
            }
        }
        return nil
    }
}
