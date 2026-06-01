#include <Servo.h>

Servo servoBraco;
Servo servoGarra;

// LED
const int PINO_LED = 7;

// Posições braço
const int BRACO_BAIXO = 30;
const int BRACO_ALTO = 120;

// Posições garra
const int GARRA_ABERTA = 120;
const int GARRA_FECHADA = 40;

String estadoSistema = "PRONTO";

void setup()
{
  Serial.begin(9600);

  // Servos
  servoBraco.attach(9);
  servoGarra.attach(10);

  // LED
  pinMode(PINO_LED, OUTPUT);

  // Posição inicial
  servoBraco.write(BRACO_BAIXO);
  servoGarra.write(GARRA_ABERTA);

  // TESTE DO LED
  digitalWrite(PINO_LED, HIGH);
  delay(3000);
  digitalWrite(PINO_LED, LOW);

  Serial.println("================================");
  Serial.println("BIO-ORBIT LABS");
  Serial.println("Sistema Robotico Orbital");
  Serial.println("================================");

  Serial.println("Comandos:");
  Serial.println("U = subir braco");
  Serial.println("D = descer braco");
  Serial.println("O = abrir garra");
  Serial.println("C = fechar garra");
  Serial.println("M = modo automatico");
  Serial.println("S = status");
  Serial.println("R = reset");
}

void loop()
{
  if (Serial.available() > 0)
  {
    char comando = Serial.read();

    comando = toupper(comando);

    if (comando == 'U')
    {
      subirBraco();
    }

    else if (comando == 'D')
    {
      descerBraco();
    }

    else if (comando == 'O')
    {
      abrirGarra();
    }

    else if (comando == 'C')
    {
      fecharGarra();
    }

    else if (comando == 'M')
    {
      modoAutomatico();
    }

    else if (comando == 'S')
    {
      mostrarStatus();
    }

    else if (comando == 'R')
    {
      resetarSistema();
    }

    else
    {
      Serial.println("Comando invalido");
      piscarErro();
    }
  }
}

void subirBraco()
{
  servoBraco.write(BRACO_ALTO);

  estadoSistema = "BRACO ELEVADO";

  Serial.println("Braco elevado.");

  piscarLED();
}

void descerBraco()
{
  servoBraco.write(BRACO_BAIXO);

  estadoSistema = "BRACO RECOLHIDO";

  Serial.println("Braco recolhido.");

  piscarLED();
}

void abrirGarra()
{
  servoGarra.write(GARRA_ABERTA);

  estadoSistema = "GARRA ABERTA";

  Serial.println("Garra aberta.");

  piscarLED();
}

void fecharGarra()
{
  servoGarra.write(GARRA_FECHADA);

  estadoSistema = "GARRA FECHADA";

  Serial.println("Garra fechada.");

  piscarLED();
}

void modoAutomatico()
{
  estadoSistema = "MODO AUTOMATICO";

  Serial.println("Iniciando coleta automatica...");

  servoBraco.write(BRACO_ALTO);
  piscarLED();
  delay(1000);

  servoGarra.write(GARRA_ABERTA);
  piscarLED();
  delay(1000);

  servoGarra.write(GARRA_FECHADA);
  piscarLED();
  delay(1000);

  servoBraco.write(BRACO_BAIXO);
  piscarLED();
  delay(1000);

  Serial.println("Coleta finalizada.");

  piscarSucesso();
}

void mostrarStatus()
{
  Serial.print("Status atual: ");
  Serial.println(estadoSistema);

  piscarLED();
}

void resetarSistema()
{
  servoBraco.write(BRACO_BAIXO);

  servoGarra.write(GARRA_ABERTA);

  estadoSistema = "PRONTO";

  Serial.println("Sistema resetado.");

  piscarLED();
}

void piscarLED()
{
  digitalWrite(PINO_LED, HIGH);
  delay(300);
  digitalWrite(PINO_LED, LOW);
}

void piscarSucesso()
{
  for (int i = 0; i < 3; i++)
  {
    digitalWrite(PINO_LED, HIGH);
    delay(200);

    digitalWrite(PINO_LED, LOW);
    delay(200);
  }
}

void piscarErro()
{
  for (int i = 0; i < 5; i++)
  {
    digitalWrite(PINO_LED, HIGH);
    delay(100);

    digitalWrite(PINO_LED, LOW);
    delay(100);
  }
}
