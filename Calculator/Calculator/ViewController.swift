import UIKit

class ViewController: UIViewController {
    
    // MARK: Outlets:
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet var allButtons: [CalcButton]!
    
    // MARK: Properties:
    

    // MARK: Starting Here:
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Methods:
    
    // MARK: Actions:
    @IBAction func someButtonTapped(_ sender: CalcButton) {
    }
}

