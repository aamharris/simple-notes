import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    var notes: [Note] = []
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        notes.append(Note(title: "Hello Notes",
                          body: "This is just some random note",
                          createdDate: "5/31/19"))
        
        notes.append(Note(title: "Books to read",
                          body: "Clean Code, The Pragmatic programmer, Breakpoint Blog",
                          createdDate: "3/10/19"))
        
        notes.append(Note(title: "Fav Colors",
                          body: "Blue is the best.",
                          createdDate: "4/31/19"))
        
        //set the datasource...in this context, self references this controller
        tableView.dataSource = self
        
        //register the table view and reuse cell. If we don't specify it in the storyboard,
        //we can do it here
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        //this will hide extra empty cells
        self.tableView.tableFooterView = UIView()
    }
    
    //this method will determine how many cells we have
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    //setting the properties for each cell in the table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")

        let currentRow = notes[indexPath.row]
        cell.textLabel!.text = currentRow.title
        cell.detailTextLabel!.text = "\(currentRow.createdDate) \(currentRow.body)"
        cell.detailTextLabel?.textColor = .lightGray
            
        return cell
    }
}

