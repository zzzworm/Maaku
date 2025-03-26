//
//  ContainerBlock.swift
//  Maaku
//
//  Created by Kris Baker on 12/20/17.
//  Copyright © 2017 Kristopher Baker. All rights reserved.
//

/// Represents a markdown container block.
public protocol ContainerBlock: Block {

    /// The block items.
    var items: [Block] { get }
}

extension ContainerBlock {
    public func isEqualTo(_ other: any Node) -> Bool {
        guard let other = other as? Self else { return false }
        return self.items.count == other.items.count && self.items.elementsEqual(other.items, by: { lhs, rhs in
            return lhs.isEqualTo(rhs)
        })
    }
}

/// Represents a markdown list.
public protocol List: ContainerBlock {

}

/// Represents an item in a markdown list.
public protocol Item: ContainerBlock {

}
