//
//  LineBreak.swift
//  Maaku
//
//  Created by Kris Baker on 12/20/17.
//  Copyright © 2017 Kristopher Baker. All rights reserved.
//

import Foundation

/// Represents a markdown line break.
public struct LineBreak: Inline {

}

public extension LineBreak {

    func attributedText(style: Style) -> NSAttributedString {
        return NSAttributedString(string: "\n")
    }
    
    public func isEqualTo(_ other: any Node) -> Bool {
        guard let other = other as? Self else { return false }
        return true
    }

}
