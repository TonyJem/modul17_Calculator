import UIKit

class ViewController: UIViewController {
    
    //MARK: - Outlets:
    @IBOutlet var numberButtons: [UIButton]!
    @IBOutlet var mathActionButtons: [UIButton]!
    @IBOutlet weak var dotButton: UIButton!
    @IBOutlet weak var acButton: UIButton!
    @IBOutlet weak var plusMinusButton: UIButton!
    @IBOutlet weak var percentButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet var backgroundView: UIView!
    
    let backgroundColor: UIColor = .black
    let numberButtonsColor: UIColor = .cyan
    let mathActionButtonsColor: UIColor = .orange
    let extraButtonsColor: UIColor = .darkGray
    
    var mainButtons: [UIButton] = []
    var actionButtons: [UIButton] = []
    var extraButtons: [UIButton] = []
    
    var allButtons: [UIButton] = []
    
    
//MARK: - StartHere:
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainButtons.append(dotButton)
        
        setupUI()
    }
    
//MARK: - Methods:
    func setupUI(){
        setupElementsBackgroundColors()
    }
    
    func setupElementsBackgroundColors(){
        backgroundView.backgroundColor = backgroundColor
        
        dotButton.backgroundColor = numberButtonsColor
        for button in numberButtons {
            button.backgroundColor = numberButtonsColor
        }
        
        for button in mathActionButtons {
            button.backgroundColor = mathActionButtonsColor
        }
        
        acButton.backgroundColor = extraButtonsColor
        plusMinusButton.backgroundColor = extraButtonsColor
        percentButton.backgroundColor = extraButtonsColor
    }
    
    
    
    
//MARK: - Actions:
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

