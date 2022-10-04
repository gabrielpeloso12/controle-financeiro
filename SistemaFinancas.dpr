program SistemaFinancas;

uses
  Vcl.Forms,
  untTelaLogin in 'untTelaLogin.pas' {frmLogin},
  untPrincipal in 'untPrincipal.pas' {frmTelaMenu},
  untDM in 'untDM.pas' {frmDM: TDataModule},
  untCadPrincipal in 'cadastro\untCadPrincipal.pas' {frmCadPrincipal},
  untRelPrincipal in 'relatorio\untRelPrincipal.pas' {frmRelPrincipal},
  untCadPessoa in 'cadastro\untCadPessoa.pas' {frmCadPessoa},
  untCadUsuario in 'cadastro\untCadUsuario.pas' {frmCadUsuario},
  untCadReceitaMensal in 'cadastro\untCadReceitaMensal.pas' {frmCadReceitaMensal},
  untCadFinalizador in 'cadastro\untCadFinalizador.pas' {frmCadFinalizador},
  untRelUsuario in 'relatorio\untRelUsuario.pas' {Form1},
  untRelFinalizador in 'relatorio\untRelFinalizador.pas' {Form2},
  untRelReceita in 'relatorio\untRelReceita.pas' {Form3},
  untRelContaPagar in 'relatorio\untRelContaPagar.pas' {Form4},
  untCadContaMensal in 'cadastro\untCadContaMensal.pas' {frmCadContaMensal},
  untCadFuncao in 'cadastro\untCadFuncao.pas' {frmCadFuncao};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmTelaMenu, frmTelaMenu);
  Application.CreateForm(TfrmDM, frmDM);
  Application.CreateForm(TfrmCadPrincipal, frmCadPrincipal);
  Application.CreateForm(TfrmRelPrincipal, frmRelPrincipal);
  Application.CreateForm(TfrmCadPessoa, frmCadPessoa);
  Application.CreateForm(TfrmCadUsuario, frmCadUsuario);
  Application.CreateForm(TfrmCadReceitaMensal, frmCadReceitaMensal);
  Application.CreateForm(TfrmCadFinalizador, frmCadFinalizador);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TfrmCadContaMensal, frmCadContaMensal);
  Application.CreateForm(TfrmCadFuncao, frmCadFuncao);
  Application.Run;
end.
