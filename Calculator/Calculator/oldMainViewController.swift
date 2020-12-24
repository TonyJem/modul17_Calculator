import UIKit
//MARK: Here is old MainViewController version before removing Tags


// TODO -1. Label can contain max: "999 999 999", if number is bigger it has to be turned into "7.901235e29" and operate with it. If anything wrong, just frop error to screen, that possible to delete with AC. As bigger number as smaller Fonts size comes <- need to do it flexible

class OLD_MainViewController: UIViewController {
    
    // MARK: Outlets:
    @IBOutlet private weak var backgroundView: UIView!
    @IBOutlet private weak var resultLabel: UILabel!
    @IBOutlet private var allButtons: [CalcButton]!
    
    // MARK: Properties:
    private let allPrimaryButtonTags = [21, 22, 23, 31, 32, 33, 41, 42, 43, 51, 52, 53]
    private let allActionButtonTags = [14, 24, 34, 44, 54]
    private let allSecondaryButtonTags = [11, 12, 13]
    
    private let colorSchemeForPrimaryButtons: ButtonColorScheme = .primaryButton
    private let colorSchemeForActionButtons: ButtonColorScheme = .actionButtonNormal
    private let colorSchemeForSecondaryButtons: ButtonColorScheme = .secondaryButton
    
    private var currentOperation: BasicMathOperation? = nil
    private var operand1: Double = 0
    private var operand2: Double = 0
    
    private var currentTextInResultLabel = "0" {
        didSet {
            setupResultLabelUI()
        }
    }
    
    // MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTitlesForButtons()
        setupUI()
    }
    
    // MARK: Methods:
    private func createTitlesForButtons(){
        for button in allButtons {
            button.setTitle(button.titleToShow, for: .normal)
        }
    }
    
    private func resultOfOperation(operation: BasicMathOperation,
                                   _ number1: Double,
                                   and number2: Double) -> Double {
        switch operation {
        case .addition:
            return number1 + number2
        case .subtraction:
            return number1 - number2
        case .multiplication:
            return number1 * number2
        case .division:
            return number1 / number2
        }
    }
    
    private func operationButtonPressed(for pressedOperation: BasicMathOperation) {
        guard currentOperation != nil else {
            operand1 = Double(currentTextInResultLabel) ?? 0
//            TODO: Refactor below next doubled code's rows:
            resultLabel.textColor = Colors.labelFontColorFrozen
            currentOperation = pressedOperation
            return
        }
        operand2 = Double(currentTextInResultLabel) ?? 0
        let result = resultOfOperation(operation: currentOperation!, operand1, and: operand2)
        operand1 = result
        resultLabel.text = String(result)
        resultLabel.textColor = Colors.labelFontColorFrozen
        currentOperation = pressedOperation
    }
    
    private func setupUI() {
        backgroundView.backgroundColor = Colors.applicationBackgroundColor
        setupResultLabelUI()
        for button in allButtons {
            setupAllButtonsUI(for: button)
        }
    }
    
    private func setupAllButtonsUI(for button: CalcButton) {
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: CalcButtonDTO.primaryButton.fontSize)
        button.setTitleColor(Colors.buttonFontColor, for: .normal)
        
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
        button.layer.borderWidth = CalcButtonDTO.primaryButton.borderWidth
        button.layer.borderColor = CalcButtonDTO.primaryButton.borderColor.cgColor
        button.layer.cornerRadius = CalcButtonDTO.primaryButton.cornerRadius
    }
    
    private func setupResultLabelUI(){
        resultLabel.textColor = Colors.labelFontColorNormal
        resultLabel.font = UIFont.systemFont(ofSize: CalcLabelDTO.resultLabelActive.fontSize)
        resultLabel.text = currentTextInResultLabel
    }
    
    // MARK: Actions:
    @IBAction func numericButtonTapped(_ sender: CalcButton) {
        
    }
    
    @IBAction func resetButtonTapped(_ sender: CalcButton) {
    }
    
    @IBAction func squareroot(_ sender: CalcButton) {
    }

    @IBAction func percentButtonTapped(_ sender: CalcButton) {
    }
    
    @IBAction func basicOperationButtonTapped(_ sender: CalcButton) {
    }
    
    @IBAction func equalsButtonTapped(_ sender: CalcButton) {
    }
    
    @IBAction func decimalpointButtonTapped(_ sender: CalcButton) {
    }
    
    @IBAction func plusminusButtonTapped(_ sender: CalcButton) {
    }
    
    
    
    // MARK: OLD Actions:
    @IBAction func someButtonTapped(_ sender: CalcButton) {
        
        switch sender.tag {
        // AC button:
        case 11:
            currentTextInResultLabel = "0"
            currentOperation = nil
            operand1 = 0
            operand2 = 0
            for button in allButtons {
                setupAllButtonsUI(for: button)
                button.isUserInteractionEnabled = true
            }
        
        // squareRoot button:
        case 12:
            return
        
        // percentage button:
        case 13:
            return
        
        // divide button:
        case 14:
            operationButtonPressed(for: .division)
                        
        // Numeric buttons:
        case 21, 22, 23, 31, 32, 33, 41, 42, 43, 52:
            guard resultLabel.textColor != Colors.labelFontColorFrozen else {
                resultLabel.textColor = Colors.labelFontColorNormal
                currentTextInResultLabel = ""
                currentTextInResultLabel += sender.currentTitle ?? ""
                return
            }
            
            guard currentTextInResultLabel != "0" else {
                currentTextInResultLabel = sender.currentTitle ?? ""
                return
            }
            currentTextInResultLabel += sender.currentTitle ?? ""
        
        // multiply button:
        case 24:
            operationButtonPressed(for: .multiplication)
            
        // minus button:
        case 34:
            operationButtonPressed(for: .subtraction)
            
        // plus button:
        case 44:
            guard sender.backgroundColor != Colors.actionButtonFrozen else { return }
            sender.isUserInteractionEnabled = false
            sender.animateWithPulsate()
            sender.animateWithFlash()
            sender.backgroundColor = Colors.actionButtonFrozen
            operationButtonPressed(for: .addition)
            
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
            
        // Result (Equal) button:
        case 54:
            guard currentOperation != nil else {
                return
            }
            operand2 = Double(currentTextInResultLabel) ?? 0
            let result = resultOfOperation(operation: currentOperation!, operand1, and: operand2)
            operand1 = result
            
            resultLabel.text = String(result)
            resultLabel.textColor = Colors.labelFontColorFrozen
            currentOperation = nil
            
        default:
            break
        }
    }
}
