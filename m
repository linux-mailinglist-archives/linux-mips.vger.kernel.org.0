Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83DCF10A322
	for <lists+linux-mips@lfdr.de>; Tue, 26 Nov 2019 18:10:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728501AbfKZRKI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 Nov 2019 12:10:08 -0500
Received: from sender4-pp-o98.zoho.com ([136.143.188.98]:25865 "EHLO
        sender4-pp-o98.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727674AbfKZRKI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 26 Nov 2019 12:10:08 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1574788058; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=N7XIzwE20+dK1fOPG2DThH4GKCHKn2z3gTgcdbpLfE91FXcyOAGhjLp1P/pW5p7f+TF3zApWEZCS6exKGuKX8jwqgtAu8JLn+JUh8Aq7dBmmr9fmbkaprpTKa2Zx6AnVZkufAjzTZImzx4nmxw3KwTaEUc6/3VNOYWvq3xYETCE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1574788058; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To; 
        bh=NpFe2R5yfcuoPLJC02fMDmY5tfqV1t1IfsCwTKVYbY8=; 
        b=mgLg6KKEC1Q0nie3Oe72yygqHJc5nGSpXmPX6ajTkHbg3kGmdXtQc/GlVdg8xzXyjoJ+1wrYkzQdCQ6czVeVI1do1YxyY/sFTYY+NZ3XfMg2KmaRFxNYhCBItAAxUkPv8TWpYflJr+gNWbxciqQLC04xXnigFTjHkiQLigCoOs0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=g42N+9ghrB6XyUJo5c4fm8+mdJX4naxyOKxqhASvnlVY4kt4LS3cFxHtUeAhQnpKMcyiiUs/Z/cT
    RPpxThhv7C2le/7UnYjDKC9aNvjmshieF/LAIQLch90yFZTAO9NM  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1574788058;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=NpFe2R5yfcuoPLJC02fMDmY5tfqV1t1IfsCwTKVYbY8=;
        b=UeW6zbS3VUEY35duXONpV+XVkXhleNJ9I01J7qWCMEeCol9g2acU7I9U47SJgAzu
        8CotAl5XMW17IzZV9c+c+DimLbouBQR8rWPDCx3qXBLFNidXsxD/qlvQb1v1SFkotQY
        AhX2keOhaVwjJ6BW02VrOO4yjxgXFk3RIb3SKrTQ=
Received: from zhouyanjie-virtual-machine.localdomain (171.221.112.214 [171.221.112.214]) by mx.zohomail.com
        with SMTPS id 1574788058130843.0617838570272; Tue, 26 Nov 2019 09:07:38 -0800 (PST)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, paul.burton@mips.com, paulburton@kernel.org,
        jhogan@kernel.org, mripard@kernel.org, shawnguo@kernel.org,
        mark.rutland@arm.com, syq@debian.org, ralf@linux-mips.org,
        heiko@sntech.de, icenowy@aosc.io,
        laurent.pinchart@ideasonboard.com, krzk@kernel.org,
        geert+renesas@glider.be, paul@crapouillou.net,
        prasannatsmkumar@gmail.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com, 772753199@qq.com
Subject: [PATCH v4 5/6] MIPS: X1000: Add pdma controller DT node.
Date:   Wed, 27 Nov 2019 01:06:13 +0800
Message-Id: <1574787974-58040-6-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574787974-58040-1-git-send-email-zhouyanjie@zoho.com>
References: <1574787974-58040-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add the appropriate DT node to probe the pdma controller driver
using the devicetree.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---

Notes:
    v4:
    New patch.

 arch/mips/boot/dts/ingenic/x1000.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/mips/boot/dts/ingenic/x1000.dtsi b/arch/mips/boot/dts/ingenic/x1000.dtsi
index 9e55edd..edfa70d 100644
--- a/arch/mips/boot/dts/ingenic/x1000.dtsi
+++ b/arch/mips/boot/dts/ingenic/x1000.dtsi
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <dt-bindings/clock/x1000-cgu.h>
+#include <dt-bindings/dma/x1000-dma.h>
 
 / {
 	#address-cells = <1>;
@@ -173,4 +174,16 @@
 
 		status = "disabled";
 	};
+
+	pdma: dma-controller@13420000 {
+		compatible = "ingenic,x1000-dma";
+		reg = <0x13420000 0x400
+			   0x13421000 0x40>;
+		#dma-cells = <2>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <10>;
+
+		clocks = <&cgu X1000_CLK_PDMA>;
+	};
 };
-- 
2.7.4


