%program do generowania skalogramow z sygnalow ekg
load('ECGData.mat'); %zaladowanie bazy danych ekg
data=ECGData.Data; %przypisanie zniennej do bazy danych
labels=ECGData.Labels; %przypisanie zniennej do etykiet sygnalow

ARR=data(1:30,:); %pobranie pierwszych 30 sygnalow
CHF=data(97:126,:);
NSR=data(127:156,:);
signallength=500;

%Definiowamanie wlasnosci ciaglej transformaty falkowej
fb=cwtfilterbank('SignalLength',signallength,'Wavelet', 'amor','VoicesPerOctave',12);

%tworzenie folderow
mkdir('zbiordanych'); %folder glowny
mkdir('zbiordanych\ar'); % podfolder
mkdir('zbiordanych\zns');
mkdir('zbiordanych\nrz');

typekg={'ARR','CHF','NSR'}

%funkcje do konwertowania sygnalow do obrazow
ekgctfskg(ARR,fb,typekg{1});
ekgctfskg(CHF,fb,typekg{2});
ekgctfskg(NSR,fb,typekg{3});