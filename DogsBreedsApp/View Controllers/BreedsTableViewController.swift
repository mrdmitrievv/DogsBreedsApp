import UIKit

class BreedsTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var dogsBreeds: [DogBreed] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80
        getDogBreeds()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let breedDetailsVC = segue.destination as! BreedDetailsViewController
        breedDetailsVC.dogBreed = sender as? DogBreed
    }
    
    private func getDogBreeds() {
        NetworkManager.shared.fetchDataWithAF { dogsBreeds in
            self.dogsBreeds = dogsBreeds
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
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
        let dogBreed = dogsBreeds[indexPath.row]
        performSegue(withIdentifier: "BreedDetails", sender: dogBreed)
    }
}

