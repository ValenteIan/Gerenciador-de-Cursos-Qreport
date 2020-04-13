unit Unit_matriculas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB;

type
  TForm_matriculas = class(TForm)
    btn_novo: TBitBtn;
    btn_salvar: TBitBtn;
    btn_alterar: TBitBtn;
    btn_cancelar: TBitBtn;
    btn_excluir: TBitBtn;
    btn_fechar: TBitBtn;
    edt_turma: TEdit;
    Label1: TLabel;
    edt_aluno: TEdit;
    Label2: TLabel;
    adoquery_aux: TADOQuery;
    btn_aluno: TBitBtn;
    btn_turma: TBitBtn;
    btn_localizar: TBitBtn;
    procedure btn_alunoClick(Sender: TObject);
    procedure btn_turmaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_novoClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_alterarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);
    procedure btn_localizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    pk_aluno, pk_turma, operacao, cod_aluno, cod_turma : string;
    procedure desabilita_salvar(Sender: TObject);
    procedure habilita_salvar(Sender: TObject);
    procedure bloqueia_campos;
    procedure libera_campos;
    procedure limpa_campos;
  end;

var
  Form_matriculas: TForm_matriculas;

implementation

uses Unit_logon, Unit_pesquisa, Unit_pesquisa_turmas;

{$R *.dfm}

{ TForm_matriculas }

procedure TForm_matriculas.bloqueia_campos;
var
i : integer;
begin
  for i := 1 to Form_matriculas.ComponentCount -1 do
  begin
    if Form_matriculas.Components[i] is TEdit then
    begin
      (Form_matriculas.Components[i] as TEdit).Enabled := false;
      (Form_matriculas.Components[i] as TEdit).Color :=clInfoBk;
    end;
  end;
end;

procedure TForm_matriculas.desabilita_salvar(Sender: TObject);
begin
  btn_novo.Enabled:=true;
  btn_salvar.Enabled:=false;
  btn_alterar.Enabled:=true;
  btn_cancelar.Enabled:=false;
  btn_excluir.Enabled:=true;

  btn_aluno.Enabled:= false;
  btn_turma.Enabled:= false;

  if Sender = btn_novo then
    operacao := 'novo'
  else if Sender = btn_salvar then
    operacao := 'salvar'
  else if Sender = btn_alterar then
    operacao := 'alterar'
  else if Sender = btn_cancelar then
    operacao := 'cancelar'
  else if Sender = btn_excluir then
    operacao := 'excluir'
end;

procedure TForm_matriculas.habilita_salvar(Sender: TObject);
begin
  btn_novo.Enabled:=false;
  btn_salvar.Enabled:=true;
  btn_alterar.Enabled:=false;
  btn_cancelar.Enabled:=true;
  btn_excluir.Enabled:=false;

  btn_aluno.Enabled:= true;
  btn_turma.Enabled:= true;

  if Sender = btn_novo then
    operacao := 'novo'
  else if Sender = btn_salvar then
    operacao := 'salvar'
  else if Sender = btn_alterar then
    operacao := 'alterar'
  else if Sender = btn_cancelar then
    operacao := 'cancelar'
  else if Sender = btn_excluir then
    operacao := 'excluir'
end;

procedure TForm_matriculas.libera_campos;
var
i : integer;
nome_obj : string;
begin
  for i := 1 to Form_matriculas.ComponentCount -1 do
  begin

    if (Form_matriculas.Components[i] is TEdit) then
    begin
        nome_obj := (Form_matriculas.Components[i] as TEdit).Name;
        if (nome_obj <> 'edt_aluno' ) AND (nome_obj <> 'edt_turma') then
        begin
          (Form_matriculas.Components[i] as TEdit).Enabled := true;
        ( Form_matriculas.Components[i] as TEdit).Color :=clWindow;
        end;
    end;
  end;
end;

procedure TForm_matriculas.limpa_campos;
var
i : integer;
begin
  for i := 1 to Form_matriculas.ComponentCount -1 do
  begin
    if Form_matriculas.Components[i] is TEdit then
      (Form_matriculas.Components[i] as TEdit).Clear;
  end;
end;

procedure TForm_matriculas.btn_alunoClick(Sender: TObject);
begin
  edt_aluno.Clear;
  form_pesquisa.sql_pesquisa:='SELECT * FROM ALUNOS ';
  Form_pesquisa.ShowModal;
  if Form_pesquisa.chave <> '' then
  begin
    cod_aluno := Form_pesquisa.chave;
    adoquery_aux.SQL.Text := ' SELECT NOME FROM ALUNOS'+
                              ' WHERE COD_ALUNO = ' + cod_aluno;
    adoquery_aux.Open;
    edt_aluno.Text := adoquery_aux.fieldbyname('NOME').AsString;
  end;
end;

procedure TForm_matriculas.btn_turmaClick(Sender: TObject);
begin
  edt_turma.Clear;
  Form_pesquisa_turmas.ShowModal;

  if Form_pesquisa_turmas.chave <> '' then
  begin
    cod_turma := Form_pesquisa_turmas.chave;
    edt_turma.Text := cod_turma;
  end;
end;

procedure TForm_matriculas.FormShow(Sender: TObject);
begin
  pk_aluno:= '';
  pk_turma:= '';
  cod_aluno:= '';
  cod_turma:= '';
  operacao:= '';
  limpa_campos;
  bloqueia_campos;
  desabilita_salvar(Sender);

end;

procedure TForm_matriculas.btn_novoClick(Sender: TObject);
begin
  libera_campos;
  limpa_campos;
  pk_aluno:= '';
  pk_turma:= '';
  cod_aluno:= '';
  cod_turma:= '';
  operacao:= '';
  habilita_salvar(Sender);
end;

procedure TForm_matriculas.btn_salvarClick(Sender: TObject);
var
deu_erro : boolean;
begin
  if(cod_aluno='') or (edt_turma.Text='') then
    begin
      showmessage('Informe todos os campos!');
    end
  else
    begin
      if operacao = 'novo' then
        adoquery_aux.SQL.Text := 'INSERT INTO MATRICULAS VALUES ' +
                                  '('+ QuotedStr(cod_turma) +
                                  ','+ cod_aluno+')'
      else if operacao = 'alterar' then
        adoquery_aux.SQL.Text := 'UPDATE MATRICULAS SET '+
                                  ' COD_TURMA ='+ QuotedStr(cod_turma) +
                                  ', COD_ALUNO ='+ cod_aluno +
                                  ' WHERE COD_TURMA = '+ QuotedStr(pk_turma) +
                                  ' AND COD_ALUNO = '+ pk_aluno;
      Form_logon.ConexaoBD.BeginTrans;
      try
        adoquery_aux.ExecSQL;
        deu_erro:=false
      except
        on E : Exception do
        begin
          deu_erro:= true;
          if Form_logon.ErroBD(E.Message, 'PK_Matriculas') = 'Sim' then
            showmessage('Matrícula já cadastrada!')
          else if Form_logon.ErroBD(E.Message, 'FK_Frequencia_Matriculas') = 'Sim' then
            showmessage('Existem frequências lançadas para esta matrícula!')
          else
            showmessage('Ocorreu o seguinte erro: '+ E.Message);
          end;
        end;

        if deu_erro = true then
          begin
            Form_logon.ConexaoBD.RollbackTrans;
          end
        else
          begin
            Form_logon.ConexaoBD.CommitTrans;
            pk_turma := cod_turma;
            pk_aluno := cod_aluno;
            desabilita_salvar(Sender);
            bloqueia_campos;
          end;
      end;
end;

procedure TForm_matriculas.btn_alterarClick(Sender: TObject);
begin
  if(pk_turma = '') or (pk_aluno = '') then
    showmessage('Impossível alterar')
  else
  begin
    libera_campos;
    habilita_salvar(Sender);
  end;
end;

procedure TForm_matriculas.btn_cancelarClick(Sender: TObject);
begin
  if operacao = 'novo' then
    limpa_campos;

  desabilita_salvar(Sender);
  bloqueia_campos;
end;

procedure TForm_matriculas.btn_excluirClick(Sender: TObject);
var
deu_erro : boolean;
begin
  if (pk_turma = '') or (pk_aluno = '') then
    showmessage('Impossível excluir!')
  else
    begin
      adoquery_aux.SQL.Text:= 'DELETE FROM MATRICULAS '+
                              'WHERE COD_TURMA = '+QuotedStr(pk_turma) +
                              'AND COD_ALUNO = ' + cod_aluno;
      Form_logon.ConexaoBD.BeginTrans;

      try
        adoquery_aux.ExecSQL;
        deu_erro:= false;
      except
        on E : Exception do
        begin
          deu_erro:=true;
          if Form_logon.ErroBD(E.Message, 'FK_Frequencia_Matriculas') = 'Sim' then
            showmessage('Existem frequências lançadas para esta matrícula! ')
          else
            showmessage('Ocorreu o seguinte erro: '+ E.Message);
          end;
        end;

        if deu_erro = true then
          begin
            form_logon.ConexaoBD.RollbackTrans;
          end
        else
          begin
            Form_logon.ConexaoBD.CommitTrans;
            pk_turma := '';
            pk_aluno := '';
            cod_turma := '';
            cod_aluno := '';
            desabilita_salvar(Sender);
            limpa_campos;
            bloqueia_campos;
          end;
        end;
      end;

procedure TForm_matriculas.btn_fecharClick(Sender: TObject);
begin
Close;
end;

procedure TForm_matriculas.btn_localizarClick(Sender: TObject);
var
sql : string;
begin
  limpa_campos;
  bloqueia_campos;
  desabilita_salvar(Sender);

  sql:= 'SELECT MATRICULAS.COD_TURMA, '+
        'MATRICULAS.COD_ALUNO, '+
        'ALUNOS.NOME '+
        'FROM MATRICULAS '+
        'INNER JOIN ALUNOS '+
        'ON MATRICULAS.COD_ALUNO = ALUNOS.COD_ALUNO ';
  Form_pesquisa.sql_pesquisa:=sql;
  Form_pesquisa.Showmodal;
  if Form_pesquisa.chave <> '' then
  begin
    pk_turma := Form_pesquisa.chave;
    pk_aluno := Form_pesquisa.chave_aux;
    adoquery_aux.SQL.Text:=  sql +
                              ' WHERE COD_TURMA = '+QuotedStr(pk_turma) +
                              ' AND MATRICULAS.COD_ALUNO = ' + pk_aluno;
    adoquery_aux.Open;
    edt_aluno.Text := adoquery_aux.fieldbyname('NOME').AsString;
    edt_turma.Text := pk_turma;
    cod_turma := pk_turma;
    cod_aluno := pk_aluno;
  end;
end;

end.
