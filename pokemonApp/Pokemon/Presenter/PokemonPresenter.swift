//
//  PokemonPresenter.swift
//  pokemonApp
//
//  Created by yesid mendoza on 26/09/23.
//

import UIKit

/// Pokemon Module Presenter
class PokemonPresenter {
    
    weak var view: PokemonViewProtocol?
    private var interactor: PokemonInteractorProtocol
    
    init(PokemonInteractor: PokemonInteractor) {
        self.interactor = PokemonInteractor
    }
    
    func getDataPokemon() {
        interactor.getDataPokemon(completion: { [weak self] (pokemon) in
            guard let _ = self else {
                return
            }
            self?.view?.setDataPokemomn(pokemonData: pokemon)
        })
    }
}

