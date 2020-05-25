Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20E6F1E1381
	for <lists+linux-mips@lfdr.de>; Mon, 25 May 2020 19:42:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389539AbgEYRmR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 25 May 2020 13:42:17 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:48862 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389348AbgEYRmR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 25 May 2020 13:42:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1590428533; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:references; bh=7pGoTltF4vbYs/4AgdTEYADlgf+GoP3BBu4X9qCt46A=;
        b=uGztXLgGX6XMUBxLQUUTtmjfB1jF1T/eLtSCAk0NmpBsAp6xcjRasLXmF4/+wVuVW/A3gy
        P3Y9Bl+sBCwV9yGB+0CoHVtblVBoogDrOrXSxA2N9lN/Q6aNVk/yJoU7FV9MnEfDZKKvFo
        dGDuLr3O1NHUHqlKm7OaES93ykSUDVY=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     od@zcrc.me, devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 1/3] MIPS: ingenic: DTS: Add memory info of GCW Zero
Date:   Mon, 25 May 2020 19:41:53 +0200
Message-Id: <20200525174155.457491-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add memory info of the GCW Zero in its devicetree. The bootloader
generally provides this information, but since it is fixed to 512 MiB,
it doesn't hurt to have it in devicetree. It allows the kernel to boot
without any parameter passed as argument.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 arch/mips/boot/dts/ingenic/gcw0.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/mips/boot/dts/ingenic/gcw0.dts b/arch/mips/boot/dts/ingenic/gcw0.dts
index c2396b5ca175..8d22828787d8 100644
--- a/arch/mips/boot/dts/ingenic/gcw0.dts
+++ b/arch/mips/boot/dts/ingenic/gcw0.dts
@@ -19,6 +19,12 @@ aliases {
 		serial3 = &uart3;
 	};
 
+	memory: memory {
+		device_type = "memory";
+		reg = <0x0 0x10000000>,
+		      <0x30000000 0x10000000>;
+	};
+
 	chosen {
 		stdout-path = "serial2:57600n8";
 	};
-- 
2.26.2

