//
//  BreedsTableViewModel.swift
//  DogsBreedsApp
//
//  Created by Артём Дмитриев on 04.07.2022.
//

import Foundation

protocol BreedsTableViewModelProtocol: AnyObject {
    var dogsBreeds: [DogBreed] { get }
    func fetchDogBreeds(completion: @escaping() -> Void)
    func numberOfRows() -> Int
    func viewModelForCell(at indexPath: IndexPath) -> TableViewCellViewModelProtocol
    func viewModelForSelectedRow(at indexPath: IndexPath) -> BreedDetailsViewModelProtocol
}

class BreedsTableViewModel: BreedsTableViewModelProtocol {
    
    var dogsBreeds: [DogBreed] = []
    
    func fetchDogBreeds(completion: @escaping () -> Void) {
        NetworkManager.shared.fetchDataWithAF { dogsBreeds in
            self.dogsBreeds = dogsBreeds
            completion()
        }
    }
    
    func numberOfRows() -> Int {
        dogsBreeds.count
    }
    
    func viewModelForCell(at indexPath: IndexPath) -> TableViewCellViewModelProtocol {
        let dogBreed = dogsBreeds[indexPath.row]
        return TableViewCellViewModel(dogBreed: dogBreed)
    }
    
    func viewModelForSelectedRow(at indexPath: IndexPath) -> BreedDetailsViewModelProtocol {
        let dogBreed = dogsBreeds[indexPath.row]
        return BreedDetailsViewModel(dogBreed: dogBreed)
    }
}
