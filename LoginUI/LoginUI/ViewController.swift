import UIKit

class ViewController: UIViewController {

    var gradientLayer = CAGradientLayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Create a gradient layer
        gradientLayer = CAGradientLayer()

        // Set the size of the layer to be equal to the size of the display.
        gradientLayer.frame = view.bounds

        let blueColor = UIColor(hex: "#00d4ff")
        let purpleColor = UIColor(hex: "#8a62f4")
        
        // Set an array of Core Graphics colors (.cgColor) to create the gradient.
        // This example uses a simple gradient with two colors
        gradientLayer.colors = [blueColor.cgColor, purpleColor.cgColor]

        // Rasterize for performance
        gradientLayer.shouldRasterize = true
        gradientLayer.rasterizationScale = UIScreen.main.scale

        // Add the gradient layer to the view's layer
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = view.bounds
    }


}

