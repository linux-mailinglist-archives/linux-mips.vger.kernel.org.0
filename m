Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEA1C330446
	for <lists+linux-mips@lfdr.de>; Sun,  7 Mar 2021 20:29:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232190AbhCGT3J (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 7 Mar 2021 14:29:09 -0500
Received: from aposti.net ([89.234.176.197]:36842 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230394AbhCGT3A (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 7 Mar 2021 14:29:00 -0500
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>
Cc:     od@zcrc.me, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 2/2] MIPS: ingenic: gcw0: SPI panel does not require active-high CS
Date:   Sun,  7 Mar 2021 19:28:30 +0000
Message-Id: <20210307192830.208245-2-paul@crapouillou.net>
In-Reply-To: <20210307192830.208245-1-paul@crapouillou.net>
References: <20210307192830.208245-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The NT39016 panel is a fun beast, even though the documentation states
that the CS line is active-low, it will work just fine if the CS line is
configured as active-high, but it won't work if the CS line is forced
low or forced high.

Since it did actually work with the spi-cs-high property, this is not a
bugfix, but we should nonetheless remove that property to match the
documentation.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 arch/mips/boot/dts/ingenic/gcw0.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/mips/boot/dts/ingenic/gcw0.dts b/arch/mips/boot/dts/ingenic/gcw0.dts
index bc72304a2440..f4c04f2263ea 100644
--- a/arch/mips/boot/dts/ingenic/gcw0.dts
+++ b/arch/mips/boot/dts/ingenic/gcw0.dts
@@ -345,7 +345,6 @@ nt39016@0 {
 
 			spi-max-frequency = <3125000>;
 			spi-3wire;
-			spi-cs-high;
 
 			reset-gpios = <&gpe 2 GPIO_ACTIVE_LOW>;
 
-- 
2.30.1

