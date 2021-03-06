//
//  MoleTestResultView.swift
//  MoleCheck
//
//  Created by Камиль Сулейманов on 20.09.2021.
//

import SwiftUI

struct MoleTestResultView: View {
    let mole: Mole
    let index: Int
    
    var body: some View {
        
        HStack {
            
            Image(uiImage: (mole.moleImage != nil ? UIImage(data: mole.moleImage!) : UIImage(named: "MoleImage"))!)
                .resizable()
                .cornerRadius(18)
                .frame(width: 79, height: 79)
                .padding(.horizontal)
            
            VStack (alignment: .leading, spacing: 10){
                
                Text((mole.moleDescription ?? "") + " №\(index + 1)")
                    .font(.system(size: 16))
                    .bold()
                    .foregroundColor(.colors.black)
                
                Text(mole.testDate ?? "")
                    .font(.system(size: 13))
                    .bold()
                    .foregroundColor(.colors.gray)
                
                Text(mole.testResult.rawValue)
                    .font(.system(size: 11))
                    .foregroundColor(.white)
                    .frame(width: 91, height: 20)
                    .background(mole.testResult.statusColor.cornerRadius(5))
            }
            
            Spacer()
            
            Image(systemName: "chevron.forward")
                .font(.system(size: 14.51))
                .foregroundColor(.colors.black)
                .padding(.trailing)
        }
        .rectangleFrame()
        .mainBackground()
    }
}

struct MoleCheckView_Previews: PreviewProvider {
    static var previews: some View {
        MoleTestResultView(mole: someMole, index: 1)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
