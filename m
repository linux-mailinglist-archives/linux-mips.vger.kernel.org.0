Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07CD52452AB
	for <lists+linux-mips@lfdr.de>; Sat, 15 Aug 2020 23:54:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728483AbgHOVyH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 15 Aug 2020 17:54:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728082AbgHOVwh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 15 Aug 2020 17:52:37 -0400
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [IPv6:2001:67c:2050::465:201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1690BC0A3BE8;
        Sat, 15 Aug 2020 09:35:45 -0700 (PDT)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4BTQsW1dB1zQl1c;
        Sat, 15 Aug 2020 18:35:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
        by spamfilter01.heinlein-hosting.de (spamfilter01.heinlein-hosting.de [80.241.56.115]) (amavisd-new, port 10030)
        with ESMTP id CwklkwhAjps1; Sat, 15 Aug 2020 18:35:40 +0200 (CEST)
From:   Hauke Mehrtens <hauke@hauke-m.de>
To:     tsbogend@alpha.franken.de
Cc:     linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, james.hartley@sondrel.com,
        rahulbedarkar89@gmail.com, wigyori@uid0.hu,
        Hauke Mehrtens <hauke@hauke-m.de>
Subject: [PATCH 2/3] MIPS: DTS: img: marduk: Add Cascoda CA8210 6LoWPAN
Date:   Sat, 15 Aug 2020 18:35:13 +0200
Message-Id: <20200815163514.11631-2-hauke@hauke-m.de>
In-Reply-To: <20200815163514.11631-1-hauke@hauke-m.de>
References: <20200815163514.11631-1-hauke@hauke-m.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-SPAM-Probability: *
X-Rspamd-Score: 0.89 / 15.00 / 15.00
X-Rspamd-Queue-Id: 29BF51831
X-Rspamd-UID: 66c5b7
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add Cascoda CA8210 6LoWPAN controller to device tree.

Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
---
 arch/mips/boot/dts/img/pistachio_marduk.dts | 22 +++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/mips/boot/dts/img/pistachio_marduk.dts b/arch/mips/boot/dts/img/pistachio_marduk.dts
index ea11a21b133b..633a41954cc0 100644
--- a/arch/mips/boot/dts/img/pistachio_marduk.dts
+++ b/arch/mips/boot/dts/img/pistachio_marduk.dts
@@ -75,6 +75,28 @@
 	VDD-supply = <&internal_dac_supply>;
 };
 
+&spfi0 {
+	status = "okay";
+	pinctrl-0 = <&spim0_pins>, <&spim0_cs0_alt_pin>, <&spim0_cs2_alt_pin>, <&spim0_cs3_alt_pin>, <&spim0_cs4_alt_pin>;
+	pinctrl-names = "default";
+
+	cs-gpios = <&gpio1 14 GPIO_ACTIVE_HIGH>, <&gpio0 2 GPIO_ACTIVE_HIGH>,
+			<&gpio1 12 GPIO_ACTIVE_HIGH>, <&gpio1 13 GPIO_ACTIVE_HIGH>;
+
+	ca8210: ca8210@0 {
+		status = "okay";
+		compatible = "cascoda,ca8210";
+		reg = <0>;
+		spi-max-frequency = <4000000>;
+		spi-cpol;
+		reset-gpio = <&gpio0 12 GPIO_ACTIVE_HIGH>;
+		irq-gpio = <&gpio2 12 GPIO_ACTIVE_HIGH>;
+		extclock-enable;
+		extclock-freq = <16000000>;
+		extclock-gpio = <2>;
+	};
+};
+
 &spfi1 {
 	status = "okay";
 
-- 
2.20.1

