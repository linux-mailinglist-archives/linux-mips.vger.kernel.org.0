Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 540A4241CD8
	for <lists+linux-mips@lfdr.de>; Tue, 11 Aug 2020 17:01:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728894AbgHKPBd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 11 Aug 2020 11:01:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728891AbgHKPBa (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 11 Aug 2020 11:01:30 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D2CEC06174A;
        Tue, 11 Aug 2020 08:01:30 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id k8so3168609wma.2;
        Tue, 11 Aug 2020 08:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YYso8mvF+Z2YnFhDcuNDr+NTK93QAQJYbSgYDti/U+A=;
        b=R+wGiLNXKusDmh30pNepJgVVaxvgq4RlgI4PXJzMHNBsq+HI9IvNLj37H+Ec5FKOzR
         NMcwdxi/yuxE7POPd7ta+ChZ0BfhbyqASqFYcAOrLH75xq/3wlMOxHyn0vX2xPESyD4U
         KqlMUcrqTHy9EwXwjr5HKHHOl/K3lvyjk5WqDYNeFR7dNuRgpHXkPMrVXmV9BeyRUYzD
         iWSCqhfCxP+ZAxb3qiLvhB0q5L7O5og0r6bRgNWHPK08Q6Txv6tWz1E1HcUid7gq4MeD
         zVnWwGuzZ3De8Qxb+ZGlTpZHXEXYfGy3iTj6mnoqmftfXkotsZuPB/3h1x67P+TsU6V3
         nDVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YYso8mvF+Z2YnFhDcuNDr+NTK93QAQJYbSgYDti/U+A=;
        b=p/uTm/7cqXqG6DUCuda2GKZNXYa1/qXjut0LFsug4lspIAkzBBi8q2HsJxnx0bDg80
         Op0yRwKEwFI/EcbvE2tfRKrkPX7ktrCOCa2RJuvWcVw1EcN+JrAIMZZNp9amLsL6n8dv
         v8gG2nakxnOYuIkKvWptAguVBM5dnuoBo3e2R3ftQ0pg+aUszU4s1xjVblBll/ZupWkk
         /DAhCwNcMac49TEzbNIAIoxqPrBZbz06fYWUtCKvi9Km1PwXmQaCEfFMX14ICkxGCFkW
         dOERHHCS7zxcjZEdEqjfcR9OXdHd4A/MBD+m9Q/tAKWuTZdG66nr7kEbmsfc1yDKb/PV
         ABgw==
X-Gm-Message-State: AOAM533NL7KcchvbE1vYDpCmnj9+8/yfocnq5LXwS6qk7JKVO1wtCXeD
        IjDPh3wfM6Zmr8aLhs3vlW4=
X-Google-Smtp-Source: ABdhPJwcaJmTCRX7m4ODyVrNt91kYSqp/nWu7Tdh5B1nWcFMZgzbX+tPYcfV9+Y2jtm3YmnyBd6iWg==
X-Received: by 2002:a1c:3dd6:: with SMTP id k205mr4483636wma.61.1597158087887;
        Tue, 11 Aug 2020 08:01:27 -0700 (PDT)
Received: from skynet.lan (88.red-83-49-60.dynamicip.rima-tde.net. [83.49.60.88])
        by smtp.gmail.com with ESMTPSA id 15sm5350494wmo.33.2020.08.11.08.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2020 08:01:27 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, bcm-kernel-feedback-list@broadcom.com,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v3 4/4] MIPS: BCM63xx: refactor board declarations
Date:   Tue, 11 Aug 2020 17:01:17 +0200
Message-Id: <20200811150117.254620-5-noltari@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200811150117.254620-1-noltari@gmail.com>
References: <20200811150117.254620-1-noltari@gmail.com>
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
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
---
 v3: no changes.
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
2.28.0

