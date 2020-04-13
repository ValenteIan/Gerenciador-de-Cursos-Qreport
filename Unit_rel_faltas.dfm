object Form_rel_faltas: TForm_rel_faltas
  Left = 509
  Top = 313
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de Faltas dos Alunos'
  ClientHeight = 170
  ClientWidth = 353
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 64
    Top = 24
    Width = 36
    Height = 13
    Caption = 'Turma'
  end
  object edt_turma: TEdit
    Left = 64
    Top = 40
    Width = 209
    Height = 21
    Color = clInfoBk
    Enabled = False
    TabOrder = 0
  end
  object btn_ok: TBitBtn
    Left = 128
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Ok'
    TabOrder = 1
    OnClick = btn_okClick
  end
  object btn_fechar: TBitBtn
    Left = 224
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Fechar'
    TabOrder = 2
    OnClick = btn_fecharClick
  end
  object btn_turma: TBitBtn
    Left = 280
    Top = 40
    Width = 25
    Height = 21
    Caption = '+'
    TabOrder = 3
    OnClick = btn_turmaClick
  end
  object btn_todos: TBitBtn
    Left = 32
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Todos'
    TabOrder = 4
    OnClick = btn_todosClick
  end
  object adoquery_rel_faltas: TADOQuery
    Connection = Form_logon.ConexaoBD
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT TURMAS.COD_TURMA AS TURMA,'
      '               ALUNOS.COD_ALUNO,'
      '               ALUNOS.NOME,'
      '               SUM(CASE WHEN FREQUENCIAS.PRESENTE = '#39'N'#39
      '                                   THEN 1 ELSE 0 END) AS FALTAS'
      'FROM TURMAS'
      ' INNER JOIN MATRICULAS'
      '  ON TURMAS.COD_TURMA = MATRICULAS.COD_TURMA'
      ' INNER JOIN ALUNOS'
      '  ON MATRICULAS.COD_ALUNO = ALUNOS.COD_ALUNO'
      ' INNER JOIN FREQUENCIAS'
      '  ON MATRICULAS.COD_TURMA = FREQUENCIAS.COD_TURMA'
      '  AND MATRICULAS.COD_ALUNO = FREQUENCIAS.COD_ALUNO'
      ' GROUP BY TURMAS.COD_TURMA, ALUNOS.COD_ALUNO, ALUNOS.NOME')
    Left = 32
    Top = 120
  end
  object adoquery_aux: TADOQuery
    Connection = Form_logon.ConexaoBD
    Parameters = <>
    Left = 8
    Top = 40
  end
  object rel_faltas: TRvProject
    Left = 288
    Top = 120
  end
  object ds_rel_faltas: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = adoquery_rel_faltas
    Left = 312
    Top = 80
  end
end
