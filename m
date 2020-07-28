Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3B41230E1E
	for <lists+linux-mips@lfdr.de>; Tue, 28 Jul 2020 17:38:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730917AbgG1PiQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Jul 2020 11:38:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730694AbgG1PiP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 28 Jul 2020 11:38:15 -0400
Received: from vultr.net.flygoat.com (vultr.net.flygoat.com [IPv6:2001:19f0:6001:3633:5400:2ff:fe8c:553])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5863C061794;
        Tue, 28 Jul 2020 08:38:15 -0700 (PDT)
Received: from localhost.localdomain (unknown [IPv6:2001:da8:20f:4430:250:56ff:fe9a:7470])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 8AC2F1FF16;
        Tue, 28 Jul 2020 15:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1595950695; bh=vaKD7IUjG1etsvFupW6edy8t9lQ2LBk8C1F1iGCfaLk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=li/cSlM2F3UMdtc81nCh4jvrGEteH9GvUeH960QB1Ux3/jnmHiYXA/ADeiynIOgRZ
         vCJOrkdQ+eHPHdhwenddzWXUsbR2MScD131Duwv1zwq9sEZGvZ+e6Wa281bmjpDHnT
         haqG+orBN7dOp6wNb4UWZxCObVPXAPo11hC45MWXi7ZFzlxVe1MpXlhaSftaP5SlR5
         /xk520HeyhQFRkhZNIvdLEKbgZXWvIbLfghCsIcP8XcNRkkZWNhGyKQH5SKsUW6ioE
         3aNg/EC3r6aQEx/vBruDF1wI+Jf2jj2KlM63Mj1uKZNNTzG8np0pGSJKZvWnrHNWj/
         K5G8fpHKn4dRA==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Paul Burton <paulburton@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Nick Desaulniers <ndesaulniers@google.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/5] MIPS: Loongson64: Add ISA node for LS7A PCH
Date:   Tue, 28 Jul 2020 23:36:59 +0800
Message-Id: <20200728153708.1296374-6-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.28.0.rc1
In-Reply-To: <20200728153708.1296374-1-jiaxun.yang@flygoat.com>
References: <20200728153708.1296374-1-jiaxun.yang@flygoat.com>
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

