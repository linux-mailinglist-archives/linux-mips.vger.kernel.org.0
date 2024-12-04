Return-Path: <linux-mips+bounces-6883-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD07E9E49AB
	for <lists+linux-mips@lfdr.de>; Thu,  5 Dec 2024 00:43:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6B8916A89F
	for <lists+linux-mips@lfdr.de>; Wed,  4 Dec 2024 23:42:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CD0021A45B;
	Wed,  4 Dec 2024 23:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XyoeZmGY"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D586020FAA1;
	Wed,  4 Dec 2024 23:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733355052; cv=none; b=W5LnJLJoueltWSyr780iqOo9/iblcPPYBrUiiPCDUj//QP9EBHCajaI3raFwbiv+Y9o2rKau1Ful4UDQ8PPUemhd9OAovBmyYRKEkx/wyKueM03T7gnYjciSFGUhuoKh/a8xnEHF1hWlTuhYg6ZGBPudllE7yMx4c4fON8Ia4i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733355052; c=relaxed/simple;
	bh=XBuvGby0z8J/djMb/bC2Slw9QCH+KEIqdOp+MIXupd4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BiJtDrGgRBie4nF3StTYnz9CqQwRs6NY3o45lRmb0aeAYyICMqDVyTIXIjrA9rwxzEd6QyYyR9h23tVs/W1uk9EkJxLLrUCnRytPI8I2MJAzeuJ0H1mVOAw+K5VHLFRYElz1GneCiBNKvK+3VFjwfcJzZg5v4T3Gk+LeVPtrXts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XyoeZmGY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D4E5C4CECD;
	Wed,  4 Dec 2024 23:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733355052;
	bh=XBuvGby0z8J/djMb/bC2Slw9QCH+KEIqdOp+MIXupd4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XyoeZmGYxWIz2vfd6AxCvFJuH0f61oj1RmohSEd5eDJuRE0g36ixZlBoGdMycOjyE
	 uw1yaK2IWa6fILTEHGG09QXcO0JzBCEK7ZySNp3f//WXGpQbiuE8gL13kV9vbK5x13
	 W3em8JT9uI0Yq+Xcs+WxHSni/V9makBUOu7TW5hI97PJgu70V1DoXBnX9Wq6UAClRA
	 JQ4lA1xh0ix5AUnEs4ueTYxj6Kb9JM4CN4vq+JV2VyROdAbc5XSY0vl5Mk11aeKoEs
	 ldxmK2eQE0IgoUqRXdJ6zqagVY7NhMu71AcCw3QG3VU2j4fczpSskK3sfP+6wUOUe0
	 b4BUoAZ01xUlQ==
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
Subject: [PATCH AUTOSEL 5.15 4/5] MIPS: Loongson64: DTS: Really fix PCIe port nodes for ls7a
Date: Wed,  4 Dec 2024 17:19:20 -0500
Message-ID: <20241204221925.2248843-4-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241204221925.2248843-1-sashal@kernel.org>
References: <20241204221925.2248843-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.173
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
index ed99ee316febb..1292e9ab282ad 100644
--- a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
+++ b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
@@ -63,7 +63,6 @@ pci@1a000000 {
 			device_type = "pci";
 			#address-cells = <3>;
 			#size-cells = <2>;
-			#interrupt-cells = <2>;
 			msi-parent = <&msi>;
 
 			reg = <0 0x1a000000 0 0x02000000>,
@@ -227,7 +226,7 @@ phy1: ethernet-phy@1 {
 				};
 			};
 
-			pci_bridge@9,0 {
+			pcie@9,0 {
 				compatible = "pci0014,7a19.1",
 						   "pci0014,7a19",
 						   "pciclass060400",
@@ -237,12 +236,16 @@ pci_bridge@9,0 {
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
@@ -252,12 +255,16 @@ pci_bridge@a,0 {
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
@@ -267,12 +274,16 @@ pci_bridge@b,0 {
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
@@ -282,12 +293,16 @@ pci_bridge@c,0 {
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
@@ -297,12 +312,16 @@ pci_bridge@d,0 {
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
@@ -312,12 +331,16 @@ pci_bridge@e,0 {
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
@@ -327,12 +350,16 @@ pci_bridge@f,0 {
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
@@ -342,12 +369,16 @@ pci_bridge@10,0 {
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
@@ -357,12 +388,16 @@ pci_bridge@11,0 {
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
@@ -372,12 +407,16 @@ pci_bridge@12,0 {
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
@@ -387,12 +426,16 @@ pci_bridge@13,0 {
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
@@ -402,9 +445,13 @@ pci_bridge@14,0 {
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


