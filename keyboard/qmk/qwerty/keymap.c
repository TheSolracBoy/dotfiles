
/*
Copyright 2019 @foostan
Copyright 2020 Drashna Jaelre <@drashna>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#include QMK_KEYBOARD_H

#define HOME G(KC_LEFT)
#define END G(KC_RGHT)
#define FWD G(KC_RBRC)
#define BACK G(KC_LBRC)
#define TABL G(S(KC_LBRC))
#define TABR G(S(KC_RBRC))
#define SPCL A(G(KC_LEFT))
#define SPC_R A(G(KC_RGHT))
#define LA_SYM LT(SYM, KC_ENT)
// #define LA_SYM MO(SYM)
#define LA_NAV LT(NAV, KC_SPC)
#define LA_NUM LT(NUM, KC_TAB)

enum layers {
  DEF,
  NAV,
  SYM,
  NUM,
};

enum {
  TD_CAPS = 0,
};


const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
[DEF] = LAYOUT_split_3x6_3(
//,-----------------------------------------------------.                    ,-----------------------------------------------------.
   KC_LALT,          KC_Q,    KC_W,    KC_E,    KC_R,    KC_T,                    KC_Y,    KC_U,    KC_I,    KC_O,   KC_P,   KC_LALT,
//|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
  LCTL_T(KC_ESC),    (KC_A),    (KC_S),    (KC_D),    KC_F,    KC_G,          KC_H,    (KC_J),    (KC_K),    (KC_L), (KC_SCLN),          LCTL_T(KC_QUOT),
//|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
  KC_LSFT,           KC_Z,    KC_X,    KC_C,    KC_V,    KC_B,                   KC_N,    KC_M, KC_COMM,  KC_DOT,  KC_SLSH,       KC_LSFT,
//|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                              KC_LGUI,    LA_NAV,  LA_NUM,    LT(NUM,KC_BSPC),  MO(SYM) , KC_LGUI
                              //`--------------------------'  `--------------------------'
),

  [NAV] = LAYOUT_split_3x6_3(
  //,-----------------------------------------------------.                    ,-----------------------------------------------------.
       _______,    KC_1,    KC_2,    KC_3,    KC_4,    KC_5,                         KC_6,    KC_7,    KC_BSPC,    KC_DEL,    KC_0, KC_BSPC,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      _______, KC_LGUI, KC_LALT, KC_LCTL, KC_LSFT, XXXXXXX,                      KC_LEFT, KC_DOWN,   KC_UP,KC_RIGHT, KC_ENT, _______,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      _______, KC_BRMU, XXXXXXX, KC_CAPS, KC_MUTE, KC_VOLD,                   KC_VOLU, KC_MPRV, KC_MPRV, KC_MPLY, KC_MNXT, _______,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                          _______, _______,  _______,     _______,   MO(4), _______
                                      //`--------------------------'  `--------------------------'
  ),
// -------______________---===-----=-=-=-_____\\\;;;;\\\\//\\\\\\\||||||\\\||;;;;::kkjkjkj=-=-=-=-=-___--=-=---====---____=-=-===
  [SYM] = LAYOUT_split_3x6_3(
  //,-----------------------------------------------------.                    ,-----------------------------------------------------.
      _______, KC_EXLM,   KC_AT, KC_HASH,  KC_DLR, KC_PERC,                      KC_CIRC, KC_AMPR, KC_ASTR, KC_LPRN, KC_RPRN, _______,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      _______, KC_LPRN, KC_RPRN, KC_LCBR, KC_RCBR, XXXXXXX,                      KC_GRV,  KC_MINS, KC_UNDS, KC_EQL , KC_BSLS,  _______,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      _______, KC_SCLN, KC_GRV, KC_LBRC, KC_RBRC, XXXXXXX,                      KC_UNDS, KC_PLUS, KC_LCBR, KC_RCBR, KC_PIPE, _______,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                          _______,   _______, _______ ,     _______, _______, _______
                                      //`--------------------------'  `--------------------------'
  ),
//-/00++***+++---+-*-------//****
  [NUM] = LAYOUT_split_3x6_3(
  //,-----------------------------------------------------.                    ,-----------------------------------------------------.
       XXXXXXX, _______ ,KC_7, KC_8, KC_9, KC_BSLS,                       XXXXXXX, KC_7, KC_8, KC_9, KC_BSLS, _______,
  //|--------+--------+--------+--------+--------+--                    |--------+--------+--------+--------+--------+--------|
         XXXXXXX, _______ ,KC_4, KC_5, KC_6, KC_PPLS,                          XXXXXXX, KC_4, KC_5, KC_6, KC_PPLS, _______,
  //|--------+--------+--------+--------+--------+--                    |--------+--------+--------+--------+--------+--------|
      XXXXXXX,  _______ ,KC_1, KC_2, KC_3, KC_PAST,                         XXXXXXX,  KC_1, KC_2, KC_3, KC_PAST,   _______,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                          _______, _______,   _______,     _______, KC_0, _______
                                      //`--------------------------'  `--------------------------'
  ),

  [4] = LAYOUT_split_3x6_3(
  //,-----------------------------------------------------.                    ,-----------------------------------------------------.
        QK_BOOT, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,                      RGB_M_P, RGB_M_B	, RGB_M_R, RGB_M_SW, RGB_M_SN, RGB_M_K,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      RGB_TOG, RGB_HUI, RGB_SAI, RGB_VAI, RGB_SPI, RGB_MOD,                      RGB_M_X, RGB_M_G, RGB_M_T, XXXXXXX, XXXXXXX, XXXXXXX,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      KC_LSFT, RGB_HUD, RGB_SAD, RGB_VAD, RGB_SPD, XXXXXXX,                      XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, _______,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                          KC_LGUI, _______,  KC_SPC,     _______, _______, KC_RALT
                                      //`--------------------------'  `--------------------------'
  )
};


bool process_record_user(uint16_t keycode, keyrecord_t *record) {
  // update_swapper(
  //     &sw_win_active, KC_LGUI, KC_TAB, SW_WIN,
  //     keycode, record
  // );
  // update_swapper(
  //     &sw_lang_active, KC_LCTL, KC_SPC, SW_LANG,
  //     keycode, record
  // );
  // update_oneshot(&os_ctrl_state, KC_LCTL, OS_CTRL, keycode, record);

  // update_oneshot(
  //     &os_shft_state, KC_LSFT, OS_SHFT,
  //     keycode, record
  // );
  // update_oneshot(&os_alt_state, KC_LALT, OS_ALT, keycode, record);
  // update_oneshot(&os_cmd_state, KC_LCMD, OS_CMD, keycode, record);

  // verify_shift(keycode, record);

  return true;
}
