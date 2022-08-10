//
//  ViewController.swift
//  BuscaCEP
//
//  Created by Maysa on 08/08/22.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    var enderecos: [String] = []
    
    @IBOutlet weak var tfCep: UITextField!
    
    @IBOutlet weak var lbLogradouro: UILabel!

    @IBOutlet weak var lbDdd: UILabel!
    
    @IBOutlet weak var lbLocalidade: UILabel!
    
    @IBOutlet weak var myButton: UIButton!
    
    @IBOutlet weak var myView: UIView!
    
    @IBOutlet weak var endSalvosBtn: UIButton!
    
    @IBOutlet weak var salvarEndBtn: UIButton!
    
    
    @IBOutlet weak var myMapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.myView.layer.cornerRadius = 15
        self.myButton.layer.cornerRadius = 10
        self.endSalvosBtn.layer.cornerRadius = 10
        self.salvarEndBtn.layer.cornerRadius = 10
        self.myMapView.layer.borderWidth = 1.0
        
    }

    @IBAction func btPesquisar(_ sender: UIButton) {
        APIViaCep.pesquisarCEP(tfCep.text!) { [self] (cep) in
            DispatchQueue.main.sync {
                self.lbLogradouro.text = (cep.logradouro)
                self.lbLocalidade.text = "Localidade/UF: \(cep.localidade)/\(cep.uf)"
                self.lbDdd.text = "DDD: \(cep.ddd)"
                
                let searchRequest = MKLocalSearch.Request()
                searchRequest.naturalLanguageQuery = lbLogradouro.text!
                
                let activeSearch = MKLocalSearch(request: searchRequest)
                
                activeSearch.start { [self] (response, error) in
                    if response == nil
                    {
                        print("ERROR")
                    }
                    else
                    {
                    //remover anotações do mapa
                        let annotations = self.myMapView.annotations
                        self.myMapView.removeAnnotations(annotations)
                        
                    //obtendo dados
                        let latitude = response?.boundingRegion.center.latitude
                        let longitude = response?.boundingRegion.center.longitude
                    //criar anotação
                        let annotation = MKPointAnnotation()
                        annotation.title = lbLogradouro.text!
                        annotation.coordinate = CLLocationCoordinate2DMake(latitude!, longitude!)
                        self.myMapView.addAnnotation(annotation)
                        
                        //zoom na anotação
                        let coordinate: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude!, longitude!)
                        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
                        let region = MKCoordinateRegion(center: coordinate, span: span)
                        self.myMapView.setRegion(region, animated: true)
                        
                    }
                    
                }
                
            }
        }
        
     
        
    }
    
    @IBAction func actionSalvosBtn(_ sender: UIButton) {
        
        performSegue(withIdentifier: "enderecoSalvos", sender: self)
    }
    
    @IBAction func actionSalvarEnd(_ sender: Any) {
        
        self.enderecos.append("\(lbLogradouro.text!), CEP: \(tfCep.text!)")
       
        UserDefaults.standard.set(self.enderecos, forKey: "endereco")
        
        UserDefaults.standard.synchronize()
        
       
        tfCep.text = ""
        
 
        }
        
    }
    
    
    


