import UIKit

class BreedDetailsViewController: UIViewController {
    
    @IBOutlet private weak var dogImage: UIImageView!
    
    @IBOutlet private weak var breedDescription: UILabel!
    
    
    var dogBreed: DogBreed!
    
    private var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    private func setupUI() {
        breedDescription.text = dogBreed.description
        if let imageData = DogBreedImage.shared.fetchImageData(from: dogBreed.image.url) {
            dogImage.image = UIImage(data: imageData)
        }
        activityIndicator.stopAnimating()
    }
    
    private func showActivityIndicator(in view: UIView) -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .black
        activityIndicator.startAnimating()
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        
        view.addSubview(activityIndicator)
        
        return activityIndicator
    }
}
