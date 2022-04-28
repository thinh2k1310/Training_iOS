//
//  GardenViewController.swift
//  Exercise5
//
//  Created by Truong Thinh on 28/04/2022.
//

import UIKit

class GardenViewController: UIViewController {

    var garden : [[String]] = []
    var gardenIndex : [String] = []
    var gardenTitle : [String] = []
    
    private let tableView : UITableView = {
        let tableview = UITableView(frame: .zero, style: .grouped)
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableview
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        view.addSubview(tableView)
        loadData()

        // Do any additional setup after loading the view.
    }
    
    func loadData(){
        let flowers : [String] = ["Rose","Daisy","Lavender","Sun Flower"]
        let vegetables : [String] = ["Cilantro","Chilli","Spinach","Corn",
                                        "Herb","Pepper","Onion","Bay"]
        let animals : [String] = ["Pig","Dog","Cat","Lion","Snake","Horse",
                                    "Fish","Chicken","Duck"]
        garden = [animals,flowers,vegetables]
        gardenIndex = ["A","F","V"]
        gardenTitle = ["Animals","Flowers","Vegetables"]
    }
    
    func configureTableView(){
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        tableView.frame = view.bounds
    }
    

}

extension GardenViewController : UITableViewDataSource{
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return gardenIndex
    }
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return gardenIndex.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        gardenTitle[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return garden[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let section = indexPath.section
        let index = indexPath.row
        cell.textLabel?.text = garden[section][index]
        return cell
    }
    
    
}
