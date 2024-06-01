//
//  LinkView.swift
//  OpenInApp (Assignment)
//
//  Created by Kushagra Shukla on 31/05/24.
//

import SwiftUI
import UniformTypeIdentifiers

struct LinkView: View {
    
    @State var link: URLLink = URLLink(urlID: 123, webLink: "https://www.google.com/", smartLink: "https://www.google.com/", title: "Google", totalClicks: 2000, originalImage: "https://picsum.photos/id/12/600", timesAgo: "", createdAt: "12:00", domainID: "", urlSuffix: "", app: "Google", isFavourite: false)
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            HStack {
                AsyncImage(url: URL(string: link.originalImage)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: 60, height: 60)
                        
                    case .success(let image):
                        
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 60, height: 60)
                    case .failure(_):
                        Image("Amazon_icon")
                            .resizable()
                            .scaledToFit()
                    @unknown default:
                            ProgressView()
                            .frame(width: 60, height: 60)
                    }
                }
                    .clipShape(.rect(cornerRadius: 8))
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(.gray.opacity(0.1), lineWidth: 2)
                            .frame(width: 60, height: 60)
                        
                    }
                    .padding()
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(link.title)
                        .foregroundStyle(.primary)
                    
                    Text(link.createdAt.getDayMonthAndYear())
                        .foregroundStyle(.secondary)
                }
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 8) {
                    Text("\(link.totalClicks)")
                        .foregroundStyle(.primary)
                        .font(.headline)
                    
                    Text("Clicks")
                        .foregroundStyle(.secondary)
                }
                .padding(.trailing)
            }
            
            HStack {
                Text(link.smartLink)
                    .foregroundStyle(.primary)
                
                Spacer()
                
                Button(action: {
                    UIPasteboard.general.setValue(link.smartLink, forPasteboardType: UTType.plainText.identifier)
                    impactFeedbackGenerator.impactOccurred()
                }, label: {
                    Image(systemName: "doc.on.doc")
                })
                
            }
            .padding()
            .frame(height: 50)
            .background {
                UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(bottomLeading: 8, bottomTrailing: 8))
                    .foregroundStyle(Color(uiColor: .systemBlue).opacity(0.1))
            }
            .overlay {
                UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(bottomLeading: 8, bottomTrailing: 8))
                    .stroke(style: StrokeStyle(lineWidth: 1, dash: [4]))
                    .foregroundStyle(Color(uiColor: .systemBlue))
            }
        }
        .frame(height: 150)
        .background {
            RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(colorScheme == .light ? .white : .black)
        }
    }
}

struct LinkView_Preview: PreviewProvider {
    static var previews: some View {
        LinkView()
            .previewLayout(.sizeThatFits)
    }
}
