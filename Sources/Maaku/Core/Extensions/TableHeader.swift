//
//  TableHeader.swift
//  Maaku
//
//  Created by Kris Baker on 12/21/17.
//  Copyright © 2017 Kristopher Baker. All rights reserved.
//

import Foundation

/// Represents a markdown table header.
public struct TableHeader: TableLine {

    /// The table cells.
    public let cells: [TableCell]

    /// Creates a TableHeader.
    ///
    /// - Returns:
    ///     The initialized TableHeader.
    public init() {
        cells = []
    }

    /// Creates a TableHeader with the specified cells.
    ///
    /// - Parameters:
    ///     - cells: The table cells.
    /// - Returns:
    ///     The initialized TableHeader.
    public init(cells: [TableCell]) {
        self.cells = cells
    }

}

public extension TableHeader {

    func attributedText(style: Style) -> NSAttributedString {
        return NSAttributedString()
    }

    
    public func isEqualTo(_ other: any Node) -> Bool {
        guard let other = other as? Self else { return false }
        return self.cells.count == other.cells.count && self.cells.elementsEqual(other.cells, by: { lhs, rhs in
            return lhs.isEqualTo(rhs)
        })
    }
}
