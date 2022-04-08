
import UIKit

class OnboardingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupView()
    }
  
    // MARK: - Set Up
    
    private func setupView(){
        let onboardingView = OnboardingView()
         
        onboardingView.clickStartButton = {
            let vc = MoviesListViewController()
            vc.navigationItem.largeTitleDisplayMode = .never
            self.navigationItem.titleView?.tintColor = .systemPink
            self.navigationItem.leftBarButtonItem?.tintColor = .systemBackground
            self.navigationController?.pushViewController(vc, animated: true)
         }
         
         self.view = onboardingView
    }
    

}

