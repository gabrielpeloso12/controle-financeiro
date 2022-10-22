unit untConsultaUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfrmConsultaUsuario = class(TForm)
    panelCabecalho: TPanel;
    lblCabecalho: TLabel;
    imgCabecalho: TImage;
    dbUsuario: TDBGrid;
    procedure dbUsuarioDblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaUsuario: TfrmConsultaUsuario;

implementation

{$R *.dfm}

uses untCadUsuario, untModuloDados;

procedure TfrmConsultaUsuario.dbUsuarioDblClick(Sender: TObject);
begin
  frmCadUsuario.btnEditar.Enabled := True;
  frmCadUsuario.btnExcluir.Enabled := True;
  frmCadUsuario.habilitaEdit;
  frmCadUsuario.btnNovo.Enabled := False;
  frmCadUsuario.btnSalvar.Enabled := False;;


  if DM.queryUsuario.FieldByName('U_CODIGO').Value <> null then
  frmCadUsuario.edtCodigo.Text := IntToStr(DM.queryUsuario.FieldByName('U_CODIGO').Value);

  if DM.queryUsuario.FieldByName('U_PESSOA').Value <> null then
  frmCadUsuario.cbPessoa.Text := DM.queryUsuario.FieldByName('U_PESSOA').Value;

  if DM.queryUsuario.FieldByName('U_NOMEUSUARIO').Value <> null then
  frmCadUsuario.edtNomeUsuario.Text := DM.queryUsuario.FieldByName('U_NOMEUSUARIO').Value;

  if DM.queryUsuario.FieldByName('U_SENHA').Value <> null then
  frmCadUsuario.edtSenha.Text := DM.queryUsuario.FieldByName('U_SENHA').Value;

  Close;
end;

procedure TfrmConsultaUsuario.FormActivate(Sender: TObject);
begin
  DM.queryUsuario.Close;
  DM.queryUsuario.SQL.Clear;
  DM.queryUsuario.SQL.Add('SELECT * FROM USUARIO ORDER BY U_CODIGO ASC');
  DM.queryUsuario.Open;
end;

end.
