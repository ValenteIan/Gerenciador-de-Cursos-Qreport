object FormDMPrincipal: TFormDMPrincipal
  OldCreateOrder = False
  Left = 192
  Top = 157
  Height = 282
  Width = 342
  object ConRelatorios: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=valente123;Persist Security Info=Tr' +
      'ue;User ID=admin_academico;Initial Catalog=Academico;Data Source' +
      '=DESKTOP-HR2SECH\SQLEXPRESS'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 24
    Top = 80
  end
  object datasetRelatorios: TADODataSet
    Connection = ConRelatorios
    CursorType = ctStatic
    CommandText = 
      'SELECT INSTRUTORES.COD_INSTRUTOR, INSTRUTORES.NOME,'#13#10'           ' +
      'AULAS.COD_TURMA, AULAS.DATA, TURMAS.VALOR_AULA '#13#10'           FROM' +
      ' AULAS '#13#10'           INNER JOIN TURMAS ON '#13#10'             AULAS.CO' +
      'D_TURMA = TURMAS.COD_TURMA '#13#10'           INNER JOIN INSTRUTORES O' +
      'N '#13#10'             TURMAS.COD_INSTRUTOR = INSTRUTORES.COD_INSTRUTO' +
      'R    '#13#10'           ORDER BY TURMAS.COD_TURMA, AULAS.DATA'
    Parameters = <>
    Left = 128
    Top = 80
  end
  object dspRelatorios: TDataSetProvider
    DataSet = datasetRelatorios
    Left = 200
    Top = 80
  end
  object cdsRelatorios: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRelatorios'
    Left = 264
    Top = 80
  end
end
