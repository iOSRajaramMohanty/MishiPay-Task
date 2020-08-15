//
//  ProductDetails.swift
//  MishiPay-Task
//
//  Created by Rajaram Mohanty on 15/08/20.
//  Copyright © 2020 Rajaram Mohanty. All rights reserved.
//

import Foundation

struct Product: Codable {
    var title, price, image:String?

    enum CodingKeys: String, CodingKey {
        case title, price, image
    }
}

// MARK: Convenience initializers

extension Product {
    init?(data: Data) {
        guard let me = try? JSONDecoder().decode(Product.self, from: data) else { return nil }
        self = me
    }
}
