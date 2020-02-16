Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 738E816063E
	for <lists+linux-mips@lfdr.de>; Sun, 16 Feb 2020 21:21:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728075AbgBPUVQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 16 Feb 2020 15:21:16 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.166]:10689 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727936AbgBPUVP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 16 Feb 2020 15:21:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1581884470;
        s=strato-dkim-0002; d=goldelico.com;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=wgk32v4tt7EcXaiX5ehacLWrDHtd9hiWK/Gk33cRKsw=;
        b=dVdTG6zJoiLOk7+qSIt0kgZPq3+KlA6Xqp5Y50/2Dfa43pAmNqKDA9Gov5zJd4onuZ
        vwnSUXQI0zyYwD3BHFZj/3o73SCf7gw18kDHQfbZ82h31s1sqfHX4y9EePD4JhSyDulI
        Wl1GpEbrsIj+bkUD6Svd1J7ark7bYwNL9zKQt0g6C6Ljaq+c4ZS8COszesU7X2eWB81+
        oHIcY/25P4lsVxbegGETwIwApOioHxsta548ZsjG/hWPEDyRQTXJZbJPyt9hysGv0fK6
        x8Rd9zlu+2AIa2Xg3SzhnNChCjIMK9xn2XWpZNmXiEJm1EmuipFcaTBpordGqJ2ldBv1
        B9hQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UNf2M0OoPPevMB"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
        with ESMTPSA id U06217w1GKL0Jr0
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Sun, 16 Feb 2020 21:21:00 +0100 (CET)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     Paul Boddie <paul@boddie.org.uk>,
        Paul Cercueil <paul@crapouillou.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Andi Kleen <ak@linux.intel.com>,
        Kees Cook <keescook@chromium.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com
Subject: [PATCH v3 0/6] MIPS: Fixes and improvements for CI20 board (JZ4780)
Date:   Sun, 16 Feb 2020 21:20:54 +0100
Message-Id: <cover.1581884459.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

V3:
* dropped "drm: ingenic-drm: add MODULE_DEVICE_TABLE" because it will be resubmitted
  with a HDMI driver solution
* added Cc: stable@vger.kernel.org where appropriate (suggested by Paul Cercueil <paul@crapouillou.net>)
* squashed all other DTS and CONFIG changes into single patches (suggested by Paul Cercueil <paul@crapouillou.net>)

PATCH V2 2020-02-14 17:10:33:
* dropped "net: davicom: dm9000: allow to pass MAC address through mac_addr module parameter"
  from this series because it goes through the netdev tree
  (suggested by Andrew Lunn <andrew@lunn.ch>)
* added a "fixes:" for "MIPS: DTS: CI20: fix PMU definitions for ACT8600"
  and "MIPS: DTS: CI20: fix interrupt for pcf8563 RTC"
  (suggested by Andreas Kemnade <andreas@kemnade.info>)
* "i2c: jz4780: silence log flood on txabrt" dropped because it is
  replaced by a new version in v5.6 by Wolfram Sang <wsa@the-dreams.de>

PATCH V1 2020-02-11 22:41:43:
This patch set provides several improvements for the CI20 board:

* suppress warnings from i2c if device is not responding
* make ingenic-drm found through DT
* allow davicom dm9000 ethernet controller to use MAC address provided by U-Boot
* fix #include in jz4780.dtsi
* configure for loadable kernel modules
* add DTS for IR sensor and SW1 button
* configure so that LEDs, IR sensor, SW1 button have drivers
* fix DTS for ACT8600 PMU and configure driver
* fix interrupt of nxp,pcf8563

There is another patch set in our queue to add HDMI support on top of this work.

Signed-off-by: Paul Boddie <paul@boddie.org.uk>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>


Alex Smith (1):
  MIPS: DTS: CI20: add DT node for IR sensor

H. Nikolaus Schaller (5):
  MIPS: DTS: jz4780: add #includes for irq.h and gpio.h
  MIPS: DTS: CI20: fix PMU definitions for ACT8600
  MIPS: DTS: CI20: fix interrupt for pcf8563 RTC
  MIPS: DTS: CI20: multiple DTS improvements
  MIPS: CI20: defconfig: multiple improvements

 arch/mips/boot/dts/ingenic/ci20.dts    | 71 ++++++++++++++++++++------
 arch/mips/boot/dts/ingenic/jz4780.dtsi |  2 +
 arch/mips/configs/ci20_defconfig       | 21 ++++++++
 3 files changed, 78 insertions(+), 16 deletions(-)

-- 
2.23.0

