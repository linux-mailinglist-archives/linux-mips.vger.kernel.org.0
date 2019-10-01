Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45FFEC40B9
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 21:10:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726010AbfJATJg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Oct 2019 15:09:36 -0400
Received: from srv1.deutnet.info ([116.203.153.70]:55196 "EHLO
        srv1.deutnet.info" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725991AbfJATJg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 1 Oct 2019 15:09:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=deutnet.info; s=default; h=In-Reply-To:Message-ID:Subject:Cc:To:From:Date;
         bh=60OHukiHnNspCw6OiVucbGC3zH8iOy4aw+kE5lf5Fcs=; b=O8Epn1G2GmOKPzCkDZdwm7mtj
        Y1JjTe9emyw2vl5DHHGZqcI2OlgrepZmqigNNi6aaFvICFBPuby0YWWaPlF2UBu8003SppFXACwDj
        j7rjqTgQAV0vkkYMi3QU55xJhEdWmCN4IpWsXPEJeJ8Wl+FzjECTtNa8q3S2ZdI340cviAo9RjiGQ
        fW5zdJKRIGM3jH0Bz7YVs/tc/wxyXG7qEmjr6qakQMNiWE9EEC3MxpWhbPtTNkmgWypvG3ECbIgAU
        Fhe5n4i88Aclox8oPdxdhUYiPHrbs9Fq7hMK0PzrRPGPZ/KYGtrVHjX//bd9Y+9jAQdpsQbIQ4Ghg
        fYjQxI7gw==;
Received: from [2001:bc8:3dc9::1] (helo=localhost)
        by srv1.deutnet.info with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <agriveaux@deutnet.info>)
        id 1iFNWc-0000qH-T0; Tue, 01 Oct 2019 21:09:30 +0200
Received: from agriveaux by localhost with local (Exim 4.92)
        (envelope-from <agriveaux@deutnet.info>)
        id 1iFNWc-00BgNX-Ht; Tue, 01 Oct 2019 21:09:30 +0200
Date:   Tue, 1 Oct 2019 21:09:30 +0200
From:   Alexandre GRIVEAUX <agriveaux@deutnet.info>
To:     robh+dt@kernel.org, mark.rutland@arm.com, ralf@linux-mips.org,
        paul.burton@mips.com, jhogan@kernel.org, agriveaux@deutnet.info
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 4/5] MIPS: CI20: DTS: Add Leds
Message-ID: <fa61d681bad1d551876ce879643226dd59611316.1569955865.git.agriveaux@deutnet.info>
References: <cover.1569955865.git.agriveaux@deutnet.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1569955865.git.agriveaux@deutnet.info>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Adding leds and related triggers.

Signed-off-by: Alexandre GRIVEAUX <agriveaux@deutnet.info>
---
 arch/mips/boot/dts/ingenic/ci20.dts | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/mips/boot/dts/ingenic/ci20.dts b/arch/mips/boot/dts/ingenic/ci20.dts
index c62c36ae94c2..37b93166bf22 100644
--- a/arch/mips/boot/dts/ingenic/ci20.dts
+++ b/arch/mips/boot/dts/ingenic/ci20.dts
@@ -25,6 +25,34 @@
 		       0x30000000 0x30000000>;
 	};
 
+	leds {
+		compatible = "gpio-leds";
+
+		led0 {
+			label = "ci20:red:led0";
+			gpios = <&gpc 3 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "none";
+		};
+
+		led1 {
+			label = "ci20:red:led1";
+			gpios = <&gpc 2 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "nand-disk";
+		};
+
+		led2 {
+			label = "ci20:red:led2";
+			gpios = <&gpc 1 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "cpu1";
+		};
+
+		led3 {
+			label = "ci20:red:led3";
+			gpios = <&gpc 0 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "cpu0";
+		};
+	};
+
 	eth0_power: fixedregulator@0 {
 		compatible = "regulator-fixed";
 		regulator-name = "eth0_power";
-- 
2.20.1

