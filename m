Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 132D689B9C
	for <lists+linux-mips@lfdr.de>; Mon, 12 Aug 2019 12:37:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727931AbfHLKhI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Aug 2019 06:37:08 -0400
Received: from mx2.mailbox.org ([80.241.60.215]:35368 "EHLO mx2.mailbox.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727841AbfHLKhI (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 12 Aug 2019 06:37:08 -0400
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:105:465:1:1:0])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mx2.mailbox.org (Postfix) with ESMTPS id C1DD1A33B3;
        Mon, 12 Aug 2019 12:37:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
        by spamfilter04.heinlein-hosting.de (spamfilter04.heinlein-hosting.de [80.241.56.122]) (amavisd-new, port 10030)
        with ESMTP id 8x7qYLLGahYE; Mon, 12 Aug 2019 12:36:56 +0200 (CEST)
From:   Stefan Roese <sr@denx.de>
To:     linux-mips@vger.kernel.org
Cc:     Paul Burton <paul.burton@mips.com>,
        Harvey Hunt <harveyhuntnexus@gmail.com>,
        John Crispin <john@phrozen.org>
Subject: [PATCH 1/4 v4] MIPS: ralink: mt7628a.dtsi: Add I2C controller DT node
Date:   Mon, 12 Aug 2019 12:36:52 +0200
Message-Id: <20190812103655.11070-1-sr@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This patch adds the I2C controller description to the MT7628A dtsi file.

Signed-off-by: Stefan Roese <sr@denx.de>
Cc: Paul Burton <paul.burton@mips.com>
Cc: Harvey Hunt <harveyhuntnexus@gmail.com>
Cc: John Crispin <john@phrozen.org>
---
v4:
- No change

v3:
- No change (I2C controller driver is now available in mainline)

v2:
- Use Harvey's new email address (not at imgtec)
- Use correct linux-mips list address

 arch/mips/boot/dts/ralink/mt7628a.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/mips/boot/dts/ralink/mt7628a.dtsi b/arch/mips/boot/dts/ralink/mt7628a.dtsi
index 61f8621e88b3..742bcc1dc2e0 100644
--- a/arch/mips/boot/dts/ralink/mt7628a.dtsi
+++ b/arch/mips/boot/dts/ralink/mt7628a.dtsi
@@ -199,6 +199,22 @@
 			status = "disabled";
 		};
 
+		i2c: i2c@900 {
+			compatible = "mediatek,mt7621-i2c";
+			reg = <0x900 0x100>;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinmux_i2c_i2c>;
+
+			resets = <&resetc 16>;
+			reset-names = "i2c";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+		};
+
 		uart0: uartlite@c00 {
 			compatible = "ns16550a";
 			reg = <0xc00 0x100>;
-- 
2.22.0

