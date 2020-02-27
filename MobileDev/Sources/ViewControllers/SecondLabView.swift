//
//  SecondLabView.swift
//  MobileDev
//
//  Created by Egor Nalobin on 27.02.2020.
//  Copyright © 2020 Egor Nalobin. All rights reserved.
//

import SwiftUI

struct SecondLabView: View {
    
    @State var a: String = ""
    @State var b: String = ""
    @State var c: String = ""
    
    var body: some View {
        VStack {
            TextField("Коэффициент а", text: $a)
                .background(Color(red: 223.0/255.0, green: 223.0/255.0, blue: 223.0/255.0, opacity: 1.0))
                .padding(.horizontal, 15)
                .cornerRadius(10)
            TextField("Коэффициент b", text: $b)
                .background(Color(red: 223.0/255.0, green: 223.0/255.0, blue: 223.0/255.0, opacity: 1.0))
                .padding(.horizontal, 15)
                .cornerRadius(10)
            TextField("Коэффициент c", text: $c)
                .background(Color(red: 223.0/255.0, green: 223.0/255.0, blue: 223.0/255.0, opacity: 1.0))
                .padding(.horizontal, 15)
                .cornerRadius(10)
            Text(self.updateText())
        }
    }
    
    func updateText() -> String{
        if let a = Double(self.a),
            let b = Double(self.b),
            let c = Double(self.c){
            
            let d = b * b - 4 * a * c
            if d < 0 {
                return "Нет корней"
            }
            if d == 0 {
                return "Корень уравнения: \(-b / 2 / a)"
            } else {
                return "Первый корень:\((-b + sqrt(d))/(2 * a))\nВторой корень:\((-b - sqrt(d))/(2 * a))"
            }
        } else {
            return "Error"
        }
    }
}

struct SecondLabView_Previews: PreviewProvider {
    static var previews: some View {
        SecondLabView()
    }
}

class SecondLabViewController: UIHostingController<SecondLabView> {

    required init?(coder: NSCoder) {
        super.init(coder: coder,rootView: SecondLabView());
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Вторая"
    }
}
