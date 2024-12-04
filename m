Return-Path: <linux-mips+bounces-6880-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FB49E4970
	for <lists+linux-mips@lfdr.de>; Thu,  5 Dec 2024 00:38:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 881911689E5
	for <lists+linux-mips@lfdr.de>; Wed,  4 Dec 2024 23:36:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDB98216613;
	Wed,  4 Dec 2024 23:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kT4YZl4K"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF68213248;
	Wed,  4 Dec 2024 23:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733354959; cv=none; b=kx7be2rkKW3CLHPUzJmr+fwzfsO52SuplOvCkTWr/Y0BScN2E4xztf/rymPhS06smGkBw3WeICz9donUAAaMggWIyOZfJjLuEjPZOXlGnn8LFyJceTi0i46i/iNr8SmIRS9N32WcoZ2PWEaGCWGImLfCLNX5Uq2IrHbbfmJu2Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733354959; c=relaxed/simple;
	bh=mzYkslIUXLeOFOh0aayYYVU2C1ENA1994A5krtiOfoY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TTFBbsQE7ezePrDbKhMLnx/4pVSQgpjHDdXjAmkXmoEFFAgKeepVCZ6sjLhzqS0TZ745KyCN/x7czJNFVJxECEXs0zSfsttmYPVyT4nS2Ii3yBc10nFpDl4w8nEa5Y08NEMj8ajoUKx642URZWGqpFURXyiEjKVwu+UD16XT/LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kT4YZl4K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC96CC4CECD;
	Wed,  4 Dec 2024 23:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733354959;
	bh=mzYkslIUXLeOFOh0aayYYVU2C1ENA1994A5krtiOfoY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kT4YZl4KNGvl2OU/tEb+q+0RwDZZ5/y9X5jn/WuSYtdLU0m5lIjmlXwSCTJ4hqie/
	 AFIg3wmDFEy3LLUBVVpBHFoDXfsNBcgHaMPBVTCiE4NXgG4Pdq646bH7Okx1S1/S33
	 ZolMtnjE1n+jy9VFAyJ7Sz45eVPEwwi742cGS8ktf4jipO4Wn8BYeneeh4E7yN7dmV
	 L8mbIRcC3olHUJUiihCm+rinLkecQupQO6MM0OyENG95OQJSIjjT/3SVexjF5DVGWT
	 mpMeRg8qQ/OtoBxhNBakEnEZJwChjXtwhz0c0DrZnwLOXWqbPLv0BGwLUUqYgDeHe/
	 UfF5KcqPLj8Yg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Xi Ruoyao <xry111@xry111.site>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Sasha Levin <sashal@kernel.org>,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	si.yanteng@linux.dev,
	davem@davemloft.net,
	jiaxun.yang@flygoat.com,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: [PATCH AUTOSEL 6.11 13/15] MIPS: Loongson64: DTS: Really fix PCIe port nodes for ls7a
Date: Wed,  4 Dec 2024 17:17:07 -0500
Message-ID: <20241204221726.2247988-13-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241204221726.2247988-1-sashal@kernel.org>
References: <20241204221726.2247988-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11.10
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
index cce9428afc41f..ee71045883e7e 100644
--- a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
+++ b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
@@ -70,7 +70,6 @@ pci@1a000000 {
 			device_type = "pci";
 			#address-cells = <3>;
 			#size-cells = <2>;
-			#interrupt-cells = <2>;
 			msi-parent = <&msi>;
 
 			reg = <0 0x1a000000 0 0x02000000>,
@@ -234,7 +233,7 @@ phy1: ethernet-phy@1 {
 				};
 			};
 
-			pci_bridge@9,0 {
+			pcie@9,0 {
 				compatible = "pci0014,7a19.1",
 						   "pci0014,7a19",
 						   "pciclass060400",
@@ -244,12 +243,16 @@ pci_bridge@9,0 {
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
@@ -259,12 +262,16 @@ pci_bridge@a,0 {
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
@@ -274,12 +281,16 @@ pci_bridge@b,0 {
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
@@ -289,12 +300,16 @@ pci_bridge@c,0 {
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
@@ -304,12 +319,16 @@ pci_bridge@d,0 {
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
@@ -319,12 +338,16 @@ pci_bridge@e,0 {
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
@@ -334,12 +357,16 @@ pci_bridge@f,0 {
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
@@ -349,12 +376,16 @@ pci_bridge@10,0 {
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
@@ -364,12 +395,16 @@ pci_bridge@11,0 {
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
@@ -379,12 +414,16 @@ pci_bridge@12,0 {
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
@@ -394,12 +433,16 @@ pci_bridge@13,0 {
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
@@ -409,9 +452,13 @@ pci_bridge@14,0 {
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


