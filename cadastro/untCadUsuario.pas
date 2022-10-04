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
    edtDescFuncao: TEdit;
    btnPesquisar: TSpeedButton;
    panelCabecalho: TPanel;
    lblCabecalho: TLabel;
    imgCabecalho: TImage;
    lblPessoa: TLabel;
    cbPessoa: TComboBox;
    imgClient: TImage;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadUsuario: TfrmCadUsuario;

implementation

{$R *.dfm}

procedure TfrmCadUsuario.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=(VK_ESCAPE) then
  begin
    Close;
  end;
end;

end.