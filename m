Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4D6842ACAE
	for <lists+linux-mips@lfdr.de>; Tue, 12 Oct 2021 20:56:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234576AbhJLS6H (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 12 Oct 2021 14:58:07 -0400
Received: from leibniz.telenet-ops.be ([195.130.137.77]:34384 "EHLO
        leibniz.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232502AbhJLS6G (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 12 Oct 2021 14:58:06 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by leibniz.telenet-ops.be (Postfix) with ESMTPS id 4HTPTQ01ZbzMqgls
        for <linux-mips@vger.kernel.org>; Tue, 12 Oct 2021 20:34:34 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:9c93:91ff:d58:ecfb])
        by andre.telenet-ops.be with bizsmtp
        id 56ZW2600f0KW32a016ZWBo; Tue, 12 Oct 2021 20:33:33 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1maMag-004RTk-HA; Tue, 12 Oct 2021 20:33:30 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1maMaf-002j54-Jt; Tue, 12 Oct 2021 20:33:29 +0200
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Miguel Ojeda <ojeda@kernel.org>
Cc:     Robin van der Gracht <robin@protonic.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Machek <pavel@ucw.cz>, Marek Behun <marek.behun@nic.cz>,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v7 00/21] auxdisplay: ht16k33: Add character display support
Date:   Tue, 12 Oct 2021 20:33:06 +0200
Message-Id: <20211012183327.649865-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

	Hi Miguel et al,

The Holtek HT16K33 LED controller is not only used for driving
dot-matrix displays, but also for driving segment displays.
The current auxdisplay driver is limited to dot-matrix displays, which
are exposed as a frame buffer device.

This patch series extends the driver to 4-digit 7-segment and quad
14-segment alphanumeric displays, allowing the user to display and
scroll text messages.

List of patches:
  - Patch 1 provides font data for displaying ASCII characters on
    14-segment displays,
  - Patch 2 updates the HT16K33 DT bindings for segment displays,
  - Patches 3-5 contain a bug fix and small improvements for the
    Imagination Technologies ASCII LCD Display driver,
  - Patch 6 extracts the character line display core support from the
    Imagination Technologies ASCII LCD Display driver, for reuse,
  - Patches 7-8 contain cleanups and improvements for the character line
    display core driver,
  - Patches 9-17 contain a bug fixes, cleanups and improvements for the
    HT16K33 driver, to prepare for segment display support,
  - Patch 18 adds support for 7/14-segment displays to the HT16K33
    driver,
  - Patch 19 updates the HT16K33 DT bindings to document an LED subnode,
  - Patch 20 adds segment display LED support to the HT16K33 driver,
    to make use of hardware blinking, and to expose display color,
  - Patch 21 converts the HT16K33 driver to use device properties.

Changes compared to v6[1]:
  - Add Acked-by, Reviewed-by,
  - New patch "auxdisplay: ht16k33: Fix frame buffer device blanking",
  - Add linux,default-trigger to example,
  - Add missing call to ht16k33_brightness_set() in
    ht16k33_fbdev_probe(), to make sure brightness and blinking are set
    to a sane state,
  - Integrate "auxdisplay: ht16k33: Make use of device properties" into
    this series.

Changes compared to v5[2]:
  - Add Reviewed-by,
  - Reorder operations in ht16k33_led_probe() to ease future conversion
    to device properties.

Changes compared to v4[3]:
  - Add Reviewed-by,
  - Add missing select NEW_LEDS.

Changes compared to v3[4]:
  - Combine compatible values for 7/14 segment displays into an enum,
  - Add Reviewed-by,
  - Add missing select LEDS_CLASS.

Changes compared to v2[5]:
  - Drop color property from display node,
  - Use compat_only_sysfs_link_entry_to_kobj() instead of cooking our
    own helper on top of kernfs_create_link(),
  - Use "err" instead of "error" to be consistent with existing driver
    naming style,
  - Pass "dev" instead of "client" to ht16k33_fbdev_probe() and
    ht16k33_seg_probe(),
  - Drop local variable "node",
  - Remove unneeded inclusion of <linux/leds.h> and <linux/of_device.h>,
  - Document LED subnode,
  - Remove unneeded C++ comment,
  - Make the creation of the LED device dependent on the presence of the
    "led" subnode in DT, so it can be used in dot-matrix mode too.
  - Use led_init_data() and devm_led_classdev_register_ext() to retrieve
    all LED properties from DT, instead of manual LED name construction
    based on just the "color" property.

Changes compared to v1[6]:
  - Fix type of color to uint32,
  - "refresh-rate-hz" is still required for dot-matrix displays.
  - Move "select LINEDISP" for HT16K33 symbol to correct patch,
  - Add backwards compatibility "message" symlink to img-ascii-lcd,
  - Connect backlight to fbdev in ht16k33 dot-matrix mode,
  - Set "err = -EINVAL" in switch() case that cannot happen,
  - Use "auxdisplay" instead of DRIVER_NAME in LED name.

This series has been tested using an Adafruit 0.54" Quad Alphanumeric
Red FeatherWing Display, connected to an OrangeCrab ECP5 FPGA board
running a 64 MHz VexRiscv RISC-V softcore.
7-segment display support is based purely on schematics, and has not
been tested on actual hardware.  The changes to img-ascii-lcd.c are also
untested, due to lack of hardware.

Thanks for applying!

[1] "[PATCH v6 00/19] auxdisplay: ht16k33: Add character display support"
    https://lore.kernel.org/r/20210914143835.511051-1-geert@linux-m68k.org/
[2] "[PATCH v5 00/19] auxdisplay: ht16k33: Add character display support"
    https://lore.kernel.org/r/20210811095759.1281480-1-geert@linux-m68k.org
[2] "[PATCH v4 00/19] auxdisplay: ht16k33: Add character display support"
    https://lore.kernel.org/r/20210727140459.3767788-1-geert@linux-m68k.org/
[3] "[PATCH v3 00/19] auxdisplay: ht16k33: Add character display support"
    https://lore.kernel.org/r/20210714151130.2531831-1-geert@linux-m68k.org/
[4] "[PATCH v2 00/18] auxdisplay: ht16k33: Add character display support"
    https://lore.kernel.org/r/20210625125902.1162428-1-geert@linux-m68k.org/
[5] "[PATCH 00/17] auxdisplay: ht16k33: Add character display support"
    https://lore.kernel.org/r/20210322144848.1065067-1-geert@linux-m68k.org/

Geert Uytterhoeven (21):
  uapi: Add <linux/map_to_14segment.h>
  dt-bindings: auxdisplay: ht16k33: Document Adafruit segment displays
  auxdisplay: img-ascii-lcd: Fix lock-up when displaying empty string
  auxdisplay: img-ascii-lcd: Add helper variable dev
  auxdisplay: img-ascii-lcd: Convert device attribute to sysfs_emit()
  auxdisplay: Extract character line display core support
  auxdisplay: linedisp: Use kmemdup_nul() helper
  auxdisplay: linedisp: Add support for changing scroll rate
  auxdisplay: ht16k33: Connect backlight to fbdev
  auxdisplay: ht16k33: Fix frame buffer device blanking
  auxdisplay: ht16k33: Use HT16K33_FB_SIZE in ht16k33_initialize()
  auxdisplay: ht16k33: Remove unneeded error check in keypad probe()
  auxdisplay: ht16k33: Convert to simple i2c probe function
  auxdisplay: ht16k33: Add helper variable dev
  auxdisplay: ht16k33: Move delayed work
  auxdisplay: ht16k33: Extract ht16k33_brightness_set()
  auxdisplay: ht16k33: Extract frame buffer probing
  auxdisplay: ht16k33: Add support for segment displays
  dt-bindings: auxdisplay: ht16k33: Document LED subnode
  auxdisplay: ht16k33: Add LED support
  auxdisplay: ht16k33: Make use of device properties

 .../bindings/auxdisplay/holtek,ht16k33.yaml   |  32 +-
 drivers/auxdisplay/Kconfig                    |  12 +-
 drivers/auxdisplay/Makefile                   |   1 +
 drivers/auxdisplay/ht16k33.c                  | 500 ++++++++++++++----
 drivers/auxdisplay/img-ascii-lcd.c            | 205 ++-----
 drivers/auxdisplay/line-display.c             | 261 +++++++++
 drivers/auxdisplay/line-display.h             |  43 ++
 include/uapi/linux/map_to_14segment.h         | 239 +++++++++
 8 files changed, 1017 insertions(+), 276 deletions(-)
 create mode 100644 drivers/auxdisplay/line-display.c
 create mode 100644 drivers/auxdisplay/line-display.h
 create mode 100644 include/uapi/linux/map_to_14segment.h

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
