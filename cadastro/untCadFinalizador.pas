unit untCadFinalizador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmCadFinalizador = class(TForm)
    panelCabecalho: TPanel;
    lblCabecalho: TLabel;
    imgCabecalho: TImage;
    btnNovo: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnEditar: TSpeedButton;
    btnExcluir: TSpeedButton;
    edtDescReceita: TEdit;
    edtCodigo: TEdit;
    btnPesquisar: TSpeedButton;
    lblCodigo: TLabel;
    lblDescricao: TLabel;
    imgClient: TImage;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);

  private
    { Private declarations }

  public
    { Public declarations }

  end;

var
  frmCadFinalizador: TfrmCadFinalizador;

implementation

{$R *.dfm}

uses untConsultaFinalizador, untModuloDados;

procedure TfrmCadFinalizador.btnEditarClick(Sender: TObject);
begin
  if not (edtDescReceita.Text = '') then
  begin
    DM.queryFinalizador.Close;
    DM.queryFinalizador.SQL.Clear;
    DM.queryFinalizador.SQL.Add('UPDATE FINALIZADOR SET F_DESCRICAO = :F_DESCRICAO WHERE F_CODIGO = :F_CODIGO');
    DM.queryFinalizador.ParamByName('F_CODIGO').Value := edtCodigo.Text;
    DM.queryFinalizador.ParamByName('F_DESCRICAO').Value := edtDescReceita.Text;
    DM.queryFinalizador.ExecSQL;
    MessageDlg('Alterado com sucesso.', mtInformation, [mbOK], 0);
    btnEditar.Enabled := False;
    btnExcluir.Enabled := False;
    edtDescReceita.Text := '';
    edtDescReceita.Enabled := False;
  end
  else
  begin
    MessageDlg('Preencha o campo ou selecione um registro a ser alterado.', mtInformation, [mbOK], 0);
  end;
end;


procedure TfrmCadFinalizador.btnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Deseja deletar o registro ?', mtConfirmation, [mbNo, mbYes], 0) = mrYes then
  begin
    if not (edtCodigo.Text = '') then
    begin
      DM.queryFinalizador.Close;
      DM.queryFinalizador.SQL.Clear;
      DM.queryFinalizador.SQL.Add('DELETE FROM FINALIZADOR WHERE F_CODIGO = :F_CODIGO');
      DM.queryFinalizador.ParamByName('F_CODIGO').Value := StrToInt(edtCodigo.Text);
      DM.queryFinalizador.Execute;
      MessageDlg('Finalizador deletado com sucesso.', mtInformation, [mbOK], 0);
      btnEditar.Enabled := False;
      btnExcluir.Enabled := False;
      edtDescReceita.Text := '';
      edtDescReceita.Enabled := False;
    end;
  end
  else
  begin

  end;
end;


procedure TfrmCadFinalizador.btnNovoClick(Sender: TObject);
begin
  btnSalvar.Enabled := True;
  edtDescReceita.Text := '';
  edtDescReceita.Enabled := True;
  edtDescReceita.SetFocus;
end;


procedure TfrmCadFinalizador.btnPesquisarClick(Sender: TObject);
begin
  frmConsultaFinalizador := TfrmConsultaFinalizador.Create(Self);
  frmConsultaFinalizador.Show;
end;


procedure TfrmCadFinalizador.btnSalvarClick(Sender: TObject);
begin
  if not (edtDescReceita.Text = '') then
  begin
    DM.tbFinalizador.Insert;
    DM.tbFinalizador.FieldByName('F_DESCRICAO').Value := edtDescReceita.Text;
    DM.tbFinalizador.FieldByName('F_DATACAD').Value := Date;
    DM.tbFinalizador.Post;
    MessageDlg('Finalizador criado com sucesso.', mtConfirmation, [mbOK], 0);
    btnSalvar.Enabled := False;
    edtDescReceita.Text := '';
    edtDescReceita.Enabled := False;
  end
  else
  begin
    MessageDlg('Preencha a descri��o do finalizador.', mtInformation, [mbOK], 0);
    edtDescReceita.SetFocus;
  end;
end;


procedure TfrmCadFinalizador.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=(VK_ESCAPE) then
  begin
    Close;
  end;
end;


procedure TfrmCadFinalizador.FormShow(Sender: TObject);
begin
  edtDescReceita.Enabled := False;
end;

end.
