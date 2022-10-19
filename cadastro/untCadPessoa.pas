unit untCadPessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.Buttons, Vcl.Mask;

type
  TfrmCadPessoa = class(TForm)
    lblCodigo: TLabel;
    lblNomePessoa: TLabel;
    lblIdade: TLabel;
    lblTelefone: TLabel;
    lblEmail: TLabel;
    lblCpfCnpj: TLabel;
    lblSexo: TLabel;
    lblEndereco: TLabel;
    lblBairro: TLabel;
    lblNumero: TLabel;
    lblFuncao: TLabel;
    edtCodigo: TEdit;
    edtNomePessoa: TEdit;
    edtIdade: TEdit;
    edtEmail: TEdit;
    panelCabecalho: TPanel;
    lblCabecalho: TLabel;
    imgCabecalho: TImage;
    cbFuncao: TComboBox;
    cbSexo: TComboBox;
    edtEndereco: TEdit;
    edtBairro: TEdit;
    edtNumero: TEdit;
    btnNovo: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnEditar: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnPesquisar: TSpeedButton;
    imgClient: TImage;
    edtTelefone: TMaskEdit;
    edtCpfCnpj: TMaskEdit;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);


  private
    { Private declarations }


  public
    { Public declarations }
    procedure carregaCargoCb;
    procedure associarCamposTbPessoas;
    procedure limpaCamposEdit;
    procedure desabilitarEdit;
    procedure habilitaEdit;

  end;

var
  frmCadPessoa: TfrmCadPessoa;

implementation

{$R *.dfm}

uses untModuloDados, untConsultaPessoa;


//LIMPA OS EDIT EVITANDO VIR SUJEIRO NO MOMENTO DE GRAVAR NO BANCO DE DADOS
procedure TfrmCadPessoa.limpaCamposEdit;
begin
  edtCodigo.Text := '';
  edtNomePessoa.Text := '';
  edtIdade.Text := '';
  edtEmail.Text := '';
  edtTelefone.Text := '';
  edtCpfCnpj.Text := '';
  edtEndereco.Text := '';
  edtBairro.Text := '';
  edtNumero.Text := '';
  cbFuncao.Text := '';
  cbSexo.Text := '';
end;


//CARREGA TODOS CARGO CADASTRADO NO COMBO BOX
procedure TfrmCadPessoa.carregaCargoCb;
begin
  With DM.tbCargo do
  begin
    Active := False;
    Active := True;
    if not isEmpty then
    begin
      while not Eof do
      begin
        cbFuncao.Items.Add(FieldByName('C_DESCRICAO').AsString);
        Next;
      end;
    end;
  end;
end;


//DESABILITA O EDIT QUANDO DADO UM SHOW NO FORM, AO SALVAR OU EDITAR
procedure TfrmCadPessoa.desabilitarEdit;
begin
  edtNomePessoa.Enabled := False;
  edtIdade.Enabled := False;
  edtEmail.Enabled := False;
  edtTelefone.Enabled := False;
  edtCpfCnpj.Enabled := False;
  cbFuncao.Enabled := False;
  cbSexo.Enabled := False;
  edtEndereco.Enabled := False;
  edtBairro.Enabled := False;
  edtNumero.Enabled := False;
end;


//HABILITA O EDIT QUANDO DADO UM CLIQUE NO BOT�O NOVO
procedure TfrmCadPessoa.habilitaEdit;
begin
  edtNomePessoa.Enabled := True;
  edtIdade.Enabled := True;
  edtEmail.Enabled := True;
  edtTelefone.Enabled := True;
  edtCpfCnpj.Enabled := True;
  cbFuncao.Enabled := True;
  cbSexo.Enabled := True;
  edtEndereco.Enabled := True;
  edtBairro.Enabled := True;
  edtNumero.Enabled := True;
end;


//ASSOCIA TODOS DADOS DOS CAMPOS COM OS CAMPOS DA TABELA PESSOA
procedure TfrmCadPessoa.associarCamposTbPessoas;
begin
  DM.tbPessoa.FieldByName('P_NOME').Value := edtNomePessoa.Text;
  DM.tbPessoa.FieldByName('P_IDADE').Value := StrToInt(edtIdade.Text);
  DM.tbPessoa.FieldByName('P_TELEFONE').Value := edtTelefone.Text;
  DM.tbPessoa.FieldByName('P_EMAIL').Value := edtEmail.Text;
  DM.tbPessoa.FieldByName('P_CPFCNPJ').Value := edtCpfCnpj.Text;
  DM.tbPessoa.FieldByName('P_SEXO').Value := cbSexo.Text;
  DM.tbPessoa.FieldByName('P_ENDERECO').Value := edtEndereco.Text;
  DM.tbPessoa.FieldByName('P_BAIRRO').Value := edtBairro.Text;
  DM.tbPessoa.FieldByName('P_NUMERO').Value := StrToInt(edtNumero.Text);
  DM.tbPessoa.FieldByName('P_CARGO').Value := cbFuncao.Text;
end;


procedure TfrmCadPessoa.btnEditarClick(Sender: TObject);
begin
  DM.tbPessoa.Edit;
  if not (edtNomePessoa.Text = '') then
  begin
    associarCamposTbPessoas;
    DM.queryPessoa.Close;
    DM.queryPessoa.SQL.Clear;
    DM.queryPessoa.SQL.Add ('UPDATE PESSOA SET P_NOME = :P_NOME, P_IDADE = :P_IDADE, P_TELEFONE = :P_TELEFONE, P_EMAIL = :P_EMAIL,');
    DM.queryPessoa.SQL.Add ('P_CPFCNPJ = :P_CPFCNPJ, P_SEXO = :P_SEXO, P_CARGO = :P_CARGO, P_ENDERECO = :P_ENDERECO,');
    DM.queryPessoa.SQL.Add ('P_BAIRRO = :P_BAIRRO, P_NUMERO = :P_NUMERO, P_DATACAD = CURDATE() WHERE P_CODIGO = :P_CODIGO');
    DM.queryPessoa.ParamByName('P_CODIGO').Value := edtCodigo.Text;
    DM.queryPessoa.ParamByName('P_NOME').Value := edtNomePessoa.Text;
    DM.queryPessoa.ParamByName('P_IDADE').Value := StrToInt(edtIdade.Text);
    DM.queryPessoa.ParamByName('P_TELEFONE').Value := edtTelefone.Text;
    DM.queryPessoa.ParamByName('P_EMAIL').Value := edtEmail.Text;
    DM.queryPessoa.ParamByName('P_CPFCNPJ').Value := edtCpfCnpj.Text;
    DM.queryPessoa.ParamByName('P_SEXO').Value := cbSexo.Text;
    DM.queryPessoa.ParamByName('P_CARGO').Value := cbFuncao.Text;
    DM.queryPessoa.ParamByName('P_ENDERECO').Value := edtEndereco.Text;
    DM.queryPessoa.ParamByName('P_BAIRRO').Value := edtBairro.Text;
    DM.queryPessoa.ParamByName('P_NUMERO').Value := StrToInt(edtNumero.Text);
    DM.queryPessoa.ExecSQL;
    MessageDlg('Alterado com sucesso', mtConfirmation, [mbOK], 0);
    limpaCamposEdit;
    btnEditar.Enabled := False;
    btnExcluir.Enabled := False;
    btnNovo.Enabled := True;
  end
  else
  begin
    MessageDlg('Selecione um registro a ser alterado', mtInformation, [mbOK], 0);
  end;

end;

procedure TfrmCadPessoa.btnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Deseja deletar o registro', mtConfirmation, [mbNo, mbYes], 0) = mrYes then
  begin
    if not (edtCodigo.Text = '') then
    begin
      DM.queryPessoa.Close;
      DM.queryPessoa.SQL.Clear;
      DM.queryPessoa.SQL.Add ('DELETE FROM PESSOA WHERE P_CODIGO = :P_CODIGO');
      DM.queryPessoa.ParamByName('P_CODIGO').Value := StrToInt(edtCodigo.Text);
      DM.queryPessoa.Execute;
      MessageDlg('Pessoa deletada com sucesso', mtConfirmation, [mbOK], 0);
      limpaCamposEdit;
      desabilitarEdit;
      btnEditar.Enabled := False;
      btnExcluir.Enabled := False;
      btnNovo.Enabled := True;
    end
    else
    begin
      MessageDlg('Seleciona uma pessoa a ser deletada', mtConfirmation, [mbOK], 0);
    end;
  end;

end;

procedure TfrmCadPessoa.btnNovoClick(Sender: TObject);
begin
  btnSalvar.Enabled := True;
  habilitaEdit;
  limpaCamposEdit;
end;

procedure TfrmCadPessoa.btnPesquisarClick(Sender: TObject);
begin
  limpaCamposEdit;
  desabilitarEdit;
  frmConsultaPessoa := TfrmConsultaPessoa.Create(Self);
  frmConsultaPessoa.Show;
end;


procedure TfrmCadPessoa.btnSalvarClick(Sender: TObject);
begin
  if not (edtNomePessoa.Text = '') then
  begin
    DM.tbPessoa.Insert;
    associarCamposTbPessoas;
    DM.tbPessoa.FieldByName('P_DATACAD').Value := Date;
    DM.tbPessoa.Post;
    MessageDlg('Salvo com sucesso', mtConfirmation, [mbOK], 0);
    btnSalvar.Enabled := False;
    limpaCamposEdit;
    desabilitarEdit;
  end
  else
  begin
    MessageDlg('Preencha os campos necess�rios, Nome e Cargo', mtInformation, [mbOK], 0);
    edtNomePessoa.SetFocus;
  end;

end;

procedure TfrmCadPessoa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=(VK_ESCAPE) then
  begin
    Close;
  end;
end;


procedure TfrmCadPessoa.FormShow(Sender: TObject);
begin
  carregaCargoCb;
  desabilitarEdit;
end;


end.
