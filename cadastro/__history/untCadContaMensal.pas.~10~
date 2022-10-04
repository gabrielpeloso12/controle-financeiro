unit untCadContaMensal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmCadContaMensal = class(TForm)
    panelCabecalho: TPanel;
    lblCabecalho: TLabel;
    imgCabecalho: TImage;
    btnExcluir: TSpeedButton;
    btnEditar: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnNovo: TSpeedButton;
    edtCodigo: TEdit;
    btnPesquisar: TSpeedButton;
    lblDescricao: TLabel;
    lblCodigo: TLabel;
    edtDescReceita: TEdit;
    lblValor: TLabel;
    lblFinalizador: TLabel;
    lblParcelado: TLabel;
    lblNumParcela: TLabel;
    lblMes: TLabel;
    lblPago: TLabel;
    edtValor: TEdit;
    cbFinalizador: TComboBox;
    cbParcelado: TComboBox;
    edtNumParcela: TEdit;
    cbMes: TComboBox;
    cbPago: TComboBox;
    imgClient: TImage;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadContaMensal: TfrmCadContaMensal;

implementation

{$R *.dfm}

procedure TfrmCadContaMensal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=(VK_ESCAPE) then
  begin
    Close;
  end;
end;

end.
