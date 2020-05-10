Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04F8E1CC710
	for <lists+linux-mips@lfdr.de>; Sun, 10 May 2020 08:03:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726041AbgEJGDa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 10 May 2020 02:03:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725808AbgEJGDa (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 10 May 2020 02:03:30 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FA4EC061A0E
        for <linux-mips@vger.kernel.org>; Sat,  9 May 2020 23:03:30 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1jXf3e-0001nf-PS; Sun, 10 May 2020 08:03:26 +0200
Received: from ore by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1jXf3e-0006YT-FH; Sun, 10 May 2020 08:03:26 +0200
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Oleksij Rempel <o.rempel@pengutronix.de>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v1 2/2] MIPS: ath79: ar9331: rename uart to serial node
Date:   Sun, 10 May 2020 08:03:24 +0200
Message-Id: <20200510060324.25134-2-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200510060324.25134-1-o.rempel@pengutronix.de>
References: <20200510060324.25134-1-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mips@vger.kernel.org
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

schema violation was detected by the dtbs_check

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 arch/mips/boot/dts/qca/ar9331.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/boot/dts/qca/ar9331.dtsi b/arch/mips/boot/dts/qca/ar9331.dtsi
index 6e1e17cbc1ee0..9267bc9e4cc09 100644
--- a/arch/mips/boot/dts/qca/ar9331.dtsi
+++ b/arch/mips/boot/dts/qca/ar9331.dtsi
@@ -59,7 +59,7 @@ ddr_ctrl: memory-controller@18000000 {
 				#qca,ddr-wb-channel-cells = <1>;
 			};
 
-			uart: uart@18020000 {
+			uart: serial@18020000 {
 				compatible = "qca,ar9330-uart";
 				reg = <0x18020000 0x14>;
 
-- 
2.26.2

