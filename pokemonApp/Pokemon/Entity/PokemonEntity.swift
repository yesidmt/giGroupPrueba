//
//  PokemonEntity.swift
//  pokemonApp
//
//  Created by yesid mendoza on 26/09/23.
//

import UIKit

struct Pokemon: Codable {
    var forms: [Form]
    var sprites: Sprite
    var abilities: [Abilities]
    var base_experience: Int
}

struct Form:Codable {
    var name: String
}

struct Sprite:Codable {
    var front_default:String
}

struct Abilities:Codable {
    var ability: Abl
}
struct Abl:Codable {
    var name: String
}
