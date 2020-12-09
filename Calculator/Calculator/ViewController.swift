import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var numberButtons: [UIButton]!
    @IBOutlet var mathActionButtons: [UIButton]!
    @IBOutlet weak var dotButton: UIButton!
    @IBOutlet weak var acButton: UIButton!
    @IBOutlet weak var plusMinusButton: UIButton!
    @IBOutlet weak var percentButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
//MARK: - Actions
    @IBAction func numberButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func dotButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func equalButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func mathActionButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func acButtonTapped(_ sender: UIButton) {
    }
   
    @IBAction func plusMinusButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func percentButtonTapped(_ sender: UIButton) {
    }
}

