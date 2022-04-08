
import Foundation
import SDWebImage

extension MoviesTableViewCell {
    
    // MARK: - configure
    
    func configure(with model: TitleModel){
        
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterURL)") else {
            return
        }
        
        titlePosterImageView.sd_setImage(with: url, completed: nil)
        titleLabel.text = model.titleName
    }
    
}

extension MoviesListViewController {
    
    // MARK: - fetch
    
    public func fetchUpcoming (){

        let caseSectionUpcoming = APIcaller()
        caseSectionUpcoming.getTrendingMovies {[weak self] result in
            switch result{
            case .success(let titles):
                self?.titles = titles
                DispatchQueue.main.async { [weak self] in
                     self?.upcomingTable.reloadData()
                }
            case .failure(let error):
                print (error.localizedDescription)
            }
        }

    }

    
}




    

