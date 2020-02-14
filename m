Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D28615DFD6
	for <lists+linux-mips@lfdr.de>; Fri, 14 Feb 2020 17:11:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391401AbgBNQKp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 14 Feb 2020 11:10:45 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.80]:35138 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391572AbgBNQKn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 14 Feb 2020 11:10:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1581696638;
        s=strato-dkim-0002; d=goldelico.com;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=ZPKJi9DpktAlJ6/TPMniw8POBwTJ4LOZk0WaWGAQMpk=;
        b=K/NEapG6OwX2fYjxumsHooW6mv71uv28Ih34WLaJTmFCd2AdnmipCe09aBxcjFcx7J
        96N58/ep9EvH1ZqVUh+8rNXYh1hcMAxeNI3+lJPGcsEA/VxisI3J7VO3xN9g90Lkcaa6
        rn3QoUJ3X6QNFb+ROYrD3GZMljljrU7JWMUfDX2gi2DRp23AglcKPg3SMBLFp1sJdgXA
        LADu/oov94tKN4JxHBMYe6jAjoWDP3BnHFar2jrKSi4YvEaWBJwv+C2hTiv3MTlUbroe
        L3tcdf/XErG6goXBjoR9zAdS//IfC9WlRgWiZJe6Q5n37zhhodHOEKPnf5GYjD33iPI3
        ovxg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UNf2M7OMfsfQx3"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
        with ESMTPSA id U06217w1EGAPFkv
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Fri, 14 Feb 2020 17:10:25 +0100 (CET)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     Paul Boddie <paul@boddie.org.uk>,
        Paul Cercueil <paul@crapouillou.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Andi Kleen <ak@linux.intel.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Kees Cook <keescook@chromium.org>
Cc:     devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        letux-kernel@openphoenux.org, kernel@pyra-handheld.com
Subject: [PATCH v2 00/12] MIPS: Fixes and improvements for CI20 board (JZ4780)
Date:   Fri, 14 Feb 2020 17:10:12 +0100
Message-Id: <cover.1581696624.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

V2:
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

H. Nikolaus Schaller (11):
  drm: ingenic-drm: add MODULE_DEVICE_TABLE
  MIPS: DTS: jz4780: add #includes for irq.h and gpio.h
  MIPS: CI20: defconfig: configure for supporting modules
  MIPS: CI20: defconfig: compile leds-gpio driver into the kernel and
    configure for LED triggers
  MIPS: DTS: CI20: fix PMU definitions for ACT8600
  MIPS: CI20: defconfig: configure CONFIG_REGULATOR_ACT8865 for PMU
  MIPS: DTS: CI20: give eth0_power a defined voltage.
  MIPS: CI20: defconfig: compile gpio-ir driver
  MIPS: DTS: CI20: add DT node for SW1 as Enter button
  MIPS: CI20: defconfig: configure for CONFIG_KEYBOARD_GPIO=m
  MIPS: DTS: CI20: fix interrupt for pcf8563 RTC

 arch/mips/boot/dts/ingenic/ci20.dts    | 71 ++++++++++++++++++++------
 arch/mips/boot/dts/ingenic/jz4780.dtsi |  2 +
 arch/mips/configs/ci20_defconfig       | 21 ++++++++
 drivers/gpu/drm/ingenic/ingenic-drm.c  |  2 +
 4 files changed, 80 insertions(+), 16 deletions(-)

-- 
2.23.0

