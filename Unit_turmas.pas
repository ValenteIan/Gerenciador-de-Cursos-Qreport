{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J-,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN SYMBOL_DEPRECATED ON}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM ON}
{$WARN UNIT_LIBRARY ON}
{$WARN UNIT_PLATFORM ON}
{$WARN UNIT_DEPRECATED ON}
{$WARN HRESULT_COMPAT ON}
{$WARN HIDING_MEMBER ON}
{$WARN HIDDEN_VIRTUAL ON}
{$WARN GARBAGE ON}
{$WARN BOUNDS_ERROR ON}
{$WARN ZERO_NIL_COMPAT ON}
{$WARN STRING_CONST_TRUNCED ON}
{$WARN FOR_LOOP_VAR_VARPAR ON}
{$WARN TYPED_CONST_VARPAR ON}
{$WARN ASG_TO_TYPED_CONST ON}
{$WARN CASE_LABEL_RANGE ON}
{$WARN FOR_VARIABLE ON}
{$WARN CONSTRUCTING_ABSTRACT ON}
{$WARN COMPARISON_FALSE ON}
{$WARN COMPARISON_TRUE ON}
{$WARN COMPARING_SIGNED_UNSIGNED ON}
{$WARN COMBINING_SIGNED_UNSIGNED ON}
{$WARN UNSUPPORTED_CONSTRUCT ON}
{$WARN FILE_OPEN ON}
{$WARN FILE_OPEN_UNITSRC ON}
{$WARN BAD_GLOBAL_SYMBOL ON}
{$WARN DUPLICATE_CTOR_DTOR ON}
{$WARN INVALID_DIRECTIVE ON}
{$WARN PACKAGE_NO_LINK ON}
{$WARN PACKAGED_THREADVAR ON}
{$WARN IMPLICIT_IMPORT ON}
{$WARN HPPEMIT_IGNORED ON}
{$WARN NO_RETVAL ON}
{$WARN USE_BEFORE_DEF ON}
{$WARN FOR_LOOP_VAR_UNDEF ON}
{$WARN UNIT_NAME_MISMATCH ON}
{$WARN NO_CFG_FILE_FOUND ON}
{$WARN MESSAGE_DIRECTIVE ON}
{$WARN IMPLICIT_VARIANTS ON}
{$WARN UNICODE_TO_LOCALE ON}
{$WARN LOCALE_TO_UNICODE ON}
{$WARN IMAGEBASE_MULTIPLE ON}
{$WARN SUSPICIOUS_TYPECAST ON}
{$WARN PRIVATE_PROPACCESSOR ON}
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
{$WARN UNSAFE_CAST OFF}
unit Unit_turmas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB;

type
  TForm_turmas = class(TForm)
    btn_novo: TBitBtn;
    btn_salvar: TBitBtn;
    btn_alterar: TBitBtn;
    btn_cancelar: TBitBtn;
    btn_excluir: TBitBtn;
    btn_fechar: TBitBtn;
    edt_instrutor: TEdit;
    Label1: TLabel;
    edt_curso: TEdit;
    Curso: TLabel;
    edt_cod: TEdit;
    Label3: TLabel;
    edt_valor: TEdit;
    Label4: TLabel;
    adoquery_aux: TADOQuery;
    btn_curso: TBitBtn;
    btn_instrutor: TBitBtn;
    btn_localizar: TBitBtn;
    procedure btn_cursoClick(Sender: TObject);
    procedure btn_instrutorClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_novoClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_alterarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edt_valorEnter(Sender: TObject);
    procedure edt_valorExit(Sender: TObject);
    procedure btn_localizarClick(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    operacao, pk,cod_curso,cod_instrutor : string;
    procedure desabilita_salvar(Sender: TObject);
    procedure habilita_salvar(Sender: TObject);
    procedure bloqueia_campos;
    procedure libera_campos;
    procedure limpa_campos;
    function formata_valor(valor, destino : string) : string;
  end;

var
  Form_turmas: TForm_turmas;

implementation

uses Unit_logon, Unit_pesquisa, Unit_pesquisa_turmas;

{$R *.dfm}

{ TForm_turmas }

procedure TForm_turmas.bloqueia_campos;
var i: integer;
begin
  for i := 1 to Form_turmas.ComponentCount -1 do
  begin
    if Form_turmas.Components[i] is TEdit then
    begin
      (Form_turmas.Components[i] as TEdit).Enabled := false;
      (Form_turmas.Components[i] as TEdit).Color:= clInfoBk;
    end;
  end;
end;

procedure TForm_turmas.desabilita_salvar(Sender: TObject);
begin
  btn_novo.Enabled:=true;
  btn_salvar.Enabled:=false;
  btn_alterar.Enabled:=true;
  btn_cancelar.Enabled:=false;
  btn_excluir.Enabled:=true;

  btn_curso.Enabled:=false;
  btn_instrutor.Enabled:=false;

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

procedure TForm_turmas.habilita_salvar(Sender: TObject);
begin
  btn_novo.Enabled:=false;
  btn_salvar.Enabled:=true;
  btn_alterar.Enabled:=false;
  btn_cancelar.Enabled:=true;
  btn_excluir.Enabled:=false;

  btn_curso.Enabled:=true;
  btn_instrutor.Enabled:=true;

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

procedure TForm_turmas.libera_campos;
var i : integer;
  nome_obj : string;
begin
  for i := 1 to ComponentCount -1 do
  begin
    if Form_turmas.Components[i] is TEdit then
    begin
      nome_obj := (Form_turmas.Components[i] as TEdit).Name;
      if(nome_obj <> 'edt_curso') AND (nome_obj <> 'edt_instrutor') then
      begin
        (Form_turmas.Components[i] as TEdit).Enabled := true;
        (Form_turmas.Components[i] as TEdit).Color := clWindow;
      end;
    end;
  end;
end;

procedure TForm_turmas.limpa_campos;
var
i : integer;
begin
  for i := 1 to Form_turmas.ComponentCount -1 do
  begin
    if Form_turmas.Components[i] is TEdit then
    begin
      (Form_turmas.Components[i] as TEdit).Clear;
    end;
  end;
end;

procedure TForm_turmas.btn_cursoClick(Sender: TObject);
begin
  edt_curso.Clear;
  Form_pesquisa.sql_pesquisa:='SELECT * FROM CURSOS ';
  Form_pesquisa.ShowModal;
  if Form_pesquisa.chave <> '' then
  begin
    cod_curso := Form_pesquisa.chave;
    adoquery_aux.SQL.Text := ' SELECT NOME FROM CURSOS ' +
                              ' WHERE COD_CURSO = ' + QuotedStr(cod_curso);
    adoquery_aux.Open;
    edt_curso.Text := adoquery_aux.fieldbyname('NOME').AsString;
  end;
end;

procedure TForm_turmas.btn_instrutorClick(Sender: TObject);
begin
  edt_instrutor.Clear;
  Form_pesquisa.sql_pesquisa:='SELECT * FROM INSTRUTORES ';
  Form_pesquisa.ShowModal;
  if Form_pesquisa.chave <> '' then
  begin
    cod_instrutor := Form_pesquisa.chave;
    adoquery_aux.SQL.Text := ' SELECT NOME FROM INSTRUTORES ' +
                              ' WHERE COD_INSTRUTOR = ' + cod_instrutor;
    adoquery_aux.Open;
    edt_instrutor.Text := adoquery_aux.fieldbyname('NOME').AsString;
  end;  
end;

procedure TForm_turmas.FormShow(Sender: TObject);
begin
  pk := '';
  cod_curso := '';
  cod_instrutor := '';
  operacao := '';
  limpa_campos;
  bloqueia_campos;
  desabilita_salvar(Sender);
end;

procedure TForm_turmas.btn_novoClick(Sender: TObject);
begin
  libera_campos;
  limpa_campos;
  pk := '';
  cod_curso := '';
  cod_instrutor := '';
  habilita_salvar(Sender);
end;

procedure TForm_turmas.btn_salvarClick(Sender: TObject);
var
deu_erro : boolean;
begin
  if(edt_cod.Text = '') or (edt_valor.Text = '') or
    (cod_curso = '') or (cod_instrutor = '') then
    begin
      showmessage('Preencha todos os campos!')
    end
  else
    begin
      if operacao = 'novo' then
        adoquery_aux.SQL.Text:= 'INSERT INTO TURMAS VALUES ' +
                                '('+ QuotedStr(edt_cod.Text) +
                                ','+QuotedStr(cod_curso) +
                                ','+cod_instrutor +
                                ','+formata_valor(edt_valor.Text, 'B')+ ')'

      else if operacao = 'alterar' then
        adoquery_aux.SQL.Text:= 'UPDATE TURMAS SET '+
                                ', COD_TURMA ='+  QuotedStr(edt_cod.Text) +
                                ', COD_CURSO ='+ QuotedStr(cod_curso) +
                                ', COD_INSTRUTOR ='+ cod_instrutor +
                                ', VALOR_AULA ='+ formata_valor(edt_valor.Text, 'B') +
                                ' WHERE COD_TURMA = '+QuotedStr(pk);
      Form_logon.ConexaoBD.BeginTrans;
      try
        adoquery_aux.ExecSQL;
        deu_erro:=false;
      except
        on E:Exception do
        begin
          deu_erro := true;
          if Form_logon.ErroBD(E.Message, 'PK_Turmas') = 'Sim' then
            showmessage('Turma já cadastrada!')
          else if Form_logon.ErroBD(E.Message, 'FK_Turmas_Cursos') = 'Sim' then
            ShowMessage('Curso inválido!')
          else if Form_logon.ErroBD(E.Message, 'FK_Turmas_Instrutores') = 'Sim' then
            showmessage('Instrutor inválido!')
          else if Form_logon.ErroBD(E.Message, 'FK_Matriculas_Turmas') = 'Sim' then
            showmessage('Existem alunos matriculados nesta turma!')
          else if Form_logon.ErroBD(E.Message, 'FK_Aulas_Turmas') = 'Sim' then
            showmessage('Existem aulas cadastradas pra esta turma!')
          else
            showmessage('Ocorreu o seguinte erro '+ E.Message);
          end;
        end;

        if deu_erro = true then
          begin
            Form_logon.ConexaoBD.RollbackTrans;
          end
        else
          begin
          Form_logon.ConexaoBD.CommitTrans;
          pk := edt_cod.Text;
          desabilita_salvar(Sender);
          bloqueia_campos;
          end;
        end;
end;

procedure TForm_turmas.btn_alterarClick(Sender: TObject);
begin
  if pk = '' then
    showmessage('Impossível alterar!')
  else
  begin
    libera_campos;
    habilita_salvar(Sender);
  end;
end;

procedure TForm_turmas.btn_cancelarClick(Sender: TObject);
begin
  if operacao = 'novo' then
    limpa_campos;

  desabilita_salvar(Sender);
  bloqueia_campos;
end;

procedure TForm_turmas.btn_excluirClick(Sender: TObject);
var
deu_erro : boolean;
begin
  if pk = '' then
    showmessage('Impossível excluir!')
  else
    begin
      adoquery_aux.SQL.Text := ' DELETE FROM TURMAS ' +
                                ' WHERE COD_TURMA = ' +QuotedStr(pk);
      Form_logon.ConexaoBD.BeginTrans;

      try
        adoquery_aux.ExecSQL;
        deu_erro:=false;
      except
        on E : Exception do
        begin
          deu_erro := true;
          if Form_logon.ErroBD(E.Message, 'FK_Matriculas_Turmas') = 'Sim' then
            showmessage('Existem alunos matriculados nesta turma!')
          else if Form_logon.ErroBD(E.Message, 'FK_Aulas_Aulas') = 'Sim' then
            showmessage('Existem aulas cadastradas pra esta turma!')
          else
            showmessage('Ocorreu o seguinte erro '+ E.Message);
          end;
        end;

        if deu_erro = true then
          begin
            Form_logon.ConexaoBD.RollbackTrans;
          end
        else
          begin
          Form_logon.ConexaoBD.CommitTrans;
          pk := '';
          cod_curso := '';
          cod_instrutor := '';
          desabilita_salvar(Sender);
          limpa_campos;
          bloqueia_campos;
          end;
        end;

end;

procedure TForm_turmas.FormCreate(Sender: TObject);
begin
Close;
end;

function TForm_turmas.formata_valor(valor, destino: string): string;
var
  valor_formatado:string;
  i : integer;
begin
  //verifica os parâmetros
  if(valor='') or (destino='') then
  begin
    result := '';
    exit;
  end;
  valor_formatado := valor;
  //apaga caracteres do simbolo monetario e ponto
  delete(valor_formatado, pos('R', valor_formatado),1);
  delete(valor_formatado, pos('$', valor_formatado),1);
  delete(valor_formatado, pos('.', valor_formatado),1);

  //tira os espaços
  valor_formatado := trim(valor_formatado);
  //Retorna o vlaor formatado de acordo com o destino
  if destino = 'T' then
    result := FormatCurr('R$ #,##0.00', StrToCurr(valor_formatado))
  else if destino = 'E' then
    result := valor_formatado
  else if destino = 'B' then
    begin
      //Varre a string para substituir a virgula por ponto
      for i:=1 to length(valor_formatado) do
      begin
        if valor_formatado[i] = ',' then
          valor_formatado[i] := '.';
      end;
      Result:= valor_formatado;
    end;

end;

procedure TForm_turmas.edt_valorEnter(Sender: TObject);
begin
 edt_valor.Text := formata_valor(edt_valor.Text, 'E');
end;

procedure TForm_turmas.edt_valorExit(Sender: TObject);
begin
  edt_valor.Text := formata_valor(edt_valor.Text, 'T');
end;

procedure TForm_turmas.btn_localizarClick(Sender: TObject);
var
sql:string;
begin
  limpa_campos;
  bloqueia_campos;
  desabilita_salvar(Sender);

  Form_pesquisa_turmas.ShowModal;
  if Form_pesquisa_turmas.chave <> '' then
  begin
    pk:= Form_pesquisa_turmas.chave;

    sql := 'SELECT TURMAS.COD_TURMA, TURMAS.VALOR_AULA, '+
            'CURSOS.NOME AS CURSO, CURSOS.COD_CURSO, '+
            ' INSTRUTORES.NOME AS INSTRUTOR, INSTRUTORES.COD_INSTRUTOR '+
            'FROM TURMAS '+
            'INNER JOIN CURSOS '+
            'ON TURMAS.COD_CURSO = CURSOS.COD_CURSO '+
            'INNER JOIN INSTRUTORES '+
            'ON TURMAS.COD_INSTRUTOR = INSTRUTORES.COD_INSTRUTOR '+
            'WHERE TURMAS.COD_TURMA = ' + QuotedStr(pk);

    adoquery_aux.SQL.Text:=sql;
    adoquery_aux.Open;

    edt_cod.Text := adoquery_aux.fieldbyname('COD_TURMA').AsString;
    edt_valor.Text := adoquery_aux.fieldbyname('VALOR_AULA').AsString;
    edt_valor.Text := formata_valor(edt_valor.Text, 'T');
    edt_curso.Text := adoquery_aux.fieldbyname('CURSO').AsString;
    edt_instrutor.Text := adoquery_aux.fieldbyname('INSTRUTOR').AsString;
    cod_curso := adoquery_aux.fieldbyname('COD_CURSO').AsString;
    cod_instrutor := adoquery_aux.fieldbyname('COD_INSTRUTOR').AsString;
    end;
end;

procedure TForm_turmas.btn_fecharClick(Sender: TObject);
begin
close;
end;

end.
