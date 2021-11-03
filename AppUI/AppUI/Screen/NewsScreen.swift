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
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct NewsScreen_Previews: PreviewProvider {
    static var previews: some View {
        NewsScreen()
    }
}
