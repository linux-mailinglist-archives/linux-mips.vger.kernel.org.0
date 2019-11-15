Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24460FD750
	for <lists+linux-mips@lfdr.de>; Fri, 15 Nov 2019 08:47:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726182AbfKOHrg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 15 Nov 2019 02:47:36 -0500
Received: from sender4-pp-o94.zoho.com ([136.143.188.94]:25415 "EHLO
        sender4-pp-o94.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725829AbfKOHrg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 15 Nov 2019 02:47:36 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1573804043; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=LHHSTtFpplY40ulRqOUKrjZLsi6s0axHJ08MCmfJ4FzbKsDKNV07fpDBW/OMHVTB5mvS85viV9L4gIwIwZWR/r8SRg/OqJMWdwKztqTBTs23Yivb4F1Vi4Rgnnose4j6BJmShmlJ08FFysAJ03Y4s4HZ/m8r+KB+tIefR8Annms=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1573804043; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To; 
        bh=Z2C87BSoanRSxgKNQzLVSR4rgyQBKmd7ggU0hBeDWpU=; 
        b=Zi9u+fMxvFaZ7Iiebw0P+CmGcLRjxba3g0je3tJRRGMzmsy48WydP+hDOSh0krryk4upHQUhFqlui74iBnO6tr18XGyyi/+j5kTmegRRaczoZrh64D6MVD4Hy9weSyjMcOOg14F7kUvKZ7Buc8f3t7ZTq+G01ybqR2d3u7bITyM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=Ve9QtBjoG8bz0FSFWB+RwBTbB4fUFcb1vF8CLmDcICxhcF5FUqfjYY4lOQCd9IrfBV3i1Q+rhLA4
    wgeun+Kp6clSLtSeH7h+1SLhr9bygnRjzPBD1nodd1DuG927/bhk  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1573804043;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        l=6548; bh=Z2C87BSoanRSxgKNQzLVSR4rgyQBKmd7ggU0hBeDWpU=;
        b=CfygluVQ77Od1mLAfDJSBGjBr3YOp0MlnzUQW7TLtFUW00PVcNNzN7fPH40xKB2R
        CYNkVLuL9JDxPv3r72F40AltF8uPGtvdffAZ4LSeCvDjrnJ37D2q0jSiEzNJ1w8Yr+5
        6PkMNnbbB/pze1dPjFfzRqRhgS3XThzDFUsa9dDY=
Received: from zhouyanjie-virtual-machine.lan (182.148.156.27 [182.148.156.27]) by mx.zohomail.com
        with SMTPS id 15738040418381004.4361180160936; Thu, 14 Nov 2019 23:47:21 -0800 (PST)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linus.walleij@linaro.org, paul@crapouillou.net,
        paul.burton@mips.com
Subject: [PATCH] pinctrl: Ingenic: Fix bugs in X1000 and X1500.
Date:   Fri, 15 Nov 2019 15:46:51 +0800
Message-Id: <1573804011-2176-2-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573804011-2176-1-git-send-email-zhouyanjie@zoho.com>
References: <1573804011-2176-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

1.Fix the pullup parameter of X1000.
2.X1000 and X1500 have only one set of uart1 hwflow pin mapping,
  so modify "uart1_hwflow_d" to "uart1_hwflow".
3.X1000 has only one set of mmc1 pin mapping, so modify
  "mmc1-1bit-e/mmc1-4bit-e" to "mmc1-1bit/mmc1-4bit".
4.X1500 has only one set of mmc, so modify "mmc0_" to "mmc_".

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---
 drivers/pinctrl/pinctrl-ingenic.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 6e26830..64c8f6d 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -1017,7 +1017,7 @@ static const struct ingenic_chip_info jz4780_chip_info = {
 };
 
 static const u32 x1000_pull_ups[4] = {
-	0xffffffff, 0x8dffffff, 0x7d3fffff, 0xffffffff,
+	0xffffffff, 0xfdffffff, 0x0dffffff, 0x0000003f,
 };
 
 static const u32 x1000_pull_downs[4] = {
@@ -1028,7 +1028,7 @@ static int x1000_uart0_data_pins[] = { 0x4a, 0x4b, };
 static int x1000_uart0_hwflow_pins[] = { 0x4c, 0x4d, };
 static int x1000_uart1_data_a_pins[] = { 0x04, 0x05, };
 static int x1000_uart1_data_d_pins[] = { 0x62, 0x63, };
-static int x1000_uart1_hwflow_d_pins[] = { 0x64, 0x65, };
+static int x1000_uart1_hwflow_pins[] = { 0x64, 0x65, };
 static int x1000_uart2_data_a_pins[] = { 0x02, 0x03, };
 static int x1000_uart2_data_d_pins[] = { 0x65, 0x64, };
 static int x1000_mmc0_1bit_pins[] = { 0x18, 0x19, 0x17, };
@@ -1078,7 +1078,7 @@ static int x1000_uart0_data_funcs[] = { 0, 0, };
 static int x1000_uart0_hwflow_funcs[] = { 0, 0, };
 static int x1000_uart1_data_a_funcs[] = { 2, 2, };
 static int x1000_uart1_data_d_funcs[] = { 1, 1, };
-static int x1000_uart1_hwflow_d_funcs[] = { 1, 1, };
+static int x1000_uart1_hwflow_funcs[] = { 1, 1, };
 static int x1000_uart2_data_a_funcs[] = { 2, 2, };
 static int x1000_uart2_data_d_funcs[] = { 0, 0, };
 static int x1000_mmc0_1bit_funcs[] = { 1, 1, 1, };
@@ -1116,7 +1116,7 @@ static const struct group_desc x1000_groups[] = {
 	INGENIC_PIN_GROUP("uart0-hwflow", x1000_uart0_hwflow),
 	INGENIC_PIN_GROUP("uart1-data-a", x1000_uart1_data_a),
 	INGENIC_PIN_GROUP("uart1-data-d", x1000_uart1_data_d),
-	INGENIC_PIN_GROUP("uart1-hwflow-d", x1000_uart1_hwflow_d),
+	INGENIC_PIN_GROUP("uart1-hwflow", x1000_uart1_hwflow),
 	INGENIC_PIN_GROUP("uart2-data-a", x1000_uart2_data_a),
 	INGENIC_PIN_GROUP("uart2-data-d", x1000_uart2_data_d),
 	INGENIC_PIN_GROUP("mmc0-1bit", x1000_mmc0_1bit),
@@ -1156,7 +1156,7 @@ static const char *x1000_mmc0_groups[] = {
 	"mmc0-1bit", "mmc0-4bit", "mmc0-8bit",
 };
 static const char *x1000_mmc1_groups[] = {
-	"mmc1-1bit-e", "mmc1-4bit-e",
+	"mmc1-1bit", "mmc1-4bit",
 };
 static const char *x1000_nemc_groups[] = {
 	"nemc-8bit-data", "nemc-16bit-data",
@@ -1224,11 +1224,11 @@ static int x1500_uart0_data_pins[] = { 0x4a, 0x4b, };
 static int x1500_uart0_hwflow_pins[] = { 0x4c, 0x4d, };
 static int x1500_uart1_data_a_pins[] = { 0x04, 0x05, };
 static int x1500_uart1_data_d_pins[] = { 0x62, 0x63, };
-static int x1500_uart1_hwflow_d_pins[] = { 0x64, 0x65, };
+static int x1500_uart1_hwflow_pins[] = { 0x64, 0x65, };
 static int x1500_uart2_data_a_pins[] = { 0x02, 0x03, };
 static int x1500_uart2_data_d_pins[] = { 0x65, 0x64, };
-static int x1500_mmc0_1bit_pins[] = { 0x18, 0x19, 0x17, };
-static int x1500_mmc0_4bit_pins[] = { 0x16, 0x15, 0x14, };
+static int x1500_mmc_1bit_pins[] = { 0x18, 0x19, 0x17, };
+static int x1500_mmc_4bit_pins[] = { 0x16, 0x15, 0x14, };
 static int x1500_i2c0_pins[] = { 0x38, 0x37, };
 static int x1500_i2c1_a_pins[] = { 0x01, 0x00, };
 static int x1500_i2c1_c_pins[] = { 0x5b, 0x5a, };
@@ -1247,11 +1247,11 @@ static int x1500_uart0_data_funcs[] = { 0, 0, };
 static int x1500_uart0_hwflow_funcs[] = { 0, 0, };
 static int x1500_uart1_data_a_funcs[] = { 2, 2, };
 static int x1500_uart1_data_d_funcs[] = { 1, 1, };
-static int x1500_uart1_hwflow_d_funcs[] = { 1, 1, };
+static int x1500_uart1_hwflow_funcs[] = { 1, 1, };
 static int x1500_uart2_data_a_funcs[] = { 2, 2, };
 static int x1500_uart2_data_d_funcs[] = { 0, 0, };
-static int x1500_mmc0_1bit_funcs[] = { 1, 1, 1, };
-static int x1500_mmc0_4bit_funcs[] = { 1, 1, 1, };
+static int x1500_mmc_1bit_funcs[] = { 1, 1, 1, };
+static int x1500_mmc_4bit_funcs[] = { 1, 1, 1, };
 static int x1500_i2c0_funcs[] = { 0, 0, };
 static int x1500_i2c1_a_funcs[] = { 2, 2, };
 static int x1500_i2c1_c_funcs[] = { 0, 0, };
@@ -1268,11 +1268,11 @@ static const struct group_desc x1500_groups[] = {
 	INGENIC_PIN_GROUP("uart0-hwflow", x1500_uart0_hwflow),
 	INGENIC_PIN_GROUP("uart1-data-a", x1500_uart1_data_a),
 	INGENIC_PIN_GROUP("uart1-data-d", x1500_uart1_data_d),
-	INGENIC_PIN_GROUP("uart1-hwflow-d", x1500_uart1_hwflow_d),
+	INGENIC_PIN_GROUP("uart1-hwflow", x1500_uart1_hwflow),
 	INGENIC_PIN_GROUP("uart2-data-a", x1500_uart2_data_a),
 	INGENIC_PIN_GROUP("uart2-data-d", x1500_uart2_data_d),
-	INGENIC_PIN_GROUP("mmc0-1bit", x1500_mmc0_1bit),
-	INGENIC_PIN_GROUP("mmc0-4bit", x1500_mmc0_4bit),
+	INGENIC_PIN_GROUP("mmc-1bit", x1500_mmc_1bit),
+	INGENIC_PIN_GROUP("mmc-4bit", x1500_mmc_4bit),
 	INGENIC_PIN_GROUP("i2c0-data", x1500_i2c0),
 	INGENIC_PIN_GROUP("i2c1-data-a", x1500_i2c1_a),
 	INGENIC_PIN_GROUP("i2c1-data-c", x1500_i2c1_c),
@@ -1291,7 +1291,7 @@ static const char *x1500_uart1_groups[] = {
 	"uart1-data-a", "uart1-data-d", "uart1-hwflow-d",
 };
 static const char *x1500_uart2_groups[] = { "uart2-data-a", "uart2-data-d", };
-static const char *x1500_mmc0_groups[] = { "mmc0-1bit", "mmc0-4bit", };
+static const char *x1500_mmc_groups[] = { "mmc-1bit", "mmc-4bit", };
 static const char *x1500_i2c0_groups[] = { "i2c0-data", };
 static const char *x1500_i2c1_groups[] = { "i2c1-data-a", "i2c1-data-c", };
 static const char *x1500_i2c2_groups[] = { "i2c2-data", };
@@ -1307,7 +1307,7 @@ static const struct function_desc x1500_functions[] = {
 	{ "uart0", x1500_uart0_groups, ARRAY_SIZE(x1500_uart0_groups), },
 	{ "uart1", x1500_uart1_groups, ARRAY_SIZE(x1500_uart1_groups), },
 	{ "uart2", x1500_uart2_groups, ARRAY_SIZE(x1500_uart2_groups), },
-	{ "mmc0", x1500_mmc0_groups, ARRAY_SIZE(x1500_mmc0_groups), },
+	{ "mmc", x1500_mmc_groups, ARRAY_SIZE(x1500_mmc_groups), },
 	{ "i2c0", x1500_i2c0_groups, ARRAY_SIZE(x1500_i2c0_groups), },
 	{ "i2c1", x1500_i2c1_groups, ARRAY_SIZE(x1500_i2c1_groups), },
 	{ "i2c2", x1500_i2c2_groups, ARRAY_SIZE(x1500_i2c2_groups), },
-- 
2.7.4

