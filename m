Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A75751EB4
	for <lists+linux-mips@lfdr.de>; Tue, 25 Jun 2019 00:58:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727827AbfFXW6f (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 Jun 2019 18:58:35 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:33338 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727774AbfFXW6d (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 24 Jun 2019 18:58:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1561417111; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CWZ8fpcDOJi1GlZKC6IM5HbC/csXyFOfQ2P9Uj7IsrQ=;
        b=ef6tRGnZu1YVwddv3jvW/FphmS+6VvFXYbahVsJeSYqgUUqJcSehkdQmZAL/b7srUEaVzl
        FwuRIPkGw+QnXHyLcPOjrXrbL+oKGg+PgWqE1o0MHlQsyNFtr9yPPfcxoKSEaLmnsmVE1h
        EKIYc9tlgGjRP1l+UdMZusgo7r/dgkk=
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
Subject: [PATCH v13 10/13] MIPS: qi_lb60: Reduce system timer and clocksource to 750 kHz
Date:   Tue, 25 Jun 2019 00:57:56 +0200
Message-Id: <20190624225759.18299-11-paul@crapouillou.net>
In-Reply-To: <20190624225759.18299-1-paul@crapouillou.net>
References: <20190624225759.18299-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The default clock (12 MHz) is too fast for the system timer, which fails
to report time accurately.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Tested-by: Mathieu Malaterre <malat@debian.org>
Tested-by: Artur Rojek <contact@artur-rojek.eu>
---

Notes:
    v5: New patch
    
    v6: Remove ingenic,clocksource-channel property
    
    v7-v13: No change

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

