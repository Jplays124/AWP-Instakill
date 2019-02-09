#pragma semicolon 1
#pragma tabsize 0
#pragma newdecls required

#define DEBUG

#define PLUGIN_AUTHOR "Jplays"
#define PLUGIN_VERSION "1.00"

#include <sourcemod>
#include <sdktools>
#include <sdkhooks>



public Plugin myinfo = 
{
	name = "Awp Instakill",
	author = PLUGIN_AUTHOR,
	description = "Awp kill with one shot in any moment.",
	version = PLUGIN_VERSION,
	url = "https://jplays.tk"
};

public void OnPluginStart()
{
}

public void OnClientPutInServer(int client)
{
	SDKHook(client, SDKHook_OnTakeDamage, OnTakeDamage); 
}

public Action OnTakeDamage(int victim, int &attacker, int &inflictor, float &damage, int &damagetype) {
    if (inflictor < 0 || inflictor > MaxClients || !IsClientInGame(inflictor)) 
        return Plugin_Continue; 
   
  	char sWeapon[32]; 
    GetClientWeapon(inflictor, sWeapon, sizeof(sWeapon)); 
     
    if (StrContains(sWeapon, "awp", false) != -1) 
    { 
        damage = 1000.0; 
        return Plugin_Changed; 
    }  
  return Plugin_Continue; 
} 