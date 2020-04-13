unit Unit_aluno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB;

type
  TForm_alunos = class(TForm)
    btn_novo: TBitBtn;
    btn_salvar: TBitBtn;
    btn_alterar: TBitBtn;
    btn_cancelar: TBitBtn;
    btn_excluir: TBitBtn;
    btn_fechar: TBitBtn;
    edt_idade: TEdit;
    edt_telefone: TEdit;
    edt_sexo: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edt_nome: TEdit;
    edt_cod: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    adoquery_aux: TADOQuery;
    btn_localizar: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btn_novoClick(Sender: TObject);
    procedure btn_alterarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_localizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    operacao, pk : string;
    procedure desabilita_salvar(Sender: TObject);
    procedure habilita_salvar(Sender: TObject);
    procedure bloqueia_campos;
    procedure libera_campos;
    procedure limpa_campos;
  end;

var
  Form_alunos: TForm_alunos;

implementation

uses Unit_logon, Math, Unit_pesquisa;

{$R *.dfm}

{ TForm_alunos }

procedure TForm_alunos.bloqueia_campos;
var
i : integer;
begin
  for i := 1 to Form_alunos.ComponentCount -1 do
  begin
    if Form_alunos.Components[i] is TEdit then
    begin
      (Form_alunos.Components[i] as TEdit).Enabled := false;
      (Form_alunos.Components[i] as TEdit).Color :=clInfoBk;
    end;
  end;
end;

procedure TForm_alunos.desabilita_salvar(Sender: TObject);
begin
  btn_novo.Enabled:=true;
  btn_salvar.Enabled:=false;
  btn_alterar.Enabled:=true;
  btn_cancelar.Enabled:=false;
  btn_excluir.Enabled:=true;

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

procedure TForm_alunos.habilita_salvar(Sender: TObject);
begin
  btn_novo.Enabled:=false;
  btn_salvar.Enabled:=true;
  btn_alterar.Enabled:=false;
  btn_cancelar.Enabled:=true;
  btn_excluir.Enabled:=false;

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

procedure TForm_alunos.libera_campos;
var
i : integer;
begin
  for i := 1 to Form_alunos.ComponentCount -1 do
  begin

    if (Form_alunos.Components[i] is TEdit) then
    begin
      if(Form_alunos.Components[i] as TEdit).Name <> 'edt_cod' then
      begin
        (Form_alunos.Components[i] as TEdit).Enabled := true;
        (Form_alunos.Components[i] as TEdit).Color :=clWindow;
       end;
    end;
  end;
end;

procedure TForm_alunos.limpa_campos;
var
i : integer;
begin
  for i := 1 to Form_alunos.ComponentCount -1 do
  begin
    if Form_alunos.Components[i] is TEdit then
    begin
      (Form_alunos.Components[i] as TEdit).Clear;
    end;
  end;
end;

procedure TForm_alunos.FormShow(Sender: TObject);
begin
  pk :='';
  operacao := '';
  limpa_campos;
  bloqueia_campos;
  desabilita_salvar(Sender);
end;

procedure TForm_alunos.btn_novoClick(Sender: TObject);
begin
  libera_campos;
  limpa_campos;
  pk:='';
  habilita_salvar(Sender);
end;

procedure TForm_alunos.btn_alterarClick(Sender: TObject);
begin
  if pk = '' then
    ShowMessage('Impossível alterar')
  else
  begin
    libera_campos;
    habilita_salvar(Sender);
  end;
end;

procedure TForm_alunos.btn_cancelarClick(Sender: TObject);
begin
  if operacao = 'novo' then
    limpa_campos;

  desabilita_salvar(Sender);
  bloqueia_campos;
end;

procedure TForm_alunos.btn_fecharClick(Sender: TObject);
begin
Close;
end;

procedure TForm_alunos.btn_salvarClick(Sender: TObject);
var deu_erro : boolean;
begin
  if (edt_nome.Text='') or (edt_idade.Text='') or
      (edt_telefone.Text='') or (edt_sexo.Text='') then
    begin
      showmessage('Preencha todos os campos!');
    end
  else
    begin
      if operacao = 'novo' then
        adoquery_aux.SQL.Text:= 'INSERT INTO ALUNOS '+
                                '(NOME, IDADE, TELEFONE, SEXO) VALUES '+
                                '('+QuotedStr(edt_nome.Text) +
                                ','+edt_idade.Text +
                                ','+QuotedStr(edt_telefone.Text) +
                                ','+QuotedStr(edt_sexo.Text) + ')'

      else if operacao = 'alterar' then
        adoquery_aux.SQL.Text:= 'UPDATE ALUNOS SET '+
                                'NOME ='+QuotedStr(edt_nome.Text) +
                                ', IDADE = '+edt_idade.Text +
                                ', TELEFONE ='+QuotedStr(edt_telefone.Text) +
                                ', SEXO ='+QuotedStr(edt_sexo.Text) +
                                'WHERE COD_ALUNO = '+pk;

      Form_logon.ConexaoBD.BeginTrans;
      try
        adoquery_aux.ExecSQL;
        deu_erro:=false;
      except
        on E:Exception do
        begin
          deu_erro:= true;
          if Form_logon.ErroBD(E.Message, 'PK_Alunos') = 'Sim' then
            showmessage('Aluno já cadastrado!')
          else if Form_logon.ErroBD(E.Message, 'FK_Matriculas_Alunos') = 'Sim' then
            showmessage('Existem matriculas cadastradas para este aluno!')
          else
            showmessage('Ocorreu o seguinte erro: '+E.Message);
        end;
      end;
      if deu_erro = true then
        begin
          Form_logon.ConexaoBD.RollbackTrans;
        end
      else
        begin
          Form_logon.ConexaoBD.CommitTrans;
          if operacao = 'novo' then
          begin
            adoquery_aux.SQL.Text:= 'SELECT COD_ALUNO FROM ALUNOS ' +
                                    'WHERE NOME = '+QuotedStr(edt_nome.Text) +
                                    'AND IDADE = '+edt_idade.Text +
                                    'AND TELEFONE ='+QuotedStr(edt_telefone.Text) +
                                    'AND SEXO ='+QuotedStr(edt_sexo.Text);
            adoquery_aux.Open;
            pk:= adoquery_aux.fieldbyname('COD_ALUNO').AsString;
            adoquery_aux.Close;
          end;
          desabilita_salvar(Sender);
          bloqueia_campos;
          edt_cod.Text:= pk;
        end;
    end;
end;

procedure TForm_alunos.btn_excluirClick(Sender: TObject);
var
deu_erro : boolean;
begin
  if pk = '' then
    showmessage('Impossível excluir!')
  else
    begin
      adoquery_aux.SQL.Text := ' DELETE FROM ALUNOS' +
                                ' WHERE COD_ALUNO =' + pk;
      Form_logon.ConexaoBD.BeginTrans;

      try
        adoquery_aux.ExecSQL;
        deu_erro:=false;
      except
       on E:exception do
       begin
        deu_erro:=true;
        if Form_logon.ErroBD(E.Message,'FK_Matriculas_Alunos') = 'Sim' then
          showmessage('Existem matrículas cadastradas para este aluno!')
        else
          showmessage('Ocorreu o seguinte erro: '+E.Message);
        end;
       end;

        if deu_erro = true then
          begin
            Form_logon.ConexaoBD.RollbackTrans
          end
        else
          begin
            Form_logon.ConexaoBD.CommitTrans;
            pk:='';
            desabilita_salvar(Sender);
            limpa_campos;
            bloqueia_campos;
          end;
      end;
end;

procedure TForm_alunos.btn_localizarClick(Sender: TObject);
begin
  limpa_campos;
  bloqueia_campos;
  desabilita_salvar(Sender);

  Form_pesquisa.sql_pesquisa:='SELECT * FROM ALUNOS ';
  Form_pesquisa.ShowModal;
  if Form_pesquisa.chave <> '' then
  begin
    pk:=Form_pesquisa.chave;
    adoquery_aux.SQL.Text:=' SELECT * FROM ALUNOS '+
                            'WHERE COD_ALUNO = '+ pk;
    adoquery_aux.Open;
    edt_cod.Text:= adoquery_aux.fieldbyname('COD_ALUNO').AsString;
    edt_nome.Text:= adoquery_aux.fieldbyname('NOME').AsString;
    edt_idade.Text:= adoquery_aux.fieldbyname('IDADE').AsString;
    edt_telefone.Text:= adoquery_aux.fieldbyname('TELEFONE').AsString;
    edt_sexo.Text:= adoquery_aux.fieldbyname('SEXO').AsString;
  end;
end;

end.
