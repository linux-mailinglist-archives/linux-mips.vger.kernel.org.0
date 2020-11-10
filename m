Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75BC12AD5C2
	for <lists+linux-mips@lfdr.de>; Tue, 10 Nov 2020 12:58:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726428AbgKJL65 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 10 Nov 2020 06:58:57 -0500
Received: from mslow2.mail.gandi.net ([217.70.178.242]:56030 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726861AbgKJL65 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 10 Nov 2020 06:58:57 -0500
Received: from relay11.mail.gandi.net (unknown [217.70.178.231])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 6AFD03B2261
        for <linux-mips@vger.kernel.org>; Tue, 10 Nov 2020 11:45:41 +0000 (UTC)
Received: from localhost (82-65-9-182.subs.proxad.net [82.65.9.182])
        (Authenticated sender: gregory.clement@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id EBE4B100013;
        Tue, 10 Nov 2020 11:45:17 +0000 (UTC)
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
Subject: [PATCH v2 4/9] MIPS: mscc: Fix configuration name for ocelot legacy boards
Date:   Tue, 10 Nov 2020 12:45:03 +0100
Message-Id: <20201110114508.1197652-5-gregory.clement@bootlin.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201110114508.1197652-1-gregory.clement@bootlin.com>
References: <20201110114508.1197652-1-gregory.clement@bootlin.com>
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

