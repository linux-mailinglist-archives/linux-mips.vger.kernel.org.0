Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B943E24255F
	for <lists+linux-mips@lfdr.de>; Wed, 12 Aug 2020 08:32:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726963AbgHLGb6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 12 Aug 2020 02:31:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726870AbgHLGbu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 12 Aug 2020 02:31:50 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4AD1C061787;
        Tue, 11 Aug 2020 23:31:49 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id p14so795588wmg.1;
        Tue, 11 Aug 2020 23:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=D46f/adlCIjpniP6tnf1wrpS0UQoP11QhV6d5bOfafw=;
        b=e3L1nvYltlsN4gX2Mr5cVOySM3MrqG6k8RQGX+kKqEF0D5+2dgnQKPz/El9M9Lh6yI
         JrdjMZ39Vwkw8AoCPSDEPgLwVrO76xp7tEiCM+l+iQawRZgCsHGX5fFlksE+f0rWPO4J
         P52QlD69tZA61uaq7+V8/zSEnOFsjBpdoJD5AdNxsBpRA0tyooRp1ci6c55aX8cL8H1m
         HoaTZb0VnefSoyWzqZ3rRWLNBlyaDWkqh9jEmMtTE/0T/eiNq8FZB0vX1aF4FxjZ3uop
         cn52URI5463elHXI10dcBxaDSPbr7Ge1tXpB/EEyS8Wfch7PxFQ2vU7sSILteCueqLup
         1HUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D46f/adlCIjpniP6tnf1wrpS0UQoP11QhV6d5bOfafw=;
        b=XEOwNVmDgx+4SqHPLVrsBUcIuj3JBEYf6gBpC1QCvrpmg4NX6/w/NUOHstVt3pPpRE
         1MHPbkjcEpukiiJjPnymLJxFkHkjiaTErK6mQdQ+dvmpFwi8FF3fgHt/MiMqU2kbsfEg
         w7EI6PdenUKEYh5HbavWQHrJ0n/Ty/ZInArXHkC/CqE/RGT9XLcYDsKSaoy3Gi3b/r9U
         vh0k+hwnd/eIQHuRIUeatm3z5WYgKJsK7201VQ56oXRR2nD5dVU2mW689z6u1Yif1kxE
         ZQzk1Grjjz6Y/UOfNqPUHpP7My1skKD8MptWlwhgt0Mn7q01ZrCu/USbWQeTqR73ymMz
         q3mA==
X-Gm-Message-State: AOAM530POLOGFBzRnayrH8Zlw9yjKVA3W5Z2WQfJZDk5jnnPmqd0yYHT
        Zt7hqvTLmO2jsPBRVVd+veE=
X-Google-Smtp-Source: ABdhPJxFgsTbtzJqFrj0kqnGseZ/NPnoF9FvnAwozcsmV6x+B1pFI+zEeOpaa/xdQDhQ4a3QcJsJRg==
X-Received: by 2002:a1c:7d55:: with SMTP id y82mr6926999wmc.186.1597213907659;
        Tue, 11 Aug 2020 23:31:47 -0700 (PDT)
Received: from skynet.lan (88.red-83-49-60.dynamicip.rima-tde.net. [83.49.60.88])
        by smtp.gmail.com with ESMTPSA id m16sm2149945wrr.71.2020.08.11.23.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2020 23:31:47 -0700 (PDT)
From:   =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
To:     f.fainelli@gmail.com, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, jonas.gorski@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>
Subject: [PATCH 14/14] mips: bmips: bcm63268: include and use dt-bindings
Date:   Wed, 12 Aug 2020 08:31:29 +0200
Message-Id: <20200812063129.361862-15-noltari@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200812063129.361862-1-noltari@gmail.com>
References: <20200812063129.361862-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Now that there are proper device tree bindings we can start using them.

Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
---
 arch/mips/boot/dts/brcm/bcm63268.dtsi | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/mips/boot/dts/brcm/bcm63268.dtsi b/arch/mips/boot/dts/brcm/bcm63268.dtsi
index beec24145af7..17d744db8211 100644
--- a/arch/mips/boot/dts/brcm/bcm63268.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm63268.dtsi
@@ -1,4 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
+
+#include "dt-bindings/clock/bcm63268-clock.h"
+#include "dt-bindings/interrupt-controller/bcm63268-interrupt-controller.h"
+
 / {
 	#address-cells = <1>;
 	#size-cells = <1>;
@@ -87,7 +91,7 @@ uart0: serial@10000180 {
 			reg = <0x10000180 0x18>;
 
 			interrupt-parent = <&periph_intc>;
-			interrupts = <5>;
+			interrupts = <BCM63268_IRQ_UART0>;
 
 			clocks = <&periph_clk>;
 			clock-names = "refclk";
@@ -100,7 +104,7 @@ uart1: serial@100001a0 {
 			reg = <0x100001a0 0x18>;
 
 			interrupt-parent = <&periph_intc>;
-			interrupts = <34>;
+			interrupts = <BCM63268_IRQ_UART1>;
 
 			clocks = <&periph_clk>;
 			clock-names = "refclk";
@@ -123,7 +127,7 @@ ehci: usb@10002500 {
 			big-endian;
 
 			interrupt-parent = <&periph_intc>;
-			interrupts = <10>;
+			interrupts = <BCM63268_IRQ_EHCI>;
 
 			status = "disabled";
 		};
@@ -135,7 +139,7 @@ ohci: usb@10002600 {
 			no-big-frame-no;
 
 			interrupt-parent = <&periph_intc>;
-			interrupts = <9>;
+			interrupts = <BCM63268_IRQ_OHCI>;
 
 			status = "disabled";
 		};
-- 
2.28.0

