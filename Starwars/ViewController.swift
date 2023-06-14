//
//  ViewController.swift
//  Starwars
//
//  Created by Elijah Armande on 6/13/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var peopleList = [PeopleList]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // print "Success" in the console if the data was downloaded
        getAPI {_ in
            self.tableView.reloadData()
            print("Success")
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peopleList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let people = peopleList[indexPath.row]
        
        // cant get to the (.name) in the results array
        cell.textLabel?.text = people.[Results.init(name: <#T##String#>]
        
        return cell
    }
    
    
    
    

    func getAPI(completion: @escaping(PeopleList) -> ()) {
            guard let url = URL(string: "https://swapi.dev/api/people/?format=json") else {return}
            
            
            URLSession.shared.dataTask(with: url) { data, _, _ in
                
                // PeopleList doesnt need to be an array because we want the Results Property which is already an array.
                let peopleList = try! JSONDecoder().decode(PeopleList.self, from: data!)
                
                DispatchQueue.main.async {
                    completion(peopleList)
                }

            }
            .resume()
        }

}

