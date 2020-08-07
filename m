Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7D2F23EB27
	for <lists+linux-mips@lfdr.de>; Fri,  7 Aug 2020 12:04:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728003AbgHGKEZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 7 Aug 2020 06:04:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728064AbgHGKEV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 7 Aug 2020 06:04:21 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1053C061575;
        Fri,  7 Aug 2020 03:04:20 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id r4so1124115wrx.9;
        Fri, 07 Aug 2020 03:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BKXtogLnS75FiWrZZGtgF3aApvOi6qz0ymHU4HAZuaA=;
        b=tJdlctrW7JcOsxxkSmKRkDV7XDuHRsv07hKurB23kDfsASTL9Af1hY5MSCEnbXYthk
         aTq9o7A4S+x8FNyBoOdDGn8TuTExDXR2qER4dQjtBb/KuDCVGcfTjAxr9PqoRVOVix8k
         gg8FOYEP4VGsXS5Tny0aLrvkWN6LpO//GX5t8T0Fy1J1RP1UcdkYsE0k24tk63dy4G3/
         RCmklcW7avgT4YBcAx5OQB7e3SKWzyhNBDAyWWgK6mE8lOkOlNjqdM8MV3vrTKbWbR2t
         ZYHxaFQYMYUDgeThMSNmxxZQAEoBMNwbaYkIdeIUukkxdofHNqZOx4N9cJyfRcGXmrq5
         ev/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BKXtogLnS75FiWrZZGtgF3aApvOi6qz0ymHU4HAZuaA=;
        b=hoI52638aJWcWW//ueNHu6GXxuOWBJJKq6ogKzsTDR1baY5MZGymrqhWYMZ3L4VVCh
         IPgK1itGmWgPWI4jS2dXlllWuPnCNwYCDt5mWppsOZ4Wg2oylXl3wYzvZtmqGRIgFGsQ
         w33W5HHeubVXZ2bR+6qontTuQeiN5fz6EvM6qflg8NZx+tE8yb26d2vYhZPxaJnH0SYx
         lfXTUYjKC0RBtu5WzurC6qTujMWoqDXAguFzeR6sckiVQ0mtv4kqPda9b+kJe7d2W7U0
         Dda0IYy9NB4VvuMu4dQSo3H+WZAI/i1Hpisjd0Ep+XZlJSbGkOXYXs9gCvFDhwjwGUXz
         suOg==
X-Gm-Message-State: AOAM533qPMZn0WvsjRHRLcJlWsts5o7X7m/aBWFzT4lPKJBy6PhJfsVB
        QNBZ30tx/bh9YC+eMbNyg/2pbPAd
X-Google-Smtp-Source: ABdhPJzPrzrcYANNIlq9+VkYPOZ2NJgbFrADMHKxce9vL4XRsnrlws4x1b6tKPsMrhdpybUgMJ1nBQ==
X-Received: by 2002:a5d:484d:: with SMTP id n13mr11444577wrs.297.1596794658583;
        Fri, 07 Aug 2020 03:04:18 -0700 (PDT)
Received: from skynet.lan (88.red-83-49-60.dynamicip.rima-tde.net. [83.49.60.88])
        by smtp.gmail.com with ESMTPSA id k1sm9875402wrw.91.2020.08.07.03.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2020 03:04:18 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, bcm-kernel-feedback-list@broadcom.com,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v2 4/4] MIPS: BCM63xx: refactor board declarations
Date:   Fri,  7 Aug 2020 12:04:11 +0200
Message-Id: <20200807100411.2904279-5-noltari@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200807100411.2904279-1-noltari@gmail.com>
References: <20200807100411.2904279-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Current board declarations are a mess. Let's put some order and make them
follow the same structure. Also board declarations tabs.
Switch to SPDX license identifier.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 v2: switch to SPDX license identifier.

 arch/mips/bcm63xx/boards/board_bcm963xx.c | 620 +++++++++++-----------
 1 file changed, 306 insertions(+), 314 deletions(-)

diff --git a/arch/mips/bcm63xx/boards/board_bcm963xx.c b/arch/mips/bcm63xx/boards/board_bcm963xx.c
index ac9570b66f37..01aff80a5967 100644
--- a/arch/mips/bcm63xx/boards/board_bcm963xx.c
+++ b/arch/mips/bcm63xx/boards/board_bcm963xx.c
@@ -1,8 +1,5 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file "COPYING" in the main directory of this archive
- * for more details.
- *
  * Copyright (C) 2008 Maxime Bizon <mbizon@freebox.fr>
  * Copyright (C) 2008 Florian Fainelli <florian@openwrt.org>
  */
@@ -41,30 +38,28 @@ static struct board_info board;
  */
 #ifdef CONFIG_BCM63XX_CPU_3368
 static struct board_info __initdata board_cvg834g = {
-	.name				= "CVG834G_E15R3921",
-	.expected_cpu_id		= 0x3368,
+	.name = "CVG834G_E15R3921",
+	.expected_cpu_id = 0x3368,
 
-	.has_uart0			= 1,
-	.has_uart1			= 1,
-
-	.has_enet0			= 1,
-	.has_pci			= 1,
+	.ephy_reset_gpio = 36,
+	.ephy_reset_gpio_flags = GPIOF_INIT_HIGH,
+	.has_pci = 1,
+	.has_uart0 = 1,
+	.has_uart1 = 1,
 
+	.has_enet0 = 1,
 	.enet0 = {
-		.has_phy		= 1,
-		.use_internal_phy	= 1,
+		.has_phy = 1,
+		.use_internal_phy = 1,
 	},
 
 	.leds = {
 		{
-			.name		= "CVG834G:green:power",
-			.gpio		= 37,
+			.name = "CVG834G:green:power",
+			.gpio = 37,
 			.default_trigger= "default-on",
 		},
 	},
-
-	.ephy_reset_gpio		= 36,
-	.ephy_reset_gpio_flags		= GPIOF_INIT_HIGH,
 };
 #endif /* CONFIG_BCM63XX_CPU_3368 */
 
@@ -73,44 +68,44 @@ static struct board_info __initdata board_cvg834g = {
  */
 #ifdef CONFIG_BCM63XX_CPU_6328
 static struct board_info __initdata board_96328avng = {
-	.name				= "96328avng",
-	.expected_cpu_id		= 0x6328,
+	.name = "96328avng",
+	.expected_cpu_id = 0x6328,
 
-	.has_uart0			= 1,
-	.has_pci			= 1,
-	.has_usbd			= 0,
+	.has_pci = 1,
+	.has_uart0 = 1,
 
+	.has_usbd = 0,
 	.usbd = {
-		.use_fullspeed		= 0,
-		.port_no		= 0,
+		.use_fullspeed = 0,
+		.port_no = 0,
 	},
 
 	.leds = {
 		{
-			.name		= "96328avng::ppp-fail",
-			.gpio		= 2,
-			.active_low	= 1,
+			.name = "96328avng::ppp-fail",
+			.gpio = 2,
+			.active_low = 1,
 		},
 		{
-			.name		= "96328avng::power",
-			.gpio		= 4,
-			.active_low	= 1,
+			.name = "96328avng::power",
+			.gpio = 4,
+			.active_low = 1,
 			.default_trigger = "default-on",
 		},
 		{
-			.name		= "96328avng::power-fail",
-			.gpio		= 8,
-			.active_low	= 1,
+			.name = "96328avng::power-fail",
+			.gpio = 8,
+			.active_low = 1,
 		},
 		{
-			.name		= "96328avng::wps",
-			.gpio		= 9,
-			.active_low	= 1,
+			.name = "96328avng::wps",
+			.gpio = 9,
+			.active_low = 1,
 		},
 		{
-			.name		= "96328avng::ppp",
-			.gpio		= 11,
-			.active_low	= 1,
+			.name = "96328avng::ppp",
+			.gpio = 11,
+			.active_low = 1,
 		},
 	},
 };
@@ -121,85 +116,86 @@ static struct board_info __initdata board_96328avng = {
  */
 #ifdef CONFIG_BCM63XX_CPU_6338
 static struct board_info __initdata board_96338gw = {
-	.name				= "96338GW",
-	.expected_cpu_id		= 0x6338,
+	.name = "96338GW",
+	.expected_cpu_id = 0x6338,
+
+	.has_ohci0 = 1,
+	.has_uart0 = 1,
 
-	.has_uart0			= 1,
-	.has_enet0			= 1,
+	.has_enet0 = 1,
 	.enet0 = {
-		.force_speed_100	= 1,
-		.force_duplex_full	= 1,
+		.force_speed_100 = 1,
+		.force_duplex_full = 1,
 	},
 
-	.has_ohci0			= 1,
-
 	.leds = {
 		{
-			.name		= "adsl",
-			.gpio		= 3,
-			.active_low	= 1,
+			.name = "adsl",
+			.gpio = 3,
+			.active_low = 1,
 		},
 		{
-			.name		= "ses",
-			.gpio		= 5,
-			.active_low	= 1,
+			.name = "ses",
+			.gpio = 5,
+			.active_low = 1,
 		},
 		{
-			.name		= "ppp-fail",
-			.gpio		= 4,
-			.active_low	= 1,
+			.name = "ppp-fail",
+			.gpio = 4,
+			.active_low = 1,
 		},
 		{
-			.name		= "power",
-			.gpio		= 0,
-			.active_low	= 1,
+			.name = "power",
+			.gpio = 0,
+			.active_low = 1,
 			.default_trigger = "default-on",
 		},
 		{
-			.name		= "stop",
-			.gpio		= 1,
-			.active_low	= 1,
+			.name = "stop",
+			.gpio = 1,
+			.active_low = 1,
 		}
 	},
 };
 
 static struct board_info __initdata board_96338w = {
-	.name				= "96338W",
-	.expected_cpu_id		= 0x6338,
+	.name = "96338W",
+	.expected_cpu_id = 0x6338,
+
+	.has_uart0 = 1,
 
-	.has_uart0			= 1,
-	.has_enet0			= 1,
+	.has_enet0 = 1,
 	.enet0 = {
-		.force_speed_100	= 1,
-		.force_duplex_full	= 1,
+		.force_speed_100 = 1,
+		.force_duplex_full = 1,
 	},
 
 	.leds = {
 		{
-			.name		= "adsl",
-			.gpio		= 3,
-			.active_low	= 1,
+			.name = "adsl",
+			.gpio = 3,
+			.active_low = 1,
 		},
 		{
-			.name		= "ses",
-			.gpio		= 5,
-			.active_low	= 1,
+			.name = "ses",
+			.gpio = 5,
+			.active_low = 1,
 		},
 		{
-			.name		= "ppp-fail",
-			.gpio		= 4,
-			.active_low	= 1,
+			.name = "ppp-fail",
+			.gpio = 4,
+			.active_low = 1,
 		},
 		{
-			.name		= "power",
-			.gpio		= 0,
-			.active_low	= 1,
+			.name = "power",
+			.gpio = 0,
+			.active_low = 1,
 			.default_trigger = "default-on",
 		},
 		{
-			.name		= "stop",
-			.gpio		= 1,
-			.active_low	= 1,
+			.name = "stop",
+			.gpio = 1,
+			.active_low = 1,
 		},
 	},
 };
@@ -210,10 +206,10 @@ static struct board_info __initdata board_96338w = {
  */
 #ifdef CONFIG_BCM63XX_CPU_6345
 static struct board_info __initdata board_96345gw2 = {
-	.name				= "96345GW2",
-	.expected_cpu_id		= 0x6345,
+	.name = "96345GW2",
+	.expected_cpu_id = 0x6345,
 
-	.has_uart0			= 1,
+	.has_uart0 = 1,
 };
 #endif /* CONFIG_BCM63XX_CPU_6345 */
 
@@ -222,282 +218,282 @@ static struct board_info __initdata board_96345gw2 = {
  */
 #ifdef CONFIG_BCM63XX_CPU_6348
 static struct board_info __initdata board_96348r = {
-	.name				= "96348R",
-	.expected_cpu_id		= 0x6348,
+	.name = "96348R",
+	.expected_cpu_id = 0x6348,
 
-	.has_uart0			= 1,
-	.has_enet0			= 1,
-	.has_pci			= 1,
+	.has_pci = 1,
+	.has_uart0 = 1,
 
+	.has_enet0 = 1,
 	.enet0 = {
-		.has_phy		= 1,
-		.use_internal_phy	= 1,
+		.has_phy = 1,
+		.use_internal_phy = 1,
 	},
 
 	.leds = {
 		{
-			.name		= "adsl-fail",
-			.gpio		= 2,
-			.active_low	= 1,
+			.name = "adsl-fail",
+			.gpio = 2,
+			.active_low = 1,
 		},
 		{
-			.name		= "ppp",
-			.gpio		= 3,
-			.active_low	= 1,
+			.name = "ppp",
+			.gpio = 3,
+			.active_low = 1,
 		},
 		{
-			.name		= "ppp-fail",
-			.gpio		= 4,
-			.active_low	= 1,
+			.name = "ppp-fail",
+			.gpio = 4,
+			.active_low = 1,
 		},
 		{
-			.name		= "power",
-			.gpio		= 0,
-			.active_low	= 1,
+			.name = "power",
+			.gpio = 0,
+			.active_low = 1,
 			.default_trigger = "default-on",
 
 		},
 		{
-			.name		= "stop",
-			.gpio		= 1,
-			.active_low	= 1,
+			.name = "stop",
+			.gpio = 1,
+			.active_low = 1,
 		},
 	},
 };
 
 static struct board_info __initdata board_96348gw_10 = {
-	.name				= "96348GW-10",
-	.expected_cpu_id		= 0x6348,
+	.name = "96348GW-10",
+	.expected_cpu_id = 0x6348,
 
-	.has_uart0			= 1,
-	.has_enet0			= 1,
-	.has_enet1			= 1,
-	.has_pci			= 1,
+	.has_ohci0 = 1,
+	.has_pccard = 1,
+	.has_pci = 1,
+	.has_uart0 = 1,
 
+	.has_enet0 = 1,
 	.enet0 = {
-		.has_phy		= 1,
-		.use_internal_phy	= 1,
+		.has_phy = 1,
+		.use_internal_phy = 1,
 	},
+
+	.has_enet1 = 1,
 	.enet1 = {
-		.force_speed_100	= 1,
-		.force_duplex_full	= 1,
+		.force_speed_100 = 1,
+		.force_duplex_full = 1,
 	},
 
-	.has_ohci0			= 1,
-	.has_pccard			= 1,
-
 	.leds = {
 		{
-			.name		= "adsl-fail",
-			.gpio		= 2,
-			.active_low	= 1,
+			.name = "adsl-fail",
+			.gpio = 2,
+			.active_low = 1,
 		},
 		{
-			.name		= "ppp",
-			.gpio		= 3,
-			.active_low	= 1,
+			.name = "ppp",
+			.gpio = 3,
+			.active_low = 1,
 		},
 		{
-			.name		= "ppp-fail",
-			.gpio		= 4,
-			.active_low	= 1,
+			.name = "ppp-fail",
+			.gpio = 4,
+			.active_low = 1,
 		},
 		{
-			.name		= "power",
-			.gpio		= 0,
-			.active_low	= 1,
+			.name = "power",
+			.gpio = 0,
+			.active_low = 1,
 			.default_trigger = "default-on",
 		},
 		{
-			.name		= "stop",
-			.gpio		= 1,
-			.active_low	= 1,
+			.name = "stop",
+			.gpio = 1,
+			.active_low = 1,
 		},
 	},
 };
 
 static struct board_info __initdata board_96348gw_11 = {
-	.name				= "96348GW-11",
-	.expected_cpu_id		= 0x6348,
+	.name = "96348GW-11",
+	.expected_cpu_id = 0x6348,
 
-	.has_uart0			= 1,
-	.has_enet0			= 1,
-	.has_enet1			= 1,
-	.has_pci			= 1,
+	.has_ohci0 = 1,
+	.has_pccard = 1,
+	.has_pci = 1,
+	.has_uart0 = 1,
 
+	.has_enet0 = 1,
 	.enet0 = {
-		.has_phy		= 1,
-		.use_internal_phy	= 1,
+		.has_phy = 1,
+		.use_internal_phy = 1,
 	},
 
+	.has_enet1 = 1,
 	.enet1 = {
-		.force_speed_100	= 1,
-		.force_duplex_full	= 1,
+		.force_speed_100 = 1,
+		.force_duplex_full = 1,
 	},
 
-	.has_ohci0 = 1,
-	.has_pccard = 1,
-
 	.leds = {
 		{
-			.name		= "adsl-fail",
-			.gpio		= 2,
-			.active_low	= 1,
+			.name = "adsl-fail",
+			.gpio = 2,
+			.active_low = 1,
 		},
 		{
-			.name		= "ppp",
-			.gpio		= 3,
-			.active_low	= 1,
+			.name = "ppp",
+			.gpio = 3,
+			.active_low = 1,
 		},
 		{
-			.name		= "ppp-fail",
-			.gpio		= 4,
-			.active_low	= 1,
+			.name = "ppp-fail",
+			.gpio = 4,
+			.active_low = 1,
 		},
 		{
-			.name		= "power",
-			.gpio		= 0,
-			.active_low	= 1,
+			.name = "power",
+			.gpio = 0,
+			.active_low = 1,
 			.default_trigger = "default-on",
 		},
 		{
-			.name		= "stop",
-			.gpio		= 1,
-			.active_low	= 1,
+			.name = "stop",
+			.gpio = 1,
+			.active_low = 1,
 		},
 	},
 };
 
 static struct board_info __initdata board_96348gw = {
-	.name				= "96348GW",
-	.expected_cpu_id		= 0x6348,
+	.name = "96348GW",
+	.expected_cpu_id = 0x6348,
 
-	.has_uart0			= 1,
-	.has_enet0			= 1,
-	.has_enet1			= 1,
-	.has_pci			= 1,
+	.has_ohci0 = 1,
+	.has_pci = 1,
+	.has_uart0 = 1,
 
+	.has_enet0 = 1,
 	.enet0 = {
-		.has_phy		= 1,
-		.use_internal_phy	= 1,
+		.has_phy = 1,
+		.use_internal_phy = 1,
 	},
+
+	.has_enet1 = 1,
 	.enet1 = {
-		.force_speed_100	= 1,
-		.force_duplex_full	= 1,
+		.force_speed_100 = 1,
+		.force_duplex_full = 1,
 	},
 
-	.has_ohci0 = 1,
-
 	.leds = {
 		{
-			.name		= "adsl-fail",
-			.gpio		= 2,
-			.active_low	= 1,
+			.name = "adsl-fail",
+			.gpio = 2,
+			.active_low = 1,
 		},
 		{
-			.name		= "ppp",
-			.gpio		= 3,
-			.active_low	= 1,
+			.name = "ppp",
+			.gpio = 3,
+			.active_low = 1,
 		},
 		{
-			.name		= "ppp-fail",
-			.gpio		= 4,
-			.active_low	= 1,
+			.name = "ppp-fail",
+			.gpio = 4,
+			.active_low = 1,
 		},
 		{
-			.name		= "power",
-			.gpio		= 0,
-			.active_low	= 1,
+			.name = "power",
+			.gpio = 0,
+			.active_low = 1,
 			.default_trigger = "default-on",
 		},
 		{
-			.name		= "stop",
-			.gpio		= 1,
-			.active_low	= 1,
+			.name = "stop",
+			.gpio = 1,
+			.active_low = 1,
 		},
 	},
 };
 
 static struct board_info __initdata board_FAST2404 = {
-	.name				= "F@ST2404",
-	.expected_cpu_id		= 0x6348,
+	.name = "F@ST2404",
+	.expected_cpu_id = 0x6348,
 
-	.has_uart0			= 1,
-	.has_enet0			= 1,
-	.has_enet1			= 1,
-	.has_pci			= 1,
+	.has_ohci0 = 1,
+	.has_pccard = 1,
+	.has_pci = 1,
+	.has_uart0 = 1,
 
+	.has_enet0 = 1,
 	.enet0 = {
-		.has_phy		= 1,
-		.use_internal_phy	= 1,
+		.has_phy = 1,
+		.use_internal_phy = 1,
 	},
 
+	.has_enet1 = 1,
 	.enet1 = {
-		.force_speed_100	= 1,
-		.force_duplex_full	= 1,
+		.force_speed_100 = 1,
+		.force_duplex_full = 1,
 	},
-
-	.has_ohci0			= 1,
-	.has_pccard			= 1,
 };
 
 static struct board_info __initdata board_rta1025w_16 = {
-	.name				= "RTA1025W_16",
-	.expected_cpu_id		= 0x6348,
+	.name = "RTA1025W_16",
+	.expected_cpu_id = 0x6348,
 
-	.has_enet0			= 1,
-	.has_enet1			= 1,
-	.has_pci			= 1,
+	.has_pci = 1,
 
+	.has_enet0 = 1,
 	.enet0 = {
-		.has_phy		= 1,
-		.use_internal_phy	= 1,
+		.has_phy = 1,
+		.use_internal_phy = 1,
 	},
+
+	.has_enet1 = 1,
 	.enet1 = {
-		.force_speed_100	= 1,
-		.force_duplex_full	= 1,
+		.force_speed_100 = 1,
+		.force_duplex_full = 1,
 	},
 };
 
 static struct board_info __initdata board_DV201AMR = {
-	.name				= "DV201AMR",
-	.expected_cpu_id		= 0x6348,
+	.name = "DV201AMR",
+	.expected_cpu_id = 0x6348,
 
-	.has_uart0			= 1,
-	.has_pci			= 1,
-	.has_ohci0			= 1,
+	.has_ohci0 = 1,
+	.has_pci = 1,
+	.has_uart0 = 1,
 
-	.has_enet0			= 1,
-	.has_enet1			= 1,
+	.has_enet0 = 1,
 	.enet0 = {
-		.has_phy		= 1,
-		.use_internal_phy	= 1,
+		.has_phy = 1,
+		.use_internal_phy = 1,
 	},
+
+	.has_enet1 = 1,
 	.enet1 = {
-		.force_speed_100	= 1,
-		.force_duplex_full	= 1,
+		.force_speed_100 = 1,
+		.force_duplex_full = 1,
 	},
 };
 
 static struct board_info __initdata board_96348gw_a = {
-	.name				= "96348GW-A",
-	.expected_cpu_id		= 0x6348,
+	.name = "96348GW-A",
+	.expected_cpu_id = 0x6348,
 
-	.has_uart0			= 1,
-	.has_enet0			= 1,
-	.has_enet1			= 1,
-	.has_pci			= 1,
+	.has_ohci0 = 1,
+	.has_pci = 1,
+	.has_uart0 = 1,
 
+	.has_enet0 = 1,
 	.enet0 = {
-		.has_phy		= 1,
-		.use_internal_phy	= 1,
+		.has_phy = 1,
+		.use_internal_phy = 1,
 	},
+
+	.has_enet1 = 1,
 	.enet1 = {
-		.force_speed_100	= 1,
-		.force_duplex_full	= 1,
+		.force_speed_100 = 1,
+		.force_duplex_full = 1,
 	},
-
-	.has_ohci0 = 1,
 };
 #endif /* CONFIG_BCM63XX_CPU_6348 */
 
@@ -506,146 +502,142 @@ static struct board_info __initdata board_96348gw_a = {
  */
 #ifdef CONFIG_BCM63XX_CPU_6358
 static struct board_info __initdata board_96358vw = {
-	.name				= "96358VW",
-	.expected_cpu_id		= 0x6358,
+	.name = "96358VW",
+	.expected_cpu_id = 0x6358,
 
-	.has_uart0			= 1,
-	.has_enet0			= 1,
-	.has_enet1			= 1,
-	.has_pci			= 1,
+	.has_ehci0 = 1,
+	.has_ohci0 = 1,
+	.has_pccard = 1,
+	.has_pci = 1,
+	.has_uart0 = 1,
 
+	.has_enet0 = 1,
 	.enet0 = {
-		.has_phy		= 1,
-		.use_internal_phy	= 1,
+		.has_phy = 1,
+		.use_internal_phy = 1,
 	},
 
+	.has_enet1 = 1,
 	.enet1 = {
-		.force_speed_100	= 1,
-		.force_duplex_full	= 1,
+		.force_speed_100 = 1,
+		.force_duplex_full = 1,
 	},
 
-	.has_ohci0 = 1,
-	.has_pccard = 1,
-	.has_ehci0 = 1,
-
 	.leds = {
 		{
-			.name		= "adsl-fail",
-			.gpio		= 15,
-			.active_low	= 1,
+			.name = "adsl-fail",
+			.gpio = 15,
+			.active_low = 1,
 		},
 		{
-			.name		= "ppp",
-			.gpio		= 22,
-			.active_low	= 1,
+			.name = "ppp",
+			.gpio = 22,
+			.active_low = 1,
 		},
 		{
-			.name		= "ppp-fail",
-			.gpio		= 23,
-			.active_low	= 1,
+			.name = "ppp-fail",
+			.gpio = 23,
+			.active_low = 1,
 		},
 		{
-			.name		= "power",
-			.gpio		= 4,
+			.name = "power",
+			.gpio = 4,
 			.default_trigger = "default-on",
 		},
 		{
-			.name		= "stop",
-			.gpio		= 5,
+			.name = "stop",
+			.gpio = 5,
 		},
 	},
 };
 
 static struct board_info __initdata board_96358vw2 = {
-	.name				= "96358VW2",
-	.expected_cpu_id		= 0x6358,
+	.name = "96358VW2",
+	.expected_cpu_id = 0x6358,
 
-	.has_uart0			= 1,
-	.has_enet0			= 1,
-	.has_enet1			= 1,
-	.has_pci			= 1,
+	.has_ehci0 = 1,
+	.has_ohci0 = 1,
+	.has_pccard = 1,
+	.has_pci = 1,
+	.has_uart0 = 1,
 
+	.has_enet0 = 1,
 	.enet0 = {
-		.has_phy		= 1,
-		.use_internal_phy	= 1,
+		.has_phy = 1,
+		.use_internal_phy = 1,
 	},
 
+	.has_enet1 = 1,
 	.enet1 = {
-		.force_speed_100	= 1,
-		.force_duplex_full	= 1,
+		.force_speed_100 = 1,
+		.force_duplex_full = 1,
 	},
 
-	.has_ohci0 = 1,
-	.has_pccard = 1,
-	.has_ehci0 = 1,
-
 	.leds = {
 		{
-			.name		= "adsl",
-			.gpio		= 22,
-			.active_low	= 1,
+			.name = "adsl",
+			.gpio = 22,
+			.active_low = 1,
 		},
 		{
-			.name		= "ppp-fail",
-			.gpio		= 23,
+			.name = "ppp-fail",
+			.gpio = 23,
 		},
 		{
-			.name		= "power",
-			.gpio		= 5,
-			.active_low	= 1,
+			.name = "power",
+			.gpio = 5,
+			.active_low = 1,
 			.default_trigger = "default-on",
 		},
 		{
-			.name		= "stop",
-			.gpio		= 4,
-			.active_low	= 1,
+			.name = "stop",
+			.gpio = 4,
+			.active_low = 1,
 		},
 	},
 };
 
 static struct board_info __initdata board_AGPFS0 = {
-	.name				= "AGPF-S0",
-	.expected_cpu_id		= 0x6358,
+	.name = "AGPF-S0",
+	.expected_cpu_id = 0x6358,
 
-	.has_uart0			= 1,
-	.has_enet0			= 1,
-	.has_enet1			= 1,
-	.has_pci			= 1,
+	.has_ehci0 = 1,
+	.has_ohci0 = 1,
+	.has_pci = 1,
+	.has_uart0 = 1,
 
+	.has_enet0 = 1,
 	.enet0 = {
-		.has_phy		= 1,
-		.use_internal_phy	= 1,
+		.has_phy = 1,
+		.use_internal_phy = 1,
 	},
 
+	.has_enet1 = 1,
 	.enet1 = {
-		.force_speed_100	= 1,
-		.force_duplex_full	= 1,
+		.force_speed_100 = 1,
+		.force_duplex_full = 1,
 	},
-
-	.has_ohci0 = 1,
-	.has_ehci0 = 1,
 };
 
 static struct board_info __initdata board_DWVS0 = {
-	.name				= "DWV-S0",
-	.expected_cpu_id		= 0x6358,
+	.name = "DWV-S0",
+	.expected_cpu_id = 0x6358,
 
-	.has_enet0			= 1,
-	.has_enet1			= 1,
-	.has_pci			= 1,
+	.has_ehci0 = 1,
+	.has_ohci0 = 1,
+	.has_pci = 1,
 
+	.has_enet0 = 1,
 	.enet0 = {
-		.has_phy		= 1,
-		.use_internal_phy	= 1,
+		.has_phy = 1,
+		.use_internal_phy = 1,
 	},
 
+	.has_enet1 = 1,
 	.enet1 = {
-		.force_speed_100	= 1,
-		.force_duplex_full	= 1,
+		.force_speed_100 = 1,
+		.force_duplex_full = 1,
 	},
-
-	.has_ohci0			= 1,
-	.has_ehci0			= 1,
 };
 #endif /* CONFIG_BCM63XX_CPU_6358 */
 
-- 
2.27.0

