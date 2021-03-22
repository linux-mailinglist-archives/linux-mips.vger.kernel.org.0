Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C5D33447C5
	for <lists+linux-mips@lfdr.de>; Mon, 22 Mar 2021 15:49:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbhCVOtV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 22 Mar 2021 10:49:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230006AbhCVOsz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 22 Mar 2021 10:48:55 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33D55C061756
        for <linux-mips@vger.kernel.org>; Mon, 22 Mar 2021 07:48:54 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:250b:f16c:c5e2:505d])
        by laurent.telenet-ops.be with bizsmtp
        id jSos2400M2HDxaV01Sosfq; Mon, 22 Mar 2021 15:48:52 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lOLrQ-009ZW8-5x; Mon, 22 Mar 2021 15:48:52 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lOLrP-004T5Y-BW; Mon, 22 Mar 2021 15:48:51 +0100
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Robin van der Gracht <robin@protonic.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 00/17] auxdisplay: ht16k33: Add character display support
Date:   Mon, 22 Mar 2021 15:48:31 +0100
Message-Id: <20210322144848.1065067-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

	Hi all,

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
  - Patches 9-15 contain cleanups and improvements for the HT16K33
    driver, to prepare for segment display support,
  - Patch 16 adds support for 7/14-segment displays to the HT16K33
    driver,
  - Patch 17 adds segment display LED support to the HT16K33 driver,
    to make use of hardware blinking, and to expose display color.

This series has been tested using an Adafruit 0.54" Quad Alphanumeric
Red FeatherWing Display, plugged into an OrangeCrab ECP5-based FPGA
board running linux-on-litex-vexriscv.
7-segment display support is based purely on schematics, and has not
been tested on actual hardware.  The changes to img-ascii-lcd.c are also
untested, due to lack of hardware.

Thanks for your comments!

Geert Uytterhoeven (17):
  uapi: Add <linux/map_to_14segment.h>
  dt-bindings: auxdisplay: ht16k33: Document Adafruit segment displays
  auxdisplay: img-ascii-lcd: Fix lock-up when displaying empty string
  auxdisplay: img-ascii-lcd: Add helper variable dev
  auxdisplay: img-ascii-lcd: Convert device attribute to sysfs_emit()
  auxdisplay: Extract character line display core support
  auxdisplay: linedisp: Use kmemdup_nul() helper
  auxdisplay: linedisp: Add support for changing scroll rate
  auxdisplay: ht16k33: Use HT16K33_FB_SIZE in ht16k33_initialize()
  auxdisplay: ht16k33: Remove unneeded error check in keypad probe()
  auxdisplay: ht16k33: Convert to simple i2c probe function
  auxdisplay: ht16k33: Add helper variable dev
  auxdisplay: ht16k33: Move delayed work
  auxdisplay: ht16k33: Extract ht16k33_brightness_set()
  auxdisplay: ht16k33: Extract frame buffer probing
  auxdisplay: ht16k33: Add support for segment displays
  auxdisplay: ht16k33: Add segment display LED support

 .../bindings/auxdisplay/holtek,ht16k33.yaml   |  22 +-
 drivers/auxdisplay/Kconfig                    |   8 +
 drivers/auxdisplay/Makefile                   |   1 +
 drivers/auxdisplay/ht16k33.c                  | 451 ++++++++++++++----
 drivers/auxdisplay/img-ascii-lcd.c            | 199 +-------
 drivers/auxdisplay/line-display.c             | 261 ++++++++++
 drivers/auxdisplay/line-display.h             |  43 ++
 include/uapi/linux/map_to_14segment.h         | 240 ++++++++++
 8 files changed, 961 insertions(+), 264 deletions(-)
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
