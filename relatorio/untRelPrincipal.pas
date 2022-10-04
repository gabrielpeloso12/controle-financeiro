unit untRelPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmRelPrincipal = class(TForm)
    btnRelUsuarios: TSpeedButton;
    btnRelContasPagar: TSpeedButton;
    btnRelReceitas: TSpeedButton;
    btnRelFinalizadores: TSpeedButton;
    imgFundo: TImage;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelPrincipal: TfrmRelPrincipal;

implementation

{$R *.dfm}

procedure TfrmRelPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=(VK_ESCAPE) then
  begin
    Close;
  end;
end;

end.
