import UIKit

enum ButtonColorScheme {
    case actionButtonNormal
    case actionButtonFrozen
    case primaryButton
    case secondaryButton
    
    var buttonBackgroundColor: UIColor{
        switch self {
        case .actionButtonNormal:
            return .orange

        case .actionButtonFrozen:
            return .green
            
        case .primaryButton:
            return .cyan
            
        case .secondaryButton:
            return .lightGray
        }
    }
}

class CalcButton: UIButton {
    var title: String = ""
    var colorScheme: ButtonColorScheme = .primaryButton
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func animateWithPulsate() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.2
        pulse.fromValue = 0.97
        pulse.toValue = 1.0
//        pulse.autoreverses = true
        pulse.repeatCount = 1
        pulse.initialVelocity = 0.5
//        pulse.damping = 1.0
        layer.add(pulse, forKey: nil)
    }
    
    func animateWithFlash() {
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 0.1
        flash.fromValue = 1
        flash.toValue = 0.7
        flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//        flash.autoreverses = true
        flash.repeatCount = 1
        layer.add(flash, forKey: nil)
    }
    
    override func setTitle(_ title: String?, for state: UIControl.State) {
        UIView.performWithoutAnimation {
            super.setTitle(title, for: state)
            super.layoutIfNeeded()
        }
    }
}
