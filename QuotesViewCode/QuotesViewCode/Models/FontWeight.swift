//
//  FontWeight.swift
//  QuotesViewCode
//
//  Created by Ygor Nascimento on 29/09/20.
//  Copyright © 2020 Ygor Nascimento. All rights reserved.
//

import UIKit

enum FontWeight: Int {
    case light
    case regular
    case bold

    var toFontWeight: UIFont.Weight {
        switch self {
            case .light:
                return .light
            case .regular:
                return .regular
            case .bold:
                return .bold
        }
    }
}
