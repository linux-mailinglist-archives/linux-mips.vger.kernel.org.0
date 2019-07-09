Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD5C963ADA
	for <lists+linux-mips@lfdr.de>; Tue,  9 Jul 2019 20:23:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728387AbfGISWo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Jul 2019 14:22:44 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:44046 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727669AbfGISWo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 9 Jul 2019 14:22:44 -0400
Received: by mail-pg1-f195.google.com with SMTP id i18so9858581pgl.11;
        Tue, 09 Jul 2019 11:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9STqI1Jzq/esB4/bjEEc0g84CBMMWQdoQcVCId/e994=;
        b=o86r0i6nZQWZmd7Ez3IDEDgeftma4RvtOLzhXESJHq0UoKm2E6xlpazwDyZ/bx+87o
         xw7OyLrvdsezFpQtk8mZJ46NoRhS42skGhoxIl+5A3mHjtC6xzgIn9iRGyBFbUMIruJp
         uxzY5sO9HZsaB6I9mcdFUP3UmhpPaGT5oeoYnycmzgstaEqHbn6zdRQtFMnY+MBKR0e0
         HSaQKfvhrBpClNIMAPm53/OrZodOgkYMNMDby6msKpwo9kdFVwvhwsN+3ZWWgZc78d8+
         OoNfk53WvPr4HlOgfm42XSa5ks6ZRb+Sd7hSjk8oGLwpR2+4mhX2c9CS/Oy9Rz7LeaiD
         2B8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9STqI1Jzq/esB4/bjEEc0g84CBMMWQdoQcVCId/e994=;
        b=jTUYn9OCIxk/Xew+VMDPaPH34zj1teaWbnrXIHU+F5/fpwiuV3wOSCO3gfgZuY78Yf
         RqM3owQ2VBRawRvlwWCZhw/5LkMVZRAEOJmgGx+cLzOBsJAg9VHr3W7cLyCR3U9zz+O9
         wFD4NuV644V2FVhlpTreyOZ6nTufYx3nB9g8adG6MSMavs3RQ4CDqxJGZt0O15zpXLEF
         R3s1lET+ZtuT2FJ9nY6JbZOTPJMhgYLlLRowgCBqochgjjlFdv568Eg3M1+95r2MtvZD
         aZdg0qKD10UP4ItMv6Kx7XBqTw8Tzpf7RPJVPi/XfK+aO1/VbsV2PA3+X6cAtYzApryr
         uLDA==
X-Gm-Message-State: APjAAAVOdSzoyx0SVeSfCB/Afq3hyTSYbAYywK7948PggRTNdqPlrxE5
        fEnrtLy/6x1V7JLla2clfvIOpVl2CFYFog==
X-Google-Smtp-Source: APXvYqzKAyOruk1lgAox5FSkQXaGKkgqTScruNAMvyq+LbO+ZrLGsElxLNhhoD0ns0wrJJR+mc1wNw==
X-Received: by 2002:a17:90a:1b4a:: with SMTP id q68mr1573355pjq.61.1562696563612;
        Tue, 09 Jul 2019 11:22:43 -0700 (PDT)
Received: from localhost.localdomain ([2001:19f0:7001:2668:5400:1ff:fe62:2bbd])
        by smtp.gmail.com with ESMTPSA id m69sm21008639pga.11.2019.07.09.11.22.36
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 09 Jul 2019 11:22:43 -0700 (PDT)
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
Subject: [PATCH 4/5] staging: mt7621-dts: add dt nodes for mt7621-pll
Date:   Wed, 10 Jul 2019 02:20:17 +0800
Message-Id: <20190709182018.23193-5-gch981213@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190709182018.23193-1-gch981213@gmail.com>
References: <20190709182018.23193-1-gch981213@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This commit adds device-tree node for mt7621-pll and use its clock
accordingly.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 drivers/staging/mt7621-dts/mt7621.dtsi | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi b/drivers/staging/mt7621-dts/mt7621.dtsi
index a4c08110094b..12717f570ceb 100644
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
+		compatible = "mediatek,mt7621-pll", "syscon";
 
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

