Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9ECF1252CE
	for <lists+linux-mips@lfdr.de>; Tue, 21 May 2019 16:52:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728896AbfEUOwQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 21 May 2019 10:52:16 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:41178 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728841AbfEUOwN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 21 May 2019 10:52:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1558450331; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1AcWS9HVqY1PLzqsC6hpHLotkuwFZ5ngbhqoh2uQkjc=;
        b=nlHsXBiTI2hOMyqvIFAOvexJxPBBNl3CAaVQnS8qA9oHXhjfz8B837s1hpXajTSR5TfbG0
        2l6OgRfvQQok4yJ1VzDsXkgNdAX74PkEkNs58DLWtNS2KgpT5GvmkugOsDJx3cpPXzY7Hy
        nElVo6O/9C02icf8goYXZtGUqlZtPaA=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Lee Jones <lee.jones@linaro.org>
Cc:     Mathieu Malaterre <malat@debian.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-clk@vger.kernel.org, od@zcrc.me,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v12 10/13] MIPS: qi_lb60: Reduce system timer and clocksource to 750 kHz
Date:   Tue, 21 May 2019 16:51:38 +0200
Message-Id: <20190521145141.9813-11-paul@crapouillou.net>
In-Reply-To: <20190521145141.9813-1-paul@crapouillou.net>
References: <20190521145141.9813-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The default clock (12 MHz) is too fast for the system timer, which fails
to report time accurately.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v5: New patch
    
    v6: Remove ingenic,clocksource-channel property
    
    v7-v12: No change

 arch/mips/boot/dts/ingenic/qi_lb60.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/mips/boot/dts/ingenic/qi_lb60.dts b/arch/mips/boot/dts/ingenic/qi_lb60.dts
index 76aaf8982554..01b8c917cb33 100644
--- a/arch/mips/boot/dts/ingenic/qi_lb60.dts
+++ b/arch/mips/boot/dts/ingenic/qi_lb60.dts
@@ -2,6 +2,7 @@
 /dts-v1/;
 
 #include "jz4740.dtsi"
+#include <dt-bindings/clock/ingenic,tcu.h>
 
 / {
 	compatible = "qi,lb60", "ingenic,jz4740";
@@ -31,3 +32,9 @@
 		bias-disable;
 	};
 };
+
+&tcu {
+	/* 750 kHz for the system timer and clocksource */
+	assigned-clocks = <&tcu TCU_CLK_TIMER0>, <&tcu TCU_CLK_TIMER1>;
+	assigned-clock-rates = <750000>, <750000>;
+};
-- 
2.21.0.593.g511ec345e18

