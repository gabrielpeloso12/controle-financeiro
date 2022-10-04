unit untCadFuncao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TfrmCadFuncao = class(TForm)
    btnNovo: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnEditar: TSpeedButton;
    btnExcluir: TSpeedButton;
    edtCodigo: TEdit;
    lblCodigo: TLabel;
    lblDescFuncao: TLabel;
    edtDescFuncao: TEdit;
    btnPesquisar: TSpeedButton;
    panelCabecalho: TPanel;
    lblCabecalho: TLabel;
    imgCabecalho: TImage;
    imgClient: TImage;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadFuncao: TfrmCadFuncao;

implementation

{$R *.dfm}

procedure TfrmCadFuncao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=(VK_ESCAPE) then
  begin
    Close;
  end;
end;

end.
