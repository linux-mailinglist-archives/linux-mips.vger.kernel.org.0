Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14231244EF5
	for <lists+linux-mips@lfdr.de>; Fri, 14 Aug 2020 21:49:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726213AbgHNTtz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 14 Aug 2020 15:49:55 -0400
Received: from mx4.wp.pl ([212.77.101.12]:7384 "EHLO mx4.wp.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726662AbgHNTtz (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 14 Aug 2020 15:49:55 -0400
Received: (wp-smtpd smtp.wp.pl 27067 invoked from network); 14 Aug 2020 21:49:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=1024a;
          t=1597434590; bh=6hs6TPHFIz1kOVdD6LgU8CRUVT9Umoi+c/8YAc/xC4M=;
          h=From:To:Cc:Subject;
          b=eN8v/ZpcBq4H7jMtxIUpXjF98kThu7jSSm54P6uuEch+cVb48QelKmg460BIds1/A
           09ptcadME72tw3bbC4ztUfVtLh4894huexGOo0favP0554YmvmDTG1OIM83ZXOlqUc
           YrFZWYGVS6fGIh+lzVQvM1LIiY30f+Dck1J+7KTk=
Received: from riviera.nat.student.pw.edu.pl (HELO LAPTOP-OLEK.lan) (olek2@wp.pl@[194.29.137.1])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <linux-gpio@vger.kernel.org>; 14 Aug 2020 21:49:50 +0200
From:   Aleksander Jan Bajkowski <olek2@wp.pl>
To:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, bgolaszewski@baylibre.com,
        linus.walleij@linaro.org, john@phrozen.org
Cc:     Aleksander Jan Bajkowski <olek2@wp.pl>
Subject: [PATCH] gpio: stp-xway: automatically drive GPHY leds on ar10 and grx390
Date:   Fri, 14 Aug 2020 21:48:47 +0200
Message-Id: <20200814194847.3171-1-olek2@wp.pl>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-DKIM-Status: good (id: wp.pl)                                      
X-WP-MailID: 51f58ab8618c49ec09034a6d961ab25c
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000000 [MXMQ]                               
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Ar10 (xr300) has 3 and grx390 (xrx330) has 4 built-in GPHY. PHY LEDs are
connected via STP. STP is a peripheral controller used to drive external
shift register cascades. The hardware is able to allow the GPHY to drive
some GPIO of the cascade automatically.This patch allows for this on ar10
and grx390.

Tested on D-Link DWR-966 with OpenWRT.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
 drivers/gpio/gpio-stp-xway.c | 54 ++++++++++++++++++++++++++++++++----
 1 file changed, 48 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-stp-xway.c b/drivers/gpio/gpio-stp-xway.c
index 9e23a5ae8108..0ce1543426a4 100644
--- a/drivers/gpio/gpio-stp-xway.c
+++ b/drivers/gpio/gpio-stp-xway.c
@@ -41,7 +41,10 @@
 #define XWAY_STP_4HZ		BIT(23)
 #define XWAY_STP_8HZ		BIT(24)
 #define XWAY_STP_10HZ		(BIT(24) | BIT(23))
-#define XWAY_STP_SPEED_MASK	(0xf << 23)
+#define XWAY_STP_SPEED_MASK	(BIT(23) | BIT(24) | BIT(25) | BIT(26) | BIT(27))
+
+#define XWAY_STP_FPIS_VALUE	BIT(21)
+#define XWAY_STP_FPIS_MASK	(BIT(20) | BIT(21))
 
 /* clock source for automatic update */
 #define XWAY_STP_UPD_FPI	BIT(31)
@@ -54,7 +57,9 @@
 /* 2 groups of 3 bits can be driven by the phys */
 #define XWAY_STP_PHY_MASK	0x7
 #define XWAY_STP_PHY1_SHIFT	27
-#define XWAY_STP_PHY2_SHIFT	15
+#define XWAY_STP_PHY2_SHIFT	3
+#define XWAY_STP_PHY3_SHIFT	6
+#define XWAY_STP_PHY4_SHIFT	15
 
 /* STP has 3 groups of 8 bits */
 #define XWAY_STP_GROUP0		BIT(0)
@@ -80,6 +85,8 @@ struct xway_stp {
 	u8 dsl;		/* the 2 LSBs can be driven by the dsl core */
 	u8 phy1;	/* 3 bits can be driven by phy1 */
 	u8 phy2;	/* 3 bits can be driven by phy2 */
+	u8 phy3;	/* 3 bits can be driven by phy3 */
+	u8 phy4;	/* 3 bits can be driven by phy4 */
 	u8 reserved;	/* mask out the hw driven bits in gpio_request */
 };
 
@@ -114,7 +121,8 @@ static void xway_stp_set(struct gpio_chip *gc, unsigned gpio, int val)
 	else
 		chip->shadow &= ~BIT(gpio);
 	xway_stp_w32(chip->virt, chip->shadow, XWAY_STP_CPU0);
-	xway_stp_w32_mask(chip->virt, 0, XWAY_STP_CON_SWU, XWAY_STP_CON0);
+	if (!chip->reserved)
+		xway_stp_w32_mask(chip->virt, 0, XWAY_STP_CON_SWU, XWAY_STP_CON0);
 }
 
 /**
@@ -188,16 +196,37 @@ static void xway_stp_hw_init(struct xway_stp *chip)
 			chip->phy2 << XWAY_STP_PHY2_SHIFT,
 			XWAY_STP_CON1);
 
+	if (of_machine_is_compatible("lantiq,grx390")
+	    || of_machine_is_compatible("lantiq,ar10")) {
+		xway_stp_w32_mask(chip->virt,
+				XWAY_STP_PHY_MASK << XWAY_STP_PHY3_SHIFT,
+				chip->phy3 << XWAY_STP_PHY3_SHIFT,
+				XWAY_STP_CON1);
+	}
+
+	if (of_machine_is_compatible("lantiq,grx390")) {
+		xway_stp_w32_mask(chip->virt,
+				XWAY_STP_PHY_MASK << XWAY_STP_PHY4_SHIFT,
+				chip->phy4 << XWAY_STP_PHY4_SHIFT,
+				XWAY_STP_CON1);
+	}
+
 	/* mask out the hw driven bits in gpio_request */
-	chip->reserved = (chip->phy2 << 5) | (chip->phy1 << 2) | chip->dsl;
+	chip->reserved = (chip->phy4 << 11) | (chip->phy3 << 8) | (chip->phy2 << 5)
+		| (chip->phy1 << 2) | chip->dsl;
 
 	/*
 	 * if we have pins that are driven by hw, we need to tell the stp what
 	 * clock to use as a timer.
 	 */
-	if (chip->reserved)
+	if (chip->reserved) {
 		xway_stp_w32_mask(chip->virt, XWAY_STP_UPD_MASK,
 			XWAY_STP_UPD_FPI, XWAY_STP_CON1);
+		xway_stp_w32_mask(chip->virt, XWAY_STP_SPEED_MASK,
+			XWAY_STP_10HZ, XWAY_STP_CON1);
+		xway_stp_w32_mask(chip->virt, XWAY_STP_FPIS_MASK,
+			XWAY_STP_FPIS_VALUE, XWAY_STP_CON1);
+	}
 }
 
 static int xway_stp_probe(struct platform_device *pdev)
@@ -242,13 +271,26 @@ static int xway_stp_probe(struct platform_device *pdev)
 	/* find out which gpios are controlled by the phys */
 	if (of_machine_is_compatible("lantiq,ar9") ||
 			of_machine_is_compatible("lantiq,gr9") ||
-			of_machine_is_compatible("lantiq,vr9")) {
+			of_machine_is_compatible("lantiq,vr9") ||
+			of_machine_is_compatible("lantiq,ar10") ||
+			of_machine_is_compatible("lantiq,grx390")) {
 		if (!of_property_read_u32(pdev->dev.of_node, "lantiq,phy1", &phy))
 			chip->phy1 = phy & XWAY_STP_PHY_MASK;
 		if (!of_property_read_u32(pdev->dev.of_node, "lantiq,phy2", &phy))
 			chip->phy2 = phy & XWAY_STP_PHY_MASK;
 	}
 
+	if (of_machine_is_compatible("lantiq,ar10") ||
+			of_machine_is_compatible("lantiq,grx390")) {
+		if (!of_property_read_u32(pdev->dev.of_node, "lantiq,phy3", &phy))
+			chip->phy3 = phy & XWAY_STP_PHY_MASK;
+	}
+
+	if (of_machine_is_compatible("lantiq,grx390")) {
+		if (!of_property_read_u32(pdev->dev.of_node, "lantiq,phy4", &phy))
+			chip->phy4 = phy & XWAY_STP_PHY_MASK;
+	}
+
 	/* check which edge trigger we should use, default to a falling edge */
 	if (!of_find_property(pdev->dev.of_node, "lantiq,rising", NULL))
 		chip->edge = XWAY_STP_FALLING;
-- 
2.20.1

