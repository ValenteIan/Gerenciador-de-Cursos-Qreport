object Form_relatorios: TForm_relatorios
  Left = 590
  Top = 332
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rios'
  ClientHeight = 261
  ClientWidth = 203
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object btn_rel_curso: TBitBtn
    Left = 16
    Top = 8
    Width = 169
    Height = 25
    Caption = 'Rela'#231#227'o de Cursos'
    TabOrder = 0
    OnClick = btn_rel_cursoClick
  end
  object btn_rel_turmas: TBitBtn
    Left = 16
    Top = 48
    Width = 169
    Height = 25
    Caption = 'Rela'#231#227'o de Turmas por Curso'
    TabOrder = 1
    OnClick = btn_rel_turmasClick
  end
  object btn_rel_alunos: TBitBtn
    Left = 16
    Top = 88
    Width = 169
    Height = 25
    Caption = 'Rela'#231#227'o de Alunos por Turma'
    TabOrder = 2
    OnClick = btn_rel_alunosClick
  end
  object btn_rel_faltas: TBitBtn
    Left = 16
    Top = 128
    Width = 169
    Height = 25
    Caption = 'Relat'#243'rio de Faltas dos Alunos'
    TabOrder = 3
    OnClick = btn_rel_faltasClick
  end
  object btn_rel_aulas: TBitBtn
    Left = 16
    Top = 168
    Width = 169
    Height = 25
    Caption = 'Relat'#243'rio de Aulas po Instrutor'
    TabOrder = 4
    OnClick = btn_rel_aulasClick
  end
  object btn_fechar: TBitBtn
    Left = 64
    Top = 216
    Width = 75
    Height = 25
    Caption = 'Fechar'
    TabOrder = 5
    OnClick = btn_fecharClick
  end
  object adoquery_rel_cursos: TADOQuery
    Connection = Form_logon.ConexaoBD
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM CURSOS ORDER BY NOME')
    Top = 216
  end
  object rel_cursos: TRvProject
    Left = 176
    Top = 216
  end
  object ds_rel_cursos: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = adoquery_rel_cursos
    Left = 32
    Top = 216
  end
end
