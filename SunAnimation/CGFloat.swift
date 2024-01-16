//
//  CGFloat.swift
//  SunAnimation
//
//  Created by Javid on 1/15/24.
//

import Foundation

extension CGFloat {
    func scaleX(in width: CGFloat) -> CGFloat {
        return (self + CGFloat.pi / 2) / (3 * CGFloat.pi) * width
    }

    func scaleY(in height: CGFloat) -> CGFloat {
        return (1 - self) / 2 * height
    }
}

