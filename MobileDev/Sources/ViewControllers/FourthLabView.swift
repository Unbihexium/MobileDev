//
//  FourthLabView.swift
//  MobileDev
//
//  Created by Egor Nalobin on 01.03.2020.
//  Copyright © 2020 Egor Nalobin. All rights reserved.
//

import SwiftUI

struct FourthLabView: View {
    
    
    
    @State var present1 = false
    @State var present2 = false
    @State var present3 = false
    
    @State var functionResult = "None"
    
    @State var data = PersonalData()
    
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 10){
                Button(action: {
                    self.present1 = !self.present1
                }){
                    Text("Первая задача")
                }.sheet(isPresented: $present1) {
                    SecondLabView()
                }.padding(.top, 20)
                Button(action: {
                    self.present2 = !self.present2
                }){
                    Text("Вторая задача")
                }.sheet(isPresented: $present2,onDismiss: {
                    self.updateData()
                }) {
                    FormView()
                }
                Button(action: {
                    self.present3 = !self.present3
                }){
                    Text("Третья задача")
                }.sheet(isPresented: $present3) {
                    MathView(self)
                }
                Spacer()
                Form{
                    Section(header: Text("Личные данные")) {
                        HStack {
                            Text("Фамилия")
                            Spacer()
                            Text("\(data.family)").foregroundColor(.gray)
                        }
                        HStack {
                            Text("Имя")
                            Spacer()
                            Text("\(data.name)").foregroundColor(.gray)
                        }
                        HStack {
                            Text("Отчество")
                            Spacer()
                            Text("\(data.patronymic)").foregroundColor(.gray)
                        }
                        DatePicker(selection: .constant(data.date), displayedComponents: .date ,label: {
                            Text("Дата рождения")
                        })
                    }
                    Section(header: Text("Контактные данные")) {
                        HStack {
                            Text("Телефон")
                            Spacer()
                            Text("\(data.phone)").foregroundColor(.gray)
                        }
                        HStack {
                            Text("Email")
                            Spacer()
                            Text("\(data.email)").foregroundColor(.gray)
                        }
                        
                    }
                }
                Text(functionResult)
                
            }
            Spacer()
            
        }
    }
    
    func updateData(){
        self.data =  NSKeyedUnarchiver.unarchiveObject(withFile: PersonalData.ArchiveURL.path) as? PersonalData ?? PersonalData()
    }
}

class PersonalData: NSObject, NSCoding {
    var family = ""
    var name = ""
    var patronymic = ""
    var date = Date()
    var email = ""
    var phone = ""

    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("personalData")
    
    override init(){
        super.init()
    }
    
    init(family: String, name: String, patronymic: String, date: Date, email: String, phone: String) {
    
        self.family = family
        self.name = name
        self.patronymic = patronymic
        self.date = date
        self.email = email
        self.phone = phone
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(family, forKey: "family")
        aCoder.encode(name, forKey: "name")
        aCoder.encode(patronymic, forKey: "patronymic")
        aCoder.encode(date, forKey: "date")
        aCoder.encode(email, forKey: "email")
        aCoder.encode(phone, forKey: "phone")
        
    }

    convenience required init?(coder aDecoder: NSCoder) {
    
        guard let name = aDecoder.decodeObject(forKey: "name") as? String,
            let family = aDecoder.decodeObject(forKey: "family") as? String,
            let patronymic = aDecoder.decodeObject(forKey: "patronymic") as? String,
            let date = aDecoder.decodeObject(forKey: "date") as? Date,
            let email = aDecoder.decodeObject(forKey: "email") as? String,
            let phone = aDecoder.decodeObject(forKey: "phone") as? String
            else {
                return nil
        }
        self.init(family: family, name: name, patronymic: patronymic, date: date, email: email, phone: phone)
    }

}

struct FourthLabView_Previews: PreviewProvider {
    static var previews: some View {
        FourthLabView()
    }
}


class FourthLabViewController: UIHostingController<FourthLabView> {
    
    required init?(coder: NSCoder) {
           super.init(coder: coder,rootView: FourthLabView());
       }

       override func viewDidLoad() {
           super.viewDidLoad()
           self.navigationItem.title = "Четвертая"
       }
}


extension FourthLabView: ShowResultDelegate {
    
    func showResult(_ result: String) {
        guard let res = Double(result) else {
            self.functionResult = "None"
            return
        }
        self.functionResult = "\(cos(res))"
    }
}
