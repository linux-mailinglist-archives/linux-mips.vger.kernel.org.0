Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 171501F1692
	for <lists+linux-mips@lfdr.de>; Mon,  8 Jun 2020 12:18:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729358AbgFHKSf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Jun 2020 06:18:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729337AbgFHKSe (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 8 Jun 2020 06:18:34 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3446C08C5C3;
        Mon,  8 Jun 2020 03:18:32 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id c71so14756126wmd.5;
        Mon, 08 Jun 2020 03:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8E3tUlnNWH0tzK24PYQO2JZkSdZVKVSOuDxhAs4jB0Q=;
        b=U3ywOkUmYf3mWHDJ5irFC8gmotq0uHroech3SdtnZ2h1j//7yautxyU6AVnYtQKDDd
         MLw1jO00ILaP9kybA31O0kfxOLcnCx0WSmIit7FKhJjM/+xIiOeX3PMeZ1xDHUQtjLc7
         YRG1HiT8tWEh9ZzHbz4UQMAIuJWIxfBcLiujlcrE3PI4XQ6b+5S0X45sY9x5lYB6MZPb
         fS1rMNdST7gM0V7CPm1ShXW0pTZ0s9Pb5mdzMEThvn2nrX9yRiLa17rbXDJLXW7piOiy
         lwn1Jbbi+Mo4QVVHlF0t6sBmrNwa6LFTUCzZwrj0iKZPldI44bkj3/f5o6xU2WA6/rfc
         CLrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8E3tUlnNWH0tzK24PYQO2JZkSdZVKVSOuDxhAs4jB0Q=;
        b=DiRTR9E7/ap5ZSB2VaOFo5NVqhQH/sXdrRN/IsGgjne/cQJsDLf7J+dJJb4Fnbz6pz
         d6hsD6s3Z/S73+SEGQZ3gPly56815rOuQmDgHEAO8vc+D2sHjfGVkO1/ZxfwC0y2orAh
         NnjpgoXErgNpIcXGDn1EgiGImquTGZ9pokO7mktheuRa0RNHj5DBvtYUe/NfhMZ8J5Hs
         STsYx/8+DZHhsNW1QXJe37PpQGGqJxye4Stv/VKPuOpcM5wnGsSDqZuXGFG6IjcOnCWE
         AzdCIQTBLWbPF8t5BVJP2kYze5D0cz+ESs6UVDaMXBzHswv09FJqM62uoJMonOEoUkrL
         Q77g==
X-Gm-Message-State: AOAM533yClPM6kU4n3PVYdM8znM682EJElIRW5XxOCIKMA3QaUZbDNvm
        MVRsarSOBi5v7kzx5lDZ+oc=
X-Google-Smtp-Source: ABdhPJzEzWvF3GXeVLXaWIlhisc6qKBmVJ6I624X62ATg/sd/QOg5XVIOCaiAD+Pgto1msHjSemKuw==
X-Received: by 2002:a1c:dd44:: with SMTP id u65mr16847352wmg.180.1591611511286;
        Mon, 08 Jun 2020 03:18:31 -0700 (PDT)
Received: from skynet.lan (28.red-83-49-61.dynamicip.rima-tde.net. [83.49.61.28])
        by smtp.gmail.com with ESMTPSA id z2sm22378439wrs.87.2020.06.08.03.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 03:18:30 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     tsbogend@alpha.franken.de, f.fainelli@gmail.com,
        jonas.gorski@gmail.com, bcm-kernel-feedback-list@broadcom.com,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH] MIPS: BCM63xx: add endif comments
Date:   Mon,  8 Jun 2020 12:18:28 +0200
Message-Id: <20200608101828.3383942-1-noltari@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

There are plenty of ifdefs in board_bcm963xx.c without endif comments.
Let's make the code easier to follow by adding proper comments.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 arch/mips/bcm63xx/boards/board_bcm963xx.c | 33 +++++++++++------------
 1 file changed, 15 insertions(+), 18 deletions(-)

diff --git a/arch/mips/bcm63xx/boards/board_bcm963xx.c b/arch/mips/bcm63xx/boards/board_bcm963xx.c
index 36ec3dc2c999..e8621074a8c2 100644
--- a/arch/mips/bcm63xx/boards/board_bcm963xx.c
+++ b/arch/mips/bcm63xx/boards/board_bcm963xx.c
@@ -67,7 +67,7 @@ static struct board_info __initdata board_cvg834g = {
 	.ephy_reset_gpio		= 36,
 	.ephy_reset_gpio_flags		= GPIOF_INIT_HIGH,
 };
-#endif
+#endif /* CONFIG_BCM63XX_CPU_3368 */
 
 /*
  * known 6328 boards
@@ -115,7 +115,7 @@ static struct board_info __initdata board_96328avng = {
 		},
 	},
 };
-#endif
+#endif /* CONFIG_BCM63XX_CPU_6328 */
 
 /*
  * known 6338 boards
@@ -204,7 +204,7 @@ static struct board_info __initdata board_96338w = {
 		},
 	},
 };
-#endif
+#endif /* CONFIG_BCM63XX_CPU_6338 */
 
 /*
  * known 6345 boards
@@ -216,7 +216,7 @@ static struct board_info __initdata board_96345gw2 = {
 
 	.has_uart0			= 1,
 };
-#endif
+#endif /* CONFIG_BCM63XX_CPU_6345 */
 
 /*
  * known 6348 boards
@@ -464,7 +464,6 @@ static struct board_info __initdata board_rta1025w_16 = {
 	},
 };
 
-
 static struct board_info __initdata board_DV201AMR = {
 	.name				= "DV201AMR",
 	.expected_cpu_id		= 0x6348,
@@ -505,7 +504,7 @@ static struct board_info __initdata board_96348gw_a = {
 
 	.has_ohci0 = 1,
 };
-#endif
+#endif /* CONFIG_BCM63XX_CPU_6348 */
 
 /*
  * known 6358 boards
@@ -530,7 +529,6 @@ static struct board_info __initdata board_96358vw = {
 		.force_duplex_full	= 1,
 	},
 
-
 	.has_ohci0 = 1,
 	.has_pccard = 1,
 	.has_ehci0 = 1,
@@ -654,7 +652,7 @@ static struct board_info __initdata board_DWVS0 = {
 
 	.has_ohci0			= 1,
 };
-#endif
+#endif /* CONFIG_BCM63XX_CPU_6358 */
 
 /*
  * all boards
@@ -662,17 +660,17 @@ static struct board_info __initdata board_DWVS0 = {
 static const struct board_info __initconst *bcm963xx_boards[] = {
 #ifdef CONFIG_BCM63XX_CPU_3368
 	&board_cvg834g,
-#endif
+#endif /* CONFIG_BCM63XX_CPU_3368 */
 #ifdef CONFIG_BCM63XX_CPU_6328
 	&board_96328avng,
-#endif
+#endif /* CONFIG_BCM63XX_CPU_6328 */
 #ifdef CONFIG_BCM63XX_CPU_6338
 	&board_96338gw,
 	&board_96338w,
-#endif
+#endif /* CONFIG_BCM63XX_CPU_6338 */
 #ifdef CONFIG_BCM63XX_CPU_6345
 	&board_96345gw2,
-#endif
+#endif /* CONFIG_BCM63XX_CPU_6345 */
 #ifdef CONFIG_BCM63XX_CPU_6348
 	&board_96348r,
 	&board_96348gw,
@@ -682,14 +680,13 @@ static const struct board_info __initconst *bcm963xx_boards[] = {
 	&board_DV201AMR,
 	&board_96348gw_a,
 	&board_rta1025w_16,
-#endif
-
+#endif /* CONFIG_BCM63XX_CPU_6348 */
 #ifdef CONFIG_BCM63XX_CPU_6358
 	&board_96358vw,
 	&board_96358vw2,
 	&board_AGPFS0,
 	&board_DWVS0,
-#endif
+#endif /* CONFIG_BCM63XX_CPU_6358 */
 };
 
 /*
@@ -728,7 +725,7 @@ int bcm63xx_get_fallback_sprom(struct ssb_bus *bus, struct ssb_sprom *out)
 		return -EINVAL;
 	}
 }
-#endif
+#endif /* CONFIG_SSB_PCIHOST */
 
 /*
  * return board name for /proc/cpuinfo
@@ -807,7 +804,7 @@ void __init board_prom_init(void)
 		if (BCMCPU_IS_6348())
 			val |= GPIO_MODE_6348_G2_PCI;
 	}
-#endif
+#endif /* CONFIG_PCI */
 
 	if (board.has_pccard) {
 		if (BCMCPU_IS_6348())
@@ -892,7 +889,7 @@ int __init board_register_devices(void)
 				&bcm63xx_get_fallback_sprom) < 0)
 			pr_err("failed to register fallback SPROM\n");
 	}
-#endif
+#endif /* CONFIG_SSB_PCIHOST */
 
 	bcm63xx_spi_register();
 
-- 
2.26.2

