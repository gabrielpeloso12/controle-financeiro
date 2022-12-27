unit untConsultaPessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmConsultaPessoa = class(TForm)
    panelCabecalho: TPanel;
    lblCabecalho: TLabel;
    imgCabecalho: TImage;
    dbPessoa: TDBGrid;
    procedure dbPessoaDblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaPessoa: TfrmConsultaPessoa;

implementation

{$R *.dfm}

uses untModuloDados, untCadPessoa;

procedure TfrmConsultaPessoa.dbPessoaDblClick(Sender: TObject);
begin
  frmCadPessoa.btnEditar.Enabled := True;
  frmCadPessoa.btnExcluir.Enabled := True;
  frmCadPessoa.habilitaEdit;
  frmCadPessoa.btnNovo.Enabled := False;
  frmCadPessoa.btnSalvar.Enabled := False;

  if DM.queryPessoa.FieldByName('P_CODIGO').Value <> null then
  frmCadPessoa.edtCodigo.Text := IntToStr(DM.queryPessoa.FieldByName('P_CODIGO').Value);

  if DM.queryPessoa.FieldByName('P_NOME').Value <> null then
  frmCadPessoa.edtNomePessoa.Text := DM.queryPessoa.FieldByName('P_NOME').Value;

  if DM.queryPessoa.FieldByName('P_IDADE').Value <> null then
  frmCadPessoa.edtIdade.Text := IntToStr(DM.queryPessoa.FieldByName('P_IDADE').Value);

  if DM.queryPessoa.FieldByName('P_TELEFONE').Value <> null then
  frmCadPessoa.edtTelefone.Text := DM.queryPessoa.FieldByName('P_TELEFONE').Value;

  if DM.queryPessoa.FieldByName('P_EMAIL').Value <> null then
  frmCadPessoa.edtEmail.Text := DM.queryPessoa.FieldByName('P_EMAIL').Value;

  if DM.queryPessoa.FieldByName('P_CPFCNPJ').Value <> null then
  frmCadPessoa.edtCpfCnpj.Text := DM.queryPessoa.FieldByName('P_CPFCNPJ').Value;

  if DM.queryPessoa.FieldByName('P_SEXO').Value <> null then
  frmCadPessoa.cbSexo.Text := DM.queryPessoa.FieldByName('P_SEXO').Value;

  if DM.queryPessoa.FieldByName('P_CARGO').Value <> null then
  frmCadPessoa.cbFuncao.Text := DM.queryPessoa.FieldByName('P_CARGO').Value;

  if DM.queryPessoa.FieldByName('P_ENDERECO').Value <> null then
  frmCadPessoa.edtEndereco.Text := DM.queryPessoa.FieldByName('P_ENDERECO').Value;

  if DM.queryPessoa.FieldByName('P_BAIRRO').Value <> null then
  frmCadPessoa.edtBairro.Text := DM.queryPessoa.FieldByName('P_BAIRRO').Value;

  if DM.queryPessoa.FieldByName('P_NUMERO').Value <> null then
  frmCadPessoa.edtNumero.Text := IntToStr(DM.queryPessoa.FieldByName('P_NUMERO').Value);

  Close;
end;

procedure TfrmConsultaPessoa.FormActivate(Sender: TObject);
begin
  DM.queryPessoa.Close;
  DM.queryPessoa.SQL.Clear;
  DM.queryPessoa.SQL.Add('SELECT * FROM PESSOA ORDER BY P_CODIGO ASC');
  DM.queryPessoa.Open;
end;

end.
