//
//  PokemonContract.swift
//  pokemonApp
//
//  Created by yesid mendoza on 26/09/23.
//
import UIKit

protocol PokemonViewProtocol: AnyObject {
    // Update UI with value returned.
    /// Set the view Object of Type PokemonEntity
    func setDataPokemomn(pokemonData:Pokemon)
}

//MARK: Interactor -
/// Pokemon Module Interactor Protocol
protocol PokemonInteractorProtocol {
    // Fetch Object from Data Layer
    func getDataPokemon(completion: @escaping ((_ animesSessionLater: Pokemon) -> Void))
}
