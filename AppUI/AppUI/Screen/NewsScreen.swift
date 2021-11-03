//
//  NewsScreen.swift
//  AppUI
//
//  Created by Илья Проскурнев on 03.11.2021.
//

import SwiftUI
import Networking

extension Article: Identifiable {

    public var id: String { url }

}

final class NewsScreentViewModel: ObservableObject {
    @Published var NewsList: [Article] = .init()
    @Published var NewsListForGrid: [[Article]] = .init()

    init() {
        ArticlesAPI.everythingGet(q: "VR", from: "2021-10-03", sortBy: "publishedAt", language: "ru", apiKey: "a59e5f24831a4322b535578654582973", page: 1) {
            list, error in
            self.NewsList.append(contentsOf:  list?.articles ?? [])
            self.collectArticlesAsGrid()
        }
    }

    func collectArticlesAsGrid() {
        let columned = NewsList.publisher.collect(2)
        _ = columned.collect().sink {
            self.NewsListForGrid = $0
        }
    }

}

struct NewsScreen: View {
    @StateObject var newsList = NewsScreentViewModel()
    var setings = ["List", "Grid", "Grid iOS 13"]
    @State var collectionViewChoise = 0
    var columns: [GridItem] = Array(repeating: .init(), count: 2)
    var body: some View {
        ScrollView {
            VStack {
                Picker("Options", selection: $collectionViewChoise) {
                    ForEach(0 ..< setings.count) { index in
                        Text(self.setings[index])
                            .tag(index)
                    }
                }.pickerStyle(SegmentedPickerStyle())
                if collectionViewChoise == 0 {
                    list
                } else if collectionViewChoise == 1 {
                    grid
                } else {
                    grid13
                }
            }
        }
    }

    var list: some View {
        VStack {
            List(newsList.NewsList) { item in
                Text(item.title ?? "No title")
            }
        }
    }

    var grid: some View {
        LazyVGrid(columns: columns) {
            ForEach(newsList.NewsList) {
                ArticleCellView(title: $0.title ?? "No title")
            }
        }
        .padding(.horizontal, 20)
    }

    var grid13: some View {
        VStack(spacing: 10) {
            ForEach(0..<newsList.NewsListForGrid.count, id:\.self) { row in
                HStack(spacing: 10) {
                    ForEach(newsList.NewsListForGrid[row], id: \.self) {
                        ArticleCellView(title: $0.title ?? "No title")
                    }
                }
            }
        }
        .padding(.horizontal, 20)
    }

}

struct ArticleCellView: View {
    let title: String
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.gray)
            VStack {
                Text(title)
                    .foregroundColor(.white)
                    .padding()
                Spacer()
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 200)
    }
}

struct NewsScreen_Previews: PreviewProvider {
    static var previews: some View {
        NewsScreen()
    }
}
