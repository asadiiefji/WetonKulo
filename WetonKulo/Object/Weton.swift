//
//  Weton.swift
//  WetonKulo
//
//  Created by Mukhammad Miftakhul As'Adi on 07/06/23.
//

import Foundation


class Weton: ObservableObject {

    @Published var dateMan = Date()
    @Published var dateWoman = Date()
    @Published var fullDateMan = Date()
    @Published var fullDateWoman = Date()
    @Published var dayMan = Date()
    @Published var dayWoman = Date()
    @Published var isMaghribMan = false
    @Published var isMaghribWoman = false
    
    let javaDay = ["Pahing", "Pon", "Wage", "Kliwon", "Legi"]
    
    let javaDayValue: [String: Int] = [
        "Pahing": 9,
        "Pon": 7,
        "Wage": 4,
        "Kliwon": 8,
        "Legi": 5
    ]
    
    let dayValue: [String: Int] = [
        "Sunday": 5,
        "Monday": 9,
        "Tuesday": 3,
        "Wednesday": 7,
        "Thursday": 8,
        "Friday": 6,
        "Saturday": 9
    ]
    
    let fiveCycles: [DatabaseFiveCycle] = [
        DatabaseFiveCycle(result: "Lungguh", interpretation: "Ibarat mahkota yang memperindah kepala, kamu dan pasanganmu dipercaya akan mempunyai jabatan yang bagus dan menghasilkan keturunan yang dapat mengangkat derajat kedua orang tuanya.", tips: "Kamu dan pasanganmu akan mempunyai jabatan yang bagus jika menikah."),
        DatabaseFiveCycle(result: "Sri", interpretation: "Ibarat tanah yang subur, kamu dan pasanganmu dipercaya akan membangun rumah tangga yang sehat, keturunan yang baik serta banyak rejeki.", tips: "Kamu dan pasanganmu akan dikaruniai anak yang baik jika menikah."),
        DatabaseFiveCycle(result: "Dunya", interpretation: "Ibarat lautan dengan sumber dayanya, kamu dan pasanganmu dipercaya akan menghasilkan banyak rejeki dan menjadi kaya.", tips: "Kamu dan pasanganmu akan hidup dengan banyak rejeki jika menikah."),
        DatabaseFiveCycle(result: "Lara", interpretation: "Ibarat bangunan yang retak, kamu dan pasanganmu dipercaya akan hidup kesusahan dan salah satunya akan sakit-sakitan.", tips: "Kamu dan pasanganmu dapat menentukan hari baik untuk menikah."),
        DatabaseFiveCycle(result: "Pati", interpretation: "Ibarat perahu yang berlayar tanpa bahan bakar, kamu atau pasanganmu dipercaya akan hidup sengsara karena ditinggal mati salah satu calon atau orang tua calon.", tips: "Kamu dan pasanganmu dapat menentukan hari baik untuk menikah.")
    ]
    
    let sevenCycles: [DatabaseSevenCycle] = [
        DatabaseSevenCycle(result: "Lebu Katiup Angin", interpretation: "Layaknya perahu di tengah badai, kamu dan pasanganmu dipercaya akan sering mendapat kesusahan, semua cita-citanya sulit terkabul dan kehidupan yang tidak menentu.", tips: "Kamu dan pasanganmu harus menebar tanah agar dapat menghindari masalah yang akan terjadi jika menikah."),
        DatabaseSevenCycle(result: "Wasesa Segara", interpretation: "Layaknya pelita yang menerangi kegelapan, kamu dan pasanganmu dipercaya sebagai sosok yang low profile, baik perwatakannya, pemaaf dan mempunyai wibawa. Selain itu memiliki pandangan hidup yang luas dalam perhikahan dan akan rukun selalu.", tips: "Kamu dan pasanganmu akan hidup berwibawa jika menikah."),
        DatabaseSevenCycle(result: "Tunggak Semi", interpretation: "Layaknya sumur yang berlimpah air, kamu dan pasanganmu dipercaya akan mudah mencari rejeki, seperti memiliki banyak anak. Namun, kamu dan pasanganmu akan mudah jatuh sakit.", tips: "Kamu dan pasanganmu akan mudah jatuh sakit jika menikah."),
        DatabaseSevenCycle(result: "Satriya Wibawa", interpretation: "Layaknya pohon yang berbuah banyak, kamu dan pasanganmu dipercaya akan hidup berlimpah serta mendapat anugrah dan kemuliaan.", tips: "Kamu dan pasanganmu akan hidup berlimpah rezeki jika menikah."),
        DatabaseSevenCycle(result: "Sumur Sinaba", interpretation: "Layaknya mercusuar yang memberi petunjuk, kamu dan pasanganmu dipercaya akan menjadi penolong orang lain, tempat untuk mendapatkan ilmu dan sering dicontoh.", tips: "Kamu dan pasanganmu akan menjadi contoh jika menikah."),
        DatabaseSevenCycle(result: "Satriya Wirang", interpretation: "Layaknya musim kemarau yang panjang, kamu dan pasanganmu dipercaya akan mengalami kesusahan dan kekurangan secara finansial.", tips: "Kamu dan pasanganmu harus menyembelih hewan agar dapat menghindari masalah yang akan terjadi jika menikah."),
        DatabaseSevenCycle(result: "Bumi Kapetak", interpretation: "Layaknya pulau yang terpencil, kamu dan pasanganmu dipercaya akan menjadi pasangan yang tertutup/tersisih dari pergaulan tetapi menghadapi kehidupan yang berkecukupan dan kuat menghadapi kesulitan.", tips: "Kamu dan pasanganmu harus menanam tanah agar dapat menghindari masalah yang akan terjadi jika menikah.")
    ]
    
    let eightCycles: [DatabaseEightCycle] = [
        DatabaseEightCycle(result: "Pesthi", interpretation: "Bagai malam tenang yang penuh dengan bintang-bintang, kamu dan pasanganmu dipercaya akan mendapat kehidupan yang selalu aman, damai, tentram dan rukun sampai tua. Walaupun nantinya dihadapkan dengan masalah tapi tidak akan merusak keharmonisan dalam rumah tangga.", tips: "Kamu dan pasanganmu akan hidup damai, tentram dan aman jika menikah."),
        DatabaseEightCycle(result: "Pegat", interpretation: "Bagaikan jalan buntu, kamu dan pasanganmu nanti dipercaya akan menghadapi suatu masalah yang berujung pada perceraian yang disebabkan oleh faktor ekonomi maupun perselingkuhan.", tips: "Kamu dan pasanganmu harus memperbanyak ikhtiar dan doa."),
        DatabaseEightCycle(result: "Ratu", interpretation: "Bagai seorang ratu yang dihargai, kamu dan pasanganmu dipercaya akan hidup seperti seorang ratu/diratukan dengan harta, hidup harmonis, disegani dan dihargai oleh masyarakat.", tips: "Kamu dan pasanganmu akan diratukan jika menikah."),
        DatabaseEightCycle(result: "Jodoh", interpretation: "Bagai dua puzzle yang cocok, kamu dan pasanganmu dipercaya akan dapat membangun rumah tangga yang harmonis hingga akhir hayat karena ditakdirkan berjodoh dan menerima kelebihan maupun kekurangan pasangan.", tips: "Kamu dan pasanganmu akan hidup harmonis jika menikah."),
        DatabaseEightCycle(result: "Topo", interpretation: "Bagaikan berlayar di lautan yang gelap, kamu dan pasanganmu dipercaya akan mendapat banyak masalah di kehidupan awal rumah tanggamu, seperti permasalahan ekonomi. Namun jika kamu dan pasanganmu dapat bertahan dan melalui masalah itu, maka seiring dengan berjalannya waktu rumah tanggamu akan baik-baik saja dan harmonis.", tips: "Kamu dan pasanganmu harus tau menyikapi setiap masalah yang mungkin muncul dalam rumah tangga."),
        DatabaseEightCycle(result: "Tinari", interpretation: "Bagai bunga yang tumbuh subur, kamu dan pasanganmu dipercaya akan hidup bahagia dan kondisi keuangan rumah tangga kalian akan berkecukupan dan hidup yang kalian dijalani akan selalu diselimuti dengan keberuntungan.", tips: "Kamu dan pasanganmu akan diselimuti keberuntungan jika menikah."),
        DatabaseEightCycle(result: "Padu", interpretation: "Bagaikan perang tanpa henti, kamu dan pasanganmu dipercaya akan sering mengalami masalah pertengkaran dalam kehidupan rumah tanggamu karena masalah sepele dan terdapat kemungkinan untuk berpisah.", tips: "Kamu dan pasanganmu perlu menetapkan hari baik untuk menikah."),
        DatabaseEightCycle(result: "Sujanan", interpretation: "Bagai sebuah gelombang yang menghantam pantai, kamu dan pasanganmu nanti dipercaya akan menghadapi kehidupan yang akan diselimuti dengan perselingkuhan maupun suatu pertengkaran yang disebabkan karena pihak laki-laki maupun pihak perempuan yang berselingkuh.", tips: "Kamu dan pasanganmu tidak boleh melanjutkan ke jenjang pernikahan karena dipercaya rumah tanggamu akan berakhir.")
    ]
    
    func getDayValue(for date: Date) -> Int {
        let day = Calendar.current.component(.weekday, from: date)
        let weekday = Calendar.current.weekdaySymbols[day - 1]
        return dayValue[weekday] ?? 0
    }
    
    func getJavaDay(for date: Date) -> String {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day, .month, .year], from: date)
        let referenceDate = dateFormatter.date(from: "1900-01-01")!
        let daysSinceReference = calendar.dateComponents([.day], from: referenceDate, to: date).day ?? 0
        
        let javaDayIndex = daysSinceReference % javaDay.count
        return javaDay[javaDayIndex]
    }
    
    func getJavaDayValue(for javaDay: String) -> Int {
        return javaDayValue[javaDay] ?? 0
    }
    
    func getWetonMan() -> Int {
        return getDayValue(for: dateMan) + getJavaDayValue(for: getJavaDay(for: dateMan))
    }
    
    func getWetonWoman() -> Int {
        return getDayValue(for: dateWoman) + getJavaDayValue(for: getJavaDay(for: dateWoman))
    }
    
    func getTotalWeton() -> Int {
        return getWetonMan() + getWetonWoman()
    }
    
    func getFiveCycles() -> DatabaseFiveCycle {
        let index = getTotalWeton() % 5
        return fiveCycles[index]
    }
    
    func getSevenCycles() -> DatabaseSevenCycle {
        let index = getTotalWeton() % 7
        return sevenCycles[index]
    }
    
    func getEightCycles() -> DatabaseEightCycle {
        let index = getTotalWeton() % 8
        return eightCycles[index]
    }
    
}
