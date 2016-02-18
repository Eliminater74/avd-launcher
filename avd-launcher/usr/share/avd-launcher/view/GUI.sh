#! /bin/bash

import model.AppInfo='source ../model/AppInfo.sh';
import view.GUIDialogs='source ../view/GUIDialogs.sh';
import controller.GUIController='source ../controller/GUIController.sh';
import controller.SDKController='source ../controller/SDKController.sh';

# "Classe" que contém o código das janelas das principais funcionalidades 
#
# Author: Gustavo Moraes <gustavosotnas1@gmail.com>
#
# This file is subject to the terms and conditions of the GNU General Public
# License. See the file COPYING in the main directory of this archive
# for more details.

# Função principal do programa, implenta os passos das atividades de execução
# (algoritmo) tal qual no Diagrama de Atividade do AVD Launcher.
start()
{
	controller.GUIController verifyGUI;
	controller.SDKController verifySDKPath;
	controller.SDKController verifyAVDPath;

	chooseAVD;
	mainMenu;
}

# Função que permite ao usuário escolher o AVD que deseja executar,
# de acordo com a lista de AVDs disponível.
# Saída:
#	$CHOSEN_AVD - o nome do AVD escolhido pelo usuário.
chooseAVD()
{
	return 0;
}

mainMenu()
{
	return 0;
}

# Cria janela de apresentação e pede para o usuário colocar onde está
# localizada a pasta do Android SDK (apenas na primeira vez que o programa 
# é executado e o SDK não está na localização padrão ou foi movido de pasta).
# Retorna:
#	$sdk_path_tmp2 - suposta localização do Android SDK escolhida pelo usuário
inputAndroidSDKPath()
{
	yad --title "`model.AppInfo getAppName`" --form \
		--center --width=500 --image="android" --window-icon="android" \
		--text "`model.AppInfo getAppAbout`\n\n<b>AVD Launcher could not get the default Android SDK folder path.</b>\n" \
		--field 'Android SDK Path (this is needed only once)\:':DIR $HOME --separator="" --borders=5 \
		--button=About:"./GUIDialogs.sh displayAbout" --button=Cancel:"./GUIDialogs.sh displayCancel" --button=OK:0
}

### MAIN ####

case $1 in
	"start") start;;
	"inputAndroidSDKPath") inputAndroidSDKPath;;
esac;