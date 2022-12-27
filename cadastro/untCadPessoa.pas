unit untCadPessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.Buttons;

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
    edtCpfCnpj: TEdit;
    panelCabecalho: TPanel;
    lblCabecalho: TLabel;
    imgCabecalho: TImage;
    edtTelefone: TEdit;
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
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadPessoa: TfrmCadPessoa;

implementation

{$R *.dfm}

procedure TfrmCadPessoa.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=(VK_ESCAPE) then
  begin
    Close;
  end;
end;

end.
