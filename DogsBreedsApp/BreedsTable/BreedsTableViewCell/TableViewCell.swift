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
        DispatchQueue.main.async {
            let image = UIImage(data: imageData)
            self.dogBreedImage.image = image?.compressTo(expectedSizeInMb: 1)
        }
    }
}
