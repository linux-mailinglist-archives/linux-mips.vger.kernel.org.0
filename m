Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CC6F49CE47
	for <lists+linux-mips@lfdr.de>; Wed, 26 Jan 2022 16:31:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242831AbiAZPa5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 26 Jan 2022 10:30:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242823AbiAZPa4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 26 Jan 2022 10:30:56 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F5B8C06161C;
        Wed, 26 Jan 2022 07:30:56 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id t7so118095ljc.10;
        Wed, 26 Jan 2022 07:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7PwUR07aiIYzr8o9oIM6nrw5MHLmD9a5fYUk8DJoaG4=;
        b=fYROBnQZe2AFqw8RFZB7rz1FlJicUt4E7rGMs5N+eE/EsDTMmyEqF6GF/rllY/DMyc
         4ZlfFI0y4J/dJ3e/0N4zZj5oY1q/EprDbJ/ai9VblVg6ElbRpAA5mzBArcH89hPhgbQe
         S0Apyg5UiVXdbnbXVTxcFWPbrk4PjOcekvpq6IqbjyJtqHut6ZADOCZYP0v+vbcY/aft
         zEzcUiyukkNduEp2KFU7P0NzLYWyxdjGz8P9/ojHCSOeu6SChhgAR1GxPliZzrX52sdt
         iN8SjoCmNwAN8Iavi+6D2yQ8IKzfiuZ1yCZjqJWJqDpqg+ZJUCFicyO715nmkYLxjaSe
         Kvew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7PwUR07aiIYzr8o9oIM6nrw5MHLmD9a5fYUk8DJoaG4=;
        b=kGebSweoposCZRPH6wQdbIVTVK9Bie8K6A6SCEZf784KTEuLZsO7hCxMwiEp5ayMdy
         PtiSSs7ZA8ZwyqU8ieNFBh/Ss6vvuLMwg73lGN2+BzfozjJKnIlUXTdZgNIwm7Oca9vo
         9wMszpqjpM4SNmvf+PpeSz6Qhfemg/tRFtINOaIsTA7o8B1E4e1ss/qihaBszBawIQ95
         EKHkskunsEilCZ2zU8qtTN2ViMjLnGl9Mc9qKx+RK3y1mpfQDHwz+Y3azmG3L9VWvNKz
         2q6ECCl6ryzNP/Jyo3Hfcal1oHFZo4m04w5SiymFVwmfKFY3Sa5RS35J/cmH46DfzFVP
         cGMw==
X-Gm-Message-State: AOAM53331w6KmerjmO043QbuaV60fgjEsuAV7kJbOjQXgeSJUDTjGDuF
        GuSeDNpSKlRVpTD/8XRaWeQ=
X-Google-Smtp-Source: ABdhPJzY1GtDlyd/NyKFNLHPSbhWzfBE/MO7a7sGbXflAczZY0U+DulGhbwI9tAv/f+n+8zsPUG1gg==
X-Received: by 2002:a2e:9114:: with SMTP id m20mr7915957ljg.385.1643211054099;
        Wed, 26 Jan 2022 07:30:54 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id y14sm459678lfg.72.2022.01.26.07.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jan 2022 07:30:53 -0800 (PST)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH RFC RFT] mips: bmips: bcm63268: add TWD block binding
Date:   Wed, 26 Jan 2022 16:30:39 +0100
Message-Id: <20220126153039.15064-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

TWD is an MFD block that contains timers, watchdog & some clocks / reset
controller.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 arch/mips/boot/dts/brcm/bcm63268.dtsi | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/mips/boot/dts/brcm/bcm63268.dtsi b/arch/mips/boot/dts/brcm/bcm63268.dtsi
index c3ce49ec675f..8926417a8fbc 100644
--- a/arch/mips/boot/dts/brcm/bcm63268.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm63268.dtsi
@@ -105,14 +105,20 @@ periph_intc: interrupt-controller@10000020 {
 			interrupts = <2>, <3>;
 		};
 
-		wdt: watchdog@1000009c {
-			compatible = "brcm,bcm7038-wdt";
-			reg = <0x1000009c 0xc>;
+		timer-mfd@10000080 {
+			compatible = "brcm,bcm7038-twd", "simple-mfd", "syscon";
+			reg = <0x10000080 0x30>;
+			ranges = <0x0 0x10000080 0x30>;
 
-			clocks = <&periph_osc>;
-			clock-names = "refclk";
+			wdt: watchdog@1c {
+				compatible = "brcm,bcm7038-wdt";
+				reg = <0x1c 0xc>;
 
-			timeout-sec = <30>;
+				clocks = <&periph_osc>;
+				clock-names = "refclk";
+
+				timeout-sec = <30>;
+			};
 		};
 
 		uart0: serial@10000180 {
-- 
2.31.1

