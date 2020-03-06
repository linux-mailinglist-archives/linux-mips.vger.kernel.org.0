Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C61617C45B
	for <lists+linux-mips@lfdr.de>; Fri,  6 Mar 2020 18:29:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726382AbgCFR3o (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 6 Mar 2020 12:29:44 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.80]:25622 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726237AbgCFR3o (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 6 Mar 2020 12:29:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1583515781;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=F7Q7dzKizkE8VkIH23/riTwDlFWCGM9XLFl0TNbD9Eo=;
        b=DYq1VZ10FQOymgNarr/J4s02+7mP0sHY23mRhrWlvm/tFAMnOb2YOhVh4bBsde+ZZ6
        sI56AtmCM1IpZEKF8Oz7fDOMDFWl9gaD2QrfBCamCwDipiwHmelvYbuJgcjm2Y+IN/Ba
        bCXv9DfeFAEI3lt/tAIrIma4Ik+VWBMrxi6XuiBurPNjKUS8rZuVMpyY2MEloRz9Q3B6
        Yvm2kMbO9TFLRILnwrUj55NtccN3fej23n7iLKaOaglue8imodUR3cNv0+WTzL2msa7m
        JHygOKSZs4cn2K0vq3mU63ZIogFqFNAYc1VkLNyh762grElSD4Cic35iKId4zyumb/Tj
        lEBQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXH6GQjzrz4="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.2.0 DYNA|AUTH)
        with ESMTPSA id y0a02cw26HTYZte
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Fri, 6 Mar 2020 18:29:34 +0100 (CET)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     Paul Cercueil <paul@crapouillou.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kees Cook <keescook@chromium.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org
Subject: [PATCH v6 3/3] MIPS: CI20: defconfig: multiple improvements
Date:   Fri,  6 Mar 2020 18:29:32 +0100
Message-Id: <3423a1167a36aac94dc5b38830d319af694c6422.1583515771.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1583515771.git.hns@goldelico.com>
References: <cover.1583515771.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

a) configure for supporting modules

Not all drivers need to be compiled into the kernel.
Support building and loading of kernel modules.

b) compile leds-gpio driver into the kernel and configure for LED triggers

DTS has been augmented to add some gpio-leds. We need the leds-gpio driver
and enable the triggers.

c) configure CONFIG_REGULATOR_ACT8865 for PMU

The PMU on the CI20 board is an ACT8600 using the ACT8865 driver.
Since it is not compiled, the PMU and the CI20 board is running in
power-on reset state of the PMU.

d) compile gpio-ir driver

The CI20 board has a gpio based IR receiver.

e) configure for CONFIG_KEYBOARD_GPIO=m

The SW1 button is hooked up to send input events.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
Reviewed-by: Paul Cercueil <paul@crapouillou.net>
---
 arch/mips/configs/ci20_defconfig | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/mips/configs/ci20_defconfig b/arch/mips/configs/ci20_defconfig
index be41df2a81fb..0db0088bbc1c 100644
--- a/arch/mips/configs/ci20_defconfig
+++ b/arch/mips/configs/ci20_defconfig
@@ -1,4 +1,5 @@
 # CONFIG_LOCALVERSION_AUTO is not set
+CONFIG_MODULES=y
 CONFIG_KERNEL_XZ=y
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
@@ -88,12 +89,14 @@ CONFIG_I2C_JZ4780=y
 CONFIG_SPI=y
 CONFIG_SPI_GPIO=y
 CONFIG_GPIO_SYSFS=y
+CONFIG_KEYBOARD_GPIO=m
 # CONFIG_HWMON is not set
 CONFIG_WATCHDOG=y
 CONFIG_JZ4740_WDT=y
 CONFIG_REGULATOR=y
 CONFIG_REGULATOR_DEBUG=y
 CONFIG_REGULATOR_FIXED_VOLTAGE=y
+CONFIG_REGULATOR_ACT8865=y
 # CONFIG_VGA_CONSOLE is not set
 # CONFIG_HID is not set
 # CONFIG_USB_SUPPORT is not set
@@ -166,3 +169,21 @@ CONFIG_STACKTRACE=y
 # CONFIG_FTRACE is not set
 CONFIG_CMDLINE_BOOL=y
 CONFIG_CMDLINE="earlycon console=ttyS4,115200 clk_ignore_unused"
+CONFIG_LEDS_CLASS=y
+CONFIG_LEDS_GPIO=y
+CONFIG_LEDS_TRIGGERS=y
+CONFIG_LEDS_TRIGGER_MTD=y
+CONFIG_LEDS_TRIGGER_TIMER=y
+CONFIG_LEDS_TRIGGER_ONESHOT=y
+CONFIG_LEDS_TRIGGER_ONESHOT=y
+CONFIG_LEDS_TRIGGER_HEARTBEAT=y
+CONFIG_LEDS_TRIGGER_BACKLIGHT=m
+CONFIG_LEDS_TRIGGER_CPU=y
+CONFIG_LEDS_TRIGGER_DEFAULT_ON=y
+CONFIG_LEDS_TRIGGER_TRANSIENT=y
+CONFIG_LEDS_TRIGGER_CAMERA=m
+CONFIG_LIRC=y
+CONFIG_MEDIA_SUPPORT=m
+CONFIG_RC_DEVICES=y
+CONFIG_IR_GPIO_CIR=m
+CONFIG_IR_GPIO_TX=m
-- 
2.23.0

