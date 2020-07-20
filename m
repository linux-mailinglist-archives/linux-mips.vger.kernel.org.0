Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 860AB2258E9
	for <lists+linux-mips@lfdr.de>; Mon, 20 Jul 2020 09:45:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726389AbgGTHpD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 20 Jul 2020 03:45:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726030AbgGTHpD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 20 Jul 2020 03:45:03 -0400
Received: from vultr.net.flygoat.com (vultr.net.flygoat.com [IPv6:2001:19f0:6001:3633:5400:2ff:fe8c:553])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51B9FC061794;
        Mon, 20 Jul 2020 00:45:03 -0700 (PDT)
Received: from localhost.localdomain (unknown [IPv6:2001:da8:20f:4430:250:56ff:fe9a:7470])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 190F41FECC;
        Mon, 20 Jul 2020 07:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1595231103; bh=JQPKVllLBhjegV8oJ4/3W4Dq3jbR4Ki6pJQ0tsIkbus=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UcP5zdYgnNjqWjgyXOUFxxE2au/BJgpu+BZxvJyy0LkKw5yM1G2koAxT2P59M7IXj
         pf6QtfVs0jdUgEfOeR2QQ9JCNB2AhpBtUkD1RbMGAV+R36zIh9vwjK5RyHzpIQKI37
         nNodzXKkPbbCcpFRf2jNeHnojHlygLJvlLyQR2MfhzwokXFxai9b76xQuDaowd13sD
         vlgXpxgbC6X4q+DnXhCrFursWHf9RX05he0i1304vE0h2uhXxJIUmL2RxPZpLoiO8D
         c9Ob2q2Gnc38gy03meWBq7YAB8aCL6v0fgOlTqr+fgCMOtEDwhDZAf0CRyN8+Q/3/w
         NN/D/3r77Gvgw==
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
Subject: [PATCH 5/5] MIPS: Loongson64: Add ISA node for LS7A PCH
Date:   Mon, 20 Jul 2020 15:42:38 +0800
Message-Id: <20200720074249.596364-6-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.28.0.rc1
In-Reply-To: <20200720074249.596364-1-jiaxun.yang@flygoat.com>
References: <20200720074249.596364-1-jiaxun.yang@flygoat.com>
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
index 1c286bb8c703..724929ea3f5f 100644
--- a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
+++ b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
@@ -19,6 +19,13 @@ pic: interrupt-controller@10000000 {
 			#interrupt-cells = <2>;
 		};
 
+		isa {
+			compatible = "isa";
+			#address-cells = <2>;
+			#size-cells = <1>;
+			ranges = <1 0 0 0x18000000 0x20000>;
+		};
+
 		pci@1a000000 {
 			compatible = "loongson,ls7a-pci";
 			device_type = "pci";
-- 
2.28.0.rc1

