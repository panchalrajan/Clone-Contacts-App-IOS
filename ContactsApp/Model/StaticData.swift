import Foundation

class StaticData {
    static func getUsers() -> [User] {
        
        let user1 = User(firstName: "Riya", lastName: "Gupta", company: nil, phoneNumbers: ["+91 9876543210"], emailIds: ["riya.gupta@example.com"])
        let user2 = User(firstName: "Aryan", lastName: "Sharma", company: "ABC Inc.", phoneNumbers: ["+91 9876543211", "+91 9876543212", "+91 9876543215"], emailIds: ["aryan.sharma@example.com", "aryan.s@example.com"])
        let user3 = User(firstName: "Neha", lastName: "Patel", company: "XYZ Corp.", phoneNumbers: ["+91 9876543213"], emailIds: ["neha.patel@example.com"])
        let user4 = User(firstName: "Rahul", lastName: "Singh", company: "DEF Ltd.", phoneNumbers: ["+91 9876543214", "+91 9876543215"], emailIds: ["rahul.singh@example.com"])
        let user5 = User(firstName: "Kavya", lastName: "Gupta", company: nil, phoneNumbers: ["+91 9876543216"], emailIds: ["kavya.gupta@example.com"])
        let user6 = User(firstName: "Saurabh", lastName: "Verma", company: "PQR Inc.", phoneNumbers: ["+91 9876543217", "+91 9876543218"], emailIds: ["saurabh.verma@example.com", "saurabh.v@example.com"])
        let user7 = User(firstName: "Anjali", lastName: "Rajput", company: nil, phoneNumbers: ["+91 9876543219", "+91 9876543220"], emailIds: nil)
        let user8 = User(firstName: "Vikas", lastName: "Yadav", company: "LMN Corp.", phoneNumbers: ["+91 9876543221"], emailIds: ["vikas.yadav@example.com"])
        let user9 = User(firstName: "Preeti", lastName: "Jain", company: "ABC Inc.", phoneNumbers: ["+91 9876543222"], emailIds: ["preeti.jain@example.com"])
        let user10 = User(firstName: "Rohit", lastName: "Sharma", company: "PQR Inc.", phoneNumbers: ["+91 9876543223", "+91 9876543224"], emailIds: ["rohit.sharma@example.com", "rohit.s@example.com"])
        let user11 = User(firstName: "Tushar", lastName: "Thakur", company: "TUV Corp.", phoneNumbers: ["+91 9876543271"], emailIds: ["tushar.thakur@example.com"])
        let user12 = User(firstName: "Manoj", lastName: "Kumar", company: "XYZ Corp.", phoneNumbers: ["+91 9876543226", "+91 9876543227"], emailIds: ["manoj.kumar@example.com"])
        let user13 = User(firstName: "Nidhi", lastName: "Sharma", company: nil, phoneNumbers: ["+91 9876543228"], emailIds: ["nidhi.sharma@example.com"])
        let user14 = User(firstName: "Snehal", lastName: "Sharma", company: "SST Corp.", phoneNumbers: ["+91 9876543270"], emailIds: ["snehal.sharma@example.com"])
        let user15 = User(firstName: "Tanvi", lastName: "Patel", company: "LMN Corp.", phoneNumbers: ["+91 9876543230", "+91 9876543231"], emailIds: ["tanvi.patel@example.com", "tanvi.p@example.com"])
        let user16 = User(firstName: "Varsha", lastName: "Vaidya", company: "VWX Corp.", phoneNumbers: ["+91 9876543272"], emailIds: ["varsha.vaidya@example.com"])
        let user17 = User(firstName: "Sakshi", lastName: "Sharma", company: "PQR Inc.", phoneNumbers: ["+91 9876543233"], emailIds: ["sakshi.sharma@example.com"])
        let user18 = User(firstName: "Alok", lastName: "Yadav", company: nil, phoneNumbers: ["+91 9876543234"], emailIds: ["alok.yadav@example.com"])
        let user19 = User(firstName: "Naina", lastName: "Jain", company: "DEF Ltd.", phoneNumbers: ["+91 9876543235", "+91 9876543236"], emailIds: ["naina.jain@example.com", "naina.j@example.com"])
        let user20 = User(firstName: "Ravi", lastName: "Sharma", company: "XYZ Corp.", phoneNumbers: ["+91 9876543237"], emailIds: ["ravi.sharma@example.com"])
        let user21 = User(firstName: "Bhavana", lastName: "Patel", company: "ABC Corp.", phoneNumbers: ["+91 9876543238"], emailIds: ["bhavana.patel@example.com"])
        let user22 = User(firstName: "Chetan", lastName: "Singh", company: "DEF Corp.", phoneNumbers: ["+91 9876543239"], emailIds: ["chetan.singh@example.com"])
        let user23 = User(firstName: "Divya", lastName: "Agarwal", company: "GHI Corp.", phoneNumbers: ["+91 9876543240"], emailIds: ["divya.agarwal@example.com"])
        let user24 = User(firstName: "Firoz", lastName: "Khan", company: "JKL Corp.", phoneNumbers: ["+91 9876543241"], emailIds: ["firoz.khan@example.com"])
        let user25 = User(firstName: "Gauri", lastName: "Nair", company: "MNO Corp.", phoneNumbers: ["+91 9876543242"], emailIds: ["gauri.nair@example.com"])
        let user26 = User(firstName: "Hitesh", lastName: "Shah", company: "PQR Corp.", phoneNumbers: ["+91 9876543243"], emailIds: ["hitesh.shah@example.com"])
        let user27 = User(firstName: "Isha", lastName: "Gupta", company: "STU Corp.", phoneNumbers: ["+91 9876543244"], emailIds: ["isha.gupta@example.com"])
        let user28 = User(firstName: "Kavya", lastName: "Rao", company: "VWX Corp.", phoneNumbers: ["+91 9876543245"], emailIds: ["kavya.rao@example.com"])
        let user29 = User(firstName: "Lakshmi", lastName: "Menon", company: "YZ Corp.", phoneNumbers: ["+91 9876543246"], emailIds: ["lakshmi.menon@example.com"])
        let user30 = User(firstName: "Manish", lastName: "Joshi", company: "LMN Corp.", phoneNumbers: ["+91 9876543247"], emailIds: ["manish.joshi@example.com"])
        let user31 = User(firstName: "Vikram", lastName: "Verma", company: nil, phoneNumbers: ["+91 9876543248"], emailIds: ["vikram.verma@example.com"])
        let user32 = User(firstName: "Devanshi", lastName: "Doshi", company: "DMS Corp.", phoneNumbers: ["+91 9876543249"], emailIds: ["devanshi.doshi@example.com"])
        let user33 = User(firstName: "Rishabh", lastName: "Rajput", company: "RRS Corp.", phoneNumbers: ["+91 9876543250"], emailIds: ["rishabh.rajput@example.com"])
        let user34 = User(firstName: "Nikhil", lastName: "Nair", company: "NNC Corp.", phoneNumbers: ["+91 9876543251"], emailIds: ["nikhil.nair@example.com"])
        let user35 = User(firstName: "Abhinav", lastName: "Acharya", company: "AAC Corp.", phoneNumbers: ["+91 9876543252"], emailIds: ["abhinav.acharya@example.com"])
        let user36 = User(firstName: "Sneha", lastName: "Sharma", company: "SSS Corp.", phoneNumbers: ["+91 9876543253"], emailIds: ["sneha.sharma@example.com"])
        let user37 = User(firstName: "Girish", lastName: "Gupta", company: "GGC Corp.", phoneNumbers: ["+91 9876543254"], emailIds: ["girish.gupta@example.com"])
        let user38 = User(firstName: "Himani", lastName: "Hegde", company: "HHC Corp.", phoneNumbers: ["+91 9876543255"], emailIds: ["himani.hegde@example.com"])
        let user39 = User(firstName: "Krishna", lastName: "Kulkarni", company: "KKC Corp.", phoneNumbers: ["+91 9876543256"], emailIds: ["krishna.kulkarni@example.com"])
        let user40 = User(firstName: "Anusha", lastName: "Apte", company: nil, phoneNumbers: ["+91 9876543257"], emailIds: ["anusha.apte@example.com"])
        let user41 = User(firstName: "Bhavesh", lastName: "Babu", company: "BCD Corp.", phoneNumbers: ["+91 9876543258"], emailIds: ["bhavesh.babu@example.com"])
        let user42 = User(firstName: "Chitra", lastName: "Chopra", company: "CCL Corp.", phoneNumbers: ["+91 9876543259"], emailIds: ["chitra.chopra@example.com"])
        let user43 = User(firstName: "Dinesh", lastName: "Desai", company: "DFT Corp.", phoneNumbers: ["+91 9876543260"], emailIds: ["dinesh.desai@example.com"])
        let user44 = User(firstName: "Faisal", lastName: "Farooqi", company: "FGI Corp.", phoneNumbers: ["+91 9876543261"], emailIds: ["faisal.farooqi@example.com"])
        let user45 = User(firstName: "Gauri", lastName: "Gandhi", company: "GGS Corp.", phoneNumbers: ["+91 9876543262"], emailIds: ["gauri.gandhi@example.com"])
        let user46 = User(firstName: "Harish", lastName: "Hegde", company: "HJL Corp.", phoneNumbers: ["+91 9876543263"], emailIds: ["harish.hegde@example.com"])
        let user47 = User(firstName: "Ishita", lastName: "Iyer", company: "ITM Corp.", phoneNumbers: ["+91 9876543264"], emailIds: ["ishita.iyer@example.com"])
        let user48 = User(firstName: "Jatin", lastName: "Joshi", company: "JKL Corp.", phoneNumbers: ["+91 9876543265"], emailIds: ["jatin.joshi@example.com"])
        let user49 = User(firstName: "Kavita", lastName: "Kadam", company: "KKT Corp.", phoneNumbers: ["+91 9876543266"], emailIds: ["kavita.kadam@example.com"])
        let user50 = User(firstName: "Lalit", lastName: "Lal", company: "LST Corp.", phoneNumbers: ["+91 9876543267"], emailIds: ["lalit.lal@example.com"])



        
        let contacts = [user1, user2, user3, user4, user5, user6, user7, user8, user9, user10,
                        user11, user12, user13, user14, user15, user16, user17, user18, user19, user20,
                        user21, user22, user23, user24, user25, user26, user27, user28, user29, user30,
                        user31, user32, user33, user34, user35, user36, user37, user38, user39, user40,
                        user41, user42, user43, user44, user45, user46, user47, user48, user49, user50,]
        
        return contacts
    }
}
