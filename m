Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8FE5B67DF2
	for <lists+linux-mips@lfdr.de>; Sun, 14 Jul 2019 09:11:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728167AbfGNHLK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 14 Jul 2019 03:11:10 -0400
Received: from sender4-pp-o95.zoho.com ([136.143.188.95]:25552 "EHLO
        sender4-pp-o95.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726799AbfGNHLK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 14 Jul 2019 03:11:10 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1563087358; cv=none; 
        d=zoho.com; s=zohoarc; 
        b=PajdWAL9ZE2X23uDLQTFKwssBHlYH9Nne+I5nN7QwVYjUtvNN1hp7eBeyqPt08L3tBVoAJKPKX4ImhD1bYxMojX7LhlUn1/2wM44ng3gxll0ptGjxWHbtsGZGjkA2knQY/62HhZGOecL077T2/qZ48Ri3s8Z2tLD4eOqc2OZFc8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
        t=1563087358; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To:ARC-Authentication-Results; 
        bh=RJB7rgYbnLJcwb1mEBskcRFwMuNEbU0C07jWNYI1Gj4=; 
        b=Ouf06N9Um4TeM1qT4+yjfIZC+DiNQIA+kJxMz47tgMx7QNHhBPedlC1didc8SFwyux+dXuoW6cYbEwUPnzQxtVI7hsM445kZCPaJD+/oU6beO2RxgLIJfhw3FLcui4XgiHdqcQCXaanmBtFmNfu53Ib8Cf9lU4kMLucbH8frIdI=
ARC-Authentication-Results: i=1; mx.zoho.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=EkAHSOKf1GKVjDz96NvCI5aDQdXhYUcu7ZHpaMVtHH/X9cZ0pv3FEXIMDPncqPvFW1gi33AM1MWh
    LQYEFdKjrej0KYzXBRaNfV5e5rwCsX+1yehyRLS0FpxaR18br3Fy  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1563087358;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        l=21508; bh=RJB7rgYbnLJcwb1mEBskcRFwMuNEbU0C07jWNYI1Gj4=;
        b=iCFIjcCCR0TtvZbwJXC+/99Ydcw4A0H+SSqDvIki5MhpY8OvXovNN5p3EDY4cFuU
        O6mBjYDiUe9tNlvjuqIY504cqny/Aw41lamgbgM2meoXuL+9aTDMqPWa5GsD5gVWQoj
        6W3S54LYJ4bcVRajZ/vaYdoEyiLj6k8kIIk2l5O0=
Received: from zhouyanjie-virtual-machine.localdomain (125.71.5.36 [125.71.5.36]) by mx.zohomail.com
        with SMTPS id 1563087357079200.0927789191004; Sat, 13 Jul 2019 23:55:57 -0700 (PDT)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, paul.burton@mips.com,
        linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com
Subject: [PATCH 2/6] pinctrl: Ingenic: Add pinctrl driver for JZ4760 and JZ4760B.
Date:   Sun, 14 Jul 2019 11:53:52 +0800
Message-Id: <1563076436-5338-3-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563076436-5338-1-git-send-email-zhouyanjie@zoho.com>
References: <1563076436-5338-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add support for probing the pinctrl-ingenic driver on the
JZ4760 Soc and the JZ4760B Soc from Ingenic.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---
 drivers/pinctrl/pinctrl-ingenic.c | 336 ++++++++++++++++++++++++++++++++++----
 1 file changed, 305 insertions(+), 31 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index c8ef3b9..ec61b083 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -35,11 +35,11 @@
 #define JZ4740_GPIO_TRIG	0x70
 #define JZ4740_GPIO_FLAG	0x80
 
-#define JZ4770_GPIO_INT		0x10
-#define JZ4770_GPIO_PAT1	0x30
-#define JZ4770_GPIO_PAT0	0x40
-#define JZ4770_GPIO_FLAG	0x50
-#define JZ4770_GPIO_PEN		0x70
+#define JZ4760_GPIO_INT		0x10
+#define JZ4760_GPIO_PAT1	0x30
+#define JZ4760_GPIO_PAT0	0x40
+#define JZ4760_GPIO_FLAG	0x50
+#define JZ4760_GPIO_PEN		0x70
 
 #define REG_SET(x) ((x) + 0x4)
 #define REG_CLEAR(x) ((x) + 0x8)
@@ -49,6 +49,8 @@
 enum jz_version {
 	ID_JZ4740,
 	ID_JZ4725B,
+	ID_JZ4760,
+	ID_JZ4760B,
 	ID_JZ4770,
 	ID_JZ4780,
 };
@@ -338,6 +340,269 @@ static const struct ingenic_chip_info jz4725b_chip_info = {
 	.pull_downs = jz4740_pull_downs,
 };
 
+static const u32 jz4760_pull_ups[6] = {
+	0xffffffff, 0xfffcf3ff, 0xffffffff, 0xffffcfff, 0xfffffb7c, 0xfffff00f,
+};
+
+static const u32 jz4760_pull_downs[6] = {
+	0x00000000, 0x00030c00, 0x00000000, 0x00003000, 0x00000483, 0x00000ff0,
+};
+
+static int jz4760_uart0_data_pins[] = { 0xa0, 0xa3, };
+static int jz4760_uart0_hwflow_pins[] = { 0xa1, 0xa2, };
+static int jz4760_uart1_data_pins[] = { 0x7a, 0x7c, };
+static int jz4760_uart1_hwflow_pins[] = { 0x7b, 0x7d, };
+static int jz4760_uart2_data_pins[] = { 0x5c, 0x5e, };
+static int jz4760_uart2_hwflow_pins[] = { 0x5d, 0x5f, };
+static int jz4760_uart3_data_pins[] = { 0x6c, 0x85, };
+static int jz4760_uart3_hwflow_pins[] = { 0x88, 0x89, };
+static int jz4760_mmc0_1bit_a_pins[] = { 0x12, 0x13, 0x14, };
+static int jz4760_mmc0_4bit_a_pins[] = { 0x15, 0x16, 0x17, };
+static int jz4760_mmc0_1bit_e_pins[] = { 0x9c, 0x9d, 0x94, };
+static int jz4760_mmc0_4bit_e_pins[] = { 0x95, 0x96, 0x97, };
+static int jz4760_mmc0_8bit_e_pins[] = { 0x98, 0x99, 0x9a, 0x9b, };
+static int jz4760_mmc1_1bit_d_pins[] = { 0x78, 0x79, 0x74, };
+static int jz4760_mmc1_4bit_d_pins[] = { 0x75, 0x76, 0x77, };
+static int jz4760_mmc1_1bit_e_pins[] = { 0x9c, 0x9d, 0x94, };
+static int jz4760_mmc1_4bit_e_pins[] = { 0x95, 0x96, 0x97, };
+static int jz4760_mmc1_8bit_e_pins[] = { 0x98, 0x99, 0x9a, 0x9b, };
+static int jz4760_mmc2_1bit_b_pins[] = { 0x3c, 0x3d, 0x34, };
+static int jz4760_mmc2_4bit_b_pins[] = { 0x35, 0x3e, 0x3f, };
+static int jz4760_mmc2_1bit_e_pins[] = { 0x9c, 0x9d, 0x94, };
+static int jz4760_mmc2_4bit_e_pins[] = { 0x95, 0x96, 0x97, };
+static int jz4760_mmc2_8bit_e_pins[] = { 0x98, 0x99, 0x9a, 0x9b, };
+static int jz4760_nemc_8bit_data_pins[] = {
+	0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
+};
+static int jz4760_nemc_16bit_data_pins[] = {
+	0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f,
+};
+static int jz4760_nemc_cle_ale_pins[] = { 0x20, 0x21, };
+static int jz4760_nemc_addr_pins[] = { 0x22, 0x23, 0x24, 0x25, };
+static int jz4760_nemc_rd_we_pins[] = { 0x10, 0x11, };
+static int jz4760_nemc_frd_fwe_pins[] = { 0x12, 0x13, };
+static int jz4760_nemc_wait_pins[] = { 0x1b, };
+static int jz4760_nemc_cs1_pins[] = { 0x15, };
+static int jz4760_nemc_cs2_pins[] = { 0x16, };
+static int jz4760_nemc_cs3_pins[] = { 0x17, };
+static int jz4760_nemc_cs4_pins[] = { 0x18, };
+static int jz4760_nemc_cs5_pins[] = { 0x19, };
+static int jz4760_nemc_cs6_pins[] = { 0x1a, };
+static int jz4760_i2c0_pins[] = { 0x7e, 0x7f, };
+static int jz4760_i2c1_pins[] = { 0x9e, 0x9f, };
+static int jz4760_cim_pins[] = {
+	0x26, 0x27, 0x28, 0x29,
+	0x2a, 0x2b, 0x2c, 0x2d, 0x2e, 0x2f, 0x30, 0x31,
+};
+static int jz4760_lcd_24bit_pins[] = {
+	0x40, 0x41, 0x42, 0x43, 0x44, 0x45, 0x46, 0x47,
+	0x48, 0x49, 0x4a, 0x4b, 0x4c, 0x4d, 0x4e, 0x4f,
+	0x50, 0x51, 0x52, 0x53, 0x54, 0x55, 0x56, 0x57,
+	0x58, 0x59, 0x5a, 0x5b,
+};
+static int jz4760_pwm_pwm0_pins[] = { 0x80, };
+static int jz4760_pwm_pwm1_pins[] = { 0x81, };
+static int jz4760_pwm_pwm2_pins[] = { 0x82, };
+static int jz4760_pwm_pwm3_pins[] = { 0x83, };
+static int jz4760_pwm_pwm4_pins[] = { 0x84, };
+static int jz4760_pwm_pwm5_pins[] = { 0x85, };
+static int jz4760_pwm_pwm6_pins[] = { 0x6a, };
+static int jz4760_pwm_pwm7_pins[] = { 0x6b, };
+
+static int jz4760_uart0_data_funcs[] = { 0, 0, };
+static int jz4760_uart0_hwflow_funcs[] = { 0, 0, };
+static int jz4760_uart1_data_funcs[] = { 0, 0, };
+static int jz4760_uart1_hwflow_funcs[] = { 0, 0, };
+static int jz4760_uart2_data_funcs[] = { 0, 0, };
+static int jz4760_uart2_hwflow_funcs[] = { 0, 0, };
+static int jz4760_uart3_data_funcs[] = { 0, 1, };
+static int jz4760_uart3_hwflow_funcs[] = { 0, 0, };
+static int jz4760_mmc0_1bit_a_funcs[] = { 1, 1, 0, };
+static int jz4760_mmc0_4bit_a_funcs[] = { 1, 1, 1, };
+static int jz4760_mmc0_1bit_e_funcs[] = { 0, 0, 0, };
+static int jz4760_mmc0_4bit_e_funcs[] = { 0, 0, 0, };
+static int jz4760_mmc0_8bit_e_funcs[] = { 0, 0, 0, 0, };
+static int jz4760_mmc1_1bit_d_funcs[] = { 0, 0, 0, };
+static int jz4760_mmc1_4bit_d_funcs[] = { 0, 0, 0, };
+static int jz4760_mmc1_1bit_e_funcs[] = { 1, 1, 1, };
+static int jz4760_mmc1_4bit_e_funcs[] = { 1, 1, 1, };
+static int jz4760_mmc1_8bit_e_funcs[] = { 1, 1, 1, 1, };
+static int jz4760_mmc2_1bit_b_funcs[] = { 0, 0, 0, };
+static int jz4760_mmc2_4bit_b_funcs[] = { 0, 0, 0, };
+static int jz4760_mmc2_1bit_e_funcs[] = { 2, 2, 2, };
+static int jz4760_mmc2_4bit_e_funcs[] = { 2, 2, 2, };
+static int jz4760_mmc2_8bit_e_funcs[] = { 2, 2, 2, 2, };
+static int jz4760_nemc_8bit_data_funcs[] = { 0, 0, 0, 0, 0, 0, 0, 0, };
+static int jz4760_nemc_16bit_data_funcs[] = { 0, 0, 0, 0, 0, 0, 0, 0, };
+static int jz4760_nemc_cle_ale_funcs[] = { 0, 0, };
+static int jz4760_nemc_addr_funcs[] = { 0, 0, 0, 0, };
+static int jz4760_nemc_rd_we_funcs[] = { 0, 0, };
+static int jz4760_nemc_frd_fwe_funcs[] = { 0, 0, };
+static int jz4760_nemc_wait_funcs[] = { 0, };
+static int jz4760_nemc_cs1_funcs[] = { 0, };
+static int jz4760_nemc_cs2_funcs[] = { 0, };
+static int jz4760_nemc_cs3_funcs[] = { 0, };
+static int jz4760_nemc_cs4_funcs[] = { 0, };
+static int jz4760_nemc_cs5_funcs[] = { 0, };
+static int jz4760_nemc_cs6_funcs[] = { 0, };
+static int jz4760_i2c0_funcs[] = { 0, 0, };
+static int jz4760_i2c1_funcs[] = { 0, 0, };
+static int jz4760_cim_funcs[] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, };
+static int jz4760_lcd_24bit_funcs[] = {
+	0, 0, 0, 0, 0, 0, 0, 0,
+	0, 0, 0, 0, 0, 0, 0, 0,
+	0, 0, 0, 0, 0, 0, 0, 0,
+	0, 0, 0, 0,
+};
+static int jz4760_pwm_pwm0_funcs[] = { 0, };
+static int jz4760_pwm_pwm1_funcs[] = { 0, };
+static int jz4760_pwm_pwm2_funcs[] = { 0, };
+static int jz4760_pwm_pwm3_funcs[] = { 0, };
+static int jz4760_pwm_pwm4_funcs[] = { 0, };
+static int jz4760_pwm_pwm5_funcs[] = { 0, };
+static int jz4760_pwm_pwm6_funcs[] = { 0, };
+static int jz4760_pwm_pwm7_funcs[] = { 0, };
+
+static const struct group_desc jz4760_groups[] = {
+	INGENIC_PIN_GROUP("uart0-data", jz4760_uart0_data),
+	INGENIC_PIN_GROUP("uart0-hwflow", jz4760_uart0_hwflow),
+	INGENIC_PIN_GROUP("uart1-data", jz4760_uart1_data),
+	INGENIC_PIN_GROUP("uart1-hwflow", jz4760_uart1_hwflow),
+	INGENIC_PIN_GROUP("uart2-data", jz4760_uart2_data),
+	INGENIC_PIN_GROUP("uart2-hwflow", jz4760_uart2_hwflow),
+	INGENIC_PIN_GROUP("uart3-data", jz4760_uart3_data),
+	INGENIC_PIN_GROUP("uart3-hwflow", jz4760_uart3_hwflow),
+	INGENIC_PIN_GROUP("mmc0-1bit-a", jz4760_mmc0_1bit_a),
+	INGENIC_PIN_GROUP("mmc0-4bit-a", jz4760_mmc0_4bit_a),
+	INGENIC_PIN_GROUP("mmc0-1bit-e", jz4760_mmc0_1bit_e),
+	INGENIC_PIN_GROUP("mmc0-4bit-e", jz4760_mmc0_4bit_e),
+	INGENIC_PIN_GROUP("mmc0-8bit-e", jz4760_mmc0_8bit_e),
+	INGENIC_PIN_GROUP("mmc1-1bit-d", jz4760_mmc1_1bit_d),
+	INGENIC_PIN_GROUP("mmc1-4bit-d", jz4760_mmc1_4bit_d),
+	INGENIC_PIN_GROUP("mmc1-1bit-e", jz4760_mmc1_1bit_e),
+	INGENIC_PIN_GROUP("mmc1-4bit-e", jz4760_mmc1_4bit_e),
+	INGENIC_PIN_GROUP("mmc1-8bit-e", jz4760_mmc1_8bit_e),
+	INGENIC_PIN_GROUP("mmc2-1bit-b", jz4760_mmc2_1bit_b),
+	INGENIC_PIN_GROUP("mmc2-4bit-b", jz4760_mmc2_4bit_b),
+	INGENIC_PIN_GROUP("mmc2-1bit-e", jz4760_mmc2_1bit_e),
+	INGENIC_PIN_GROUP("mmc2-4bit-e", jz4760_mmc2_4bit_e),
+	INGENIC_PIN_GROUP("mmc2-8bit-e", jz4760_mmc2_8bit_e),
+	INGENIC_PIN_GROUP("nemc-8bit-data", jz4760_nemc_8bit_data),
+	INGENIC_PIN_GROUP("nemc-16bit-data", jz4760_nemc_16bit_data),
+	INGENIC_PIN_GROUP("nemc-cle-ale", jz4760_nemc_cle_ale),
+	INGENIC_PIN_GROUP("nemc-addr", jz4760_nemc_addr),
+	INGENIC_PIN_GROUP("nemc-rd-we", jz4760_nemc_rd_we),
+	INGENIC_PIN_GROUP("nemc-frd-fwe", jz4760_nemc_frd_fwe),
+	INGENIC_PIN_GROUP("nemc-wait", jz4760_nemc_wait),
+	INGENIC_PIN_GROUP("nemc-cs1", jz4760_nemc_cs1),
+	INGENIC_PIN_GROUP("nemc-cs2", jz4760_nemc_cs2),
+	INGENIC_PIN_GROUP("nemc-cs3", jz4760_nemc_cs3),
+	INGENIC_PIN_GROUP("nemc-cs4", jz4760_nemc_cs4),
+	INGENIC_PIN_GROUP("nemc-cs5", jz4760_nemc_cs5),
+	INGENIC_PIN_GROUP("nemc-cs6", jz4760_nemc_cs6),
+	INGENIC_PIN_GROUP("i2c0-data", jz4760_i2c0),
+	INGENIC_PIN_GROUP("i2c1-data", jz4760_i2c1),
+	INGENIC_PIN_GROUP("cim-data", jz4760_cim),
+	INGENIC_PIN_GROUP("lcd-24bit", jz4760_lcd_24bit),
+	{ "lcd-no-pins", },
+	INGENIC_PIN_GROUP("pwm0", jz4760_pwm_pwm0),
+	INGENIC_PIN_GROUP("pwm1", jz4760_pwm_pwm1),
+	INGENIC_PIN_GROUP("pwm2", jz4760_pwm_pwm2),
+	INGENIC_PIN_GROUP("pwm3", jz4760_pwm_pwm3),
+	INGENIC_PIN_GROUP("pwm4", jz4760_pwm_pwm4),
+	INGENIC_PIN_GROUP("pwm5", jz4760_pwm_pwm5),
+	INGENIC_PIN_GROUP("pwm6", jz4760_pwm_pwm6),
+	INGENIC_PIN_GROUP("pwm7", jz4760_pwm_pwm7),
+};
+
+static const char *jz4760_uart0_groups[] = { "uart0-data", "uart0-hwflow", };
+static const char *jz4760_uart1_groups[] = { "uart1-data", "uart1-hwflow", };
+static const char *jz4760_uart2_groups[] = { "uart2-data", "uart2-hwflow", };
+static const char *jz4760_uart3_groups[] = { "uart3-data", "uart3-hwflow", };
+static const char *jz4760_mmc0_groups[] = {
+	"mmc0-1bit-a", "mmc0-4bit-a",
+	"mmc0-1bit-e", "mmc0-4bit-e", "mmc0-8bit-e",
+};
+static const char *jz4760_mmc1_groups[] = {
+	"mmc1-1bit-d", "mmc1-4bit-d",
+	"mmc1-1bit-e", "mmc1-4bit-e", "mmc1-8bit-e",
+};
+static const char *jz4760_mmc2_groups[] = {
+	"mmc2-1bit-b", "mmc2-4bit-b",
+	"mmc2-1bit-e", "mmc2-4bit-e", "mmc2-8bit-e",
+};
+static const char *jz4760_nemc_groups[] = {
+	"nemc-8bit-data", "nemc-16bit-data", "nemc-cle-ale",
+	"nemc-addr", "nemc-rd-we", "nemc-frd-fwe", "nemc-wait",
+};
+static const char *jz4760_cs1_groups[] = { "nemc-cs1", };
+static const char *jz4760_cs2_groups[] = { "nemc-cs2", };
+static const char *jz4760_cs3_groups[] = { "nemc-cs3", };
+static const char *jz4760_cs4_groups[] = { "nemc-cs4", };
+static const char *jz4760_cs5_groups[] = { "nemc-cs5", };
+static const char *jz4760_cs6_groups[] = { "nemc-cs6", };
+static const char *jz4760_i2c0_groups[] = { "i2c0-data", };
+static const char *jz4760_i2c1_groups[] = { "i2c1-data", };
+static const char *jz4760_cim_groups[] = { "cim-data", };
+static const char *jz4760_lcd_groups[] = { "lcd-24bit", "lcd-no-pins", };
+static const char *jz4760_pwm0_groups[] = { "pwm0", };
+static const char *jz4760_pwm1_groups[] = { "pwm1", };
+static const char *jz4760_pwm2_groups[] = { "pwm2", };
+static const char *jz4760_pwm3_groups[] = { "pwm3", };
+static const char *jz4760_pwm4_groups[] = { "pwm4", };
+static const char *jz4760_pwm5_groups[] = { "pwm5", };
+static const char *jz4760_pwm6_groups[] = { "pwm6", };
+static const char *jz4760_pwm7_groups[] = { "pwm7", };
+
+static const struct function_desc jz4760_functions[] = {
+	{ "uart0", jz4760_uart0_groups, ARRAY_SIZE(jz4760_uart0_groups), },
+	{ "uart1", jz4760_uart1_groups, ARRAY_SIZE(jz4760_uart1_groups), },
+	{ "uart2", jz4760_uart2_groups, ARRAY_SIZE(jz4760_uart2_groups), },
+	{ "uart3", jz4760_uart3_groups, ARRAY_SIZE(jz4760_uart3_groups), },
+	{ "mmc0", jz4760_mmc0_groups, ARRAY_SIZE(jz4760_mmc0_groups), },
+	{ "mmc1", jz4760_mmc1_groups, ARRAY_SIZE(jz4760_mmc1_groups), },
+	{ "mmc2", jz4760_mmc2_groups, ARRAY_SIZE(jz4760_mmc2_groups), },
+	{ "nemc", jz4760_nemc_groups, ARRAY_SIZE(jz4760_nemc_groups), },
+	{ "nemc-cs1", jz4760_cs1_groups, ARRAY_SIZE(jz4760_cs1_groups), },
+	{ "nemc-cs2", jz4760_cs2_groups, ARRAY_SIZE(jz4760_cs2_groups), },
+	{ "nemc-cs3", jz4760_cs3_groups, ARRAY_SIZE(jz4760_cs3_groups), },
+	{ "nemc-cs4", jz4760_cs4_groups, ARRAY_SIZE(jz4760_cs4_groups), },
+	{ "nemc-cs5", jz4760_cs5_groups, ARRAY_SIZE(jz4760_cs5_groups), },
+	{ "nemc-cs6", jz4760_cs6_groups, ARRAY_SIZE(jz4760_cs6_groups), },
+	{ "i2c0", jz4760_i2c0_groups, ARRAY_SIZE(jz4760_i2c0_groups), },
+	{ "i2c1", jz4760_i2c1_groups, ARRAY_SIZE(jz4760_i2c1_groups), },
+	{ "cim", jz4760_cim_groups, ARRAY_SIZE(jz4760_cim_groups), },
+	{ "lcd", jz4760_lcd_groups, ARRAY_SIZE(jz4760_lcd_groups), },
+	{ "pwm0", jz4760_pwm0_groups, ARRAY_SIZE(jz4760_pwm0_groups), },
+	{ "pwm1", jz4760_pwm1_groups, ARRAY_SIZE(jz4760_pwm1_groups), },
+	{ "pwm2", jz4760_pwm2_groups, ARRAY_SIZE(jz4760_pwm2_groups), },
+	{ "pwm3", jz4760_pwm3_groups, ARRAY_SIZE(jz4760_pwm3_groups), },
+	{ "pwm4", jz4760_pwm4_groups, ARRAY_SIZE(jz4760_pwm4_groups), },
+	{ "pwm5", jz4760_pwm5_groups, ARRAY_SIZE(jz4760_pwm5_groups), },
+	{ "pwm6", jz4760_pwm6_groups, ARRAY_SIZE(jz4760_pwm6_groups), },
+	{ "pwm7", jz4760_pwm7_groups, ARRAY_SIZE(jz4760_pwm7_groups), },
+};
+
+static const struct ingenic_chip_info jz4760_chip_info = {
+	.num_chips = 6,
+	.groups = jz4760_groups,
+	.num_groups = ARRAY_SIZE(jz4760_groups),
+	.functions = jz4760_functions,
+	.num_functions = ARRAY_SIZE(jz4760_functions),
+	.pull_ups = jz4760_pull_ups,
+	.pull_downs = jz4760_pull_downs,
+};
+
+static const struct ingenic_chip_info jz4760b_chip_info = {
+	.num_chips = 6,
+	.groups = jz4760_groups,
+	.num_groups = ARRAY_SIZE(jz4760_groups),
+	.functions = jz4760_functions,
+	.num_functions = ARRAY_SIZE(jz4760_functions),
+	.pull_ups = jz4760_pull_ups,
+	.pull_downs = jz4760_pull_downs,
+};
+
 static const u32 jz4770_pull_ups[6] = {
 	0x3fffffff, 0xfff0030c, 0xffffffff, 0xffff4fff, 0xfffffb7c, 0xffa7f00f,
 };
@@ -775,8 +1040,8 @@ static inline bool ingenic_gpio_get_value(struct ingenic_gpio_chip *jzgc,
 static void ingenic_gpio_set_value(struct ingenic_gpio_chip *jzgc,
 				   u8 offset, int value)
 {
-	if (jzgc->jzpc->version >= ID_JZ4770)
-		ingenic_gpio_set_bit(jzgc, JZ4770_GPIO_PAT0, offset, !!value);
+	if (jzgc->jzpc->version >= ID_JZ4760)
+		ingenic_gpio_set_bit(jzgc, JZ4760_GPIO_PAT0, offset, !!value);
 	else
 		ingenic_gpio_set_bit(jzgc, JZ4740_GPIO_DATA, offset, !!value);
 }
@@ -786,9 +1051,9 @@ static void irq_set_type(struct ingenic_gpio_chip *jzgc,
 {
 	u8 reg1, reg2;
 
-	if (jzgc->jzpc->version >= ID_JZ4770) {
-		reg1 = JZ4770_GPIO_PAT1;
-		reg2 = JZ4770_GPIO_PAT0;
+	if (jzgc->jzpc->version >= ID_JZ4760) {
+		reg1 = JZ4760_GPIO_PAT1;
+		reg2 = JZ4760_GPIO_PAT0;
 	} else {
 		reg1 = JZ4740_GPIO_TRIG;
 		reg2 = JZ4740_GPIO_DIR;
@@ -837,8 +1102,8 @@ static void ingenic_gpio_irq_enable(struct irq_data *irqd)
 	struct ingenic_gpio_chip *jzgc = gpiochip_get_data(gc);
 	int irq = irqd->hwirq;
 
-	if (jzgc->jzpc->version >= ID_JZ4770)
-		ingenic_gpio_set_bit(jzgc, JZ4770_GPIO_INT, irq, true);
+	if (jzgc->jzpc->version >= ID_JZ4760)
+		ingenic_gpio_set_bit(jzgc, JZ4760_GPIO_INT, irq, true);
 	else
 		ingenic_gpio_set_bit(jzgc, JZ4740_GPIO_SELECT, irq, true);
 
@@ -853,8 +1118,8 @@ static void ingenic_gpio_irq_disable(struct irq_data *irqd)
 
 	ingenic_gpio_irq_mask(irqd);
 
-	if (jzgc->jzpc->version >= ID_JZ4770)
-		ingenic_gpio_set_bit(jzgc, JZ4770_GPIO_INT, irq, false);
+	if (jzgc->jzpc->version >= ID_JZ4760)
+		ingenic_gpio_set_bit(jzgc, JZ4760_GPIO_INT, irq, false);
 	else
 		ingenic_gpio_set_bit(jzgc, JZ4740_GPIO_SELECT, irq, false);
 }
@@ -878,8 +1143,8 @@ static void ingenic_gpio_irq_ack(struct irq_data *irqd)
 			irq_set_type(jzgc, irq, IRQ_TYPE_EDGE_RISING);
 	}
 
-	if (jzgc->jzpc->version >= ID_JZ4770)
-		ingenic_gpio_set_bit(jzgc, JZ4770_GPIO_FLAG, irq, false);
+	if (jzgc->jzpc->version >= ID_JZ4760)
+		ingenic_gpio_set_bit(jzgc, JZ4760_GPIO_FLAG, irq, false);
 	else
 		ingenic_gpio_set_bit(jzgc, JZ4740_GPIO_DATA, irq, true);
 }
@@ -935,8 +1200,8 @@ static void ingenic_gpio_irq_handler(struct irq_desc *desc)
 
 	chained_irq_enter(irq_chip, desc);
 
-	if (jzgc->jzpc->version >= ID_JZ4770)
-		flag = ingenic_gpio_read_reg(jzgc, JZ4770_GPIO_FLAG);
+	if (jzgc->jzpc->version >= ID_JZ4760)
+		flag = ingenic_gpio_read_reg(jzgc, JZ4760_GPIO_FLAG);
 	else
 		flag = ingenic_gpio_read_reg(jzgc, JZ4740_GPIO_FLAG);
 
@@ -1001,8 +1266,8 @@ static int ingenic_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
 	struct ingenic_pinctrl *jzpc = jzgc->jzpc;
 	unsigned int pin = gc->base + offset;
 
-	if (jzpc->version >= ID_JZ4770)
-		return ingenic_get_pin_config(jzpc, pin, JZ4770_GPIO_PAT1);
+	if (jzpc->version >= ID_JZ4760)
+		return ingenic_get_pin_config(jzpc, pin, JZ4760_GPIO_PAT1);
 
 	if (ingenic_get_pin_config(jzpc, pin, JZ4740_GPIO_SELECT))
 		return true;
@@ -1027,11 +1292,11 @@ static int ingenic_pinmux_set_pin_fn(struct ingenic_pinctrl *jzpc,
 	dev_dbg(jzpc->dev, "set pin P%c%u to function %u\n",
 			'A' + offt, idx, func);
 
-	if (jzpc->version >= ID_JZ4770) {
-		ingenic_config_pin(jzpc, pin, JZ4770_GPIO_INT, false);
+	if (jzpc->version >= ID_JZ4760) {
+		ingenic_config_pin(jzpc, pin, JZ4760_GPIO_INT, false);
 		ingenic_config_pin(jzpc, pin, GPIO_MSK, false);
-		ingenic_config_pin(jzpc, pin, JZ4770_GPIO_PAT1, func & 0x2);
-		ingenic_config_pin(jzpc, pin, JZ4770_GPIO_PAT0, func & 0x1);
+		ingenic_config_pin(jzpc, pin, JZ4760_GPIO_PAT1, func & 0x2);
+		ingenic_config_pin(jzpc, pin, JZ4760_GPIO_PAT0, func & 0x1);
 	} else {
 		ingenic_config_pin(jzpc, pin, JZ4740_GPIO_FUNC, true);
 		ingenic_config_pin(jzpc, pin, JZ4740_GPIO_TRIG, func & 0x2);
@@ -1080,10 +1345,10 @@ static int ingenic_pinmux_gpio_set_direction(struct pinctrl_dev *pctldev,
 	dev_dbg(pctldev->dev, "set pin P%c%u to %sput\n",
 			'A' + offt, idx, input ? "in" : "out");
 
-	if (jzpc->version >= ID_JZ4770) {
-		ingenic_config_pin(jzpc, pin, JZ4770_GPIO_INT, false);
+	if (jzpc->version >= ID_JZ4760) {
+		ingenic_config_pin(jzpc, pin, JZ4760_GPIO_INT, false);
 		ingenic_config_pin(jzpc, pin, GPIO_MSK, true);
-		ingenic_config_pin(jzpc, pin, JZ4770_GPIO_PAT1, input);
+		ingenic_config_pin(jzpc, pin, JZ4760_GPIO_PAT1, input);
 	} else {
 		ingenic_config_pin(jzpc, pin, JZ4740_GPIO_SELECT, false);
 		ingenic_config_pin(jzpc, pin, JZ4740_GPIO_DIR, !input);
@@ -1110,8 +1375,8 @@ static int ingenic_pinconf_get(struct pinctrl_dev *pctldev,
 	unsigned int offt = pin / PINS_PER_GPIO_CHIP;
 	bool pull;
 
-	if (jzpc->version >= ID_JZ4770)
-		pull = !ingenic_get_pin_config(jzpc, pin, JZ4770_GPIO_PEN);
+	if (jzpc->version >= ID_JZ4760)
+		pull = !ingenic_get_pin_config(jzpc, pin, JZ4760_GPIO_PEN);
 	else
 		pull = !ingenic_get_pin_config(jzpc, pin, JZ4740_GPIO_PULL_DIS);
 
@@ -1142,8 +1407,8 @@ static int ingenic_pinconf_get(struct pinctrl_dev *pctldev,
 static void ingenic_set_bias(struct ingenic_pinctrl *jzpc,
 		unsigned int pin, bool enabled)
 {
-	if (jzpc->version >= ID_JZ4770)
-		ingenic_config_pin(jzpc, pin, JZ4770_GPIO_PEN, !enabled);
+	if (jzpc->version >= ID_JZ4760)
+		ingenic_config_pin(jzpc, pin, JZ4760_GPIO_PEN, !enabled);
 	else
 		ingenic_config_pin(jzpc, pin, JZ4740_GPIO_PULL_DIS, !enabled);
 }
@@ -1263,6 +1528,8 @@ static const struct regmap_config ingenic_pinctrl_regmap_config = {
 static const struct of_device_id ingenic_pinctrl_of_match[] = {
 	{ .compatible = "ingenic,jz4740-pinctrl", .data = (void *) ID_JZ4740 },
 	{ .compatible = "ingenic,jz4725b-pinctrl", .data = (void *)ID_JZ4725B },
+	{ .compatible = "ingenic,jz4760-pinctrl", .data = (void *) ID_JZ4760 },
+	{ .compatible = "ingenic,jz4760b-pinctrl", .data = (void *) ID_JZ4760B },
 	{ .compatible = "ingenic,jz4770-pinctrl", .data = (void *) ID_JZ4770 },
 	{ .compatible = "ingenic,jz4780-pinctrl", .data = (void *) ID_JZ4780 },
 	{},
@@ -1270,6 +1537,7 @@ static const struct of_device_id ingenic_pinctrl_of_match[] = {
 
 static const struct of_device_id ingenic_gpio_of_match[] __initconst = {
 	{ .compatible = "ingenic,jz4740-gpio", },
+	{ .compatible = "ingenic,jz4760-gpio", },
 	{ .compatible = "ingenic,jz4770-gpio", },
 	{ .compatible = "ingenic,jz4780-gpio", },
 	{},
@@ -1391,6 +1659,10 @@ static int __init ingenic_pinctrl_probe(struct platform_device *pdev)
 		chip_info = &jz4780_chip_info;
 	else if (jzpc->version >= ID_JZ4770)
 		chip_info = &jz4770_chip_info;
+	else if (jzpc->version >= ID_JZ4760B)
+		chip_info = &jz4760b_chip_info;
+	else if (jzpc->version >= ID_JZ4760)
+		chip_info = &jz4760_chip_info;
 	else if (jzpc->version >= ID_JZ4725B)
 		chip_info = &jz4725b_chip_info;
 	else
@@ -1467,6 +1739,8 @@ static int __init ingenic_pinctrl_probe(struct platform_device *pdev)
 static const struct platform_device_id ingenic_pinctrl_ids[] = {
 	{ "jz4740-pinctrl", ID_JZ4740 },
 	{ "jz4725b-pinctrl", ID_JZ4725B },
+	{ "jz4760-pinctrl", ID_JZ4760 },
+	{ "jz4760b-pinctrl", ID_JZ4760B },
 	{ "jz4770-pinctrl", ID_JZ4770 },
 	{ "jz4780-pinctrl", ID_JZ4780 },
 	{},
-- 
2.7.4


