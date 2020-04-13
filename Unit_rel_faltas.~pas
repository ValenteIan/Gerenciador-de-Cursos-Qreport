unit Unit_rel_faltas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RpCon, RpConDS, RpDefine, RpRave, DB, ADODB, StdCtrls, Buttons;

type
  TForm_rel_faltas = class(TForm)
    Label1: TLabel;
    edt_turma: TEdit;
    btn_ok: TBitBtn;
    btn_fechar: TBitBtn;
    btn_turma: TBitBtn;
    adoquery_rel_faltas: TADOQuery;
    adoquery_aux: TADOQuery;
    rel_faltas: TRvProject;
    ds_rel_faltas: TRvDataSetConnection;
    btn_todos: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btn_turmaClick(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);
    procedure btn_okClick(Sender: TObject);
    procedure btn_todosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cod_turma : string;
  end;

var
  Form_rel_faltas: TForm_rel_faltas;

implementation

uses Unit_logon, Unit_pesquisa_turmas, Unit_DMPrincipal,
  Unit_Rel_FaltaAlunos;

{$R *.dfm}

procedure TForm_rel_faltas.FormShow(Sender: TObject);
begin
  cod_turma := '';
  edt_turma.Clear;
end;

procedure TForm_rel_faltas.btn_turmaClick(Sender: TObject);
begin
  edt_turma.Clear;
  cod_turma := '';
  Form_pesquisa_turmas.ShowModal;

  if Form_pesquisa_turmas.chave <> '' then
  begin
    cod_turma := Form_pesquisa_turmas.chave;
    edt_turma.Text := cod_turma;
  end;
end;

procedure TForm_rel_faltas.btn_fecharClick(Sender: TObject);
begin
  close;
end;

procedure TForm_rel_faltas.btn_okClick(Sender: TObject);
var
sql : string;
begin
    if cod_turma = '' then
    showmessage('Selecione uma turma !')
  else
  begin
    sql := ' SELECT TURMAS.COD_TURMA AS TURMA, '+
           '       ALUNOS.COD_ALUNO, '+
           '       ALUNOS.NOME, '+
           '       SUM(CASE WHEN FREQUENCIAS.PRESENTE = ' + QuotedStr('N') +
           '                THEN 1 ELSE 0 END) AS FALTAS '+
           ' FROM TURMAS '+
           ' INNER JOIN MATRICULAS '+
           '  ON TURMAS.COD_TURMA = MATRICULAS.COD_TURMA '+
           ' INNER JOIN ALUNOS '+
           '  ON MATRICULAS.COD_ALUNO = ALUNOS.COD_ALUNO '+
           ' INNER JOIN FREQUENCIAS '+
           '  ON MATRICULAS.COD_TURMA = FREQUENCIAS.COD_TURMA '+
           '  AND MATRICULAS.COD_ALUNO = FREQUENCIAS.COD_ALUNO '+
           ' WHERE TURMAS.COD_TURMA = '+ QuotedStr(cod_turma) +
           ' GROUP BY TURMAS.COD_TURMA, ALUNOS.COD_ALUNO, ALUNOS.NOME '+
           ' ORDER BY ALUNOS.NOME ';


    FormDMPrincipal.datasetRelatorios.CommandText := sql;
    FormDMPrincipal.cdsRelatorios.Open;
    Form_Rel_FaltaAlunos.QuickRep1.Preview;
    FormDMPrincipal.cdsRelatorios.Close;
  end;
end;

procedure TForm_rel_faltas.btn_todosClick(Sender: TObject);
var
sql : string;
begin
    edt_turma.Clear;

    sql := ' SELECT TURMAS.COD_TURMA AS TURMA, '+
           '       ALUNOS.COD_ALUNO, '+
           '       ALUNOS.NOME, '+
           '       SUM(CASE WHEN FREQUENCIAS.PRESENTE = ' + QuotedStr('N') +
           '                THEN 1 ELSE 0 END) AS FALTAS '+
           ' FROM TURMAS '+
           ' INNER JOIN MATRICULAS '+
           '  ON TURMAS.COD_TURMA = MATRICULAS.COD_TURMA '+
           ' INNER JOIN ALUNOS '+
           '  ON MATRICULAS.COD_ALUNO = ALUNOS.COD_ALUNO '+
           ' INNER JOIN FREQUENCIAS '+
           '  ON MATRICULAS.COD_TURMA = FREQUENCIAS.COD_TURMA '+
           '  AND MATRICULAS.COD_ALUNO = FREQUENCIAS.COD_ALUNO '+
           ' GROUP BY TURMAS.COD_TURMA, ALUNOS.COD_ALUNO, ALUNOS.NOME '+
           ' ORDER BY ALUNOS.NOME ';

    FormDMPrincipal.datasetRelatorios.CommandText := sql;
    FormDMPrincipal.cdsRelatorios.Open;
    Form_Rel_FaltaAlunos.QuickRep1.Preview;
    FormDMPrincipal.cdsRelatorios.Close;

end;

end.
