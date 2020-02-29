Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 259691748F6
	for <lists+linux-mips@lfdr.de>; Sat, 29 Feb 2020 20:46:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727447AbgB2TqD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 29 Feb 2020 14:46:03 -0500
Received: from mo4-p03-ob.smtp.rzone.de ([85.215.255.101]:9278 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727257AbgB2TqD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 29 Feb 2020 14:46:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1583005559;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=N4GtTrjPdB4EW85DMh8XLv+djAgi+uGPsiInIH/iXUw=;
        b=qTWgWusZJ97Gha2xUtV/ZgI8v9w3z2ZdoA6VMUw22JzSg8gdZvOFdG6wc9mfNKdjFx
        WwggB2Esq1fzeDnDkCMG4yo/jhJCKLftHMmSFXtYfgSTC5MWCd5j06E5Y/qcqWJr2CBC
        2rjXXBoLeasr4y+gCcOJ5N/UpNkfL5ExEZ5llPoqIGB9pxyNDIWBGnh9biSJrtGhb1n3
        zj+3JxY9CR0Zg8QW/sOKkcgPYNe3bsBN0LujwU0QUufBjiBRv4YasXyYGI7OKro5bWG4
        c9tTKsGfF/2S+bmVrz3lE32C1DKHM4Ecx/yB3xrOQUlAF5vXtlbWJ4tKfXtPlj6D4Q7+
        hLDQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXH6HGqvi2w="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.2.0 DYNA|AUTH)
        with ESMTPSA id y0a02cw1TJjp6m5
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Sat, 29 Feb 2020 20:45:51 +0100 (CET)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     Paul Boddie <paul@boddie.org.uk>,
        Paul Cercueil <paul@crapouillou.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Andi Kleen <ak@linux.intel.com>,
        Kees Cook <keescook@chromium.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "Eric W. Biederman" <ebiederm@xmission.com>
Cc:     devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com
Subject: [PATCH v5 4/5] MIPS: DTS: CI20: multiple DTS improvements
Date:   Sat, 29 Feb 2020 20:45:47 +0100
Message-Id: <e146dcc3829bd208a607fd18650e480d0c683ab7.1583005548.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1583005548.git.hns@goldelico.com>
References: <cover.1583005548.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

a) add DT node for SW1 as Enter button

The SW1 button can be used as a simple one-button keyboard
and is connected to PD17.

Note: SW1 has a second meaning to change the boot sequence
when pressed while powering on.

b) give eth0_power a defined voltage.

This is a 3.3V power switch (DVNET3.3V).

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
Reviewed-by: Paul Cercueil <paul@crapouillou.net>
---
 arch/mips/boot/dts/ingenic/ci20.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/mips/boot/dts/ingenic/ci20.dts b/arch/mips/boot/dts/ingenic/ci20.dts
index 0251ca154ccb..ce6bf7e7dbba 100644
--- a/arch/mips/boot/dts/ingenic/ci20.dts
+++ b/arch/mips/boot/dts/ingenic/ci20.dts
@@ -4,6 +4,7 @@
 #include "jz4780.dtsi"
 #include <dt-bindings/clock/ingenic,tcu.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/regulator/active-semi,8865-regulator.h>
 
@@ -27,6 +28,17 @@
 		       0x30000000 0x30000000>;
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		sw1 {
+			label = "ci20:sw1";
+			linux,code = <KEY_F13>;
+			gpios = <&gpd 17 GPIO_ACTIVE_HIGH>;
+			wakeup-source;
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -58,6 +70,8 @@
 	eth0_power: fixedregulator@0 {
 		compatible = "regulator-fixed";
 		regulator-name = "eth0_power";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
 		gpio = <&gpb 25 GPIO_ACTIVE_LOW>;
 		enable-active-high;
 	};
-- 
2.23.0

