Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECB252281D7
	for <lists+linux-mips@lfdr.de>; Tue, 21 Jul 2020 16:18:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728989AbgGUOSp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 21 Jul 2020 10:18:45 -0400
Received: from vultr.net.flygoat.com ([149.28.68.211]:41584 "EHLO
        vultr.net.flygoat.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726522AbgGUOSp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 21 Jul 2020 10:18:45 -0400
Received: from localhost.localdomain (unknown [IPv6:2001:da8:20f:4430:250:56ff:fe9a:7470])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id EA9381FEB5;
        Tue, 21 Jul 2020 14:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1595341124; bh=vaKD7IUjG1etsvFupW6edy8t9lQ2LBk8C1F1iGCfaLk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tce9KQGX93te0m68uhC/CMSBP0c091jJweStn3YBbYVkQL/iO0rIpJeBNo784UcxT
         O4agLh/309o8puqXrtgadFqp4pLuONuOmrbRVvtF6XpJtJfRkL8aSy7tbkZ2djVg7Z
         Q9JYpH/0UX8oP2Esa6P3Bhtzt0N2pimL/XWEVV2jYsrKp/Vh4yofO5YI6syWpbehn5
         iE2so5lSFUdaFS6YPwcJFruXCl68xFnKFJBIGDu2F3njisBMFYW3k5rIah6Plh1fod
         6X/rXB89msdwEIs+KhLmptnalyF1XRRQDAMxHpUp1wHGf+kRUZsSnFvj0uUOff96eP
         eSt7ggJireOzw==
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
Subject: [PATCH v2 5/5] MIPS: Loongson64: Add ISA node for LS7A PCH
Date:   Tue, 21 Jul 2020 22:17:33 +0800
Message-Id: <20200721141742.996350-6-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.28.0.rc1
In-Reply-To: <20200721141742.996350-1-jiaxun.yang@flygoat.com>
References: <20200721141742.996350-1-jiaxun.yang@flygoat.com>
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

