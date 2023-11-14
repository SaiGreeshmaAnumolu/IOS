//
//  ViewController.swift
//  Anumolu_SampleExam02
//
//  Created by Sai Greeshma Anumolu on 11/13/23.
//

import UIKit

class StudentsTVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.studentsTV.delegate = self
        self.studentsTV.dataSource = self
    }


    @IBOutlet weak var studentsTV: UITableView!
}

