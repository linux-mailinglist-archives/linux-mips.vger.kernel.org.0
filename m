Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E588E51EB5
	for <lists+linux-mips@lfdr.de>; Tue, 25 Jun 2019 00:58:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727774AbfFXW6t (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 Jun 2019 18:58:49 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:33426 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727845AbfFXW6i (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 24 Jun 2019 18:58:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1561417115; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2v0Z5R4mQM3hEewqviblwFvXCBmmKWeQbk4PLuRGQ8M=;
        b=vO/81n0dKKZrNarNV85OPQaZrvanEnJI8NFWXHfzffwmJzHUjBUMoRAsQtucKdNkWo134s
        5DeCD2Y9UfjObgvdNhFCOARCy/UGHgWvscft0tX5OiCbHjn3M8VfxScgC6HqHd6Skny+Xt
        O4WLXZI8DjctSyvwZXMgv4fIK4X3OHQ=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Lee Jones <lee.jones@linaro.org>
Cc:     Mathieu Malaterre <malat@debian.org>, od@zcrc.me,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-clk@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
        Artur Rojek <contact@artur-rojek.eu>
Subject: [PATCH v13 12/13] MIPS: GCW0: Reduce system timer and clocksource to 750 kHz
Date:   Tue, 25 Jun 2019 00:57:58 +0200
Message-Id: <20190624225759.18299-13-paul@crapouillou.net>
In-Reply-To: <20190624225759.18299-1-paul@crapouillou.net>
References: <20190624225759.18299-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The default clock (12 MHz) is too fast for the system timer.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Tested-by: Mathieu Malaterre <malat@debian.org>
Tested-by: Artur Rojek <contact@artur-rojek.eu>
---

Notes:
    v8: New patch
    
    v9: Don't configure clock timer1, as the OS Timer is used as
    	clocksource on this SoC
    
    v10: Revert back to v8 bahaviour. Let the user choose what
    	 clocksource should be used.
    
    v11: No change
    
    v12: Move clocksource to channel 2, as channel 1 is used as PWM
    	 for the backlight.
    
    v13: No change

 arch/mips/boot/dts/ingenic/gcw0.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/mips/boot/dts/ingenic/gcw0.dts b/arch/mips/boot/dts/ingenic/gcw0.dts
index 35f0291e8d38..f58d239c2058 100644
--- a/arch/mips/boot/dts/ingenic/gcw0.dts
+++ b/arch/mips/boot/dts/ingenic/gcw0.dts
@@ -2,6 +2,7 @@
 /dts-v1/;
 
 #include "jz4770.dtsi"
+#include <dt-bindings/clock/ingenic,tcu.h>
 
 / {
 	compatible = "gcw,zero", "ingenic,jz4770";
@@ -60,3 +61,12 @@
 	/* The WiFi module is connected to the UHC. */
 	status = "okay";
 };
+
+&tcu {
+	/* 750 kHz for the system timer and clocksource */
+	assigned-clocks = <&tcu TCU_CLK_TIMER0>, <&tcu TCU_CLK_TIMER2>;
+	assigned-clock-rates = <750000>, <750000>;
+
+	/* PWM1 is in use, so reserve channel #2 for the clocksource */
+	ingenic,pwm-channels-mask = <0xfa>;
+};
-- 
2.21.0.593.g511ec345e18

