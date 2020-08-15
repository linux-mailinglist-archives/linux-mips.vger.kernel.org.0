Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C5C7245380
	for <lists+linux-mips@lfdr.de>; Sun, 16 Aug 2020 00:02:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729526AbgHOWC0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 15 Aug 2020 18:02:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728730AbgHOVvY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 15 Aug 2020 17:51:24 -0400
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [IPv6:2001:67c:2050::465:201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D062C0A3BE7;
        Sat, 15 Aug 2020 09:35:45 -0700 (PDT)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:105:465:1:1:0])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4BTQsV1wL2zQkmG;
        Sat, 15 Aug 2020 18:35:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
        by spamfilter01.heinlein-hosting.de (spamfilter01.heinlein-hosting.de [80.241.56.115]) (amavisd-new, port 10030)
        with ESMTP id xSyu6HoWY8l4; Sat, 15 Aug 2020 18:35:39 +0200 (CEST)
From:   Hauke Mehrtens <hauke@hauke-m.de>
To:     tsbogend@alpha.franken.de
Cc:     linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, james.hartley@sondrel.com,
        rahulbedarkar89@gmail.com, wigyori@uid0.hu,
        Hauke Mehrtens <hauke@hauke-m.de>
Subject: [PATCH 1/3] MIPS: DTS: img: marduk: Add SPI NAND flash
Date:   Sat, 15 Aug 2020 18:35:12 +0200
Message-Id: <20200815163514.11631-1-hauke@hauke-m.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-SPAM-Probability: *
X-Rspamd-Score: 0.84 / 15.00 / 15.00
X-Rspamd-Queue-Id: 19D3417F1
X-Rspamd-UID: 21c987
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add Gigadevice GD5F4GQ4UCYIGT SPI NAND flash to the device tree.

The NAND flash chip is connected with quad SPI, but reading currently
fails in quad SPI mode.

Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
---
 arch/mips/boot/dts/img/pistachio_marduk.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/mips/boot/dts/img/pistachio_marduk.dts b/arch/mips/boot/dts/img/pistachio_marduk.dts
index bf69da96dc8b..ea11a21b133b 100644
--- a/arch/mips/boot/dts/img/pistachio_marduk.dts
+++ b/arch/mips/boot/dts/img/pistachio_marduk.dts
@@ -88,6 +88,12 @@
 		reg = <0>;
 		spi-max-frequency = <50000000>;
 	};
+
+	flash@1 {
+		compatible = "spi-nand";
+		reg = <1>;
+		spi-max-frequency = <50000000>;
+	};
 };
 
 &uart0 {
-- 
2.20.1

