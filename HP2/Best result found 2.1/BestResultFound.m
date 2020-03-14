%Best path were found in ACO in HP 2.1c
cityLocation = LoadCityLocations();

bestPath=[23;26;30;29;32;36;40;48;46;47;44;41;39;42;45;50;49;43;37;38;35;27;15;9;1;5;4;2;10;11;21;24;31;34;33;25;18;12;6;3;7;8;13;14;17;20;28;22;16;19];
bestPathLength=GetPathLength(bestPath,cityLocation);

disp('Best path')
disp(bestPath)
disp('Best path Length')
disp(bestPathLength)