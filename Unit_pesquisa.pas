unit Unit_pesquisa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB, ADODB;

type
  TForm_pesquisa = class(TForm)
    Label1: TLabel;
    edt_nome: TEdit;
    grid_pesquisa: TDBGrid;
    btn_pesquisar: TBitBtn;
    btn_limpar: TBitBtn;
    btn_selecionar: TBitBtn;
    btn_cancelar: TBitBtn;
    adoquery_pesquisa: TADOQuery;
    ds_pesquisa: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure btn_pesquisarClick(Sender: TObject);
    procedure btn_selecionarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_limparClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    chave,chave_aux, sql_pesquisa : string;
  end;

var
  Form_pesquisa: TForm_pesquisa;

implementation

uses Unit_logon;

{$R *.dfm}

procedure TForm_pesquisa.FormShow(Sender: TObject);
begin
  edt_nome.Clear;
  chave:='';
end;

procedure TForm_pesquisa.btn_pesquisarClick(Sender: TObject);
begin
  if edt_nome.Text = '' then
    ShowMessage('Digite um nome na pesquisa!')
  else if sql_pesquisa = '' then
    ShowMessage('Impossível pesquisar!')
  else
    begin
      adoquery_pesquisa.Close;
      adoquery_pesquisa.SQL.Text:=sql_pesquisa + 'WHERE NOME LIKE ' + QuotedStr(edt_nome.Text);
      adoquery_pesquisa.Open;
    end;
end;


procedure TForm_pesquisa.btn_selecionarClick(Sender: TObject);
begin
  if adoquery_pesquisa.Active = false then
    ShowMessage('Impossivel selecionar!')
  else
  begin
    chave:=adoquery_pesquisa.Fields.Fields[0].AsString;
    chave_aux:=adoquery_pesquisa.Fields.Fields[1].AsString;
    adoquery_pesquisa.Close;
    Close;
  end;
end;

procedure TForm_pesquisa.btn_cancelarClick(Sender: TObject);
begin
  chave := '';
  adoquery_pesquisa.Close;
  Close;
end;

procedure TForm_pesquisa.btn_limparClick(Sender: TObject);
begin
 chave:='';
 edt_nome.Clear;
 adoquery_pesquisa.Close;
end;

procedure TForm_pesquisa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  adoquery_pesquisa.Close;
end;

end.
