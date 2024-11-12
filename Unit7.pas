unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CheckLst;

type
  TForm7 = class(TForm)
    Button1: TButton;
    ListBox1: TListBox;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation
uses Unit1;
{$R *.dfm}

procedure TForm7.Button1Click(Sender: TObject);
var
i:integer;
begin
for i:=0 to ListBox1.Count-1 do
begin
if ListBox1.Selected[i] then
begin
Form1.TheListFill(ExtractFilePath(ParamStr(0))+'Plugins\'+ListBox1.Items[i]);
HighLightFileName:=ExtractFilePath(ParamStr(0))+'Plugins\'+ListBox1.Items[i];
end;
end;
Close;
end;

procedure TForm7.FormShow(Sender: TObject);
begin
if Form1.FindHighLight('a') then
begin
ListBox1.Clear;
ListBox1.Items.AddStrings(HighLightFileMas);
end;
end;

procedure TForm7.FormCreate(Sender: TObject);
begin
if FileExists('Text.ini') then
Form1.Init;
end;

end.