unit untCadReceitaMensal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.Buttons;

type
  TfrmCadReceitaMensal = class(TForm)
    lblCodigo: TLabel;
    lblDescricao: TLabel;
    lblValor: TLabel;
    lblCltPj: TLabel;
    lblEmpresa: TLabel;
    panelCabecalho: TPanel;
    lblCabecalho: TLabel;
    imgCabecalho: TImage;
    edtCodigo: TEdit;
    edtDescReceita: TEdit;
    edtValor: TEdit;
    edtEmpresa: TEdit;
    cbCltPj: TComboBox;
    btnNovo: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnEditar: TSpeedButton;
    btnExcluir: TSpeedButton;
    imgClient: TImage;
    btnPesquisar: TSpeedButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadReceitaMensal: TfrmCadReceitaMensal;

implementation

{$R *.dfm}

procedure TfrmCadReceitaMensal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=(VK_ESCAPE) then
  begin
    Close;
  end;
end;

end.
