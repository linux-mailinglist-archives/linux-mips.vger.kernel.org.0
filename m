Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E99206A3BFE
	for <lists+linux-mips@lfdr.de>; Mon, 27 Feb 2023 09:09:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230062AbjB0IJU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Feb 2023 03:09:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbjB0IJT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 27 Feb 2023 03:09:19 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87999C14E
        for <linux-mips@vger.kernel.org>; Mon, 27 Feb 2023 00:09:17 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id r27so7355946lfe.10
        for <linux-mips@vger.kernel.org>; Mon, 27 Feb 2023 00:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OeD9abmV393jlsifpzKT+MGLG7UiUgA6cDKKqFjBQY0=;
        b=lMSlEUZWmWuycrI2Pe0Tbx9f2fIYm0nFZoWFzQcj7UrTMFRv2yfXFEakTC6lrm8mEo
         vVz9t3Et4HZ/fs9s/OKUvqsyYR1qizD8txi/KQ2K7p/+QQGvhRh6EXoj8q2IQwNG6JNN
         3LZYY58ZJJwmC8PQsjc6ZP2DVShTMZZV/PQba64cGujeB75AAn00BkUn/FqyAyNAZxMw
         BC+i9SOLgDVVlv9IgxDPCDooNljiytVM0nJJymZ/9zfayLuIInFtjY6NNnU2tdNnuLuU
         k3itk9at1TpHhwyM8Ssgn+pKnS6DWbdH18uLG2BsGlHifP8rhlZ38AyUVya4WXiUSHrY
         tQ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OeD9abmV393jlsifpzKT+MGLG7UiUgA6cDKKqFjBQY0=;
        b=FOLzKNkKRzAGv7SQVT0fDFHbBbvc/BpWvP8723PudhjlrCDxJaxyx4GTKQ50ey6/aE
         94Dey2qwOyRVemeYuXyRCTy3+zUhQIdSUx+Zv5GrlLqSfVKZisEkiY7VrgUGWIUPnvJ6
         kQarXOKOKlxDHjuhtWxmiwQPr3TXZ55zm8KitDBGP0vrscx2CVdvvdSQFpYB+e/gkbkS
         HxGwa6sCUzPhyNEszw/m6Vy6mg3yEvqZg4tJB1wIqyTC1rHMkKjHeadQKDULJdP0eA+c
         ODir3A0h0DrmfS2owf/wf1DXUGVH/+ywor1ck7vjScuPMzUk84Q93e7serfIYhsmso2u
         2Mhw==
X-Gm-Message-State: AO0yUKXUBLMHxxdRgomEAZe6MiQHHkq4exaedNcrB1IfaIR/ijMKFUaZ
        QLklRQ0gYKQKoCYGBPh3Yww=
X-Google-Smtp-Source: AK7set95kmMjVS/jsy+aD8ADnvFETtxn9n+WX0VxzX3hFtSOh+vf4vz6JQMBUVom4iZV1RlQr9BdJw==
X-Received: by 2002:ac2:4c93:0:b0:4dc:807a:d144 with SMTP id d19-20020ac24c93000000b004dc807ad144mr6925242lfl.39.1677485355661;
        Mon, 27 Feb 2023 00:09:15 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id 14-20020ac25f0e000000b004cca1658a41sm829094lfq.300.2023.02.27.00.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 00:09:14 -0800 (PST)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Hauke Mehrtens <hauke@hauke-m.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-mips@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] MIPS: BCM47XX: Add support for Huawei B593u-12
Date:   Mon, 27 Feb 2023 09:09:11 +0100
Message-Id: <20230227080911.15039-1-zajec5@gmail.com>
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

It's a BCM5358 based home router. One of very few bcm47xx devices with
cellular modems (here: LTE).

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 arch/mips/bcm47xx/board.c                          | 1 +
 arch/mips/bcm47xx/leds.c                           | 8 ++++++++
 arch/mips/include/asm/mach-bcm47xx/bcm47xx_board.h | 1 +
 3 files changed, 10 insertions(+)

diff --git a/arch/mips/bcm47xx/board.c b/arch/mips/bcm47xx/board.c
index 90fb48b046c0..b487f687f62d 100644
--- a/arch/mips/bcm47xx/board.c
+++ b/arch/mips/bcm47xx/board.c
@@ -193,6 +193,7 @@ struct bcm47xx_board_type_list1 bcm47xx_board_list_board_id[] __initconst = {
 /* boardtype, boardnum, boardrev */
 static const
 struct bcm47xx_board_type_list3 bcm47xx_board_list_board[] __initconst = {
+	{{BCM47XX_BOARD_HUAWEI_B593U_12, "Huawei B593u-12"}, "0x053d", "1234", "0x1301"},
 	{{BCM47XX_BOARD_HUAWEI_E970, "Huawei E970"}, "0x048e", "0x5347", "0x11"},
 	{{BCM47XX_BOARD_PHICOMM_M1, "Phicomm M1"}, "0x0590", "80", "0x1104"},
 	{{BCM47XX_BOARD_ZTE_H218N, "ZTE H218N"}, "0x053d", "1234", "0x1305"},
diff --git a/arch/mips/bcm47xx/leds.c b/arch/mips/bcm47xx/leds.c
index 8e257d0896d2..64e37505b9b4 100644
--- a/arch/mips/bcm47xx/leds.c
+++ b/arch/mips/bcm47xx/leds.c
@@ -222,6 +222,11 @@ bcm47xx_leds_dlink_dir330[] __initconst = {
 
 /* Huawei */
 
+static const struct gpio_led
+bcm47xx_leds_huawei_b593u_12[] __initconst = {
+	BCM47XX_GPIO_LED(5, "blue", "wlan", 0, LEDS_GPIO_DEFSTATE_OFF),
+};
+
 static const struct gpio_led
 bcm47xx_leds_huawei_e970[] __initconst = {
 	BCM47XX_GPIO_LED(0, "unk", "wlan", 0, LEDS_GPIO_DEFSTATE_OFF),
@@ -672,6 +677,9 @@ void __init bcm47xx_leds_register(void)
 		bcm47xx_set_pdata(bcm47xx_leds_dlink_dir330);
 		break;
 
+	case BCM47XX_BOARD_HUAWEI_B593U_12:
+		bcm47xx_set_pdata(bcm47xx_leds_huawei_b593u_12);
+		break;
 	case BCM47XX_BOARD_HUAWEI_E970:
 		bcm47xx_set_pdata(bcm47xx_leds_huawei_e970);
 		break;
diff --git a/arch/mips/include/asm/mach-bcm47xx/bcm47xx_board.h b/arch/mips/include/asm/mach-bcm47xx/bcm47xx_board.h
index 3c401f11655e..4bd8c86ec6c3 100644
--- a/arch/mips/include/asm/mach-bcm47xx/bcm47xx_board.h
+++ b/arch/mips/include/asm/mach-bcm47xx/bcm47xx_board.h
@@ -53,6 +53,7 @@ enum bcm47xx_board {
 	BCM47XX_BOARD_DLINK_DIR130,
 	BCM47XX_BOARD_DLINK_DIR330,
 
+	BCM47XX_BOARD_HUAWEI_B593U_12,
 	BCM47XX_BOARD_HUAWEI_E970,
 
 	BCM47XX_BOARD_LINKSYS_E900V1,
-- 
2.34.1

