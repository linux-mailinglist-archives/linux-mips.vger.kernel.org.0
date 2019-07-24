Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E83997248B
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jul 2019 04:24:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387450AbfGXCYp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 Jul 2019 22:24:45 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:42509 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728052AbfGXCYo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 23 Jul 2019 22:24:44 -0400
Received: by mail-pf1-f195.google.com with SMTP id q10so20080018pff.9;
        Tue, 23 Jul 2019 19:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qRMlM2gUSInEC6RWWvSWyihO1TIAbroHme9s+jonTRc=;
        b=uakhSOoJr7OLv33vGsuhtq2Ax1mkcbw1w3DshzvnsB11Jgvts/botujxNjtMMGf3BD
         nPjs20j2kLIW8b0TVsHSLGyqAF50zmL2OPm53LfVnH6zm4hr6Zyw6s2Rcd7dPU9gG3gC
         NPTyac0LdjUbzZ9uc+UhlJ8OughYsGXd6wMtLurs588+3WrMHwS1KYYz30r2BHvqI5Mn
         do9Wm3Mx0W4fSY77x8zmGEC1S2ppgFhZR8fUmDjkIsOpA4xDs8H0mFf6zR6uFnKShxYE
         oWAtVJA6PO5CLbreAX4+kIV1V1lFNrZL+qYwabWMZaZLCOUkfCzTPpuGNWvemLxQ3srs
         MfPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qRMlM2gUSInEC6RWWvSWyihO1TIAbroHme9s+jonTRc=;
        b=X1nVb8gPML/72wDKEZkOHwpkop83FjvcsgZSnrwXGmzys+Y7vDCleKtISXnx2IW6gS
         D2RWg47pFJjWUhtGGBO9+oz750dCmLRr2U/bqUukeNQsRSqUQJt1rLrS5SaqBR6q8Hn/
         2JUCpYIhvbby1dCKlMnxZe2pCW3dOKiF6orSurco1BmTPQZr7Vh/QBjp12etdyqphYzS
         axAPvkbcD3WWPlPR1C8kBGssNXNSmq8gA9lzzA6kom0s/MUlmgMhcaWF0GF0vewb7cRi
         gEEqQBQZ6ynp+tJCgBCe2ZIbC2obtTseIFfX9ttYU61BIqqprnoIESBGBGxDbMErJF6R
         Wn8w==
X-Gm-Message-State: APjAAAV2z+zSpTs7YIfTHMEEfv2WIhhUGbTvj49X5SmKSV//sV2iQOXe
        ExASFXPVmAclNwV/AVqq0NAr4T6DSjk=
X-Google-Smtp-Source: APXvYqwtiFH8QItK41hVwAREdYVTax52z066QYfEO1VzBIZM5BscyljFyb1qFWp/q4lLGfqmyg7yww==
X-Received: by 2002:aa7:81d9:: with SMTP id c25mr8963389pfn.255.1563935083841;
        Tue, 23 Jul 2019 19:24:43 -0700 (PDT)
Received: from guoguo-omen-lan.lan ([107.151.139.128])
        by smtp.gmail.com with ESMTPSA id s185sm63468029pgs.67.2019.07.23.19.24.38
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 23 Jul 2019 19:24:43 -0700 (PDT)
From:   Chuanhong Guo <gch981213@gmail.com>
To:     linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list),
        linux-mips@vger.kernel.org (open list:MIPS),
        devel@driverdev.osuosl.org (open list:STAGING SUBSYSTEM)
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        John Crispin <john@phrozen.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Weijie Gao <hackpascal@gmail.com>, NeilBrown <neil@brown.name>,
        Chuanhong Guo <gch981213@gmail.com>
Subject: [PATCH v2 6/6] staging: mt7621-dts: add dt nodes for mt7621-pll
Date:   Wed, 24 Jul 2019 10:23:10 +0800
Message-Id: <20190724022310.28010-7-gch981213@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190724022310.28010-1-gch981213@gmail.com>
References: <20190724022310.28010-1-gch981213@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This commit adds device-tree node for mt7621-pll and use its clocks
accordingly.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---

Changes since v1:
1. drop cpuclock node in gbpc1.dts
2. drop syscon in mt7621-pll node

 drivers/staging/mt7621-dts/gbpc1.dts   |  5 -----
 drivers/staging/mt7621-dts/mt7621.dtsi | 15 +++++++--------
 2 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/mt7621-dts/gbpc1.dts b/drivers/staging/mt7621-dts/gbpc1.dts
index 1fb560ff059c..d94b73243268 100644
--- a/drivers/staging/mt7621-dts/gbpc1.dts
+++ b/drivers/staging/mt7621-dts/gbpc1.dts
@@ -106,11 +106,6 @@
 			clock-frequency = <225000000>;
 };
 
-&cpuclock {
-			compatible = "fixed-clock";
-			clock-frequency = <900000000>;
-};
-
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie_pins>;
diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi b/drivers/staging/mt7621-dts/mt7621.dtsi
index d89d68ffa7bc..7b82f7f70404 100644
--- a/drivers/staging/mt7621-dts/mt7621.dtsi
+++ b/drivers/staging/mt7621-dts/mt7621.dtsi
@@ -1,4 +1,5 @@
 #include <dt-bindings/interrupt-controller/mips-gic.h>
+#include <dt-bindings/clock/mt7621-clk.h>
 #include <dt-bindings/gpio/gpio.h>
 
 / {
@@ -27,12 +28,11 @@
 		serial0 = &uartlite;
 	};
 
-	cpuclock: cpuclock@0 {
-		#clock-cells = <0>;
-		compatible = "fixed-clock";
+	pll: pll {
+		compatible = "mediatek,mt7621-pll";
 
-		/* FIXME: there should be way to detect this */
-		clock-frequency = <880000000>;
+		#clock-cells = <1>;
+		clock-output-names = "cpu", "bus";
 	};
 
 	sysclock: sysclock@0 {
@@ -155,7 +155,6 @@
 			compatible = "ns16550a";
 			reg = <0xc00 0x100>;
 
-			clocks = <&sysclock>;
 			clock-frequency = <50000000>;
 
 			interrupt-parent = <&gic>;
@@ -172,7 +171,7 @@
 			compatible = "ralink,mt7621-spi";
 			reg = <0xb00 0x100>;
 
-			clocks = <&sysclock>;
+			clocks = <&pll MT7621_CLK_BUS>;
 
 			resets = <&rstctrl 18>;
 			reset-names = "spi";
@@ -372,7 +371,7 @@
 		timer {
 			compatible = "mti,gic-timer";
 			interrupts = <GIC_LOCAL 1 IRQ_TYPE_NONE>;
-			clocks = <&cpuclock>;
+			clocks = <&pll MT7621_CLK_CPU>;
 		};
 	};
 
-- 
2.21.0

