/*Le programme fonctionne correctement
 * mais pb sur PC windows7 : la page affichée par le module tarde longtemps à s'afficher sur le PC
 * les Robot de TSS fonctionnement mais à chaque allumage l'adresse IP du module change !!!!!
 * Il faut donc à chaque fois lancer le moniteur de Arduino pour conna^tre l'adresse Ip du robot.
 * */
 
 #include <ESP8266WiFi.h>
 
const char* ssid = "Lumia_Fab"; // "robotinsa"; //"Freebox-470159"; //"Lumia_Fab"; // //"Lumia_Fab"; //AndroidHotspot8476
const char* password = "RobotFab"; // "robotinsa"; //"polluimur7-imbarbis2!-incitatum-damnaret6"; //"RobotFab"; // .0 "RobotFab"; // 5c017d438093
WiFiServer server(80);


//PWM frequency is 1kHz by default. Call analogWriteFreq(new_frequency) to change the frequency.

#define D0 16
#define D1 5 // I2C Bus SCL (clock)
#define D2 4 // I2C Bus SDA (data)
#define D3 0
#define D4 2 // Same as "LED_BUILTIN", but inverted logic
#define D5 14 // SPI Bus SCK (clock)
#define D6 12 // SPI Bus MISO 
#define D7 13 // SPI Bus MOSI
#define D8 15 // SPI Bus SS (CS)
#define D9 3 // RX0 (Serial console)
#define D10 1 // TX0 (Serial console)
//#define D11 9 // pas de fonctionnement obtenu sur D11, à tester
#define D12 10 // 


const int PWM_A = D7;
const int PWM_B = D12;
const int AIN1 = D6;
const int AIN2 = D5; 
const int BIN1 = D4; // D4 : LED bleue
const int BIN2 = D3;
bool Marche_Avant = true;
int Vitesse_D = 0; // Variable pour la vitesse du moteur Droite
int Vitesse_G = 0; // Variable pour la vitesse du moteur Gauche
//int Vitesse_Avance = 50;
//int Vitesse_Recul = 50;
String Action = "";


void setup() {
  Serial.begin(115200);
  delay(10);
  //PWM frequency is 1kHz by default. Call analogWriteFreq(new_frequency) to change the frequency.
 analogWriteFreq(20000);
 analogWriteRange(255);
  pinMode(PWM_A, OUTPUT); // Vitesse moteur D (M1)
  pinMode(PWM_B, OUTPUT); // Vitesse moteur G (M2)
  pinMode(AIN1, OUTPUT); // Direction moteur D (M1)
  pinMode(AIN2, OUTPUT); // Direction moteur G (M2)
  pinMode(BIN1, OUTPUT);   // 0 pour freinage
  pinMode(BIN2, OUTPUT);   // 0 pour freinage
  
 
  analogWrite(PWM_A, 0); // Arrêt complet moteur 
  analogWrite(PWM_B, 0); // Arrêt complet moteur
  
  digitalWrite(AIN1, LOW);  // pour arrêt robot
  digitalWrite(AIN2, LOW);  // pour arrêt robot
  digitalWrite(BIN1, LOW); // pour arrêt robot
  digitalWrite(BIN2, LOW);  // pour arrêt robot
 
  // Connexion au WiFi
  Serial.println();
  Serial.println();
  Serial.print("Connexion borne wifi : ");
  Serial.println(ssid);
 
  WiFi.begin(ssid, password);
 
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("");
  Serial.println("Connexion WiFi etablie ");
 
  // Demarre le serveur
  server.begin();
  Serial.println("Serveur en marche");
 
  // Donner l'adresse IP
  Serial.print("Adresse IP pour se connecter au Robot : ");
  Serial.print("http://");
  Serial.print(WiFi.localIP());
  Serial.println("/");
 
}
 
void loop() {
  // Vérifier si un client est connecté
  WiFiClient client = server.available();
  if (!client) {
    return;
  }
 
  // attend des données du client
  Serial.println("Nouveau Client");
  while(!client.available()){
    delay(1);
  }
 
  // Lire la première ligne de la requête
  String request = client.readStringUntil('\r');
  Serial.println(request);
  client.flush();
 
  // Identifier la requête
  
  if (request.indexOf("/Av+") > 0)  {
    
      digitalWrite(AIN1, LOW);  // Prépare la marche avant
      digitalWrite(AIN2, HIGH); // Prépare la marche avant
      digitalWrite(BIN1, LOW);  // Prépare la marche avant
      digitalWrite(BIN2, HIGH); // Prépare la marche avant
      if(Vitesse_D == 0) Vitesse_D = 75;
      Vitesse_D +=25;
      if(Vitesse_D >= 250) Vitesse_D = 250;
      Vitesse_G = Vitesse_D;
      analogWrite(PWM_A, Vitesse_D);
      analogWrite(PWM_B, Vitesse_G);
      Action = " Avance +";
   
   
  }
  if (request.indexOf("/Av-") >0)  {
      digitalWrite(AIN1, LOW);// Prépare la marche avant
      digitalWrite(AIN2, HIGH);// Prépare la marche avant
      digitalWrite(BIN1, LOW);// Prépare la marche avant
      digitalWrite(BIN2, HIGH);// Prépare la marche avant
      Vitesse_D -=25;
      if(Vitesse_D <= 0) Vitesse_D = 0;
      Vitesse_G = Vitesse_D;
      analogWrite(PWM_A, Vitesse_D);
      analogWrite(PWM_B, Vitesse_G);
      Action = " Avance -";
   
  }

   if (request.indexOf("/G+") > 0)  {
    
      digitalWrite(AIN1, LOW);// Prépare la marche avant
      digitalWrite(AIN2, HIGH);// Prépare la marche avant
      digitalWrite(BIN1, HIGH);// Prépare la marche avant
      digitalWrite(BIN2, LOW );// Prépare la marche avant
    if(Vitesse_G < 75) Vitesse_G = 75;
    Vitesse_G +=25;
    Vitesse_D = 75;
    if(Vitesse_G >= 250) Vitesse_G = 250;
    if(Vitesse_D <= 0) Vitesse_D = 0;
    analogWrite(PWM_A, Vitesse_D);
    analogWrite(PWM_B, Vitesse_G);
    Action = " Gauche +";
   
  }
  if (request.indexOf("/G-") >0)  {
    
    digitalWrite(AIN1, LOW);// Prépare la marche avant
      digitalWrite(AIN2, HIGH);// Prépare la marche avant
      digitalWrite(BIN1, HIGH);// Prépare la marche avant
      digitalWrite(BIN2, LOW );// Prépare la marche avant
    if(Vitesse_G < 75) Vitesse_G = 75;
    Vitesse_G +=10;
    Vitesse_D = 75;
    if(Vitesse_G >= 250) Vitesse_G = 250;
    if(Vitesse_D <= 0) Vitesse_D = 0;
    analogWrite(PWM_A, Vitesse_D);
    analogWrite(PWM_B, Vitesse_G);
    Action = " Gauche -";
  }
    if (request.indexOf("/D+") >0)  {
    if(Vitesse_G > Vitesse_D) Vitesse_D = Vitesse_G;
    digitalWrite(AIN1, HIGH);// Prépare la marche avant
      digitalWrite(AIN2, LOW);// Prépare la marche avant
      digitalWrite(BIN1, LOW);// Prépare la marche avant
      digitalWrite(BIN2, HIGH );// Prépare la marche avant
    Vitesse_G -=25;
    Vitesse_D +=25;
    if(Vitesse_D >= 250) Vitesse_D = 250;
    if(Vitesse_G <= 0) Vitesse_G = 0;
    analogWrite(PWM_A, Vitesse_D);
    analogWrite(PWM_B, Vitesse_G);
    Action = " Droite +";
  }
  if (request.indexOf("/D-") > 0)  
  {
    Vitesse_D = int ((Vitesse_G + Vitesse_D)/2);
    Vitesse_G = Vitesse_D;
    digitalWrite(AIN1, HIGH);// Prépare la marche avant
      digitalWrite(AIN2, LOW);// Prépare la marche avant
      digitalWrite(BIN1, LOW);// Prépare la marche avant
      digitalWrite(BIN2, HIGH );// Prépare la marche avant
    Vitesse_G -=10;
    Vitesse_D +=10;
    if(Vitesse_D >= 250) Vitesse_D = 250;
    if(Vitesse_G <= 0) Vitesse_G = 0;
    analogWrite(PWM_A, Vitesse_D);
    analogWrite(PWM_B, Vitesse_G);
    Action = " Droite -";
   
  }
   if (request.indexOf("/R") > 0)  
   {
      digitalWrite(AIN1, HIGH);// Prépare la marche avant
      digitalWrite(AIN2, LOW);// Prépare la marche avant
      digitalWrite(BIN1, HIGH);// Prépare la marche avant
      digitalWrite(BIN2, LOW);// Prépare la marche avant
      Vitesse_G = 125;
      Vitesse_D = 125;
      analogWrite(PWM_A, Vitesse_D);
      analogWrite(PWM_B, Vitesse_G);
      Action = " Recule";
   }
   
  if (request.indexOf("/S") > 0)  
  {
      digitalWrite(AIN1, LOW);// Prépare la marche avant
      digitalWrite(AIN2, LOW);// Prépare la marche avant
      digitalWrite(BIN1, LOW);// Prépare la marche avant
      digitalWrite(BIN2, LOW);// Prépare la marche avant
    Vitesse_G = 0;
    Vitesse_D = 0;
    Action = " Stop ";
  }
 
  // Code page HTML
  client.println("HTTP/1.1 200 OK");
  client.println("Content-Type: text/html");
  client.println(""); //  indispensable
  client.println("<!DOCTYPE HTML>");
  client.println("<html>");
  client.println("<head>");
 // client.println("<meta http-equiv='content-type' content='text/html; charset=utf-8' />"); // supprimé car ralenti beaucoup de fonctionnement
  client.println("<meta name='apple-mobile-web-app-capable' content='yes' />");
  client.println("<meta name='apple-mobile-web-app-status-bar-style' content='black-translucent' />");
 client.println("</head>");
  client.println("<body bgcolor = \"#e0e6ec\">"); 
  client.println("<hr/><hr>");
  client.println("<h2><i><center> Controle du Robot WIFI </i></center></h2>"); // Pas d'accent sinon caractère étranges
  client.println("<hr/><hr>");
  client.println("<h2><i><center> Fabrice 08/2016 </i></center></h2>"); // Pas d'accent sinon caractère étranges
  client.println("<hr/><hr>");
  //client.println("<br><br>");
  client.println("<br><br>");
  client.println("<center>");
   client.println("Avance");
  client.println("<a href=\"/Av+\"\"><button>Avance plus vite</button></a>");
  client.println("<a href=\"/Av-\"\"><button>Avance moins vite </button></a><br />");  
  client.println("</center>"); 

 // client.println("<br><br>");
  client.println("<br><br>");
  
  client.println("<center>");
  client.println("Tourne");
  client.println("<a href=\"/G+\"\"><button>Gauche plus vite </button></a>");
  client.println("<a href=\"/G-\"\"><button>Gauche moins vite </button></a>"); //<br /> 
  client.println("  __________ ");
  client.println("<a href=\"/D+\"\"><button>Droite plus vite </button></a>");
  client.println("<a href=\"/D-\"\"><button>Droite moins vite </button></a><br />");  
  client.println("</center>"); 
  client.println("<br><br>");
  client.println("<center>");
  client.println("Recule ");
  client.println("<a href=\"/R\"\"><button>Recule </button></a><br />");
  client.println("<br><br>");
  client.println("<center>");
  client.println("Stoppe ");
  client.println("<a href=\"/S\"\"><button>Stop </button></a><br />");  
  //client.println("</center>"); 

  client.println("<br><br>");
  client.println("<center>");
  client.print("Action : ");
  client.println(Action);
  client.println("<br><br>");
  client.println("<center>");
  client.print("Vitesse_D  = ");
  client.println(Vitesse_D);
  client.println("<center>");
  client.print("Vitesse_G  = ");
  client.println(Vitesse_G);
  client.println("</html>"); 
  delay(10);
  Serial.println("Deconnexion Client");
  Serial.println("");
 
}
