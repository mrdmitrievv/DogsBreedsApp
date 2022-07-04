//
//  TableViewCellViewModel.swift
//  DogsBreedsApp
//
//  Created by Артём Дмитриев on 04.07.2022.
//

import Foundation

protocol TableViewCellViewModelProtocol: AnyObject {
    var imageData: Data? { get }
    var breedName: String { get }
    init(dogBreed: DogBreed)
}

class TableViewCellViewModel: TableViewCellViewModelProtocol {
    var imageData: Data? {
        ImageManager.shared.fetchImageData(from: dogBreed.image?.url)
    }
    
    var breedName: String {
        dogBreed.name
    }
    
    private let dogBreed: DogBreed
    
    required init(dogBreed: DogBreed) {
        self.dogBreed = dogBreed
    }
}
