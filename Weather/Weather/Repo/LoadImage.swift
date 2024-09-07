import SwiftUI

struct LoadImage: View {
    
    let url: String
    let placeholder: String
    
    @ObservedObject var imageLoader = DownloadImage()
    
    init(url: String, placeholder: String = "default") {
        self.url = url
        self.placeholder = placeholder
        self.imageLoader.downloadImage(url: self.url)
    }
    
    var body: some View {
      
        if let data = self.imageLoader.downloadedData {
            return Image(uiImage: UIImage(data: data)!).resizable()
        } else {
            return Image("default").resizable()
        }
        
    }
}

struct LoadImage_Previews: PreviewProvider {
    static var previews: some View {
        LoadImage(url: "https://openweathermap.org/img/w/10d.png")
    }
}

