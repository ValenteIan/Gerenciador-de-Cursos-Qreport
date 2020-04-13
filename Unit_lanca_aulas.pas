unit Unit_lanca_aulas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Buttons, ComCtrls;

type
  TForm_lanca_aulas = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edt_turma: TEdit;
    dt_aula: TDateTimePicker;
    btn_lancar: TBitBtn;
    btn_cancelar: TBitBtn;
    btn_turma: TBitBtn;
    adoquery_aux: TADOQuery;
    procedure FormShow(Sender: TObject);
    procedure btn_turmaClick(Sender: TObject);
    procedure btn_lancarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_lanca_aulas: TForm_lanca_aulas;

implementation

uses Unit_pesquisa_turmas, Unit_logon;

{$R *.dfm}

procedure TForm_lanca_aulas.FormShow(Sender: TObject);
begin
  edt_turma.Clear;
  dt_aula.Date := Date;
end;

procedure TForm_lanca_aulas.btn_turmaClick(Sender: TObject);
begin
  edt_turma.Clear;
  Form_pesquisa_turmas.ShowModal;

  if Form_pesquisa_turmas.chave <> '' then
    edt_turma.Text := Form_pesquisa_turmas.chave;
end;

procedure TForm_lanca_aulas.btn_lancarClick(Sender: TObject);
var
data_aula : string;
deu_erro : boolean;
begin
  if edt_turma.Text = '' then
    showmessage('Informe a turma!')
  else if dt_aula.Date > date then
    showmessage('N�o � permitido lan�ar aulas antecipadamente!')
  else
    begin
      data_aula:=FormatDateTime('mm/dd/yyyy', dt_aula.Date);

      adoquery_aux.SQL.Text := 'INSERT INTO AULAS VALUES '+
                                '('+ QuotedStr(edt_turma.Text) +
                                ','+QuotedStr(data_aula) +
                                ','+QuotedStr('N') + ')';
      Form_logon.ConexaoBD.BeginTrans;
      try
        adoquery_aux.ExecSQL;
        deu_erro := false;
      except
        on E:Exception do
        begin
          deu_erro:=true;
        if Form_logon.ErroBD(E.Message, 'PK_Aulas') = 'Sim' then
          showmessage('Aula j� lan�ada!')
        else
          showmessage('Ocorreu o seguinte erro: '+e.Message);
        end;
      end;
      if deu_erro = true then
        Form_logon.ConexaoBD.RollbackTrans
      else
        begin
          Form_logon.ConexaoBD.CommitTrans;
          ShowMessage('Aula lan�ada com sucesso!');
          edt_turma.Clear;
          dt_aula.Date := Date;
        end;
    end;
  end;

procedure TForm_lanca_aulas.btn_cancelarClick(Sender: TObject);
begin
close;
end;

end.
