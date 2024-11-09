#!/usr/bin/perl
use strict;
use warnings;
use CGI;
use CGI::Carp qw(fatalsToBrowser); 

my $cgi =CGI->new;
$cgi->charset('UTF-8');
print $cgi->header;
print <<HTML;
<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../css/estilos.css">
    <title>Consulta Universidades Licenciadas</title>
  </head>
  <body>
    <div class="ResultadoDebusqueda">
      <div class="TituloDeLaPagina">
        <b>Resultados de la búsqueda</b>
    </div>
      <div class="TablaDeResultados">
HTML
#Recibimos  los parametros del formulario
my $palabraBusqueda=$cgi->param('palabraBusqueda');
my $campoABuscar=$cgi->param('campoABuscar');

#Abrimos el documento CSV
open (my $miArchivo,"<","PogramasdeUniversidades.cvs");





my $SeEncontro=0;
 

while (my $filaUniversidad = <$miArchivo>) {

my @camposDelArchivo=split(/\|/,$filaUniversidad);
 if ($campoABuscar eq 'nombre_universidad' && uc($camposDelArchivo[1]) =~ /\Q$palabraBusqueda\E/i) {
        imprimir_fila(\@camposDelArchivo);
        $SeEncontro = 1;}
  elsif ($campoABuscar eq 'periodo' && $camposDelArchivo[4] =~ /\Q$palabraBusqueda\E/) {
        imprimir_fila(\@camposDelArchivo);
        $SeEncontro = 1;
    } elsif ($campoABuscar eq 'departamento_local' && uc($camposDelArchivo[10]) =~ /\Q$palabraBusqueda\E/i) {
        imprimir_fila(\@camposDelArchivo);
        $SeEncontro = 1;
    } elsif ($campoABuscar eq 'denominacion_programa' && uc($camposDelArchivo[16]) =~ /\Q$palabraBusqueda\E/i) {
        imprimir_fila(\@camposDelArchivo);
        $SeEncontro = 1;
    }
}


close($miArchivo);
if(!$SeEncontro)

{
print "<p>No se encontro la busqueda.</p>\n"
}
print <<HTML;
      </div>
    <div class="RetrocederAlBuscador">
    <a href="../index.html">Volver a buscar</a>
</div>

    </div>
  </body>
</html>
HTML
sub imprimir_fila{
  my($campos)=@_;
  
}