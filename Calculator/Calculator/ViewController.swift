import UIKit

class ViewController: UIViewController {
    
    // MARK: Outlets:
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet var allButtons: [CalcButton]!
    
    // MARK: Properties:
    private let appBackgroundColor: UIColor = .black
    private let fontColor: UIColor = .blue
    private let fontSize: CGFloat = 32
    
    private let allPrimaryButtonTags = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    private let allActionButtonTags = [11, 12, 13, 14, 15]
    private let allSecondaryButtonTags = [16, 17, 18]
    
    private let colorSchemeForPrimaryButtons: ButtonColorScheme = .primaryButton
    private let colorSchemeForActionButtons: ButtonColorScheme = .actionButton
    private let colorSchemeForSecondaryButtons: ButtonColorScheme = .secondaryButton
    
    // MARK: Starting Here:
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: Methods:
    private func setupUI() {
        backView.backgroundColor = appBackgroundColor
        
        for button in allButtons {
            if allPrimaryButtonTags.contains(button.tag) {
                button.backgroundColor = colorSchemeForPrimaryButtons.buttonBackgroundColor
            }
            
            if allActionButtonTags.contains(button.tag) {
                button.backgroundColor = colorSchemeForActionButtons.buttonBackgroundColor
            }
            
            if allSecondaryButtonTags.contains(button.tag) {
                button.backgroundColor = colorSchemeForSecondaryButtons.buttonBackgroundColor
            }
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: fontSize)
        button.setTitleColor(fontColor, for: .normal)
        }
        
    }
    
    // MARK: Actions:
    @IBAction func someButtonTapped(_ sender: CalcButton) {
    }
    
    
}
