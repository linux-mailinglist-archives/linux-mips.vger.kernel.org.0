Return-Path: <linux-mips+bounces-4558-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E100A93E79E
	for <lists+linux-mips@lfdr.de>; Sun, 28 Jul 2024 18:12:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C1CF2861FF
	for <lists+linux-mips@lfdr.de>; Sun, 28 Jul 2024 16:12:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB42212A14C;
	Sun, 28 Jul 2024 16:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rjB2ccja"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8ED823D1;
	Sun, 28 Jul 2024 16:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722182766; cv=none; b=CD0LYtRNkXa+a3BxCrCX/eF40K0+yZk3OMNFBNajWO4kYGb5XFA3i58hwDEBUcGH8i/bTTU2g9H3o542fjPJEjKzn3LNluMQpXeM6X7Cr+lsX2V+hOTNcql2dD3/nxx82iqRnAIAkVUKXpg5zJRH/D5chx+A7hAh/tRBc3tElrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722182766; c=relaxed/simple;
	bh=YJyW18Cic3+oLsuGLQKOztB5FqyPIyN7YB2rAw9ucm8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vm9OJehesSFxJxElKY+HfJbZzrxrchXAAcZvVWG7g9F9CO9v5EiJRjTjrLxwUi4uhtBEccRfDXjbB73cK19QEk0XEfhK7Wby3YAw7QhF2n1CUj9CWkj65Q3+LcGGYmogKMQ8ONV9QcaTjcSFRSYAygGZqUs/Yp3R0r53g7ceBTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rjB2ccja; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB838C32782;
	Sun, 28 Jul 2024 16:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722182766;
	bh=YJyW18Cic3+oLsuGLQKOztB5FqyPIyN7YB2rAw9ucm8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rjB2ccjaDgpd4bnM6RVLLnPK5vXr1X0W7smdp/QXSkktr58KuDwnGshY+PITTYhzQ
	 aMBtZqHJMHC+xtBkyM2AkvhbV64jBe+9ULkNgKqHnGRx6oaWb1ftHsmyhyqWxZVBTw
	 MDWSJq/ysipitxDEI1JgRJnKuhtzRsJZem3xdCqhACQOzb1phJGkgtBuWgs77653F4
	 YyTPvBbbuKsGq8rtIHIxH1g/6DvNqyMsPQASvrVeJdsp4fsJVRJ8IV/WSOh/0VDwie
	 NmkfTi1Rjv7nIzGWTNsQ8ZXBJ/wNlb3IBVwTMeBehP2vjbPrB8qMkZopX1HSuVAPEj
	 xHRleaXyyrVCg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Sasha Levin <sashal@kernel.org>,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	davem@davemloft.net,
	siyanteng@loongson.cn,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: [PATCH AUTOSEL 6.10 10/23] MIPS: Loongson64: DTS: Fix PCIe port nodes for ls7a
Date: Sun, 28 Jul 2024 12:04:51 -0400
Message-ID: <20240728160538.2051879-10-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240728160538.2051879-1-sashal@kernel.org>
References: <20240728160538.2051879-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.2
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
index ee3e2153dd13f..b5593f7cc383b 100644
--- a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
+++ b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
@@ -118,7 +118,6 @@ pci@1a000000 {
 			device_type = "pci";
 			#address-cells = <3>;
 			#size-cells = <2>;
-			#interrupt-cells = <2>;
 
 			reg = <0 0x1a000000 0 0x02000000>,
 				<0xfe 0x00000000 0 0x20000000>;
@@ -204,93 +203,117 @@ sata@8,0 {
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


