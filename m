Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4BB2173F5C
	for <lists+linux-mips@lfdr.de>; Fri, 28 Feb 2020 19:20:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726688AbgB1STo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 28 Feb 2020 13:19:44 -0500
Received: from mo4-p04-ob.smtp.rzone.de ([85.215.255.123]:17528 "EHLO
        mo4-p04-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725900AbgB1STm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 28 Feb 2020 13:19:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1582913980;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=xsODhkpVGkDQnLLErU6wOpwUWKFJnPJTBh47MaWfiIU=;
        b=nw5x2mPC3aXbhf3Q6WsgXIcLS6dy85nv/jTNqzV5UxlJl7Xk7F/V0Lp+5U35QIoUpW
        nJTZqRavhkgCPeh/LSLoybRZ4VViVGyVW3eRLwtCHHLF/rVsgrFm2iXRjSXeqezNYjjG
        57YqC6X9cKn3WQv1QvR5KlDbtdzID03BsNvCwnkdx16xCXBeEUZvokNQITWo7oBiGJGV
        hY4EVkGkmosgLWmnEc9T18q1iTr1fMdnu4ZiV8kNBtELJtdhjS9tLCrYo5SGbimJdjEY
        g5y6C5ognIp6mp48nSfZ2bir3sI2LzPHIihn1G5b47u0dB4vNP6ztxxdvP2p3XCZA0hP
        aelA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXH6G1+ULkA="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.2.0 DYNA|AUTH)
        with ESMTPSA id y0a02cw1SIJc2Lr
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Fri, 28 Feb 2020 19:19:38 +0100 (CET)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     Paul Cercueil <paul@crapouillou.net>,
        Paul Boddie <paul@boddie.org.uk>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andi Kleen <ak@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-gpio@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com
Subject: [RFC v2 5/8] pinctrl: ingenic: add hdmi-ddc pin control group
Date:   Fri, 28 Feb 2020 19:19:30 +0100
Message-Id: <010d6ad3473fb4b1f1041888a071796180cdd838.1582913973.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1582913973.git.hns@goldelico.com>
References: <cover.1582913973.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Paul Boddie <paul@boddie.org.uk>

Signed-off-by: Paul Boddie <paul@boddie.org.uk>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/pinctrl/pinctrl-ingenic.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 96f04d121ebd..1599a003c31f 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -4,6 +4,7 @@
  *
  * Copyright (c) 2017 Paul Cercueil <paul@crapouillou.net>
  * Copyright (c) 2019 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
+ * Copyright (c) 2017, 2019 Paul Boddie <paul@boddie.org.uk>
  */
 
 #include <linux/compiler.h>
@@ -900,6 +901,7 @@ static int jz4780_mmc0_8bit_a_pins[] = { 0x04, 0x05, 0x06, 0x07, 0x18, };
 static int jz4780_i2c3_pins[] = { 0x6a, 0x6b, };
 static int jz4780_i2c4_e_pins[] = { 0x8c, 0x8d, };
 static int jz4780_i2c4_f_pins[] = { 0xb9, 0xb8, };
+static int jz4780_hdmi_ddc_pins[] = { 0xb9, 0xb8, };
 
 static int jz4780_uart2_data_funcs[] = { 1, 1, };
 static int jz4780_uart2_hwflow_funcs[] = { 1, 1, };
@@ -908,6 +910,7 @@ static int jz4780_mmc0_8bit_a_funcs[] = { 1, 1, 1, 1, 1, };
 static int jz4780_i2c3_funcs[] = { 1, 1, };
 static int jz4780_i2c4_e_funcs[] = { 1, 1, };
 static int jz4780_i2c4_f_funcs[] = { 1, 1, };
+static int jz4780_hdmi_ddc_funcs[] = { 0, 0, };
 
 static const struct group_desc jz4780_groups[] = {
 	INGENIC_PIN_GROUP("uart0-data", jz4770_uart0_data),
@@ -950,6 +953,7 @@ static const struct group_desc jz4780_groups[] = {
 	INGENIC_PIN_GROUP("i2c3-data", jz4780_i2c3),
 	INGENIC_PIN_GROUP("i2c4-data-e", jz4780_i2c4_e),
 	INGENIC_PIN_GROUP("i2c4-data-f", jz4780_i2c4_f),
+	INGENIC_PIN_GROUP("hdmi-ddc", jz4780_hdmi_ddc),
 	INGENIC_PIN_GROUP("cim-data", jz4770_cim_8bit),
 	INGENIC_PIN_GROUP("lcd-24bit", jz4770_lcd_24bit),
 	{ "lcd-no-pins", },
@@ -982,6 +986,7 @@ static const char *jz4780_nemc_groups[] = {
 static const char *jz4780_i2c3_groups[] = { "i2c3-data", };
 static const char *jz4780_i2c4_groups[] = { "i2c4-data-e", "i2c4-data-f", };
 static const char *jz4780_cim_groups[] = { "cim-data", };
+static const char *jz4780_hdmi_ddc_groups[] = { "hdmi-ddc", };
 
 static const struct function_desc jz4780_functions[] = {
 	{ "uart0", jz4770_uart0_groups, ARRAY_SIZE(jz4770_uart0_groups), },
@@ -1014,6 +1019,8 @@ static const struct function_desc jz4780_functions[] = {
 	{ "pwm5", jz4770_pwm5_groups, ARRAY_SIZE(jz4770_pwm5_groups), },
 	{ "pwm6", jz4770_pwm6_groups, ARRAY_SIZE(jz4770_pwm6_groups), },
 	{ "pwm7", jz4770_pwm7_groups, ARRAY_SIZE(jz4770_pwm7_groups), },
+	{ "hdmi-ddc", jz4780_hdmi_ddc_groups,
+		      ARRAY_SIZE(jz4780_hdmi_ddc_groups), },
 };
 
 static const struct ingenic_chip_info jz4780_chip_info = {
-- 
2.23.0

