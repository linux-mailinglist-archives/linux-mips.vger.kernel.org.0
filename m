Return-Path: <linux-mips+bounces-6884-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB139E49C3
	for <lists+linux-mips@lfdr.de>; Thu,  5 Dec 2024 00:44:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4FC4A1881BD0
	for <lists+linux-mips@lfdr.de>; Wed,  4 Dec 2024 23:43:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 383CA21CA1D;
	Wed,  4 Dec 2024 23:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XltI0kLv"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5FA21CA14;
	Wed,  4 Dec 2024 23:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733355069; cv=none; b=cvVWCRXlFROGwC2L0MkFB8FfEY95fp4ahKiHeMKMsTvUMI+zhKsoi4pHHnI4juYavsCleufUVubyxGfxCDpyE51ZAeW08b44qPoWy921ikhW3PPBFph2a2tTxCw2XZlMUllOJv9mUOs1AuP6RSgv26sY6dCGSsOqDXTsU/biPBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733355069; c=relaxed/simple;
	bh=D/uZikPJRAFo/ZuGmwbk6hC/rh66CL3AU/IYr7sZlA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bWw7A6imPdQdQ8EqOnMnBqCwdNd2CCogsBgtQkKXGEBNOxyQDbB2X/yGi+yxKBODBXoxWrI+7LZGSq3/ydkkZtn6LE2em1P7Xp0+U5E5r55Qi2NRotcUzNvl0IEZ/uXEFQtg8BTXwwkJN8moXISz/ZB/FCk0VKyyf00EuIwlVrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XltI0kLv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D9D1C4CECD;
	Wed,  4 Dec 2024 23:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733355068;
	bh=D/uZikPJRAFo/ZuGmwbk6hC/rh66CL3AU/IYr7sZlA0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XltI0kLvriY0ReqCWUt4uPC4BalrnXLtMIGkG06s1QkHKQs864QBuF7PtCEfv+2ij
	 NOL6hPc2GPt0sLiUKuw4mHJ1ViACyzmTtcWmMmpyy0/97j5i9N9NOKU6DAwIrcx6uX
	 6niBIXjQ8ldbXO5l38QiH/Y6VO4XK7ayRv3ZCEKv3Us3DnqbUQyyFubLrR/3oo/lAw
	 /pp1PFHOmNJMErUYIU5I0f0OpNv73ywpwGArgmG7rrixBR1GOTYYBFmDykISz5+npu
	 Os6R3hk8JGem48hSR+fiUJ6t2gyAKwKgFdZ/waFT3FrfNrVJoTquMn6cD2zG2iGD4r
	 T9zF7ZQQqq+Ug==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Xi Ruoyao <xry111@xry111.site>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Sasha Levin <sashal@kernel.org>,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	davem@davemloft.net,
	jiaxun.yang@flygoat.com,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 4/5] MIPS: Loongson64: DTS: Really fix PCIe port nodes for ls7a
Date: Wed,  4 Dec 2024 17:19:37 -0500
Message-ID: <20241204221942.2248973-4-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241204221942.2248973-1-sashal@kernel.org>
References: <20241204221942.2248973-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.230
Content-Transfer-Encoding: 8bit

From: Xi Ruoyao <xry111@xry111.site>

[ Upstream commit 4fbd66d8254cedfd1218393f39d83b6c07a01917 ]

Fix the dtc warnings:

    arch/mips/boot/dts/loongson/ls7a-pch.dtsi:68.16-416.5: Warning (interrupt_provider): /bus@10000000/pci@1a000000: '#interrupt-cells' found, but node is not an interrupt provider
    arch/mips/boot/dts/loongson/ls7a-pch.dtsi:68.16-416.5: Warning (interrupt_provider): /bus@10000000/pci@1a000000: '#interrupt-cells' found, but node is not an interrupt provider
    arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'

And a runtime warning introduced in commit 045b14ca5c36 ("of: WARN on
deprecated #address-cells/#size-cells handling"):

    WARNING: CPU: 0 PID: 1 at drivers/of/base.c:106 of_bus_n_addr_cells+0x9c/0xe0
    Missing '#address-cells' in /bus@10000000/pci@1a000000/pci_bridge@9,0

The fix is similar to commit d89a415ff8d5 ("MIPS: Loongson64: DTS: Fix PCIe
port nodes for ls7a"), which has fixed the issue for ls2k (despite its
subject mentions ls7a).

Signed-off-by: Xi Ruoyao <xry111@xry111.site>
Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/mips/boot/dts/loongson/ls7a-pch.dtsi | 73 +++++++++++++++++++----
 1 file changed, 60 insertions(+), 13 deletions(-)

diff --git a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
index f99a7a11fded8..cdb1c40b4fd14 100644
--- a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
+++ b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
@@ -63,7 +63,6 @@ pci@1a000000 {
 			device_type = "pci";
 			#address-cells = <3>;
 			#size-cells = <2>;
-			#interrupt-cells = <2>;
 			msi-parent = <&msi>;
 
 			reg = <0 0x1a000000 0 0x02000000>,
@@ -226,7 +225,7 @@ phy1: ethernet-phy@1 {
 				};
 			};
 
-			pci_bridge@9,0 {
+			pcie@9,0 {
 				compatible = "pci0014,7a19.1",
 						   "pci0014,7a19",
 						   "pciclass060400",
@@ -236,12 +235,16 @@ pci_bridge@9,0 {
 				interrupts = <32 IRQ_TYPE_LEVEL_HIGH>;
 				interrupt-parent = <&pic>;
 
+				#address-cells = <3>;
+				#size-cells = <2>;
+				device_type = "pci";
 				#interrupt-cells = <1>;
 				interrupt-map-mask = <0 0 0 0>;
 				interrupt-map = <0 0 0 0 &pic 32 IRQ_TYPE_LEVEL_HIGH>;
+				ranges;
 			};
 
-			pci_bridge@a,0 {
+			pcie@a,0 {
 				compatible = "pci0014,7a09.1",
 						   "pci0014,7a09",
 						   "pciclass060400",
@@ -251,12 +254,16 @@ pci_bridge@a,0 {
 				interrupts = <33 IRQ_TYPE_LEVEL_HIGH>;
 				interrupt-parent = <&pic>;
 
+				#address-cells = <3>;
+				#size-cells = <2>;
+				device_type = "pci";
 				#interrupt-cells = <1>;
 				interrupt-map-mask = <0 0 0 0>;
 				interrupt-map = <0 0 0 0 &pic 33 IRQ_TYPE_LEVEL_HIGH>;
+				ranges;
 			};
 
-			pci_bridge@b,0 {
+			pcie@b,0 {
 				compatible = "pci0014,7a09.1",
 						   "pci0014,7a09",
 						   "pciclass060400",
@@ -266,12 +273,16 @@ pci_bridge@b,0 {
 				interrupts = <34 IRQ_TYPE_LEVEL_HIGH>;
 				interrupt-parent = <&pic>;
 
+				#address-cells = <3>;
+				#size-cells = <2>;
+				device_type = "pci";
 				#interrupt-cells = <1>;
 				interrupt-map-mask = <0 0 0 0>;
 				interrupt-map = <0 0 0 0 &pic 34 IRQ_TYPE_LEVEL_HIGH>;
+				ranges;
 			};
 
-			pci_bridge@c,0 {
+			pcie@c,0 {
 				compatible = "pci0014,7a09.1",
 						   "pci0014,7a09",
 						   "pciclass060400",
@@ -281,12 +292,16 @@ pci_bridge@c,0 {
 				interrupts = <35 IRQ_TYPE_LEVEL_HIGH>;
 				interrupt-parent = <&pic>;
 
+				#address-cells = <3>;
+				#size-cells = <2>;
+				device_type = "pci";
 				#interrupt-cells = <1>;
 				interrupt-map-mask = <0 0 0 0>;
 				interrupt-map = <0 0 0 0 &pic 35 IRQ_TYPE_LEVEL_HIGH>;
+				ranges;
 			};
 
-			pci_bridge@d,0 {
+			pcie@d,0 {
 				compatible = "pci0014,7a19.1",
 						   "pci0014,7a19",
 						   "pciclass060400",
@@ -296,12 +311,16 @@ pci_bridge@d,0 {
 				interrupts = <36 IRQ_TYPE_LEVEL_HIGH>;
 				interrupt-parent = <&pic>;
 
+				#address-cells = <3>;
+				#size-cells = <2>;
+				device_type = "pci";
 				#interrupt-cells = <1>;
 				interrupt-map-mask = <0 0 0 0>;
 				interrupt-map = <0 0 0 0 &pic 36 IRQ_TYPE_LEVEL_HIGH>;
+				ranges;
 			};
 
-			pci_bridge@e,0 {
+			pcie@e,0 {
 				compatible = "pci0014,7a09.1",
 						   "pci0014,7a09",
 						   "pciclass060400",
@@ -311,12 +330,16 @@ pci_bridge@e,0 {
 				interrupts = <37 IRQ_TYPE_LEVEL_HIGH>;
 				interrupt-parent = <&pic>;
 
+				#address-cells = <3>;
+				#size-cells = <2>;
+				device_type = "pci";
 				#interrupt-cells = <1>;
 				interrupt-map-mask = <0 0 0 0>;
 				interrupt-map = <0 0 0 0 &pic 37 IRQ_TYPE_LEVEL_HIGH>;
+				ranges;
 			};
 
-			pci_bridge@f,0 {
+			pcie@f,0 {
 				compatible = "pci0014,7a29.1",
 						   "pci0014,7a29",
 						   "pciclass060400",
@@ -326,12 +349,16 @@ pci_bridge@f,0 {
 				interrupts = <40 IRQ_TYPE_LEVEL_HIGH>;
 				interrupt-parent = <&pic>;
 
+				#address-cells = <3>;
+				#size-cells = <2>;
+				device_type = "pci";
 				#interrupt-cells = <1>;
 				interrupt-map-mask = <0 0 0 0>;
 				interrupt-map = <0 0 0 0 &pic 40 IRQ_TYPE_LEVEL_HIGH>;
+				ranges;
 			};
 
-			pci_bridge@10,0 {
+			pcie@10,0 {
 				compatible = "pci0014,7a19.1",
 						   "pci0014,7a19",
 						   "pciclass060400",
@@ -341,12 +368,16 @@ pci_bridge@10,0 {
 				interrupts = <41 IRQ_TYPE_LEVEL_HIGH>;
 				interrupt-parent = <&pic>;
 
+				#address-cells = <3>;
+				#size-cells = <2>;
+				device_type = "pci";
 				#interrupt-cells = <1>;
 				interrupt-map-mask = <0 0 0 0>;
 				interrupt-map = <0 0 0 0 &pic 41 IRQ_TYPE_LEVEL_HIGH>;
+				ranges;
 			};
 
-			pci_bridge@11,0 {
+			pcie@11,0 {
 				compatible = "pci0014,7a29.1",
 						   "pci0014,7a29",
 						   "pciclass060400",
@@ -356,12 +387,16 @@ pci_bridge@11,0 {
 				interrupts = <42 IRQ_TYPE_LEVEL_HIGH>;
 				interrupt-parent = <&pic>;
 
+				#address-cells = <3>;
+				#size-cells = <2>;
+				device_type = "pci";
 				#interrupt-cells = <1>;
 				interrupt-map-mask = <0 0 0 0>;
 				interrupt-map = <0 0 0 0 &pic 42 IRQ_TYPE_LEVEL_HIGH>;
+				ranges;
 			};
 
-			pci_bridge@12,0 {
+			pcie@12,0 {
 				compatible = "pci0014,7a19.1",
 						   "pci0014,7a19",
 						   "pciclass060400",
@@ -371,12 +406,16 @@ pci_bridge@12,0 {
 				interrupts = <43 IRQ_TYPE_LEVEL_HIGH>;
 				interrupt-parent = <&pic>;
 
+				#address-cells = <3>;
+				#size-cells = <2>;
+				device_type = "pci";
 				#interrupt-cells = <1>;
 				interrupt-map-mask = <0 0 0 0>;
 				interrupt-map = <0 0 0 0 &pic 43 IRQ_TYPE_LEVEL_HIGH>;
+				ranges;
 			};
 
-			pci_bridge@13,0 {
+			pcie@13,0 {
 				compatible = "pci0014,7a29.1",
 						   "pci0014,7a29",
 						   "pciclass060400",
@@ -386,12 +425,16 @@ pci_bridge@13,0 {
 				interrupts = <38 IRQ_TYPE_LEVEL_HIGH>;
 				interrupt-parent = <&pic>;
 
+				#address-cells = <3>;
+				#size-cells = <2>;
+				device_type = "pci";
 				#interrupt-cells = <1>;
 				interrupt-map-mask = <0 0 0 0>;
 				interrupt-map = <0 0 0 0 &pic 38 IRQ_TYPE_LEVEL_HIGH>;
+				ranges;
 			};
 
-			pci_bridge@14,0 {
+			pcie@14,0 {
 				compatible = "pci0014,7a19.1",
 						   "pci0014,7a19",
 						   "pciclass060400",
@@ -401,9 +444,13 @@ pci_bridge@14,0 {
 				interrupts = <39 IRQ_TYPE_LEVEL_HIGH>;
 				interrupt-parent = <&pic>;
 
+				#address-cells = <3>;
+				#size-cells = <2>;
+				device_type = "pci";
 				#interrupt-cells = <1>;
 				interrupt-map-mask = <0 0 0 0>;
 				interrupt-map = <0 0 0 0 &pic 39 IRQ_TYPE_LEVEL_HIGH>;
+				ranges;
 			};
 		};
 
-- 
2.43.0


