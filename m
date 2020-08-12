Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E285242656
	for <lists+linux-mips@lfdr.de>; Wed, 12 Aug 2020 09:52:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726962AbgHLHwp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 12 Aug 2020 03:52:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726946AbgHLHwn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 12 Aug 2020 03:52:43 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F3C2C06174A;
        Wed, 12 Aug 2020 00:52:43 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id y3so1120116wrl.4;
        Wed, 12 Aug 2020 00:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8nPF4lY9n6x79gt3b45qYt5EI3InDx4CnSiaulIIjsg=;
        b=kIsaSmDoFciBdN8a0+X+2v4zFQj20Zakbs35E49yX9KOcHaGvpQC7wJpjBLD2xYX6u
         nneTSdyh2XouhiQlY0OcPJ1DypJ+xoSJMDzPXdn4vJgguk4fdrGVOBr1TaTFcMU0/+xn
         HuJd/G7PxoZjTKO4vA5SRxiDlJkwHglXY4epdyq3ac8MLNf3XpKcBZYKDeRDksxiYVz/
         +iAzl4Cf7o/HtU1jFMg+gEkOggNw2FOwJ2CHDwX5RfXY3M0cbGoNpcs+CashK8fk3Hts
         A5q8b/+xugSrKu9RjL6hgMs6AzM6IUVdr3mQbmGmgupIAtkq+Y7CoUs+8OAu6oIeKJTM
         VRtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8nPF4lY9n6x79gt3b45qYt5EI3InDx4CnSiaulIIjsg=;
        b=te1EDHDEllgnVz/i6sf7wz0GP7c0dFauxHBPksD1FrSgNiGx9dYqLBBWUjHErI6woW
         4gTbajB2kU8TA7dUi3vBF5Ac/UuUURizAJCcHu/cGL0KpYFOVDP9pr5Uuo/mGyya13uT
         0NkTTlCWaD0y0WhyCMD42kL2BRUxQCXtp6V7eXZKHh85qilcqQ5Ose/Se8rAV8Etog2r
         UIwuFDxn+IchrUU48jd0HXMHPnY5VaGZSSvay3rMpouMstghmaMwFTAN+sPPYvlXU5Vt
         motQNa5VKzEmWuGNqdpnN7suZmJTtGbQkkRMdgRl9FSiru8CBwIGO7Dh4LIxN7VTurHd
         UrxA==
X-Gm-Message-State: AOAM532dad0HTp5gexnv/FJi02RfBKsOqs2l+rGMaz70eY2UZLhoI3jn
        tO8r/AzDOhyC/K4D4OmFSKw=
X-Google-Smtp-Source: ABdhPJye17rgRJAj++BuaCKDTUolNwTFgRpNgW8nxETsQgXVos63a4l6VQtV8kzV2vhDuBuAGScMvA==
X-Received: by 2002:a5d:45c9:: with SMTP id b9mr31928502wrs.283.1597218761566;
        Wed, 12 Aug 2020 00:52:41 -0700 (PDT)
Received: from skynet.lan (88.red-83-49-60.dynamicip.rima-tde.net. [83.49.60.88])
        by smtp.gmail.com with ESMTPSA id 6sm2470984wmf.4.2020.08.12.00.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 00:52:41 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, bcm-kernel-feedback-list@broadcom.com,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH v4 4/5] MIPS: BCM63xx: refactor board declarations
Date:   Wed, 12 Aug 2020 09:52:34 +0200
Message-Id: <20200812075235.366864-5-noltari@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200812075235.366864-1-noltari@gmail.com>
References: <20200812075235.366864-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Current board declarations are a mess. Let's put some order and make them
follow the same structure.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
Acked-by: Florian Fainelli <f.fainelli@gmail.com>
---
 v4: split license change to a new patch.
 v3: no changes.
 v2: switch to SPDX license identifier.

 arch/mips/bcm63xx/boards/board_bcm963xx.c | 615 +++++++++++-----------
 1 file changed, 305 insertions(+), 310 deletions(-)

diff --git a/arch/mips/bcm63xx/boards/board_bcm963xx.c b/arch/mips/bcm63xx/boards/board_bcm963xx.c
index ac9570b66f37..fa0acf003a46 100644
--- a/arch/mips/bcm63xx/boards/board_bcm963xx.c
+++ b/arch/mips/bcm63xx/boards/board_bcm963xx.c
@@ -41,30 +41,28 @@ static struct board_info board;
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
 
@@ -73,44 +71,44 @@ static struct board_info __initdata board_cvg834g = {
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
@@ -121,85 +119,86 @@ static struct board_info __initdata board_96328avng = {
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
@@ -210,10 +209,10 @@ static struct board_info __initdata board_96338w = {
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
 
@@ -222,282 +221,282 @@ static struct board_info __initdata board_96345gw2 = {
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
 
@@ -506,146 +505,142 @@ static struct board_info __initdata board_96348gw_a = {
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

