//
//  PokemonInteractor.swift
//  pokemonApp
//
//  Created by yesid mendoza on 26/09/23.
//

import UIKit
import Alamofire

/// ListAnimes Module Interactor
class PokemonInteractor: PokemonInteractorProtocol {
    
    func getDataPokemon(completion: @escaping ((_ pokemonData: Pokemon) -> Void)){
        let url = "https://pokeapi.co/api/v2/pokemon/25"
        
        AF.request(url, method: .get).responseDecodable(of: Pokemon.self) { response in
            switch response.result {
            case .success(let pokemon):
                print("Respuesta exitosa: \(pokemon.forms[0].name)")
                completion(pokemon)
            case .failure(let error):
                print("Error en la petición: \(error)")
            }
        }
    }
}
