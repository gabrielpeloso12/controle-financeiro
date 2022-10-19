unit untPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Menus, Vcl.ToolWin,
  Vcl.ActnMan, Vcl.ActnCtrls, Vcl.ActnMenus, Vcl.Buttons;

type
    TfrmTelaMenu = class(TForm)
    imgFundo: TImage;
    panelCabecalho: TPanel;
    menuAcessos: TMainMenu;
    Cadastro1: TMenuItem;
    FuncionrioUsurio1: TMenuItem;
    Usurio1: TMenuItem;
    ContasaPagar1: TMenuItem;
    ReceitadoMs1: TMenuItem;
    Relatrios1: TMenuItem;
    PessoasUsurio1: TMenuItem;
    ContasaPagar2: TMenuItem;
    ContasaPagar3: TMenuItem;
    Sair1: TMenuItem;
    btnCadastros: TSpeedButton;
    btnRelatorio: TSpeedButton;
    btnSair: TSpeedButton;
    Finalizador1: TMenuItem;
    btnTrocarUsuario: TSpeedButton;
    Finalizadores1: TMenuItem;
    Funo1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCadastrosClick(Sender: TObject);
    procedure btnRelatorioClick(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure btnTrocarUsuarioClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FuncionrioUsurio1Click(Sender: TObject);
    procedure Funo1Click(Sender: TObject);
    procedure Usurio1Click(Sender: TObject);
    procedure ContasaPagar1Click(Sender: TObject);
    procedure Finalizador1Click(Sender: TObject);
    procedure ReceitadoMs1Click(Sender: TObject);
private
    { Private declarations }

public
    { Public declarations }
  function ConverterRGB(r, g, b : Byte) : TColor;
end;

var
  frmTelaMenu: TfrmTelaMenu;

implementation

{$R *.dfm}

uses untCadPrincipal,untRelPrincipal, untTelaLogin, untCadContaMensal,
  untCadFinalizador, untCadFuncao, untCadPessoa, untCadReceitaMensal,
  untCadUsuario, untRelContaPagar, untRelFinalizador, untRelReceita,
  untRelUsuario;


procedure TfrmTelaMenu.btnCadastrosClick(Sender: TObject);
begin
  frmCadPrincipal := TFrmCadPrincipal.Create (Self);
  frmCadPrincipal.Show;
end;


procedure TfrmTelaMenu.btnRelatorioClick(Sender: TObject);
begin
  frmRelPrincipal := TfrmRelPrincipal.Create (Self);
  frmRelPrincipal.Show;
end;


procedure TfrmTelaMenu.btnSairClick(Sender: TObject);
begin
  if MessageDlg ('Deseja fechar o Sistema ?', mtConfirmation, [MBYes, MBNo], 0) = mrYes then
  begin
  Application.Terminate;
  end;
end;


procedure TfrmTelaMenu.btnTrocarUsuarioClick(Sender: TObject);
begin
  frmLogin := TfrmLogin.Create (Self);
  frmLogin.Show;
    frmTelaMenu.Hide;
end;


procedure TfrmTelaMenu.ContasaPagar1Click(Sender: TObject);
begin
  frmCadReceitaMensal := TfrmCadReceitaMensal.Create(Self);
  frmCadReceitaMensal.Show;
end;

function TfrmTelaMenu.ConverterRGB(r, g, b: Byte): TColor;
begin
  Result := RGB(r, g, b);
end;


procedure TfrmTelaMenu.Finalizador1Click(Sender: TObject);
begin
  frmCadFinalizador := TfrmCadFinalizador.Create(Self);
  frmCadFinalizador.Show;
end;

procedure TfrmTelaMenu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if MessageDlg ('Deseja fechar o Sistema ?', mtConfirmation, [MBYes, MBNo], 0) = mrYes then
  begin
    Application.Terminate;
  end;
end;


procedure TfrmTelaMenu.FormShow(Sender: TObject);
begin
  panelCabecalho.Color := ConverterRGB (220, 220, 220);
end;


procedure TfrmTelaMenu.FuncionrioUsurio1Click(Sender: TObject);
begin
  frmCadPessoa := TfrmCadPessoa.Create(Self);
  frmCadPessoa.Show;
end;

procedure TfrmTelaMenu.Funo1Click(Sender: TObject);
begin
  frmCadFuncao := TfrmCadFuncao.Create(Self);
  frmCadFuncao.Show;
end;

procedure TfrmTelaMenu.ReceitadoMs1Click(Sender: TObject);
begin
  frmCadContaMensal := TfrmCadContaMensal.Create(Self);
  frmCadContaMensal.Show;
end;

procedure TfrmTelaMenu.Sair1Click(Sender: TObject);
begin
  if MessageDlg ('Deseja fechar o Sistema ?', mtConfirmation, [MBYes, MBNo], 0) = mrYes then
  begin
    Application.Terminate;
  end;
end;

procedure TfrmTelaMenu.Usurio1Click(Sender: TObject);
begin
  frmCadUsuario := TfrmCadUsuario.Create(Self);
  frmCadUsuario.Show;
end;

end.
