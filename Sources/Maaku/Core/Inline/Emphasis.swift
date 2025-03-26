//
//  Emphasis.swift
//  Maaku
//
//  Created by Kris Baker on 12/20/17.
//  Copyright © 2017 Kristopher Baker. All rights reserved.
//

import Foundation

/// Represents a markdown emphasis.
public struct Emphasis: Inline {

    /// The inline items.
    public let items: [Inline]

    /// Creates a Emphasis.
    ///
    /// - Returns:
    ///     The initialized Emphasis.
    public init() {
        items = []
    }

    /// Creates a Emphasis with the specified items.
    ///
    /// - Parameters:
    ///     - items: The inline items.
    /// - Returns:
    ///     The initialized Emphasis.
    public init(items: [Inline]) {
        self.items = items
    }
}

public extension Emphasis {

    func attributedText(style: Style) -> NSAttributedString {
        let attributed = NSMutableAttributedString()

        var emphasisStyle = style
        emphasisStyle.emphasis()

        for item in items {
            attributed.append(item.attributedText(style: emphasisStyle))
        }

        return attributed
    }
    
    public func isEqualTo(_ other: any Node) -> Bool {
        guard let other = other as? Self else { return false }
        return self.items.count == other.items.count && self.items.elementsEqual(other.items, by: { lhs, rhs in
            return lhs.isEqualTo(rhs)
        })
    }

}
