//
//  ViewController.swift
//  pokemonApp
//
//  Created by yesid mendoza on 26/09/23.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - @IBOutlet
    @IBOutlet weak var namePokemon: UILabel!
    @IBOutlet weak var SpritePokemon: UIImageView!
    @IBOutlet weak var skills: UITextView!
    @IBOutlet weak var baseExp: UILabel!
    
    // MARK: - Properties
    var presenter: PokemonPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let interactor = PokemonInteractor()
        let presenter = PokemonPresenter(PokemonInteractor: interactor)
        presenter.view = self
        self.presenter = presenter
        presenter.getDataPokemon()
    }

    @IBAction func menosExperiencia(_ sender: Any) {
        baseExp.text = String(Int(baseExp.text!)! - 1)
    }
    
    @IBAction func masExperiencia(_ sender: Any) {
        baseExp.text = String(Int(baseExp.text!)! + 1)
    }
}

extension ViewController:PokemonViewProtocol {
    func setDataPokemomn(pokemonData: Pokemon) {
        namePokemon.text = pokemonData.forms[0].name
        var habilidades = ""
        for item in pokemonData.abilities {
            habilidades = habilidades + "- "+item.ability.name + "\n"
        }
        skills.text = habilidades
        baseExp.text = String(pokemonData.base_experience)
        let url = URL(string: pokemonData.sprites.front_default)!
        Util.sharedInstance.getData(from: url) { data, response, error in
                guard let data = data, error == nil else { return }
                DispatchQueue.main.async() { [weak self] in
                    self?.SpritePokemon.image = UIImage(data: data)
                }
        }
    }
}
