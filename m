Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF39C10C6ED
	for <lists+linux-mips@lfdr.de>; Thu, 28 Nov 2019 11:42:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726876AbfK1KmH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 Nov 2019 05:42:07 -0500
Received: from sender4-pp-o98.zoho.com ([136.143.188.98]:25858 "EHLO
        sender4-pp-o98.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726133AbfK1KmG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 Nov 2019 05:42:06 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1574937529; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=g+iqaSEt9t6mEBYpze1YBxtSpVuBILtAHDtMhG+OQRHzDT0/LeUkqcMsYLYujDKJtbJu1/NcE/XRtFw/H5h1vPxCM2s2vOql0193BTvGS0vJ8K8j299+SPzOrqQ5/67c7IhGFi0d/tXWNjGObgbik12Ghh+3qBg+uqAm5nL49+g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1574937529; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To; 
        bh=KNMab1ZXdB5UBvxQSnRm5OjTPZ0lTlMGVFskLJY0674=; 
        b=Xw5N8Q4KkKozwWgAqT3e9WXWmGiLoEfsTQo05XlO26E5hIVrJ3fX3sP8SjDj44b1DsolQUBUj2jI8RNc6oq/Plr1ya8qE6/EOAkMH92cnj8r3bTlbWvutTD36BieeZraCOqrUbNmmHS49mx4mTKsmBJm+TajFny++5zmQRbXNPM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=ruqVQva/XTauqwBJs5udeIgFBWXgPIWEaf3XV1zUsaELRhwRpIpW9Ww9wNImrfMmMQao48+/QiTI
    5FMJWSJiJjaZ4RibuT8xTdqpYac8mG9WHiIluMXfeOFpVVtmv829  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1574937529;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=KNMab1ZXdB5UBvxQSnRm5OjTPZ0lTlMGVFskLJY0674=;
        b=bm2BqqiAWYVk5gYVA0+fNy2AN3KALf2I3Ht7Pv5yrXHvmU73r4cQDEZAa/vE3oGg
        Lu8kwrJM+v2yvKeaDOtwSKCwRkrMt81ibaI4nA5vTk3w4lHFhJDCTxNmRTNWbPlKmo6
        EtOmsKa9QThk16tXGLVTIDq8O7EgqsyBU8fhWP/E=
Received: from zhouyanjie-virtual-machine.localdomain (182.148.156.27 [182.148.156.27]) by mx.zohomail.com
        with SMTPS id 1574937527094777.0253424488163; Thu, 28 Nov 2019 02:38:47 -0800 (PST)
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
        zhenwenjin@gmail.com
Subject: [PATCH v5 05/10] MIPS: X1000: Add pdma controller DT node.
Date:   Thu, 28 Nov 2019 18:37:42 +0800
Message-Id: <1574937467-101907-6-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574937467-101907-1-git-send-email-zhouyanjie@zoho.com>
References: <1574937467-101907-1-git-send-email-zhouyanjie@zoho.com>
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
    
    v4->v5:
    No change.

 arch/mips/boot/dts/ingenic/x1000.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/mips/boot/dts/ingenic/x1000.dtsi b/arch/mips/boot/dts/ingenic/x1000.dtsi
index 13a6c9ff..c432828 100644
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


