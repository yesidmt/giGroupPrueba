//
//  Util.swift
//  pokemonApp
//
//  Created by yesid mendoza on 26/09/23.
//

import Foundation
import UIKit

class Util {
    static let sharedInstance = Util()
    private init() { }

    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}

