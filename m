Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C36268E8AF
	for <lists+linux-mips@lfdr.de>; Wed,  8 Feb 2023 08:04:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230466AbjBHHE3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 8 Feb 2023 02:04:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230465AbjBHHEA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 8 Feb 2023 02:04:00 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 329F9442FF
        for <linux-mips@vger.kernel.org>; Tue,  7 Feb 2023 23:03:07 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id gr7so48827875ejb.5
        for <linux-mips@vger.kernel.org>; Tue, 07 Feb 2023 23:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=chaPZb3F1Lj55Ua2qpU1dZJDJeBr2I3XOT3p/iRZEPY=;
        b=D++CmrWBHOjCYs6e19/eu4f1Uhtjj7qdTpyWaVbtecL3ZCDAWPcoaJFW9EVLDxwfxE
         THRHUdaTK0JwL9veeStxC/1emhKRLp92VbcPtLzympV2d2cfgXeNhSH9nOvnX/1Y7tM2
         kIf6QesuB9owHDzUNPPJBfitlQg52XzluT1F7hvSEZDtRhKucrvwHjWqLyNa3dXE922Y
         hiWjc9wLc+L7SsgANf9HEy6lqrA5+nauoGSuKZISmhCQVUeyy9JALDXmmq27NJ2Nz6KR
         XODtJh8JeZiB1WN/a1EgyTd3Vgar7oFBiho4s1ux19oTWFgA5N1Z5geEF/wEaJZyr3uN
         1SXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=chaPZb3F1Lj55Ua2qpU1dZJDJeBr2I3XOT3p/iRZEPY=;
        b=ZSPdD1lYfF3lcBoJnzVfjsE1wwMUAOorOxvslPX/tals1KbVwPt1UgsFaf/iehs5DV
         GaJpxr77yaG9Te0+nJ4G8n2GvEH7zO8iyHdjr0XC7KrZfLmPAWN94KJ4IUnHJFRgq2CQ
         V8oKXe6Y/B3xXHcf12E8fG/lwOjhr2Dxuq8Vu6UlgaGa28XqjHFQH6qdgtqQIc4QCIEc
         jDu1i0NIjaVcU+sFy2hJgJqMssUsu16p15jtYorkus9xhp3nZ1NQRdJZmADR4SccDETf
         734DEkIs63uDFLajdl5LzDhoUI02lIvyoZE9QNYPhAKUgtKzQL8sYG3zxki0hTA3iEd/
         5o2Q==
X-Gm-Message-State: AO0yUKWl9bdauCSTZGnwHAi/X1lEqIl2RPIhwX7DXcxZ3eKiKD8C8Qqg
        egj7PArwcMcOoeEnFoJa/ilBfA40Fc0=
X-Google-Smtp-Source: AK7set9mg2NylHdJAwb7S9qUAz5hnUogZfGFTeo873DgdIxbs//6TtSFBa3pVtn6HjV/4T5uttf0Ow==
X-Received: by 2002:a17:906:29d0:b0:888:b471:8e46 with SMTP id y16-20020a17090629d000b00888b4718e46mr6100625eje.50.1675839785788;
        Tue, 07 Feb 2023 23:03:05 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id b14-20020a1709063f8e00b0088dc98e4510sm7944266ejj.112.2023.02.07.23.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 23:03:05 -0800 (PST)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Hauke Mehrtens <hauke@hauke-m.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-mips@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] MIPS: BCM47XX: Add support for Linksys E2500 V3
Date:   Wed,  8 Feb 2023 08:03:01 +0100
Message-Id: <20230208070301.5338-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

It's a BCM5358 based home WiFi router. 16 MiB flash, 64 MiB RAM, BCM5325
switch, on-SoC 802.11n radio.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 arch/mips/bcm47xx/board.c                          | 1 +
 arch/mips/bcm47xx/buttons.c                        | 9 +++++++++
 arch/mips/include/asm/mach-bcm47xx/bcm47xx_board.h | 1 +
 3 files changed, 11 insertions(+)

diff --git a/arch/mips/bcm47xx/board.c b/arch/mips/bcm47xx/board.c
index 8ef002471b9c..90fb48b046c0 100644
--- a/arch/mips/bcm47xx/board.c
+++ b/arch/mips/bcm47xx/board.c
@@ -130,6 +130,7 @@ struct bcm47xx_board_type_list2 bcm47xx_board_list_boot_hw[] __initconst = {
 	{{BCM47XX_BOARD_LINKSYS_E1000V21, "Linksys E1000 V2.1"}, "E1000", "2.1"},
 	{{BCM47XX_BOARD_LINKSYS_E1200V2, "Linksys E1200 V2"}, "E1200", "2.0"},
 	{{BCM47XX_BOARD_LINKSYS_E2000V1, "Linksys E2000 V1"}, "Linksys E2000", "1.0"},
+	{{BCM47XX_BOARD_LINKSYS_E2500V3, "Linksys E2500 V3"}, "E2500", "1.0"},
 	/* like WRT610N v2.0 */
 	{{BCM47XX_BOARD_LINKSYS_E3000V1, "Linksys E3000 V1"}, "E300", "1.0"},
 	{{BCM47XX_BOARD_LINKSYS_E3200V1, "Linksys E3200 V1"}, "E3200", "1.0"},
diff --git a/arch/mips/bcm47xx/buttons.c b/arch/mips/bcm47xx/buttons.c
index 38e4a9cbcf4e..437a737c01dd 100644
--- a/arch/mips/bcm47xx/buttons.c
+++ b/arch/mips/bcm47xx/buttons.c
@@ -222,6 +222,12 @@ bcm47xx_buttons_linksys_e2000v1[] __initconst = {
 	BCM47XX_GPIO_KEY(8, KEY_RESTART),
 };
 
+static const struct gpio_keys_button
+bcm47xx_buttons_linksys_e2500v3[] __initconst = {
+	BCM47XX_GPIO_KEY(9, KEY_WPS_BUTTON),
+	BCM47XX_GPIO_KEY(10, KEY_RESTART),
+};
+
 static const struct gpio_keys_button
 bcm47xx_buttons_linksys_e3000v1[] __initconst = {
 	BCM47XX_GPIO_KEY(4, KEY_WPS_BUTTON),
@@ -617,6 +623,9 @@ int __init bcm47xx_buttons_register(void)
 	case BCM47XX_BOARD_LINKSYS_E2000V1:
 		err = bcm47xx_copy_bdata(bcm47xx_buttons_linksys_e2000v1);
 		break;
+	case BCM47XX_BOARD_LINKSYS_E2500V3:
+		err = bcm47xx_copy_bdata(bcm47xx_buttons_linksys_e2500v3);
+		break;
 	case BCM47XX_BOARD_LINKSYS_E3000V1:
 		err = bcm47xx_copy_bdata(bcm47xx_buttons_linksys_e3000v1);
 		break;
diff --git a/arch/mips/include/asm/mach-bcm47xx/bcm47xx_board.h b/arch/mips/include/asm/mach-bcm47xx/bcm47xx_board.h
index 30f4114ab872..3c401f11655e 100644
--- a/arch/mips/include/asm/mach-bcm47xx/bcm47xx_board.h
+++ b/arch/mips/include/asm/mach-bcm47xx/bcm47xx_board.h
@@ -61,6 +61,7 @@ enum bcm47xx_board {
 	BCM47XX_BOARD_LINKSYS_E1000V21,
 	BCM47XX_BOARD_LINKSYS_E1200V2,
 	BCM47XX_BOARD_LINKSYS_E2000V1,
+	BCM47XX_BOARD_LINKSYS_E2500V3,
 	BCM47XX_BOARD_LINKSYS_E3000V1,
 	BCM47XX_BOARD_LINKSYS_E3200V1,
 	BCM47XX_BOARD_LINKSYS_E4200V1,
-- 
2.34.1

