Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D28F02A93B9
	for <lists+linux-mips@lfdr.de>; Fri,  6 Nov 2020 11:09:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726765AbgKFKJD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 6 Nov 2020 05:09:03 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:48811 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726422AbgKFKJD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 6 Nov 2020 05:09:03 -0500
X-Originating-IP: 91.175.115.186
Received: from localhost (91-175-115-186.subs.proxad.net [91.175.115.186])
        (Authenticated sender: gregory.clement@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 7701760009;
        Fri,  6 Nov 2020 10:09:00 +0000 (UTC)
From:   Gregory CLEMENT <gregory.clement@bootlin.com>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org
Cc:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        <Steen.Hegelund@microchip.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH 4/9] MIPS: mscc: Fix configuration name for ocelot legacy boards
Date:   Fri,  6 Nov 2020 11:08:44 +0100
Message-Id: <20201106100849.969240-6-gregory.clement@bootlin.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201106100849.969240-1-gregory.clement@bootlin.com>
References: <20201106100849.969240-1-gregory.clement@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Ocelots is supported by the generic MIPS build so make it clears that
LEGACY_BOARD_OCELOT is only needed for legacy boards which didn't have
bootloader supporting device tree.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 arch/mips/generic/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/generic/Kconfig b/arch/mips/generic/Kconfig
index 45431b88dded..eb2a3fa9fcd7 100644
--- a/arch/mips/generic/Kconfig
+++ b/arch/mips/generic/Kconfig
@@ -31,7 +31,7 @@ comment "MSCC Ocelot doesn't work with SEAD3 enabled"
 	depends on LEGACY_BOARD_SEAD3
 
 config LEGACY_BOARD_OCELOT
-	bool "Support MSCC Ocelot boards"
+	bool "Legacy support for Ocelot based boards"
 	depends on LEGACY_BOARD_SEAD3=n
 	select LEGACY_BOARDS
 	select SOC_VCOREIII
-- 
2.28.0

