#ifndef LEVEL_LOAD
#define LEVEL_LOAD
#include <string>
#include <fstream>
#include <vector>
#include <Windows.h>
#include "BoolEngine/BoolEngine.h"

const float SCREEN_WIDTH = GetSystemMetrics(SM_CXSCREEN);
const float SCREEN_HEIGHT = GetSystemMetrics(SM_CYSCREEN) - GetSystemMetrics(SM_CYSCREEN) * 1 / 10;

const std::string LEVEL_DATAPATH = "/levels/";
//Files will be located in this directory
const std::string MAP_INFO = "levels.lv";
const std::string EXTENSION = ".lv";
//This file indexes all of the other map files
const float PI = 3.14159265358979323846264338327950288419716939937510582097;

const float INITIAL_LEVEL_POS_X = SCREEN_WIDTH * 1 / 4;
const float INITIAL_LEVEL_POS_Y = SCREEN_HEIGHT * 1 / 4;
const float LEVEL_LENGTH_X = SCREEN_WIDTH * 1 / 2;
const float LEVEL_LENGTH_Y = SCREEN_HEIGHT * 2 / 3;

typedef enum tGame_Element
{
	CLOSED_WALL, HORIZ_OPEN_WALL, VERT_OPEN_WALL, CLOSED_WALL_3_0DEG, CLOSED_WALL_3_90DEG, CLOSED_WALL_3_180DEG,
	CLOSED_WALL_3_270DEG, CLOSED_WALL_2_0DEG, CLOSED_WALL_2_90DEG, CLOSED_WALL_2_180DEG, CLOSED_WALL_2_270DEG,
	INTERIOR_WALL, CLOSED_WALL_1_0DEG, CLOSED_WALL_1_90DEG, CLOSED_WALL_1_180DEG, CLOSED_WALL_1_270DEG, PELLET,
	POWER_UP, PLAYER, RED_GHOST, BLUE_GHOST, ORANGE_GHOST, PINK_GHOST, CHERRY, PINEAPPLE, EMPTY, MISTAKE
};

struct tGame {
	tGame_Element elem;
	ALLEGRO_BITMAP *sprite;
	float pixel_position[2];
};

class Level
{
public:
	Level();

	void LoadLevel();
	void NextLevel();
	void SetMapElem(int i, int j, tGame_Element elem);
	tGame_Element CharacterTransform(const char& c);
	ALLEGRO_BITMAP *GameElementToBitmap(const tGame_Element elem);
	float AngleFromElement(const tGame_Element & aux); //Revisar angulos de los muros y los sprites.
	void SetFirstTime(bool boolean);
	

	int GetCurrentLevel() const;
	int GetSize(int i = -1) const;
	tGame_Element GetElement(int i, int j) const;
	ALLEGRO_BITMAP *GetBitmap(int i, int j) const;
	float GetPixelPositionX(int j) const;
	float GetPixelPositionY(int i) const;
	std::vector<std::vector<tGame>> GetMap() const;
	int GetRowPixelElem() const;
	int GetColumnPixelElem() const;
	bool GetFirstTime() const;

	~Level();
private:
	int currentLevel;
	std::vector<std::vector<tGame>> map;
	float row_pixel_elem, column_pixel_elem;
	bool first_time;
};

#endif