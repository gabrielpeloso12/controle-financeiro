unit untCargo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmCargo = class(TForm)
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    edtCodigo: TEdit;
    edtNome: TEdit;
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    procedure associarCampos;
  public
    { Public declarations }
  end;

var
  frmCargo: TfrmCargo;

implementation

{$R *.dfm}

uses untDM;

procedure TfrmCargo.associarCampos;
begin
  frmDM.tbFuncao.FieldByName('F_CODIGO').Value := StrToInt(edtCodigo.Text);
  frmDM.tbFuncao.FieldByName('F_FUNCAO').Value := edtNome.Text;
end;

procedure TfrmCargo.SpeedButton1Click(Sender: TObject);
begin
  if (edtCodigo.Text <> '')  then
  begin
    frmDM.tbFuncao.Insert;
    associarCampos;
    frmDM.tbFuncao.FieldByName('F_DATA').Value := Date;
    frmDM.tbFuncao.Post;
    MessageDlg ('Salvo com Sucesso', mtInformation, [MBOk], 0);
  end
  else
  begin
    MessageDlg ('Preencha os campos', mtInformation, [MBOk], 0);
    edtCodigo.SetFocus;
  end;
end;

end.
