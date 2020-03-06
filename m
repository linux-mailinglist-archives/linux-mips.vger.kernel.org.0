Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D69C517C785
	for <lists+linux-mips@lfdr.de>; Fri,  6 Mar 2020 22:06:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726676AbgCFVGk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 6 Mar 2020 16:06:40 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.82]:21724 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726185AbgCFVGk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 6 Mar 2020 16:06:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1583528798;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=vNO66+ztpQp9n8/S8Q3jA2wnH0xE9ZlJlnj64laLA5o=;
        b=eC/fqldFRaN7a1/2Z9kfcASvQBRb92sv11tNfIQp669rrUR65NBwin1hnq59CPCbGh
        VC93Wf6xwYIBRKirv5eNUntmZRlCd/nwpvBXknql6utIhS4xvtxsCLvbv5BrTbE92phb
        OdLrVHl2LHvd/UcnV/7xAIKMkjDz5+2p8rFmcpPNj/UYqRoQfhUraIwL+5GCLmnTeQwf
        TxY+YAQ04f/DzcbAFubu1nKhc+scivFQGjTVe8OISK71AwU3KM6HzWXc+xgJrUb0IVGc
        IWxxy/sgpwAhEkgU09VpbhI2iYo6y9vU/ANFsrPY5uQQBbD9YaZJGY9Gj2zSKiwEwo/z
        PUUg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXH6GQjzrz4="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.2.0 DYNA|AUTH)
        with ESMTPSA id y0a02cw26L6baJd
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Fri, 6 Mar 2020 22:06:37 +0100 (CET)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     Paul Cercueil <paul@crapouillou.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kees Cook <keescook@chromium.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org
Subject: [PATCH v7 2/3] MIPS: DTS: CI20: multiple DTS improvements
Date:   Fri,  6 Mar 2020 22:06:32 +0100
Message-Id: <cc802abaf32370e852c4ba28d8598fdff45706f3.1583528793.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1583528793.git.hns@goldelico.com>
References: <cover.1583528793.git.hns@goldelico.com>
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
index fc4e64200c3d..db0ca250bd1a 100644
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

