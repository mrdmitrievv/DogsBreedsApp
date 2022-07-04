import UIKit

class BreedsTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var dogsBreeds: [DogBreed] = []
    
    private var spinnerView: UIActivityIndicatorView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80
        spinnerView = showActivityIndicator(in: view)
        getDogBreeds()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let dogBreed = dogsBreeds[indexPath.row]
        let breedDetailsVC = segue.destination as! BreedDetailsViewController
        breedDetailsVC.dogBreed = dogBreed
    }
    
    private func getDogBreeds() {
        NetworkManager.shared.fetchDataWithAF { dogsBreeds in
            self.dogsBreeds = dogsBreeds
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.spinnerView.stopAnimating()
            }
        }
    }
    
    private func showActivityIndicator(in view: UIView) -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .black
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        view.addSubview(activityIndicator)        
        
        return activityIndicator
    }
}

extension BreedsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dogsBreeds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let dogBreed = dogsBreeds[indexPath.row]
        cell.configure(with: dogBreed)
        return cell
    }
}

extension BreedsTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

