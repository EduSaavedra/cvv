function cont(){
    var conteudo = document.getElementById('ContentPlaceHolder1_tabVacinas').innerHTML;
    tela_impressao = window.open('about:blank');
    tela_impressao.document.write(conteudo);
    tela_impressao.window.print();
    tela_impressao.window.close();
}
function imprime(){
    var conteudo = document.getElementById('ContentPlaceHolder1_tabVacinas').innerHTML,
	tela_impressao = window.open('about:blank');
	tela_impressao.document.write(conteudo);
	tela_impressao.document.write("<link rel=\"stylesheet\" href=\"../css/imprime.css\" type=\"text/css\" media=\"print\"/>");
	tela_impressao.window.print();
	tela_impressao.window.close();
}

function PrintElem(elem)
{
    var mywindow = window.open('', 'PRINT', 'height=400,width=600');

    mywindow.document.write('<html><head><title>' + document.title  + '</title>');
    mywindow.document.write('</head><body >');
    mywindow.document.write('<h1>' + document.title  + '</h1>');
    mywindow.document.write(document.getElementById(elem).innerHTML);
    mywindow.document.write('</body></html>');

    mywindow.document.close(); // necessary for IE >= 10
    mywindow.focus(); // necessary for IE >= 10*/

    mywindow.print();
    mywindow.close();

    return true;
}

function printDiv(divName) {
    var printContents = document.getElementById(divName).innerHTML;
    var originalContents = document.body.innerHTML;

    document.body.innerHTML = printContents;
    window.print();
    document.body.innerHTML = originalContents;
}