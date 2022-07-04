//
//  BreedDetailsViewModel.swift
//  DogsBreedsApp
//
//  Created by Артём Дмитриев on 04.07.2022.
//

import Foundation

protocol BreedDetailsViewModelProtocol: AnyObject {
    var breedName: String { get }
    var temperament: String? { get }
    var lifeSpan: String? { get }
    var origin: String? { get }
    var bredFor: String? { get }
    var imageData: Data? { get }
    init(dogBreed: DogBreed)
}

class BreedDetailsViewModel: BreedDetailsViewModelProtocol {
    var breedName: String {
        dogBreed.name
    }
    
    var temperament: String? {
        dogBreed.temperament
    }
    
    var lifeSpan: String? {
        dogBreed.lifeSpan
    }
    
    var origin: String? {
        dogBreed.origin
    }
    
    var bredFor: String? {
        dogBreed.bredFor
    }
    
    var imageData: Data? {
        DogBreedImage.shared.fetchImageData(from: dogBreed.image?.url)
    }
    
    private let dogBreed: DogBreed
    
    required init(dogBreed: DogBreed) {
        self.dogBreed = dogBreed
    }
    
    
}
