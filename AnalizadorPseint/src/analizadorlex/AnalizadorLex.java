/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package analizadorlex;

import java.io.File;

/**
 *
 * @author Dany
 */
public class AnalizadorLex {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        String path = "C:/Users/Dany/Documents/NetBeansProjects/AnalizadorLex/src/analizadorlex/parametros.flex";
        generarLexer(path);

    }
    public static void generarLexer(String path){
        File file=new File(path);
        jflex.Main.generate(file);
    }
    
}
