//
//  Item.swift
//  app
//
//  Created by Cass Pangell on 9/7/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
