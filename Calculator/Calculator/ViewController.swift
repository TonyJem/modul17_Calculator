import UIKit

// TODO -1. Label can contain max: "999 999 999", if number is bigger it has to be turned into "7.901235e29" and operate with it. If anything wrong, just frop error to screen, that possible to delete with AC. As bigger number as smaller Fonts size comes <- need to do it flexible

class ViewController: UIViewController {
    
    // MARK: Outlets:
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet var allButtons: [CalcButton]!
    
    // MARK: Properties:
    private let appBackgroundColor: UIColor = .black
    
    private let labelFontColor: UIColor = .white
    private let labelFontSize: CGFloat = 65
    
    private let buttonFontColor: UIColor = .blue
    private let buttonFontSize: CGFloat = 42
    
    private let buttonBorderWidth: CGFloat = 3
    private let buttonBorderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1.0)
    private let buttonBorderCornerRadius: CGFloat = 20
    
    private let allPrimaryButtonTags = [21, 22, 23, 31, 32, 33, 41, 42, 43, 51, 52, 53]
    private let allActionButtonTags = [14, 24, 34, 44, 54]
    private let allSecondaryButtonTags = [11, 12, 13]
    
    private let colorSchemeForPrimaryButtons: ButtonColorScheme = .primaryButton
    private let colorSchemeForActionButtons: ButtonColorScheme = .actionButton
    private let colorSchemeForSecondaryButtons: ButtonColorScheme = .secondaryButton
    
    private var currentTextInResultLabel = "0" {
        didSet {
            setupResultLabelUI()
        }
    }
    
    // MARK: Starting Here:
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: Methods:
    private func setupUI() {
        backView.backgroundColor = appBackgroundColor
        setupResultLabelUI()
        for button in allButtons {
            setupButtonUI(for: button)
        }
    }
    
    private func setupButtonUI(for button: CalcButton) {
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: buttonFontSize)
        button.setTitleColor(buttonFontColor, for: .normal)
        
        setupButtonBorders(for: button)
        
        if allPrimaryButtonTags.contains(button.tag) {
            button.backgroundColor = colorSchemeForPrimaryButtons.buttonBackgroundColor
        }
        
        // "Square Root" Button:
        if button.tag == 12 {
            button.setTitle("\u{221A}x", for: .normal)
        }
        
        // "Devision" Button:
        if button.tag == 14 {
            button.setTitle("\u{00F7}", for: .normal)
        }
        
        // "Multiplication" Button:
        if button.tag == 24 {
            button.setTitle("\u{00D7}", for: .normal)
        }
        
        // "Minus" Button:
        if button.tag == 34 {
            button.setTitle("\u{2212}", for: .normal)
        }
        
        // "PlusMinus" Button:
        if button.tag == 51 {
            button.setTitle("\u{207A}\u{2215}\u{208B}", for: .normal)
        }
        
        if allActionButtonTags.contains(button.tag) {
            button.backgroundColor = colorSchemeForActionButtons.buttonBackgroundColor
        }
        
        if allSecondaryButtonTags.contains(button.tag) {
            button.backgroundColor = colorSchemeForSecondaryButtons.buttonBackgroundColor
        }
    }
    
    private func setupButtonBorders(for button: CalcButton){
        button.layer.borderWidth = buttonBorderWidth
        button.layer.borderColor = buttonBorderColor.cgColor
        button.layer.cornerRadius = buttonBorderCornerRadius
    }
    
    private func setupResultLabelUI(){
        resultLabel.textColor = labelFontColor
        resultLabel.font = UIFont.systemFont(ofSize: labelFontSize)
        resultLabel.text = currentTextInResultLabel
    }
    
    // MARK: Actions:
    @IBAction func someButtonTapped(_ sender: CalcButton) {
        sender.animateWithPulsate()
        sender.animateWithFlash()
        
        switch sender.tag {
        // AC button:
        case 11:
            currentTextInResultLabel = "0"
        
        // squareRoot button:
        case 12:
            return
        
        // percentage button:
        case 13:
            return
        
        // divide button:
        case 14:
            return
                        
        // Numeric buttons:
        case 21, 22, 23, 31, 32, 33, 41, 42, 43, 52:
            guard currentTextInResultLabel != "0" else {
                currentTextInResultLabel = sender.currentTitle ?? ""
                return
            }
            currentTextInResultLabel += sender.currentTitle ?? ""
        
        // multiply button:
        case 24:
            return
            
        // minus button:
        case 34:
            return
            
        // plus button:
        case 44:
            return
            
        // PlusMinus button:
        case 51:
            guard currentTextInResultLabel != "0" else { return }
            
            guard currentTextInResultLabel.first != "\u{2212}" else {
                currentTextInResultLabel.removeFirst()
                return
            }
            currentTextInResultLabel = "\u{2212}" + currentTextInResultLabel
        
        // Comma button:
        case 53:
            guard !currentTextInResultLabel.contains(sender.currentTitle!) else { return }
            currentTextInResultLabel += sender.currentTitle ?? ""
         
        // Result button:
        case 54:
            return
            
        default:
            break
        }
    }
}

//
//import UIKit
//
//class ViewController: UIViewController {
//    enum Operation {
//        case plus
//        case minus
//        case divide
//        case multiply
//    }
//
//    var operation: Operation? = nil
//    var operand1: Int = 0
//    var operand2: Int?
//
//    @IBOutlet weak var stackView: UIStackView!
//    @IBOutlet weak var resultLabel: UILabel!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        makeCornerRadiusOnButtons()
//    }
//
//
//    @IBAction func numberButtonAction(_ sender: UIButton) {
//        let number = Int(sender.titleLabel!.text!)!
//        print(number)
//
//        if resultLabel.text == "0" {
//            resultLabel.text = sender.titleLabel?.text
//        } else {
//            resultLabel.text = resultLabel.text! + (sender.titleLabel?.text)!
//        }
//    }
//
//    private func makeCornerRadiusOnButtons() {
//        for subview in stackView.subviews {
//            guard let stackView = subview as? UIStackView else { return }
//            for subview in stackView.arrangedSubviews {
//                guard let button = subview as? UIButton else { return }
//                button.layer.masksToBounds = true
//                button.layer.cornerRadius = button.frame.height / 2
//            }
//        }
//    }
//}
