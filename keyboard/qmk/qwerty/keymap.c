
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
#include <stdio.h>

// #include "oneshot.h"
//
// #include "swapper.h"

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

enum keycodes {
  // Custom oneshot mod implementation with no timers.
  OS_SHFT = SAFE_RANGE,
  // OS_CTRL,
  // OS_ALT,
  // OS_CMD,

  // SW_WIN,  // Switch to next window         (cmd-tab)
  // SW_LANG, // Switch to next input language (ctl-spc)
};

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
[DEF] = LAYOUT_split_3x6_3(
//,-----------------------------------------------------.                    ,-----------------------------------------------------.
   KC_LALT,          KC_Q,    KC_W,    KC_E,    KC_R,    KC_T,                    KC_Y,    KC_U,    KC_I,    KC_O,   KC_P,   KC_LALT,
//|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
  LCTL_T(KC_ESC),    (KC_A),    (KC_S),    (KC_D),    KC_F,    KC_G,          KC_H,    (KC_J),    (KC_K),    (KC_L), (KC_SCLN),          LCTL_T(KC_QUOT),
//|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
  OS_SHFT,           KC_Z,    KC_X,    KC_C,    KC_V,    KC_B,                   KC_N,    KC_M, KC_COMM,  KC_DOT,  KC_SLSH,       OS_SHFT,
//|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                              KC_LGUI,    LA_NAV,  LA_NUM,    KC_BSPC,  MO(SYM) , KC_LGUI
                              //`--------------------------'  `--------------------------'
),

  [NAV] = LAYOUT_split_3x6_3(
  //,-----------------------------------------------------.                    ,-----------------------------------------------------.
       _______,    KC_1,    KC_2,    KC_3,    KC_4,    KC_5,                         KC_6,    KC_7,    KC_BSPC,    KC_DEL,    KC_0, KC_BSPC,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      _______, KC_LGUI, KC_LALT, KC_LCTL, OS_SHFT, XXXXXXX,                      KC_LEFT, KC_DOWN,   KC_UP,KC_RIGHT, KC_ENT, _______,
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
       _______, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,                      XXXXXXX, KC_7, KC_8, KC_9, KC_BSLS, _______,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      _______, KC_LGUI, KC_LALT, KC_LCTL, OS_SHFT, XXXXXXX,                         XXXXXXX, KC_4, KC_5, KC_6, KC_PPLS, _______,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      _______, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,                      XXXXXXX,  KC_1, KC_2, KC_3, KC_PAST,   _______,
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

bool is_oneshot_cancel_key(uint16_t keycode) {
  switch (keycode) {
  case LCTL_T(KC_ESC):
    // case LA_SYM:
    // case LA_NUM:
    // case LA_NAV:
    return true;
  default:
    return false;
  }
}
//
bool is_oneshot_ignored_key(uint16_t keycode) {
  switch (keycode) {
  case LA_SYM:
  case LA_NUM:
  case LA_NAV:
  case KC_LSFT:
  case OS_SHFT:
    return true;
  default:
    return false;
  }
}

typedef enum {
    os_up_unqueued,
    os_up_queued,
    os_down_unused,
    os_down_used,
} oneshot_state;

bool sw_win_active = false;
bool sw_lang_active = false;
//
oneshot_state os_shft_state = os_up_unqueued;
// oneshot_state os_ctrl_state = os_up_unqueued;
// oneshot_state os_alt_state = os_up_unqueued;
// oneshot_state os_cmd_state = os_up_unqueued;
bool shift_pressed_once =
    false; // Variable para rastrear si Shift se presionó dos veces
bool caps_lock_active =
    false; // Variable para rastrear si Caps Lock está activo
bool shift_have_been_used = false;
bool shift_habe_been_released = false;

bool verify_shift(uint16_t keycode, keyrecord_t *record) {

  if (is_oneshot_cancel_key(keycode) && caps_lock_active) {
    register_code(KC_CAPS);
    if (caps_lock_active) {
      unregister_code(KC_LSFT);
      caps_lock_active = false;
      shift_pressed_once = false;
      return true;
    }
  }

  if (keycode != OS_SHFT && !caps_lock_active) {
    if (is_oneshot_ignored_key(keycode)) {
      return true;
    }

    if (shift_have_been_used && shift_habe_been_released) {
      unregister_code(KC_LSFT);
    }
    shift_pressed_once = false;
    shift_have_been_used = true;
  }

  if (keycode == OS_SHFT) {
    if (record->event.pressed) {

      shift_have_been_used = false;
      shift_habe_been_released = false;
      register_code(KC_LSFT); // Activar Caps Lock

      if (shift_pressed_once) {
        register_code(KC_CAPS); // Activar
        if (caps_lock_active) {
          caps_lock_active = false;
          shift_pressed_once = false;
          shift_have_been_used = true;
          return true;
        }
        caps_lock_active = true;
        return true;
      }

      shift_pressed_once = true; // Marcar que Shift se ha presionado una vez

    } else {
      shift_habe_been_released = true;
    }
  }
  return true;
}

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

  verify_shift(keycode, record);

  return true;
}
