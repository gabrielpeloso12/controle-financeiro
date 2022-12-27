unit untCadUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmCadUsuario = class(TForm)
    btnNovo: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnEditar: TSpeedButton;
    btnExcluir: TSpeedButton;
    edtCodigo: TEdit;
    lblCodigo: TLabel;
    lblDescFuncao: TLabel;
    edtNomeUsuario: TEdit;
    btnPesquisar: TSpeedButton;
    panelCabecalho: TPanel;
    lblCabecalho: TLabel;
    imgCabecalho: TImage;
    lblPessoa: TLabel;
    cbPessoa: TComboBox;
    lblSenha: TLabel;
    edtSenha: TEdit;
    imgClient: TImage;
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
    procedure limparCampos;
    procedure desabilitaEdit;
    procedure habilitaEdit;
    procedure associarCamposTbUsuario;
    procedure carregarCbPessoa;
  end;

var
  frmCadUsuario: TfrmCadUsuario;

implementation

{$R *.dfm}

uses untConsultaUsuario, untModuloDados;


procedure TfrmCadUsuario.associarCamposTbUsuario;
begin
  DM.tbUsuario.FieldByName('U_PESSOA').Value := cbPessoa.Text;
  DM.tbUsuario.FieldByName('U_NOMEUSUARIO').Value := edtNomeUsuario.Text;
  DM.tbUsuario.FieldByName('U_SENHA').Value := edtSenha.Text;
  DM.tbUsuario.FieldByName('U_DATACAD').Value := Date;
end;


procedure TfrmCadUsuario.carregarCbPessoa;
begin
  With DM.tbPessoa do
  begin
    Active := False;
    Active := True;
    if not IsEmpty then
    begin
      while not eof do
      begin
        cbPessoa.Items.Add(FieldByName('P_NOME').AsString);
        Next;
      end;
    end;
  end;

end;


procedure TfrmCadUsuario.habilitaEdit;
begin
  cbPessoa.Enabled := True;
  edtNomeUsuario.Enabled := True;
  edtSenha.Enabled := True;
end;


procedure TfrmCadUsuario.limparCampos;
begin
  cbPessoa.Text := '';
  edtNomeUsuario.Text := '';
  edtSenha.Text := '';
end;


procedure TfrmCadUsuario.desabilitaEdit;
begin
  cbPessoa.Enabled := False;
  edtNomeUsuario.Enabled := False;
  edtSenha.Enabled := False;
end;


procedure TfrmCadUsuario.btnEditarClick(Sender: TObject);
begin
  if (cbPessoa.Text <> '') and (edtNomeUsuario.Text <> '') and (edtSenha.Text <> '')  then
  begin
    DM.queryUsuario.Close;
    DM.queryUsuario.SQL.Clear;
    DM.queryUsuario.SQL.Add('UPDATE USUARIO SET U_PESSOA = :U_PESSOA, U_NOMEUSUARIO = :U_NOMEUSUARIO, U_SENHA = :U_SENHA, U_DATACAD = CURDATE() WHERE U_CODIGO = :U_CODIGO');
    DM.queryUsuario.ParamByName('U_CODIGO').Value := edtCodigo.Text;
    DM.queryUsuario.ParamByName('U_PESSOA').Value := cbPessoa.Text;
    DM.queryUsuario.ParamByName('U_NOMEUSUARIO').Value := edtNomeUsuario.Text;
    DM.queryUsuario.ParamByName('U_SENHA').Value := edtSenha.Text;
    DM.queryUsuario.ExecSQL;
    MessageDlg('Alterado com sucesso', mtConfirmation, [mbOK], 0);
    limparCampos;
    desabilitaEdit;
    btnEditar.Enabled := False;
    btnExcluir.Enabled := False;
  end
  else
  begin
    MessageDlg('Preencha todos os campos ou selecione registro a ser alterado', mtInformation, [mbOK], 0);
  end;
end;


procedure TfrmCadUsuario.btnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Deseja deletar o registro ?', mtConfirmation, [mbNo, mbYes], 0) = mrYes then
  begin
    if not (edtCodigo.Text = '') then
    begin
      DM.queryUsuario.Close;
      DM.queryUsuario.SQL.Clear;
      DM.queryUsuario.SQL.Add('DELETE FROM USUARIO WHERE U_CODIGO = :U_CODIGO');
      DM.queryUsuario.ParamByName('U_CODIGO').Value := StrToInt(edtCodigo.Text);
      DM.queryUsuario.Execute;
      MessageDlg('Usu�rio deletado com sucesso', mtInformation, [mbOK], 0);
      limparCampos;
      desabilitaEdit;
      btnEditar.Enabled := False;
      btnExcluir.Enabled := False;
      btnNovo.Enabled := True;
    end
    else
    begin
      MessageDlg('Selecione o usu�rio a ser deletado', mtInformation, [mbOK], 0);
    end;
  end;
end;

procedure TfrmCadUsuario.btnNovoClick(Sender: TObject);
begin
  habilitaEdit;
  btnSalvar.Enabled := True;
end;


procedure TfrmCadUsuario.btnPesquisarClick(Sender: TObject);
begin
  frmConsultaUsuario := TfrmConsultaUsuario.Create(Self);
  frmConsultaUsuario.Show;
end;


procedure TfrmCadUsuario.btnSalvarClick(Sender: TObject);
begin
  if (cbPessoa.Text <> '') and (edtNomeUsuario.Text <> '') and (edtSenha.Text <> '')  then
  begin
    DM.tbUsuario.Insert;
    associarCamposTbUsuario;
    DM.tbUsuario.Post;
    MessageDlg('Usu�rio criado com sucesso.', mtConfirmation, [mbOK], 0);
    btnSalvar.Enabled := False;
    limparCampos;
    desabilitaEdit;
  end
  else
  begin
    MessageDlg('Preencha todos os campos.', mtWarning, [mbOK], 0);
  end;

end;

procedure TfrmCadUsuario.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=(VK_ESCAPE) then
  begin
    Close;
  end;
end;


procedure TfrmCadUsuario.FormShow(Sender: TObject);
begin
  carregarCbPessoa;
  desabilitaEdit;
end;

end.
