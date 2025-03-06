#ifndef _SOC_GAME_H
#define _SOC_GAME_H

#ifdef __cplusplus
extern "C" {
#endif


#include "soc_ls1c102.h"

void Set_X(int x);
void Set_Y(int y);
void Set_Blood_1(int blood_1);
void Set_Blood_2(int blood_2);
void Set_Energy_1(int Energy_1);
void Set_Energy_2(int Energy_2);
void Set_Energy_count_1(int Energy_count_1);
void Set_Energy_count_2(int Energy_count_2);
void Set_Player1_x(int player1_x);
void Set_Player1_y(int player1_y);
void Set_Prop1_x(int prop1_x);
void Set_Prop1_y(int prop1_y);
void Set_Player2_x(int player2_x);
void Set_Player2_y(int player2_y);
void Set_Prop2_x(int prop2_x);
void Set_Prop2_y(int prop2_y);
void Set_Player1_direction(int player1_direction);
void Set_Player2_direction(int player2_direction);

void Set_Audio(int audio);
void Set_video(int video,int state);

uint32_t Read_test_x(void);
uint32_t Read_test_y(void);
uint32_t Read_test_z(void);
uint32_t Read_Score1(void);
uint32_t Read_Score2(void);
uint32_t Read_Score3(void);
uint32_t Read_Score4(void);
uint32_t Read_Key_output(void);
#ifdef __cplusplus
}
#endif

#endif // _SOC_GAME_H