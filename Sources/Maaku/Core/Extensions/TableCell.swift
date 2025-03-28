//
//  TableCell.swift
//  Maaku
//
//  Created by Kris Baker on 12/21/17.
//  Copyright © 2017 Kristopher Baker. All rights reserved.
//

import Foundation

/// Represents a markdown table cell.
public struct TableCell: Node {

    /// The inline items.
    public let items: [Inline]

    /// Creates a TableCell.
    ///
    /// - Returns:
    ///     The initialized TableCell.
    public init() {
        items = []
    }

    /// Creates a TableCell with the specified items.
    ///
    /// - Parameters:
    ///     - items: The inline items.
    /// - Returns:
    ///     The initialized TableCell.
    public init(items: [Inline]) {
        self.items = items
    }
    
    public func isEqualTo(_ other: Node) -> Bool {
        guard let other = other as? Self, self.items.count == other.items.count else { return false }
        return other.items.elementsEqual(self.items) { lhs, rhs in
            return lhs.isEqualTo(rhs)
        }
    }

}

public extension TableCell {

    func attributedText(style: Style) -> NSAttributedString {
        let attributed = NSMutableAttributedString()

        for item in items {
            attributed.append(item.attributedText(style: style))
        }

        return attributed
    }

}
