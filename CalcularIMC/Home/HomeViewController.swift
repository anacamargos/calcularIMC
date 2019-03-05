//
//  HomeViewController.swift
//  CalcularIMC
//
//  Created by Ana Leticia Camargos on 05/03/19.
//  Copyright © 2019 Ana Leticia Camargos. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - IBOutlets

    @IBOutlet weak var textFieldNomeCompleto: UITextField!
    @IBOutlet weak var textFieldAltura: UITextField!
    @IBOutlet weak var textFieldPeso: UITextField!
    @IBOutlet weak var textFieldIdade: UITextField!
    
    // MARK: - Variáveis
    
    var valorImc : Float = 0.0;
    var nomeCompleto : String = "";
    var idade: Float = 0.0;
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    // MARK: - Metodos
    
    func exibirAlerta() {
        let alerta = UIAlertController(title: "Atenção", message: "Favor preencher todos os campos", preferredStyle: .alert)
        let button = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alerta.addAction(button)
        self.present(alerta, animated: true, completion: nil)
    }
    
    // MARK: - IBActions
    

    @IBAction func calcularIMC(_ sender: UIButton) {
        
        guard let sNomeCompleto = textFieldNomeCompleto.text, self.textFieldNomeCompleto.text?.isEmpty == false else {
            exibirAlerta()
            return
        }
        guard let sAltura = textFieldAltura.text, self.textFieldAltura.text?.isEmpty == false else {
            exibirAlerta()
            return
        }
        guard let sPeso = textFieldPeso.text, self.textFieldPeso.text?.isEmpty == false else {
            exibirAlerta()
            return
        }
        guard let sIdade = textFieldIdade.text, self.textFieldIdade.text?.isEmpty == false else {
            exibirAlerta()
            return
        }
        
        //Convertendo os valores dos campos para realizar o calculo
        let alturaFloat = (sAltura as NSString).floatValue;
        let pesoFloat = (sPeso as NSString).floatValue;
        let idadeFloat = (sIdade as NSString).floatValue;
        
        idade = idadeFloat
        nomeCompleto = sNomeCompleto
        valorImc = (pesoFloat / (alturaFloat*alturaFloat));
        
        self.performSegue(withIdentifier: "showResults", sender: nil)
        
    
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResults" {
            let telaResultados = segue.destination as? ResultadoViewController
            telaResultados?.nomeCompleto = self.nomeCompleto
            telaResultados?.resultadoIMC = self.valorImc
            telaResultados?.idade = self.idade
        }
    }
    
    @IBAction func limparCampos(_ sender: UIButton) {
        textFieldNomeCompleto.text = ""
        textFieldAltura.text = ""
        textFieldPeso.text = ""
        textFieldIdade.text = ""
    }
    
}
