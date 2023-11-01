//
//  ViewController.swift
//  KisilerApp_CRUD_Operation
//
//  Created by Alptuğ Ağca on 26.10.2023.
//

import UIKit

class HomePage: UIViewController  {
    //UISearchBarDelegete protokol olarak sayfamıza bağladık. Verileri bu protokol sayesinde çekiyoruz.
    
    @IBOutlet weak var searchBar: UISearchBar! //SearchBar kodumuza tanımladık
    
    @IBOutlet weak var kisilerTableView: UITableView! //TableView Homepage clasında oluşturduk ve bağladık
    
    var kisilerListesi = [User]() //Nesneleri gösterebileceğim bir array ihtiyacım var çünkü listelemem gerekiyor.

    override func viewDidLoad()
    {
        super.viewDidLoad()
        searchBar.delegate = self
        //Protokoldeki tasarımdaki searchBar bağladık. Protokoldeki searchBar delegate. Bu sayede aşağıdaki searchBar fonksiyonu çalışabilir.
        kisilerTableView.delegate = self
        kisilerTableView.dataSource = self
        
        let k1 = User(kisi_id: 1, kisi_ad: "Ahmer", kisi_tel: "5319999")
        let k2 = User(kisi_id: 2, kisi_ad: "Alp", kisi_tel: "123")
        let k3 = User(kisi_id: 3, kisi_ad: "Leyla", kisi_tel: "44444")
        
        kisilerListesi.append(k1)
        kisilerListesi.append(k2)
        kisilerListesi.append(k3)
        
        

    }
    override func viewWillAppear(_ animated :  Bool) //Burada her sayfa tekrar görüldüğünde anlamı var.
    {
        print("Anasayfa dönüldü.")
    }

    
    
   
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toDetail"
        {
            if let us = sender as? User{ //Burada down casting yapmamızın sebebi performSegueden gelen nesne bilgisi prepare methodun any gireceği için ve tür bu olduğundna dolayı bunu user olarak dönüştürmem gerekiyor.
                let gidilecekVC = segue.destination as! UserDetailPage //Gidilecek viewController ekliyoruz ve ünlemli yapmamızın sebebi buradaki destiantion bilgisinin kesin gideceğinden dolayı.
                gidilecekVC.us = us
            }
        }
        
    }
    
    
}

extension HomePage : UISearchBarDelegate{ //Burada aslında kodta tanımlamadık her Protokolü class yanına yazıp spagetti olmasın diye burada extension kullanarak hangi protokolü kullanıp methodlarına erişeceksek kullanıyoruz ve class dışarısında aslında ayrı bir extra class oluşturarak methodlarına erişip daha modular yazabiliyoruz.Ama bu methodu protokolle kullanıp view içerisinde kullanabilmek için viewDidLoad içerisine yazmamız gerekiyor.
 
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Kişi Ara : \(searchText)") //Buradaki fonksiyon ne yazarsak veya sildiğimizde bize sonuç verecek.
    }
}



extension HomePage : UITableViewDelegate , UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { //Sıralayan fonksiyon
        return kisilerListesi.count //Burada tableview da kaç satır olacak onu kodluyoruz ve burada kisiler listesi arayımda kac elemena varsa onun sayısı kadar oluştur dedik.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { //return type olarak UITableViewCell istiyor. Bu methodta hücreleri neye göre sıralayacağını belirleyeceğin fonksiyon.
        
        let kisi = kisilerListesi[indexPath.row] //Burada kisilerListesi içerisindeki index yoluna göre satırları sırala dedim.
        
        let hucre = tableView.dequeueReusableCell(withIdentifier: "kisilerHucre") as! KisilerHucre //Burada tableView UI element içerisindeki ıd si kisilerHucre olan değere ulaşarak downCasting yaptıkm KisilerHucre class gibi davran dedik. ve hucreye eşitledik. Ve artık bu hücreye ve içindeki UI elementlere erişebiliyoruz.
        
        hucre.labelKisiAd.text = kisi.kisi_ad
        hucre.labelKisiTel.text = kisi.kisi_tel
        return hucre
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { //Tableview için secim yapılan method.
        
        let kisi = kisilerListesi[indexPath.row] //Burada kisilerListesi içerisindeki index yoluna göre satırları sırala dedim.
        performSegue(withIdentifier: "toDetail", sender: kisi) //Burda performsegue ile kisi nesnesini gönderecek.
        
        tableView.deselectRow(at: indexPath, animated: true) //Buradaki animasyonda seçilip detay sayfasına gidildiğinde dönüşte tekrar seçili gözükmesin methodu. tableView içerisinden bu methodu bulabilirsin.
        
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? { //Bu fonksiyon kaydırılınca yapılacak işlemler soldan kaydırma leading sağdan kaydırma trailing deniyor.
        let silAction = UIContextualAction(style: .destructive, title: "Sil"){contextualAction,view,bool in //Burada sil aksiyonunu belirledik sola kaydırınca kullanıcı sil alanı çıkacak.
            let kisi = self.kisilerListesi[indexPath.row]//Clossure içerisinde array çağırırken self kullanman gerekir.
            
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(kisi.kisi_ad!) silinsin mi ? ", preferredStyle: .alert) //Burada sil action yapıldıktan sonra biz alert oluşturduk. Sil tıklanınca alert açılacak.
            
            let iptalAction = UIAlertAction(title: "İPTAL", style: .cancel) //iptal actionda tıklanınca alert kapanacağı için clousure oluşturmadık.
            alert.addAction(iptalAction)//action eklendi
            
            let evetAction = UIAlertAction(title: "EVET", style: .destructive){_ in//closure ile evet action belirledik çünkü bunun içerisinde kişiyi sileceğimiz bir yapı oluşturduk. Fakat action eklenirken clousure içerisine eklenmicek dışına addAction methodu kullanarak eklenecek.
                
                print("Kişi Sil : \(kisi.kisi_id!)")
            }
            alert.addAction(evetAction)//action eklendi.
            
            self.present(alert, animated: true) //Bu alert gözüksün diye self.present kullandık.
            
        }
        return UISwipeActionsConfiguration(actions: [silAction]) //Burada return olarak UISwipeActionsConfiguration döndürdük ama içerisine action ekledik.
        
    }
    
    
}
