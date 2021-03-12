unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, IdIOHandler, IdIOHandlerSocket, IdSSLOpenSSL;

type
  TForm1 = class(TForm)
    Button1: TButton;
    IdHTTP1: TIdHTTP;
    procedure Button1Click(Sender: TObject);

  private
    { Private declarations }
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
 var
  s: String;
  Resp_Json: string;
  Req_Json:TStream;

begin

    try
        s:='cod=codDoProduto';
        s:=s+'&price=PrecoDoproduto';
        s:=s+'&token=tokenDoMercadoLimit255';
        Req_Json:=TstringStream.Create(s);
        Req_Json.Position:=0;
        IdHTTP1.Request.UserAgent:='Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36';
        IdHTTP1.Request.Accept := 'application/json, text/javascript, */*; q=0.01';
        IdHTTP1.Request.ContentType := 'application/x-www-form-urlencoded; charset=UTF-8';
        Resp_Json:=IdHTTP1.Post('http://painel.himarket.com.br/integration/api', Req_Json);
    finally
        Req_Json.Free;
    end;
           //continua o seu fluxo normal independete.
           //DMconecao.tabela.post;
           //se quiser verificar o server devolve um json com {msg:'success'} ou error  de qualqer maneira para n parar o fluxo principal o status da reposta sera 202
end;

end.



