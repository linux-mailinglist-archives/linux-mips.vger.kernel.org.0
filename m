Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFCD2380338
	for <lists+linux-mips@lfdr.de>; Fri, 14 May 2021 07:19:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232032AbhENFUp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 14 May 2021 01:20:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232411AbhENFTE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 14 May 2021 01:19:04 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC913C06174A
        for <linux-mips@vger.kernel.org>; Thu, 13 May 2021 22:17:53 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1lhQCo-0003es-DQ; Fri, 14 May 2021 07:17:46 +0200
Received: from ore by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1lhQCn-0003zc-0Y; Fri, 14 May 2021 07:17:45 +0200
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Oleksij Rempel <o.rempel@pengutronix.de>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v1 3/3] MIPS: ath79: ar9331: add pause property for the MAC <> switch link
Date:   Fri, 14 May 2021 07:17:43 +0200
Message-Id: <20210514051743.15248-3-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210514051743.15248-1-o.rempel@pengutronix.de>
References: <20210514051743.15248-1-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mips@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Both, MAC and switch support flow control, so add pause property for the
MAC <> switch link.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 arch/mips/boot/dts/qca/ar9331.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/boot/dts/qca/ar9331.dtsi b/arch/mips/boot/dts/qca/ar9331.dtsi
index 83b3c0ce135a..c4102b280b47 100644
--- a/arch/mips/boot/dts/qca/ar9331.dtsi
+++ b/arch/mips/boot/dts/qca/ar9331.dtsi
@@ -148,6 +148,7 @@ eth1: ethernet@1a000000 {
 			fixed-link {
 				speed = <1000>;
 				full-duplex;
+				pause;
 			};
 
 			mdio {
@@ -183,6 +184,7 @@ switch_port0: port@0 {
 							fixed-link {
 								speed = <1000>;
 								full-duplex;
+								pause;
 							};
 						};
 
-- 
2.29.2

