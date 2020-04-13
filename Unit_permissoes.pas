unit Unit_permissoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Buttons, Grids, DBGrids;

type
  TForm_permissoes = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    cb_funcoes: TComboBox;
    btn_inserir: TBitBtn;
    btn_retirar: TBitBtn;
    btn_fechar: TBitBtn;
    adoquery_permissoes: TADOQuery;
    adoquery_aux: TADOQuery;
    ds_permissoes: TDataSource;
    grid_permissoes: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure cb_funcoesEnter(Sender: TObject);
    procedure btn_inserirClick(Sender: TObject);
    procedure btn_retirarClick(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     usuario : string;
  end;

var
  Form_permissoes: TForm_permissoes;


implementation

uses Unit_logon;

{$R *.dfm}

procedure TForm_permissoes.FormShow(Sender: TObject);
begin
  adoquery_permissoes.SQL.Text:= 'SELECT FUNCOES.NOME '+
                                  'FROM FUNCOES INNER JOIN PERMISSOES ON '+
                                  'FUNCOES.COD_FUNCAO = PERMISSOES.COD_FUNCAO ' +
                                  'WHERE PERMISSOES.USUARIO = ' +QuotedStr(usuario) +
                                  'ORDER BY FUNCOES.NOME';
  adoquery_permissoes.Open;
end;

procedure TForm_permissoes.cb_funcoesEnter(Sender: TObject);
begin
  cb_funcoes.Clear;
  adoquery_aux.SQL.Text:= 'SELECT NOME FROM FUNCOES ' +
                          'WHERE COD_FUNCAO NOT IN ' +
                          '(SELECT COD_FUNCAO FROM PERMISSOES ' +
                          ' WHERE USUARIO = ' + QuotedStr(usuario) + ')' +
                          'ORDER BY NOME';
  adoquery_aux.Open;
  while not adoquery_aux.Eof do
  begin
    cb_funcoes.Items.Add(adoquery_aux.fieldbyname('NOME').AsString);
    adoquery_aux.Next;
  end;
  adoquery_aux.Close;  
end;

procedure TForm_permissoes.btn_inserirClick(Sender: TObject);
var
cod_funcao : string;
begin
  adoquery_aux.SQL.Text := 'SELECT COD_FUNCAO FROM FUNCOES '+
                            'WHERE NOME = ' + QuotedStr(cb_funcoes.Text);
  adoquery_aux.Open;
  cod_funcao := adoquery_aux.fieldbyname('COD_FUNCAO').AsString;
  adoquery_aux.Close;

  adoquery_aux.SQL.Text:= 'INSERT INTO PERMISSOES VALUES '+
                            '('+QuotedStr(cod_funcao) +
                            ','+QuotedStr(usuario) + ')';
  Form_logon.ConexaoBD.BeginTrans;
  adoquery_aux.ExecSQL;
  Form_logon.ConexaoBD.CommitTrans;

  adoquery_permissoes.Close;
  adoquery_permissoes.Open;
  cb_funcoes.Clear;

end;

procedure TForm_permissoes.btn_retirarClick(Sender: TObject);
var cod_funcao, nome : string;
begin
  nome := adoquery_permissoes.fieldbyname('NOME').AsString;
  adoquery_aux.sql.Text:= 'SELECT COD_FUNCAO FROM FUNCOES '+
                            'WHERE NOME = ' + QuotedStr(nome);
  adoquery_aux.Open;
  cod_funcao:= adoquery_aux.fieldbyname('COD_FUNCAO').AsString;
  adoquery_aux.Close;

  adoquery_aux.SQL.Text:= 'DELETE FROM PERMISSOES ' +
                          'WHERE COD_FUNCAO =' + QuotedStr(cod_funcao) +
                          'AND USUARIO =' +QuotedStr(usuario);
  Form_logon.ConexaoBD.BeginTrans;
  adoquery_aux.ExecSQL;
  Form_logon.ConexaoBD.CommitTrans;

  adoquery_permissoes.Close;
  adoquery_permissoes.Open;
end;

procedure TForm_permissoes.btn_fecharClick(Sender: TObject);
begin
Close;
end;

end.
