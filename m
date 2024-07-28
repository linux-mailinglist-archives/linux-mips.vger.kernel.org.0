Return-Path: <linux-mips+bounces-4562-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7D093E811
	for <lists+linux-mips@lfdr.de>; Sun, 28 Jul 2024 18:22:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 328E21C215A5
	for <lists+linux-mips@lfdr.de>; Sun, 28 Jul 2024 16:22:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F242158D7F;
	Sun, 28 Jul 2024 16:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QpS4/etx"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E865D158D63;
	Sun, 28 Jul 2024 16:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722182912; cv=none; b=QtTn5i9w4teO4y98jaL6ls9ObVatmFikgQjM/chsoVrJBV5hvh0HfCiI3hM0+i0wNcgs/EsztJI/G7jUn+w/hnG2ZkXAXi9gpDCr9k3v8PGO78pAeyKV8X9S8s0srR0k7qVufEDv4pRgKdLvroyrRFHjj1y3+xdzxRlPjN89vYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722182912; c=relaxed/simple;
	bh=G9qf3gffnJqmP+URF2T/RCBx73PfFDVLbmLSe8+YFeI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KeIhA3DtTMaUAYKDNxj4uPnXv0iBUUhdX2HQ3dHGEnHXAkW+L7eGn9tcKtnH96wOQi8tqqUwo18/pF9t/D/eBNcKvK2gkg5sEUBpTutGOKPuxvNhDmEoOVU1HDBZ7nEQLMX/gbDwGW7wYt/MFA4u4vKJo7qQ8W+DEna7SIj3CPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QpS4/etx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52E4DC116B1;
	Sun, 28 Jul 2024 16:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722182911;
	bh=G9qf3gffnJqmP+URF2T/RCBx73PfFDVLbmLSe8+YFeI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QpS4/etxVqEsvQjf5j8LDPhsSxm2M8fQnn1EN0fMGuox0fiTP1J3dB+EyUaE0Qhx5
	 Ecp9do6eH+e9g4DAn8N+A5bDW05Nbu/z6MpwNUPzMIdgwkGPkg9A0fluENRLlKh2E8
	 GlFDrHmZbUeCXxUANZdaSvehRIg2SllU7tNW9jJBjaLh8HV+bV45uj9IqrXTDre9Hq
	 vJ1blT0W5wKgjIRdrSly2t7tl47aWfZryLJJUnwDq9jaPKN1HNliJASiREB9fIdPid
	 2hEnCJVIXZtGbXywenXAP6ZYGOtWSclygJbR0XvCiJya5rkx44V2CyGHucFLSju+fE
	 MqpT6Xd9E06yg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Sasha Levin <sashal@kernel.org>,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	siyanteng@loongson.cn,
	davem@davemloft.net,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 07/15] MIPS: Loongson64: DTS: Fix PCIe port nodes for ls7a
Date: Sun, 28 Jul 2024 12:07:51 -0400
Message-ID: <20240728160813.2053107-7-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240728160813.2053107-1-sashal@kernel.org>
References: <20240728160813.2053107-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.102
Content-Transfer-Encoding: 8bit

From: Jiaxun Yang <jiaxun.yang@flygoat.com>

[ Upstream commit d89a415ff8d5e0aad4963f2d8ebb0f9e8110b7fa ]

Add various required properties to silent warnings:

arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi:116.16-297.5: Warning (interrupt_provider): /bus@10000000/pci@1a000000: '#interrupt-cells' found, but node is not an interrupt provider
arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../boot/dts/loongson/loongson64-2k1000.dtsi  | 37 +++++++++++++++----
 1 file changed, 30 insertions(+), 7 deletions(-)

diff --git a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
index c16b521308cb1..838d770871407 100644
--- a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
+++ b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
@@ -111,7 +111,6 @@ pci@1a000000 {
 			device_type = "pci";
 			#address-cells = <3>;
 			#size-cells = <2>;
-			#interrupt-cells = <2>;
 
 			reg = <0 0x1a000000 0 0x02000000>,
 				<0xfe 0x00000000 0 0x20000000>;
@@ -197,93 +196,117 @@ sata@8,0 {
 				interrupt-parent = <&liointc0>;
 			};
 
-			pci_bridge@9,0 {
+			pcie@9,0 {
 				compatible = "pci0014,7a19.0",
 						   "pci0014,7a19",
 						   "pciclass060400",
 						   "pciclass0604";
 
 				reg = <0x4800 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				device_type = "pci";
 				#interrupt-cells = <1>;
 				interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
 				interrupt-parent = <&liointc1>;
 				interrupt-map-mask = <0 0 0 0>;
 				interrupt-map = <0 0 0 0 &liointc1 0 IRQ_TYPE_LEVEL_LOW>;
+				ranges;
 				external-facing;
 			};
 
-			pci_bridge@a,0 {
+			pcie@a,0 {
 				compatible = "pci0014,7a09.0",
 						   "pci0014,7a09",
 						   "pciclass060400",
 						   "pciclass0604";
 
 				reg = <0x5000 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				device_type = "pci";
 				#interrupt-cells = <1>;
 				interrupts = <1 IRQ_TYPE_LEVEL_LOW>;
 				interrupt-parent = <&liointc1>;
 				interrupt-map-mask = <0 0 0 0>;
 				interrupt-map = <0 0 0 0 &liointc1 1 IRQ_TYPE_LEVEL_LOW>;
+				ranges;
 				external-facing;
 			};
 
-			pci_bridge@b,0 {
+			pcie@b,0 {
 				compatible = "pci0014,7a09.0",
 						   "pci0014,7a09",
 						   "pciclass060400",
 						   "pciclass0604";
 
 				reg = <0x5800 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				device_type = "pci";
 				#interrupt-cells = <1>;
 				interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
 				interrupt-parent = <&liointc1>;
 				interrupt-map-mask = <0 0 0 0>;
 				interrupt-map = <0 0 0 0 &liointc1 2 IRQ_TYPE_LEVEL_LOW>;
+				ranges;
 				external-facing;
 			};
 
-			pci_bridge@c,0 {
+			pcie@c,0 {
 				compatible = "pci0014,7a09.0",
 						   "pci0014,7a09",
 						   "pciclass060400",
 						   "pciclass0604";
 
 				reg = <0x6000 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				device_type = "pci";
 				#interrupt-cells = <1>;
 				interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
 				interrupt-parent = <&liointc1>;
 				interrupt-map-mask = <0 0 0 0>;
 				interrupt-map = <0 0 0 0 &liointc1 3 IRQ_TYPE_LEVEL_LOW>;
+				ranges;
 				external-facing;
 			};
 
-			pci_bridge@d,0 {
+			pcie@d,0 {
 				compatible = "pci0014,7a19.0",
 						   "pci0014,7a19",
 						   "pciclass060400",
 						   "pciclass0604";
 
 				reg = <0x6800 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				device_type = "pci";
 				#interrupt-cells = <1>;
 				interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
 				interrupt-parent = <&liointc1>;
 				interrupt-map-mask = <0 0 0 0>;
 				interrupt-map = <0 0 0 0 &liointc1 4 IRQ_TYPE_LEVEL_LOW>;
+				ranges;
 				external-facing;
 			};
 
-			pci_bridge@e,0 {
+			pcie@e,0 {
 				compatible = "pci0014,7a09.0",
 						   "pci0014,7a09",
 						   "pciclass060400",
 						   "pciclass0604";
 
 				reg = <0x7000 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				device_type = "pci";
 				#interrupt-cells = <1>;
 				interrupts = <5 IRQ_TYPE_LEVEL_LOW>;
 				interrupt-parent = <&liointc1>;
 				interrupt-map-mask = <0 0 0 0>;
 				interrupt-map = <0 0 0 0 &liointc1 5 IRQ_TYPE_LEVEL_LOW>;
+				ranges;
 				external-facing;
 			};
 
-- 
2.43.0


