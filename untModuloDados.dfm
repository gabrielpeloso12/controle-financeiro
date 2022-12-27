object DM: TDM
  OldCreateOrder = False
  Height = 644
  Width = 881
  object ConexaoMySql: TFDConnection
    Params.Strings = (
      'Database=financeiro'
      'User_Name=gabriel'
      'Password=140595@Ga'
      'DriverID=MySQL')
    Connected = True
    Left = 32
    Top = 24
  end
  object DriverMySql: TFDPhysMySQLDriverLink
    VendorLib = 
      'C:\projetos-programacao\controle-financeiro\Win32\lib\libmysql.d' +
      'll'
    Left = 112
    Top = 24
  end
  object CursorMySql: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 184
    Top = 24
  end
  object tbCargo: TFDTable
    Active = True
    IndexFieldNames = 'C_CODIGO'
    Connection = ConexaoMySql
    TableName = 'financeiro.cargo'
    Left = 32
    Top = 128
    object tbCargoC_CODIGO: TFDAutoIncField
      FieldName = 'C_CODIGO'
      Origin = 'C_CODIGO'
      ReadOnly = True
    end
    object tbCargoC_DESCRICAO: TStringField
      FieldName = 'C_DESCRICAO'
      Origin = 'C_DESCRICAO'
      Required = True
      Size = 30
    end
    object tbCargoC_DATACAD: TDateField
      FieldName = 'C_DATACAD'
      Origin = 'C_DATACAD'
      Required = True
    end
  end
  object dstbCargo: TDataSource
    DataSet = tbCargo
    Left = 32
    Top = 200
  end
  object queryCargo: TFDQuery
    Active = True
    Connection = ConexaoMySql
    SQL.Strings = (
      'SELECT * FROM CARGO')
    Left = 32
    Top = 336
    object queryCargoC_CODIGO: TFDAutoIncField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'C_CODIGO'
      ReadOnly = True
    end
    object queryCargoC_DESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'C_DESCRICAO'
      Required = True
      Size = 30
    end
    object queryCargoC_DATACAD: TDateField
      DisplayLabel = 'Data do Cadastro'
      FieldName = 'C_DATACAD'
      Required = True
    end
  end
  object dsqueryCargo: TDataSource
    DataSet = queryCargo
    Left = 32
    Top = 424
  end
  object tbPessoa: TFDTable
    Active = True
    IndexFieldNames = 'P_CODIGO'
    Connection = ConexaoMySql
    TableName = 'financeiro.pessoa'
    Left = 104
    Top = 128
    object tbPessoaP_CODIGO: TFDAutoIncField
      FieldName = 'P_CODIGO'
      Origin = 'P_CODIGO'
      ReadOnly = True
    end
    object tbPessoaP_NOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'P_NOME'
      Origin = 'P_NOME'
      Size = 100
    end
    object tbPessoaP_IDADE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'P_IDADE'
      Origin = 'P_IDADE'
    end
    object tbPessoaP_TELEFONE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'P_TELEFONE'
      Origin = 'P_TELEFONE'
      EditMask = '!\(99\)00000-0000;1;_'
      Size = 14
    end
    object tbPessoaP_EMAIL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'P_EMAIL'
      Origin = 'P_EMAIL'
      Size = 100
    end
    object tbPessoaP_CPFCNPJ: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'P_CPFCNPJ'
      Origin = 'P_CPFCNPJ'
      EditMask = '000\.000\.000\-00;1;_'
      Size = 19
    end
    object tbPessoaP_SEXO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'P_SEXO'
      Origin = 'P_SEXO'
      Size = 10
    end
    object tbPessoaP_CARGO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'P_CARGO'
      Origin = 'P_CARGO'
    end
    object tbPessoaP_ENDERECO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'P_ENDERECO'
      Origin = 'P_ENDERECO'
      Size = 100
    end
    object tbPessoaP_BAIRRO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'P_BAIRRO'
      Origin = 'P_BAIRRO'
      Size = 60
    end
    object tbPessoaP_NUMERO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'P_NUMERO'
      Origin = 'P_NUMERO'
    end
    object tbPessoaP_DATACAD: TDateField
      FieldName = 'P_DATACAD'
      Origin = 'P_DATACAD'
      Required = True
    end
  end
  object dstbPessoa: TDataSource
    DataSet = tbPessoa
    Left = 104
    Top = 200
  end
  object queryPessoa: TFDQuery
    Active = True
    Connection = ConexaoMySql
    SQL.Strings = (
      'SELECT * FROM PESSOA')
    Left = 120
    Top = 336
    object queryPessoaP_CODIGO: TFDAutoIncField
      DisplayLabel = 'Codigo'
      DisplayWidth = 5
      FieldName = 'P_CODIGO'
      Origin = 'P_CODIGO'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object queryPessoaP_NOME: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Nome'
      DisplayWidth = 50
      FieldName = 'P_NOME'
      Origin = 'P_NOME'
      Size = 100
    end
    object queryPessoaP_IDADE: TIntegerField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Idade'
      DisplayWidth = 5
      FieldName = 'P_IDADE'
      Origin = 'P_IDADE'
      Visible = False
    end
    object queryPessoaP_TELEFONE: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Telefone'
      DisplayWidth = 10
      FieldName = 'P_TELEFONE'
      Origin = 'P_TELEFONE'
      Visible = False
      Size = 14
    end
    object queryPessoaP_EMAIL: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'E-mail'
      DisplayWidth = 60
      FieldName = 'P_EMAIL'
      Origin = 'P_EMAIL'
      Visible = False
      Size = 100
    end
    object queryPessoaP_CPFCNPJ: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Cpf / Cnpj'
      DisplayWidth = 14
      FieldName = 'P_CPFCNPJ'
      Origin = 'P_CPFCNPJ'
      Visible = False
      Size = 19
    end
    object queryPessoaP_SEXO: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Sexo'
      DisplayWidth = 8
      FieldName = 'P_SEXO'
      Origin = 'P_SEXO'
      Visible = False
      Size = 10
    end
    object queryPessoaP_CARGO: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Cargo'
      DisplayWidth = 20
      FieldName = 'P_CARGO'
      Origin = 'P_CARGO'
    end
    object queryPessoaP_ENDERECO: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Endereco'
      DisplayWidth = 60
      FieldName = 'P_ENDERECO'
      Origin = 'P_ENDERECO'
      Visible = False
      Size = 100
    end
    object queryPessoaP_BAIRRO: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Bairro'
      DisplayWidth = 30
      FieldName = 'P_BAIRRO'
      Origin = 'P_BAIRRO'
      Visible = False
      Size = 60
    end
    object queryPessoaP_NUMERO: TIntegerField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Numero'
      DisplayWidth = 5
      FieldName = 'P_NUMERO'
      Origin = 'P_NUMERO'
      Visible = False
    end
    object queryPessoaP_DATACAD: TDateField
      DisplayLabel = 'Data Cadastro'
      DisplayWidth = 5
      FieldName = 'P_DATACAD'
      Origin = 'P_DATACAD'
      Required = True
    end
  end
  object dsqueryPessoa: TDataSource
    DataSet = queryPessoa
    Left = 120
    Top = 426
  end
  object tbUsuario: TFDTable
    Active = True
    IndexFieldNames = 'U_CODIGO'
    Connection = ConexaoMySql
    TableName = 'financeiro.usuario'
    Left = 187
    Top = 128
    object tbUsuarioU_CODIGO: TFDAutoIncField
      FieldName = 'U_CODIGO'
      Origin = 'U_CODIGO'
      ReadOnly = True
    end
    object tbUsuarioU_PESSOA: TStringField
      FieldName = 'U_PESSOA'
      Origin = 'U_PESSOA'
      Required = True
      Size = 50
    end
    object tbUsuarioU_NOMEUSUARIO: TStringField
      FieldName = 'U_NOMEUSUARIO'
      Origin = 'U_NOMEUSUARIO'
      Required = True
      Size = 50
    end
    object tbUsuarioU_SENHA: TStringField
      FieldName = 'U_SENHA'
      Origin = 'U_SENHA'
      Required = True
      Size = 10
    end
    object tbUsuarioU_DATACAD: TDateField
      FieldName = 'U_DATACAD'
      Origin = 'U_DATACAD'
      Required = True
    end
  end
  object tbFinalizador: TFDTable
    Active = True
    IndexFieldNames = 'F_CODIGO'
    Connection = ConexaoMySql
    TableName = 'financeiro.finalizador'
    Left = 280
    Top = 128
    object tbFinalizadorF_CODIGO: TFDAutoIncField
      FieldName = 'F_CODIGO'
      Origin = 'F_CODIGO'
      ReadOnly = True
    end
    object tbFinalizadorF_DESCRICAO: TStringField
      FieldName = 'F_DESCRICAO'
      Origin = 'F_DESCRICAO'
      Required = True
    end
    object tbFinalizadorF_DATACAD: TDateField
      FieldName = 'F_DATACAD'
      Origin = 'F_DATACAD'
      Required = True
    end
  end
  object dstbUsuario: TDataSource
    DataSet = tbUsuario
    Left = 184
    Top = 200
  end
  object dstbFinalizador: TDataSource
    DataSet = tbFinalizador
    Left = 280
    Top = 200
  end
  object queryUsuario: TFDQuery
    Active = True
    Connection = ConexaoMySql
    SQL.Strings = (
      'SELECT * FROM USUARIO')
    Left = 208
    Top = 337
    object queryUsuarioU_CODIGO: TFDAutoIncField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 5
      FieldName = 'U_CODIGO'
      Origin = 'U_CODIGO'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object queryUsuarioU_PESSOA: TStringField
      DisplayLabel = 'Nome Pessoa'
      DisplayWidth = 35
      FieldName = 'U_PESSOA'
      Origin = 'U_PESSOA'
      Required = True
      Size = 50
    end
    object queryUsuarioU_NOMEUSUARIO: TStringField
      DisplayLabel = 'Nome Usu'#225'rio'
      DisplayWidth = 25
      FieldName = 'U_NOMEUSUARIO'
      Origin = 'U_NOMEUSUARIO'
      Required = True
      Size = 50
    end
    object queryUsuarioU_SENHA: TStringField
      FieldName = 'U_SENHA'
      Origin = 'U_SENHA'
      Required = True
      Visible = False
      Size = 10
    end
    object queryUsuarioU_DATACAD: TDateField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'U_DATACAD'
      Origin = 'U_DATACAD'
      Required = True
    end
  end
  object queryFinalizador: TFDQuery
    Active = True
    Connection = ConexaoMySql
    SQL.Strings = (
      'SELECT * FROM FINALIZADOR')
    Left = 309
    Top = 337
    object queryFinalizadorF_CODIGO: TFDAutoIncField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 5
      FieldName = 'F_CODIGO'
      Origin = 'F_CODIGO'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object queryFinalizadorF_DESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 40
      FieldName = 'F_DESCRICAO'
      Origin = 'F_DESCRICAO'
      Required = True
    end
    object queryFinalizadorF_DATACAD: TDateField
      DisplayLabel = 'Data Cadastro'
      DisplayWidth = 20
      FieldName = 'F_DATACAD'
      Origin = 'F_DATACAD'
      Required = True
    end
  end
  object dsqueryUsuario: TDataSource
    DataSet = queryUsuario
    Left = 206
    Top = 426
  end
  object dsqueryFinalizador: TDataSource
    DataSet = queryFinalizador
    Left = 310
    Top = 426
  end
end
