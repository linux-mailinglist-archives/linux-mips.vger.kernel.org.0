Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B4B222D3A7
	for <lists+linux-mips@lfdr.de>; Sat, 25 Jul 2020 03:46:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727014AbgGYBqo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 24 Jul 2020 21:46:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726701AbgGYBqo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 24 Jul 2020 21:46:44 -0400
Received: from vultr.net.flygoat.com (vultr.net.flygoat.com [IPv6:2001:19f0:6001:3633:5400:2ff:fe8c:553])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 218E5C0619D3;
        Fri, 24 Jul 2020 18:46:44 -0700 (PDT)
Received: from localhost.localdomain (unknown [IPv6:2001:da8:20f:4430:250:56ff:fe9a:7470])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id EA8101FECD;
        Sat, 25 Jul 2020 01:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1595641603; bh=vaKD7IUjG1etsvFupW6edy8t9lQ2LBk8C1F1iGCfaLk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rQTCgS/aUbpHeSUWsnjBtcd7X09EjjstBhr88VM0i1XjAEGMun/AOfqJL+hpTewQ1
         DvsqbBntCloVENKsfuezgUL7bLfZH7Ma1PWh+jNUz1Mt6GvzO6bWqCmpRFXkngZ833
         EKNswPCUd+48axr75k+eFKEuVEDWVZIir82/D28KZlpFkkhzR3bvfpZv6V6u5mqtHg
         rEAceI7QZYM06jrJ3AXj2ZsyUeTXgLdVd5ENmJm+HL+plMULKPG81/fz8QL5MnStpn
         Cj6Ckp5l3+H6iAmDG/maOriPS68IJvToTJVS/ISAYxL2SKXBaZmBHX7jd/JMACiDm7
         PW73LwosyxoJA==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Paul Burton <paulburton@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/5] MIPS: Loongson64: Add ISA node for LS7A PCH
Date:   Sat, 25 Jul 2020 09:45:19 +0800
Message-Id: <20200725014529.1143208-6-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.28.0.rc1
In-Reply-To: <20200725014529.1143208-1-jiaxun.yang@flygoat.com>
References: <20200725014529.1143208-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Although currently we're not enabling any ISA device in devicetree,
but this node is required to express the ranges of address reserved
for ISA.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/boot/dts/loongson/ls7a-pch.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
index 1c286bb8c703..e574a062dfae 100644
--- a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
+++ b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
@@ -367,5 +367,12 @@ pci_bridge@14,0 {
 				interrupt-map = <0 0 0 0 &pic 39 IRQ_TYPE_LEVEL_HIGH>;
 			};
 		};
+
+		isa {
+			compatible = "isa";
+			#address-cells = <2>;
+			#size-cells = <1>;
+			ranges = <1 0 0 0x18000000 0x20000>;
+		};
 	};
 };
-- 
2.28.0.rc1

