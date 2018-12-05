import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkClient.fetchRecipes { (students, error) in
            if let error = error {
                NSLog("Error getting students: \(error)")
                return
            }
            
            self.students = students ?? []
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Segmented Control
    @IBAction func sort(_ sender: Any) {
        updateSort()
    }
    
    private func updateSort() {
        DispatchQueue.main.async {
            let sortedStudents: [Student]
            if self.sortSelector.selectedSegmentIndex == 0 {
            // Sort by first name
                sortedStudents = self.students.sorted { $0.firstName < $1.firstName }
            } else {
            // Sort by last name
                sortedStudents = self.students.sorted { ($0.lastName ?? "") < ($1.lastName ?? "") }
            }
            self.studentsTableViewController.students = sortedStudents
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EmbedStudentsTableView" {
            let studentsTableVC = segue.destination as! StudentsTableViewController
            studentsTableViewController = studentsTableVC
        }
    }
    
    private let networkClient = NetworkClient()
    
    @IBOutlet weak var sortSelector: UISegmentedControl!

    private var studentsTableViewController: StudentsTableViewController!
    
        private var students:[Student] = [] {
            didSet {
                updateSort()
            }
        }
}
