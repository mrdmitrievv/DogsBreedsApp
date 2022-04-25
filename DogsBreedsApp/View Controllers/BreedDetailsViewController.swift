import UIKit

class BreedDetailsViewController: UIViewController {
    
    @IBOutlet var dogBreedImage: DogBreedImage! {
        didSet {
            dogBreedImage.layer.cornerRadius = dogBreedImage.frame.width / 2
            dogBreedImage.contentMode = .scaleAspectFit
            dogBreedImage.clipsToBounds = true
            dogBreedImage.backgroundColor = .black
        }
    }
    
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var dogBreed: DogBreed?
    
    private var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        descriptionLabel.text = dogBreed?.description
        
        activityIndicator = showActivityIndicator(in: view)
        
        descriptionLabel.isHidden = true
        dogBreedImage.isHidden = true
        
        fetchImage(from: dogBreed?.image.url ?? "")
        
        
//        dogBreedImage.fetchImageWithAF(from: dogBreed?.image.url ?? "")
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
//            self.activityIndicator.stopAnimating()
//            self.descriptionLabel.isHidden = false
//            self.dogBreedImage.isHidden = false
//        }
    }
    
    
    private func fetchImage(from url: String) {
        dogBreedImage.fetchImageWithAF(from: url)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.activityIndicator.stopAnimating()
            self.descriptionLabel.isHidden = false
            self.dogBreedImage.isHidden = false
        }
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
