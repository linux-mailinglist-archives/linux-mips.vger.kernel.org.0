Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3834815DFDB
	for <lists+linux-mips@lfdr.de>; Fri, 14 Feb 2020 17:11:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391648AbgBNQKw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 14 Feb 2020 11:10:52 -0500
Received: from mo4-p04-ob.smtp.rzone.de ([85.215.255.124]:36123 "EHLO
        mo4-p04-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391603AbgBNQKu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 14 Feb 2020 11:10:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1581696641;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=dZbZVnixfoO3ZI6/71WGGwComZxww6jvUSKhufZA4ck=;
        b=qqR6ysT+tq1UT58oNVjbDZpcqqp4orVxHFkTflGkO6wVlP2TF8HBx3xLLUY3bhtLQo
        Zscr3oXH0pD+M2EfKPS1MjtQePLHWDOWYVVASGDKS3niSsnUb9UyAcjrRXhNbSDoJQdv
        Pqwf/Q6uVedE0GNIa/xpsFUm7LplgyJ/PPmIqR2+KX572aecjXdFyP3SFNiMsTQ3p4ex
        dtaZQdLF38e6Mt9wnNbPEczKaVy92a86kYG5Gq369btAC/7XNMJ112HZVE/ICcEVqYyd
        sZ7Wvn0tad/24RcZaduQXZP1DHSZsbVgsrp70V2vDuAu/OQjVTbO4gmM8YXXrLZF3Jqz
        r3/g==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UNf2M7OMfsfQx3"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
        with ESMTPSA id U06217w1EGAWFl5
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Fri, 14 Feb 2020 17:10:32 +0100 (CET)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     Paul Boddie <paul@boddie.org.uk>,
        Paul Cercueil <paul@crapouillou.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Andi Kleen <ak@linux.intel.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Kees Cook <keescook@chromium.org>
Cc:     devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        letux-kernel@openphoenux.org, kernel@pyra-handheld.com
Subject: [PATCH v2 10/12] MIPS: DTS: CI20: add DT node for SW1 as Enter button
Date:   Fri, 14 Feb 2020 17:10:22 +0100
Message-Id: <c3ee5a9d9831c291cff3762c01a6f3d8665745d2.1581696624.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1581696624.git.hns@goldelico.com>
References: <cover.1581696624.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The SW1 button can be used as a simple one-button keyboard
and is connected to PD17.

Note: SW1 has a second meaning to change the boot sequence
when pressed while powering on.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/mips/boot/dts/ingenic/ci20.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/mips/boot/dts/ingenic/ci20.dts b/arch/mips/boot/dts/ingenic/ci20.dts
index b4a820313992..8f9d182566db 100644
--- a/arch/mips/boot/dts/ingenic/ci20.dts
+++ b/arch/mips/boot/dts/ingenic/ci20.dts
@@ -4,6 +4,7 @@
 #include "jz4780.dtsi"
 #include <dt-bindings/clock/ingenic,tcu.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 
 / {
 	compatible = "img,ci20", "ingenic,jz4780";
@@ -25,6 +26,17 @@
 		       0x30000000 0x30000000>;
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		sw1 {
+			label = "ci20:sw1";
+			linux,code = <KEY_ENTER>;
+			gpios = <&gpd 17 GPIO_ACTIVE_HIGH>;
+			wakeup-source;
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
-- 
2.23.0

