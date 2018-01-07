unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

function traite_chaine(s : string) : string;
// Supprime les accents
var t : string;
begin
t:=s;
t:=ansilowercase(t);
t:=stringreplace(t,'é','e',[rfreplaceall]);
t:=stringreplace(t,'è','e',[rfreplaceall]);
t:=stringreplace(t,'ê','e',[rfreplaceall]);
t:=stringreplace(t,'ë','e',[rfreplaceall]);
t:=stringreplace(t,'à','a',[rfreplaceall]);
t:=stringreplace(t,'â','a',[rfreplaceall]);
t:=stringreplace(t,'ç','c',[rfreplaceall]);
t:=stringreplace(t,'ù','u',[rfreplaceall]);
t:=stringreplace(t,'û','u',[rfreplaceall]);
t:=stringreplace(t,'î','i',[rfreplaceall]);
t:=stringreplace(t,'ô','o',[rfreplaceall]);
t:=stringreplace(t,'''',' ',[rfreplaceall]);
traite_chaine:=t;
end;

function id(s : string) : string;
// Remplace #32 par underscore
begin
id:=stringreplace(s,' ','_',[rfreplaceall]);
end;

function nom(s : string) : string;
// Remplace #32 par ,
begin
nom:=stringreplace(s,' ',',',[rfreplaceall]);
end;

function prix(s : string) : string;
// Remplace , par .
begin
prix:=stringreplace(s,',','.',[rfreplaceall]);
end;

function split(s : string) : string;
// --------------------------------------------------------
// s contient une liste de mots
// retourne une liste de listes de 40 mots maximum du type
// [['test','unitaire',...],['debut','ligne2',...]
// --------------------------------------------------------
const MAXL=40;
var origine, resultat, t : string;
    i, longueur : integer;
begin
origine:=s;
longueur:=0;
resultat:='[[''';
while length(origine)>0  do begin
  i:=pos(' ',origine);
  if i=0 then begin
      //reste juste un mot
      t:=copy(origine,1,length(origine));
      origine:='';
      end else begin
      t:=copy(origine,1,i-1);
      origine:=copy(origine,i+1,length(origine)-i);
      end;
  //t contient le 1er mot, origine = origine -t
  if longueur>MAXL then begin
      resultat:=copy(resultat,1,length(resultat)-1);
      resultat:=resultat+'''],['''+t+' ';
      longueur:=0;
      end else begin
      resultat:=resultat+t+' ';
      longueur:=longueur+length(t);
      end;
  end;
resultat:=copy(resultat,1,length(resultat)-1);
resultat:=resultat+''']]';
split:=resultat;
end;



procedure TForm2.Button1Click(Sender: TObject);
//nom, region, annee, couleur, prix, origine, cepage, elevage,
//    description, consomax, degre, accompagnement, nez, bouche : string;
//
// fichier = xls, prolog = fichier prolog
// memo1 affiche les prédicats
var fichier, prolog : textfile;
    s : string;
    tab : array[1..50,1..14] of string;
    lg, col, a : integer;
begin
assignfile(fichier ,'F:\UNAMUR\Master jour\TIA\Vin\db vins.csv');
reset(fichier);

// init tableau
for lg:=1 to 50 do for col:=1 to 14 do tab[lg,col]:='';

// Remplissage du tableau
readln(fichier,s); //1ère ligne
lg:=0;
while not eof(fichier) do begin
  lg:=lg+1;
  readln(fichier,s);
  //memo1.Lines[0]:=s;
  for col:=1 to 14 do begin
     if col=14 then tab[lg,col]:=s else begin
          a:=pos(';',s);
          tab[lg,col]:=copy(s,1,a-1);
          s:=copy(s,a+1,length(s)-a);
          end;
     tab[lg,col]:=traite_chaine(tab[lg,col]);
     memo1.Lines.Add(inttostr(col)+' : '+tab[lg,col]);
     end;
  memo1.Lines.Add('--------------');
  end;
closefile(fichier);

// création fichier prolog
assignfile(prolog,'F:\UNAMUR\Master jour\TIA\Vin\prolog_data.pl');
rewrite(prolog);
for col:=1 to 14 do begin
    for lg:=1 to strtoint(edit1.Text) do begin
         if tab[lg,col]<>'' then begin
            case col of
                1 : writeln(prolog,'nom('+id(tab[lg,1])+',['+nom(tab[lg,col])+']).');
                2 : writeln(prolog,'region('+id(tab[lg,1])+','+tab[lg,col]+').');
                3 : writeln(prolog,'annee('+id(tab[lg,1])+','+tab[lg,col]+').');
                4 : writeln(prolog,'couleur('+id(tab[lg,1])+','+tab[lg,col]+').');
                5 : writeln(prolog,'prix('+id(tab[lg,1])+','+prix(tab[lg,col])+').');
                6 : writeln(prolog,'origine('+id(tab[lg,1])+','+split(tab[lg,col])+').');

                7 : writeln(prolog,'cepage('+id(tab[lg,1])+','+split(tab[lg,col])+').');
                8 : writeln(prolog,'elevage('+id(tab[lg,1])+','+split(tab[lg,col])+').');
                9 : writeln(prolog,'description('+id(tab[lg,1])+','+split(tab[lg,col])+').');

                10 : writeln(prolog,'consommation('+id(tab[lg,1])+','+tab[lg,col]+').');
                11 : writeln(prolog,'temperature('+id(tab[lg,1])+','+tab[lg,col]+').');

                12 : //accompagnement
                     begin
                     tab[lg,col]:=tab[lg,col]+',';
                     repeat
                        a:=pos(',',tab[lg,col]);
                        s:=copy(tab[lg,col],1,a-1);
                        if s[1]=' ' then delete(s,1,1);
                        if s[length(s)]=' ' then delete(s,length(s),1);
                        if pos(' ',s)>1 then s:=''''+s+'''';
                        
                        
                        writeln(prolog,'accompagnement('+id(tab[lg,1])+','+s+').');
                        delete(tab[lg,col],1,a);
                     until tab[lg,col]='';
                     end;
                13 : writeln(prolog,'nez('+id(tab[lg,1])+','+split(tab[lg,col])+').');
                14 : writeln(prolog,'bouche('+id(tab[lg,1])+','+split(tab[lg,col])+').');
                end;
            end;
          end;
       writeln(prolog);
    end;

closefile(prolog);
end;

end.
