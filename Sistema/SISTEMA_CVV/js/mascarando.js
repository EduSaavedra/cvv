var trava = false;
var iCount1, iCount2, iCount, iTexto, nChar;
function MaskDown(e) {
    if(trava == false) {
        iTexto = e.value;
        iCount1 = e.value.length;
        trava = true;
    }
}

function MaskUp(e,evt,msc) {
    iCount2 = e.value.length;
    var key_code = evt.keyCode ? evt.keyCode : evt.charCode ? evt.charCode : evt.which ? evt.which : void 0;
    if (key_code == 9) {
        iCount1 = iCount2-1;
        e.select;
                
    } else {
        if (iCount2 > iCount1) {
            e.value = e.value.substr(0,iCount1+1);
            if(e.value.length > msc.length) {
                e.value = e.value.substr(0,msc.length);
            }
            if(iCount1 == 0) {
                if (msc.substring(iCount1,iCount1+1) != "#") {
                    nChar=1;
                    while (msc.substring(iCount1+nChar,iCount1+nChar+1) != "#" && nChar <= msc.length) {
                        nChar++;        
                    }
                    e.value = msc.substring(0,iCount1+nChar) + e.value.substr(0,iCount1+1);
                } 
            } else {
                if (msc.substring(iCount1+1,iCount1+2) != "#") {
                    var nChar=1;
                    while (msc.substring(iCount1+nChar,iCount1+nChar+1) != "#" && nChar <= msc.length) {
                        nChar++;        
                    }
                    e.value = e.value.substr(0,iCount1+1) + msc.substring(iCount1+1,iCount1+nChar);
                }
            }
        } else if (iCount2 == iCount1) {
            e.value = e.value;
        } else {        
            if (msc.substr(iCount2,1) != "#") {     

                nChar = 1;
                while (msc.substr(iCount1-nChar,1) != "#" && nChar <= iCount1) {
                    nChar++;        
                }
                e.value = iTexto.substr(0,iCount2-nChar+1);
            }

        }
        trava = false;
    }
}
</script>


/*Telefone: <input type="text" id="t1" onkeydown="MaskDown(this)" onkeyup="MaskUp(this,event,'(##) ####-####')"> (##) ####-####
<br>Data: <input type="text" id="t2" onkeydown="MaskDown(this)" onkeyup="MaskUp(this,event,'##/##/####')"> ##/##/####
<br>CEP: <input type="text" id="t3" onkeydown="MaskDown(this)" onkeyup="MaskUp(this,event,'#####-###')"> #####-###
<br>CPF: <input type="text" id="t4" onkeydown="MaskDown(this)" onkeyup="MaskUp(this,event,'###.###.###-##')"> ###.###.###-##
<br>CNPJ: <input type="text" id="t5" onkeydown="MaskDown(this)" onkeyup="MaskUp(this,event,'##.###.###/####-##')"> ##.###.###/####-##
<br>Placas de automóveis: <input type="text" id="t6" onkeydown="MaskDown(this)" onkeyup="MaskUp(this,event,'### ####')"> ### #####

<br><br>Aleatório 1: <input type="text" id="t7" onkeydown="MaskDown(this)" onkeyup="MaskUp(this,event,'|$-%  *& «##» .:. «##» (###) %-$|')" size="40"> |$-%  *& «##» .:. «##» (###) %-$|

<br><br>Aleatório 2: <input type="text" id="t8" onkeydown="MaskDown(this)" onkeyup="MaskUp(this,event,'<--| ##.### |-->')" size="40"> <--| ##.### |-->

<br /><br /><br /><br />Características principais:
    <br />1. Filtro para evitar teclas de aderência;
<br />2. Flexibilidade para qualquer tipo de máscara, com qualquer tipo de caractere especial;
<br />3. Permite correção inteligente quando BACKSPACE for pressionado;
<br />4. Permite o uso de símbolos especiais em sequência, inclusive com espaço;
<br />5. Controlam a quantidade de símbolos na máscara, não havendo necessidade de inserir o "maxlength" em cada um dos campos de texto que forem criados (o "maxlength" pode ser usado a critério do desenvolvedor).
<br />6. Código-fonte reaproveitável para qualquer campo texto do formulário.
</body>
</html>*/