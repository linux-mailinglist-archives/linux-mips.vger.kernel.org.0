Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C33116064D
	for <lists+linux-mips@lfdr.de>; Sun, 16 Feb 2020 21:21:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727809AbgBPUVL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 16 Feb 2020 15:21:11 -0500
Received: from mo4-p03-ob.smtp.rzone.de ([85.215.255.104]:30257 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726020AbgBPUVL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 16 Feb 2020 15:21:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1581884468;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=dOonmpmRBGw9AJdjMOawfKlXYNxdn0SnFz/txP/bL+s=;
        b=Mp+eYrDvLEaHHTBpkg5rNFZkAv3nwp+ADZ+6ADSbj7MrIjpH983vPPdNtphJn5QBM6
        iMeXAlaCDW+tOlPrNqgGN1AQQ/pLpbAgcmVLp7BCa4cTvSnCCQCUgF9l/lKbpAsNPtwx
        g89OBFfcjccU1WrAPFj/hzgRXvzY7zJ/vsvN27U6e5Cpqqlht/ACBFtFG80SXEZsmkKX
        RDrciwSn9VHvid9ky0NDLjYIXTHKtzVcnmtjqnJjrXVcrOh1RTjomjrqpnwHeld8KvHY
        ablKAzrMnDOHIKCAqCeg445GMQEN/htO0voPup2/txv0bUuFFqJLd+f6JQ6KkqpK4QVA
        9QVQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UNf2M0OoPPevMB"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
        with ESMTPSA id U06217w1GKL6Jr6
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Sun, 16 Feb 2020 21:21:06 +0100 (CET)
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
Subject: [PATCH v3 6/6] MIPS: CI20: defconfig: multiple improvements
Date:   Sun, 16 Feb 2020 21:21:00 +0100
Message-Id: <aa7259fbcf0f89ec4ab0639ee67fc03d1c492829.1581884459.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1581884459.git.hns@goldelico.com>
References: <cover.1581884459.git.hns@goldelico.com>
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

