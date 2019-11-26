Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27E8A1098BB
	for <lists+linux-mips@lfdr.de>; Tue, 26 Nov 2019 06:34:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726636AbfKZFeo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 Nov 2019 00:34:44 -0500
Received: from sender4-pp-o97.zoho.com ([136.143.188.97]:25765 "EHLO
        sender4-pp-o97.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725372AbfKZFeo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 26 Nov 2019 00:34:44 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1574746463; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=dJ/WBWKv2M7iVimzF8ytdubD/k/LdosTlxEUw4NRIKGLsr3bsHje79atfDi6QN3YipYZYAfcojiSCPIWvD8Od2k/9vK3wkOQQvxCuE7k8Gr9UJba9Ie2m29Ru1/V47CiifkpoD39+FatMbSSLZSTz4b6OSMayAW/lahi9WED9E4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1574746463; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To; 
        bh=tzQFvUsyqcFYMb38NZHWUzlf2g118fM8WKJHPHlMn28=; 
        b=VyjSamIQOWWEV388PJklS4DWsd+E/OzSJKOyXGIPD2IOVoHXzIE9X50Idtvg8s4q6WdfXWrkSVk8dVaRZZv8C3MOgWHTkHj6DMOp/6uyRav1U/5OHk3qohfhyUppycXAceYkuTZSFRXARUY03t4wtEuD+QdyNi7vEX6yDJQJPVI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=T7UOZ6nsH0e7vZ7ccazWdvFUvb/8Y5Ab3oTnbevS8t9QcD8OEaYDffgsT0h0nK0FPWtJWWEUtQSd
    +fUBiNgSsFyqAwT/cuYgaMLnztFmu3a+gRoPf2a/4/mxxwaendU+  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1574746463;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=tzQFvUsyqcFYMb38NZHWUzlf2g118fM8WKJHPHlMn28=;
        b=Cdwqx/eDRRV9H3zu+oSaFvpXo198Og8Q2L3S2uNibdo/06uMSzJ2ZK4UtfmO7TuU
        1TAhN8dvL33rmRfDxG4oZxG5AQATrhEa3kczK8VDxfsuPIMhgxZvI4TNO+FpIfyY+m5
        nX0wZlnNzIB4FK+HbRbOo3kWYbOWYiNko9/D1bXc=
Received: from zhouyanjie-virtual-machine.localdomain (182.148.156.27 [182.148.156.27]) by mx.zohomail.com
        with SMTPS id 157474646288433.94922530752456; Mon, 25 Nov 2019 21:34:22 -0800 (PST)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        paul.burton@mips.com, paulburton@kernel.org, paul@crapouillou.net,
        mark.rutland@arm.com, syq@debian.org
Subject: [PATCH v6 1/4] pinctrl: Ingenic: Fix bugs in X1000 and X1500.
Date:   Tue, 26 Nov 2019 13:33:53 +0800
Message-Id: <1574746436-80066-2-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574746436-80066-1-git-send-email-zhouyanjie@zoho.com>
References: <1574746436-80066-1-git-send-email-zhouyanjie@zoho.com>
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
4.X1000 has only one regular externel memory controller that
  does not support nand flash, so change "nemc_" to "emc_".
5.X1500 has only one set of mmc, so modify "mmc0_" to "mmc_".

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---

Notes:
    v1->v2:
    Modify "nemc_" to "emc_" because X1000 has only one regular externel
    memory controller that does not support nand flash.
    
    v2->v3:
    No change.
    
    v3->v4:
    No change.
    
    v4->v5:
    No change.
    
    v5->v6:
    No change.

 drivers/pinctrl/pinctrl-ingenic.c | 94 +++++++++++++++++++--------------------
 1 file changed, 47 insertions(+), 47 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 6e26830..059e39a 100644
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
@@ -1036,20 +1036,20 @@ static int x1000_mmc0_4bit_pins[] = { 0x16, 0x15, 0x14, };
 static int x1000_mmc0_8bit_pins[] = { 0x13, 0x12, 0x11, 0x10, };
 static int x1000_mmc1_1bit_pins[] = { 0x40, 0x41, 0x42, };
 static int x1000_mmc1_4bit_pins[] = { 0x43, 0x44, 0x45, };
-static int x1000_nemc_8bit_data_pins[] = {
+static int x1000_emc_8bit_data_pins[] = {
 	0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
 };
-static int x1000_nemc_16bit_data_pins[] = {
+static int x1000_emc_16bit_data_pins[] = {
 	0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f,
 };
-static int x1000_nemc_addr_pins[] = {
+static int x1000_emc_addr_pins[] = {
 	0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26, 0x27,
 	0x28, 0x29, 0x2a, 0x2b, 0x2c, 0x2d, 0x2e, 0x2f,
 };
-static int x1000_nemc_rd_we_pins[] = { 0x30, 0x31, };
-static int x1000_nemc_wait_pins[] = { 0x34, };
-static int x1000_nemc_cs1_pins[] = { 0x32, };
-static int x1000_nemc_cs2_pins[] = { 0x33, };
+static int x1000_emc_rd_we_pins[] = { 0x30, 0x31, };
+static int x1000_emc_wait_pins[] = { 0x34, };
+static int x1000_emc_cs1_pins[] = { 0x32, };
+static int x1000_emc_cs2_pins[] = { 0x33, };
 static int x1000_i2c0_pins[] = { 0x38, 0x37, };
 static int x1000_i2c1_a_pins[] = { 0x01, 0x00, };
 static int x1000_i2c1_c_pins[] = { 0x5b, 0x5a, };
@@ -1078,7 +1078,7 @@ static int x1000_uart0_data_funcs[] = { 0, 0, };
 static int x1000_uart0_hwflow_funcs[] = { 0, 0, };
 static int x1000_uart1_data_a_funcs[] = { 2, 2, };
 static int x1000_uart1_data_d_funcs[] = { 1, 1, };
-static int x1000_uart1_hwflow_d_funcs[] = { 1, 1, };
+static int x1000_uart1_hwflow_funcs[] = { 1, 1, };
 static int x1000_uart2_data_a_funcs[] = { 2, 2, };
 static int x1000_uart2_data_d_funcs[] = { 0, 0, };
 static int x1000_mmc0_1bit_funcs[] = { 1, 1, 1, };
@@ -1086,15 +1086,15 @@ static int x1000_mmc0_4bit_funcs[] = { 1, 1, 1, };
 static int x1000_mmc0_8bit_funcs[] = { 1, 1, 1, 1, 1, };
 static int x1000_mmc1_1bit_funcs[] = { 0, 0, 0, };
 static int x1000_mmc1_4bit_funcs[] = { 0, 0, 0, };
-static int x1000_nemc_8bit_data_funcs[] = { 0, 0, 0, 0, 0, 0, 0, 0, };
-static int x1000_nemc_16bit_data_funcs[] = { 0, 0, 0, 0, 0, 0, 0, 0, };
-static int x1000_nemc_addr_funcs[] = {
+static int x1000_emc_8bit_data_funcs[] = { 0, 0, 0, 0, 0, 0, 0, 0, };
+static int x1000_emc_16bit_data_funcs[] = { 0, 0, 0, 0, 0, 0, 0, 0, };
+static int x1000_emc_addr_funcs[] = {
 	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 };
-static int x1000_nemc_rd_we_funcs[] = { 0, 0, };
-static int x1000_nemc_wait_funcs[] = { 0, };
-static int x1000_nemc_cs1_funcs[] = { 0, };
-static int x1000_nemc_cs2_funcs[] = { 0, };
+static int x1000_emc_rd_we_funcs[] = { 0, 0, };
+static int x1000_emc_wait_funcs[] = { 0, };
+static int x1000_emc_cs1_funcs[] = { 0, };
+static int x1000_emc_cs2_funcs[] = { 0, };
 static int x1000_i2c0_funcs[] = { 0, 0, };
 static int x1000_i2c1_a_funcs[] = { 2, 2, };
 static int x1000_i2c1_c_funcs[] = { 0, 0, };
@@ -1116,7 +1116,7 @@ static const struct group_desc x1000_groups[] = {
 	INGENIC_PIN_GROUP("uart0-hwflow", x1000_uart0_hwflow),
 	INGENIC_PIN_GROUP("uart1-data-a", x1000_uart1_data_a),
 	INGENIC_PIN_GROUP("uart1-data-d", x1000_uart1_data_d),
-	INGENIC_PIN_GROUP("uart1-hwflow-d", x1000_uart1_hwflow_d),
+	INGENIC_PIN_GROUP("uart1-hwflow", x1000_uart1_hwflow),
 	INGENIC_PIN_GROUP("uart2-data-a", x1000_uart2_data_a),
 	INGENIC_PIN_GROUP("uart2-data-d", x1000_uart2_data_d),
 	INGENIC_PIN_GROUP("mmc0-1bit", x1000_mmc0_1bit),
@@ -1124,13 +1124,13 @@ static const struct group_desc x1000_groups[] = {
 	INGENIC_PIN_GROUP("mmc0-8bit", x1000_mmc0_8bit),
 	INGENIC_PIN_GROUP("mmc1-1bit", x1000_mmc1_1bit),
 	INGENIC_PIN_GROUP("mmc1-4bit", x1000_mmc1_4bit),
-	INGENIC_PIN_GROUP("nemc-8bit-data", x1000_nemc_8bit_data),
-	INGENIC_PIN_GROUP("nemc-16bit-data", x1000_nemc_16bit_data),
-	INGENIC_PIN_GROUP("nemc-addr", x1000_nemc_addr),
-	INGENIC_PIN_GROUP("nemc-rd-we", x1000_nemc_rd_we),
-	INGENIC_PIN_GROUP("nemc-wait", x1000_nemc_wait),
-	INGENIC_PIN_GROUP("nemc-cs1", x1000_nemc_cs1),
-	INGENIC_PIN_GROUP("nemc-cs2", x1000_nemc_cs2),
+	INGENIC_PIN_GROUP("emc-8bit-data", x1000_emc_8bit_data),
+	INGENIC_PIN_GROUP("emc-16bit-data", x1000_emc_16bit_data),
+	INGENIC_PIN_GROUP("emc-addr", x1000_emc_addr),
+	INGENIC_PIN_GROUP("emc-rd-we", x1000_emc_rd_we),
+	INGENIC_PIN_GROUP("emc-wait", x1000_emc_wait),
+	INGENIC_PIN_GROUP("emc-cs1", x1000_emc_cs1),
+	INGENIC_PIN_GROUP("emc-cs2", x1000_emc_cs2),
 	INGENIC_PIN_GROUP("i2c0-data", x1000_i2c0),
 	INGENIC_PIN_GROUP("i2c1-data-a", x1000_i2c1_a),
 	INGENIC_PIN_GROUP("i2c1-data-c", x1000_i2c1_c),
@@ -1149,21 +1149,21 @@ static const struct group_desc x1000_groups[] = {
 
 static const char *x1000_uart0_groups[] = { "uart0-data", "uart0-hwflow", };
 static const char *x1000_uart1_groups[] = {
-	"uart1-data-a", "uart1-data-d", "uart1-hwflow-d",
+	"uart1-data-a", "uart1-data-d", "uart1-hwflow",
 };
 static const char *x1000_uart2_groups[] = { "uart2-data-a", "uart2-data-d", };
 static const char *x1000_mmc0_groups[] = {
 	"mmc0-1bit", "mmc0-4bit", "mmc0-8bit",
 };
 static const char *x1000_mmc1_groups[] = {
-	"mmc1-1bit-e", "mmc1-4bit-e",
+	"mmc1-1bit", "mmc1-4bit",
 };
-static const char *x1000_nemc_groups[] = {
-	"nemc-8bit-data", "nemc-16bit-data",
-	"nemc-addr", "nemc-rd-we", "nemc-wait",
+static const char *x1000_emc_groups[] = {
+	"emc-8bit-data", "emc-16bit-data",
+	"emc-addr", "emc-rd-we", "emc-wait",
 };
-static const char *x1000_cs1_groups[] = { "nemc-cs1", };
-static const char *x1000_cs2_groups[] = { "nemc-cs2", };
+static const char *x1000_cs1_groups[] = { "emc-cs1", };
+static const char *x1000_cs2_groups[] = { "emc-cs2", };
 static const char *x1000_i2c0_groups[] = { "i2c0-data", };
 static const char *x1000_i2c1_groups[] = { "i2c1-data-a", "i2c1-data-c", };
 static const char *x1000_i2c2_groups[] = { "i2c2-data", };
@@ -1184,9 +1184,9 @@ static const struct function_desc x1000_functions[] = {
 	{ "uart2", x1000_uart2_groups, ARRAY_SIZE(x1000_uart2_groups), },
 	{ "mmc0", x1000_mmc0_groups, ARRAY_SIZE(x1000_mmc0_groups), },
 	{ "mmc1", x1000_mmc1_groups, ARRAY_SIZE(x1000_mmc1_groups), },
-	{ "nemc", x1000_nemc_groups, ARRAY_SIZE(x1000_nemc_groups), },
-	{ "nemc-cs1", x1000_cs1_groups, ARRAY_SIZE(x1000_cs1_groups), },
-	{ "nemc-cs2", x1000_cs2_groups, ARRAY_SIZE(x1000_cs2_groups), },
+	{ "emc", x1000_emc_groups, ARRAY_SIZE(x1000_emc_groups), },
+	{ "emc-cs1", x1000_cs1_groups, ARRAY_SIZE(x1000_cs1_groups), },
+	{ "emc-cs2", x1000_cs2_groups, ARRAY_SIZE(x1000_cs2_groups), },
 	{ "i2c0", x1000_i2c0_groups, ARRAY_SIZE(x1000_i2c0_groups), },
 	{ "i2c1", x1000_i2c1_groups, ARRAY_SIZE(x1000_i2c1_groups), },
 	{ "i2c2", x1000_i2c2_groups, ARRAY_SIZE(x1000_i2c2_groups), },
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
@@ -1288,10 +1288,10 @@ static const struct group_desc x1500_groups[] = {
 
 static const char *x1500_uart0_groups[] = { "uart0-data", "uart0-hwflow", };
 static const char *x1500_uart1_groups[] = {
-	"uart1-data-a", "uart1-data-d", "uart1-hwflow-d",
+	"uart1-data-a", "uart1-data-d", "uart1-hwflow",
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


