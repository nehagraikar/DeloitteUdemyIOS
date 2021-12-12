//
//  ModelData.swift
//  DeloitteUdemyIOS
//
//  Created by nraikar on 12/12/21.
//

import Foundation
class apiCall {
    func getCourses(completion:@escaping ([CourseModel]) -> ()) {
        guard let url = URL(string: "https://nehagraikar.github.io/files/courseInfo.json") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let courses = try! JSONDecoder().decode([CourseModel].self, from: data!)

            DispatchQueue.main.async {
                completion(courses)
            }
        }
        .resume()
    }
}
