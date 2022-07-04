import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var dogBreedImage: UIImageView! {
        didSet {
            dogBreedImage.contentMode = .scaleToFill
            dogBreedImage.clipsToBounds = true
            dogBreedImage.layer.cornerRadius = dogBreedImage.bounds.height / 2            
        }
    }
        
    @IBOutlet weak var breedName: UILabel!

    var viewModel: TableViewCellViewModelProtocol!
        
    func configure(with viewModel: TableViewCellViewModelProtocol) {
        breedName.text = viewModel.breedName
        guard let imageData = viewModel.imageData else { return }
        dogBreedImage.image = UIImage(data: imageData)
    }
}
