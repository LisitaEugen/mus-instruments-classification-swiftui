//
//  ContentView.swift
//  InstrumentsML
//
//  Created by Lisita Evgheni on 19.05.21.
//

import SwiftUI
import ImagePickerView
import CoreML

struct ContentView: View {
    @EnvironmentObject var viewModel: InstrumentsViewModel
    @State var showImagePicker: Bool = false
    @State var image: UIImage?
    
    var body: some View {
        VStack {
            if image != nil {
                Image(uiImage: image!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            Button("Pick an image") {
                self.showImagePicker.toggle()
            }
            Spacer()
            Text(viewModel.infoText)
            Spacer()
        }
        .sheet(isPresented: $showImagePicker) {
            ImagePickerView(sourceType: .photoLibrary) { image in
                self.image = image
                
                viewModel.updateClassifications(for: image)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
