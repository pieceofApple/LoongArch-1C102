#include "soc_ls1c102.h"

/******************************************************************************/
/*                Game FUNCTION DECLARATION                            */
/******************************************************************************/

/********************************************/
void Set_X(int x)
{
    Game->x_coordinate = x;
}

void Set_Y(int y)
{
    Game->y_coordinate = y;
}

void Set_Blood_1(int blood_1)
{
    Game->blood_1 = blood_1;
}

void Set_Blood_2(int blood_2)
{
    Game->blood_2 = blood_2;
}

void Set_Energy_1(int energy_1)
{
    Game->energy_1 = energy_1;
}

void Set_Energy_2(int energy_2)
{
    Game->energy_2 = energy_2;
}

void Set_Energy_count_1(int energy_count_1)
{
    Game->energy_count_1 = energy_count_1;
}

void Set_Energy_count_2(int energy_count_2)
{
    Game->energy_count_2 = energy_count_2;
}

void Set_Player1_x(int player1_x)
{
    Game->player1_x = player1_x;
}

void Set_Player1_y(int player1_y)
{
    Game->player1_y = player1_y;
}

void Set_Prop1_x(int prop1_x)
{
    Game->prop1_x = prop1_x;
}

void Set_Prop1_y(int prop1_y)
{
    Game->prop1_y = prop1_y;
}

void Set_Player2_x(int player2_x)
{
    Game->player2_x = player2_x;
}

void Set_Player2_y(int player2_y)
{
    Game->player2_y = player2_y;
}

void Set_Prop2_x(int prop2_x)
{
    Game->prop2_x = prop2_x;
}

void Set_Prop2_y(int prop2_y)
{
    Game->prop2_y = prop2_y;
}

void Set_Player1_direction(int player1_direction)
{
    Game->player1_direction = player1_direction;
}

void Set_Player2_direction(int player2_direction)
{
    Game->player2_direction = player2_direction;
}

void Set_Audio(int audio)
{
    switch (audio)
    {
        //              游戏1:水果忍者
    case 1:
        Game->audio[0] = 1;
        break; // 音效1  切水果
    case 2:
        Game->audio[1] = 1;
        break; // 音效2  Game Over
        //              游戏2:拳皇
    case 3:
        Game->audio[2] = 1;
        break; // 音效3  轻拳轻脚男受击
    case 4:
        Game->audio[3] = 1;
        break; // 音效4  重拳重脚男受击
    case 5:
        Game->audio[4] = 1;
        break; // 音效5  轻拳轻脚女受击
    case 6:
        Game->audio[5] = 1;
        break; // 音效6  重拳重脚女受击
    case 7:
        Game->audio[6] = 1;
        break; // 音效7  防御成功
    case 8:
        Game->audio[7] = 1;
        break; // 音效8  男受击
    case 9:
        Game->audio[8] = 1;
        break; // 音效9  女受击
    case 10:
        Game->audio[9] = 1;
        break; // 音效10 男技能
    case 11:
        Game->audio[10] = 1;
        break; // 音效11 女技能
    case 12:
        Game->audio[11] = 1;
        break; // 音效12 3.2.1.Ready Go
    case 13:
        Game->audio[12] = 1;
        break; // 音效13 K.O.
    default:
        break;
    }
}

void Set_video(int video, int state)
{
    switch (video)
    {
    //                  玩家1                  //
    case 1:
        Game->video[0] = state;
        break; // 移动
    case 2:
        Game->video[1] = state;
        break; // 防御
    case 3:
        Game->video[2] = 1;
        break; // 轻拳
    case 4:
        Game->video[3] = 1;
        break; // 重拳
    case 5:
        Game->video[4] = 1;
        break; // 轻踢
    case 6:
        Game->video[5] = 1;
        break; // 重踢
    case 7:
        Game->video[6] = state;
        break; // 跳跃
    case 8:
        Game->video[7] = 1;
        break; // 受击
    case 9:
        Game->video[8] = state;
        break; // 技能
    case 10:
        Game->video[9] = 1;
        break; // 技能受击
    //                  玩家2                  //
    case 11:
        Game->video[10] = state;
        break; // 移动
    case 12:
        Game->video[11] = state;
        break; // 防御
    case 13:
        Game->video[12] = 1;
        break; // 轻拳
    case 14:
        Game->video[13] = 1;
        break; // 重拳
    case 15:
        Game->video[14] = 1;
        break; // 轻踢
    case 16:
        Game->video[15] = 1;
        break; // 重踢
    case 17:
        Game->video[16] = state;
        break; // 跳跃
    case 18:
        Game->video[17] = 1;
        break; // 受击
    case 19:
        Game->video[18] = state;
        break; // 技能
    case 20:
        Game->video[19] = 1;
        break; // 技能受击
    default:
        break;
    }
}

/********************************************/
uint32_t Read_test_x()
{
    uint32_t x;
    x = Game->test_x;
    return (x);
}

uint32_t Read_test_y()
{
    uint32_t y;
    y = Game->test_y;
    return (y);
}

uint32_t Read_test_z()
{
    uint32_t z;
    z = Game->test_z;
    return (z);
}

uint32_t Read_Score1()
{
    uint32_t score1;
    score1 = Game->score1;
    return (score1);
}

uint32_t Read_Score2()
{
    uint32_t score2;
    score2 = Game->score2;
    return (score2);
}
uint32_t Read_Score3()
{
    uint32_t score3;
    score3 = Game->score3;
    return (score3);
}
uint32_t Read_Score4()
{
    uint32_t score4;
    score4 = Game->score4;
    return (score4);
}
uint32_t Read_Key_output()
{
    uint32_t key_output;
    key_output = Game->key_output;
    return (key_output);
}