import UIKit

class BreedsTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet var BreedsTableView: UITableView!
    
    var dogsBreeds: [DogBreed] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BreedsTableView.rowHeight = 80
        
        fetchData(from: URLS.breedURL.rawValue)
    }
    
//    func prepareForReuse() {
//        for dogBreed in dogsBreeds {
//            dogBreed.image = nil
//        }
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dogsBreeds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.configureWithIndex(with: dogsBreeds, and: indexPath.row)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = BreedsTableView.indexPathForSelectedRow else { return }
        let dogBreed = dogsBreeds[indexPath.row]
        let breedDetailsVC = segue.destination as! BreedDetailsViewController
        breedDetailsVC.dogBreed = dogBreed
    }
    
    
    /*
    private func fetchData(from url: String?) {
        NetworkManager.shared.fetchData(from: url) { dogsBreeds in
                self.dogsBreeds = dogsBreeds
                self.BreedsTableView.reloadData()
        }
    }*/
    
    private func fetchData(from url: String?) {
        NetworkManager.shared.fetchDataWithAF(from: url) { dogsBreeds in
                self.dogsBreeds = dogsBreeds
                self.BreedsTableView.reloadData()
        }
}
}

