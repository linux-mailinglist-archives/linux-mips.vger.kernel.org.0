Return-Path: <linux-mips+bounces-3679-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14CFD908F15
	for <lists+linux-mips@lfdr.de>; Fri, 14 Jun 2024 17:41:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8AB53B2ADF4
	for <lists+linux-mips@lfdr.de>; Fri, 14 Jun 2024 15:40:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A186417FAC5;
	Fri, 14 Jun 2024 15:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="ktx5Cr9E";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="iHWJ1PQ7"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfout4-smtp.messagingengine.com (wfout4-smtp.messagingengine.com [64.147.123.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E950916FF5B;
	Fri, 14 Jun 2024 15:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718379627; cv=none; b=Z+dxPlrGhibUXQ+0dwc88QW/PBed5zmgKBDYf2EiVMJpWAd/ZEEWHrgHIYGYtUtv4DcuzK7zVk8FvH6vMFKJAg1/qZyrJXLtQlK/7y53/tnA4ZswgzD33n5fzXq/UxLQlIrx2jQVyrdSSJVy3V+Kv1QA6xYMk654vqFA944eZKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718379627; c=relaxed/simple;
	bh=vYER/pXqdWHWLoBKEaHOXiarTJYU86UGRpUaHVkrU0I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FkBi5Su+9fF2JaP8YElrYK6+w7rvp4+DHXNl++Euf6XKSR+cjTZqUk6Z93IQM59h3byqPdZTQmX+y/otgznYMgC2MAqOmvX9IXsxioTbL9KQC63Icql5wJwuOwFOXK9z4IjViYjzLk1J+uYCTjh5moOO3vLZKfy1DqbbI7grk4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=ktx5Cr9E; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=iHWJ1PQ7; arc=none smtp.client-ip=64.147.123.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfout.west.internal (Postfix) with ESMTP id 6E1B31C0013E;
	Fri, 14 Jun 2024 11:40:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 14 Jun 2024 11:40:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1718379624;
	 x=1718466024; bh=BTqxN8R5GVSj4jm6DEQcWA4F1sY94Lm5Gd86TkYk1aM=; b=
	ktx5Cr9Ek56mcwjzN6mo0+1b8toFpWxhJ0SHVz5Q5za/OqzczyWW1d0ioLNz4iuj
	Hp8sGPTKMi8HMC1hz/Lu/B48iY2EnC/KThaUHrxd/r0nCElOfZXjzoSqfKaTotHQ
	kdPK/uiQxSaxyT6lgQ0b9FAbbTAFe7b7mKnLFYS7YtQxLAfh89FrWHsS7DHo2ulS
	W8qPVYrTTIZhLMhOhycP7JlW7DO/sR6KXJDwhzyj6blZOOJBBC15kDDUcVUN+Jwm
	FTfWGeph6YK/zh9hvuS9pg4/1DcsqAt+YBKLhppAphAB5vdZ6ogsFQf7b+mRSlIN
	Vg4Qkch61vd9FgXBa48i6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718379624; x=
	1718466024; bh=BTqxN8R5GVSj4jm6DEQcWA4F1sY94Lm5Gd86TkYk1aM=; b=i
	HWJ1PQ7UIbnIwegjxfU8H/K5wtxzCe+/e4SXQHSRHR2Ra95ljIEypCXXqCUYnQnz
	QqH4FoS1MExUhgMfH7B34xiUOCpgFCM0QLasukXMFfKBr2nrqSQw2v+bzL+jsI+t
	dxfc7Qv6jS1clA5toWvAH/r5clnbbTHRsI2jZ/bxkb0CVnugZxMptZv0uhVlYO8t
	JNG/S2bEPqXO+ID2JzMKkYXS3gqMKoWs95mW0aDQt7x/t6FMhQrtUi6VTat+0EFj
	a1q8lJ0pXjiPWmSSHesny2YeYHUW4qGBXW8/ryTVJ5x+sNVYISIxiKQdM2MhqHYc
	RG8Zap9iytghT2uwDj9zA==
X-ME-Sender: <xms:Z2RsZuZ3GulITFLN5y5HxeMd3fNv9qHUyVKFuBYAdd3ETgBn5RT3bw>
    <xme:Z2RsZhbN-0vbC_hlCy9J83y49wWd-RiAGhUvx6dnACNhtOTv_RqpGwMWZSslN--P3
    yoZaLtjIckX8pALEnc>
X-ME-Received: <xmr:Z2RsZo9uILBcXMvjs2eGLAB7bcEXDlnzp54c-HPofRmKVwhLJzgbD8s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeduledgleduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffekgedugefhtdduudeghfeu
    veegffegudekjeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:Z2RsZgr52lMk0IVM_0d9Sp7P5Egoykr8U5QwaqqF4KS15xCQXlp6Qg>
    <xmx:Z2RsZprJdu2DCVX8BIqyG0jd1LoX1bN7GeX4eIo_iZkGJhHAxAnX_Q>
    <xmx:Z2RsZuTOkrumb-MkPlUWfJU3vX1r-kz1Fz_30ypoxlQzQtWCex3NkQ>
    <xmx:Z2RsZpqAMKgLy5sYueeLO4NvROzmvfrZqrpspfOb7XZA_fhfG3jLXw>
    <xmx:aGRsZnjbxcHs55KILKU-6he7gWGHU1CbogqXWgQb9430u8P7hQtO59ZZ>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Jun 2024 11:40:22 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Fri, 14 Jun 2024 16:40:10 +0100
Subject: [PATCH 02/10] MIPS: dts: loongson: Fix liointc IRQ polarity
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240614-ls3k-mips-v1-2-7614340ace7d@flygoat.com>
References: <20240614-ls3k-mips-v1-0-7614340ace7d@flygoat.com>
In-Reply-To: <20240614-ls3k-mips-v1-0-7614340ace7d@flygoat.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Qing Zhang <zhangqing@loongson.cn>, Binbin Zhou <zhoubinbin@loongson.cn>, 
 Huacai Chen <chenhuacai@kernel.org>
Cc: devicetree@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5381;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=vYER/pXqdWHWLoBKEaHOXiarTJYU86UGRpUaHVkrU0I=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrSclLjbXYWekWF//d9lVxk26kVLKK/y0N3SzGa9b4pLa
 bzKl6KOEhYGMS4GWTFFlhABpb4NjRcXXH+Q9QdmDisTyBAGLk4BmIiXGyPDYTm7I1V8Nz6KfmaY
 ucHWS1t1eq2/n4NuuibH+wZHTaZ8hh9z/63zr9I9Fr7xS6a97xsLxckXlz0WSBBe+7L9U+/pfZw A
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

All internal liointc interrupts are high level triggered.

Fixes: b1a792601f26 ("MIPS: Loongson64: DeviceTree for Loongson-2K1000")
Cc: stable@vger.kernel.org
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi | 42 +++++++++++-----------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
index f5a74338bf05..3f5255584c30 100644
--- a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
+++ b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
@@ -93,7 +93,7 @@ rtc0: rtc@1fe07800 {
 			compatible = "loongson,ls2k1000-rtc";
 			reg = <0 0x1fe07800 0 0x78>;
 			interrupt-parent = <&liointc0>;
-			interrupts = <60 IRQ_TYPE_LEVEL_LOW>;
+			interrupts = <60 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
 		uart0: serial@1fe00000 {
@@ -101,7 +101,7 @@ uart0: serial@1fe00000 {
 			reg = <0 0x1fe00000 0 0x8>;
 			clock-frequency = <125000000>;
 			interrupt-parent = <&liointc0>;
-			interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+			interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
 			no-loopback-test;
 		};
 
@@ -124,8 +124,8 @@ gmac@3,0 {
 						   "pciclass0c03";
 
 				reg = <0x1800 0x0 0x0 0x0 0x0>;
-				interrupts = <12 IRQ_TYPE_LEVEL_LOW>,
-					     <13 IRQ_TYPE_LEVEL_LOW>;
+				interrupts = <12 IRQ_TYPE_LEVEL_HIGH>,
+					     <13 IRQ_TYPE_LEVEL_HIGH>;
 				interrupt-names = "macirq", "eth_lpi";
 				interrupt-parent = <&liointc0>;
 				phy-mode = "rgmii";
@@ -147,8 +147,8 @@ gmac@3,1 {
 						   "loongson, pci-gmac";
 
 				reg = <0x1900 0x0 0x0 0x0 0x0>;
-				interrupts = <14 IRQ_TYPE_LEVEL_LOW>,
-					     <15 IRQ_TYPE_LEVEL_LOW>;
+				interrupts = <14 IRQ_TYPE_LEVEL_HIGH>,
+					     <15 IRQ_TYPE_LEVEL_HIGH>;
 				interrupt-names = "macirq", "eth_lpi";
 				interrupt-parent = <&liointc0>;
 				phy-mode = "rgmii";
@@ -169,7 +169,7 @@ ehci@4,1 {
 						   "pciclass0c03";
 
 				reg = <0x2100 0x0 0x0 0x0 0x0>;
-				interrupts = <18 IRQ_TYPE_LEVEL_LOW>;
+				interrupts = <18 IRQ_TYPE_LEVEL_HIGH>;
 				interrupt-parent = <&liointc1>;
 			};
 
@@ -180,7 +180,7 @@ ohci@4,2 {
 						   "pciclass0c03";
 
 				reg = <0x2200 0x0 0x0 0x0 0x0>;
-				interrupts = <19 IRQ_TYPE_LEVEL_LOW>;
+				interrupts = <19 IRQ_TYPE_LEVEL_HIGH>;
 				interrupt-parent = <&liointc1>;
 			};
 
@@ -191,7 +191,7 @@ sata@8,0 {
 						   "pciclass0106";
 
 				reg = <0x4000 0x0 0x0 0x0 0x0>;
-				interrupts = <19 IRQ_TYPE_LEVEL_LOW>;
+				interrupts = <19 IRQ_TYPE_LEVEL_HIGH>;
 				interrupt-parent = <&liointc0>;
 			};
 
@@ -206,10 +206,10 @@ pcie@9,0 {
 				#size-cells = <2>;
 				device_type = "pci";
 				#interrupt-cells = <1>;
-				interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+				interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
 				interrupt-parent = <&liointc1>;
 				interrupt-map-mask = <0 0 0 0>;
-				interrupt-map = <0 0 0 0 &liointc1 0 IRQ_TYPE_LEVEL_LOW>;
+				interrupt-map = <0 0 0 0 &liointc1 0 IRQ_TYPE_LEVEL_HIGH>;
 				ranges;
 				external-facing;
 			};
@@ -225,10 +225,10 @@ pcie@a,0 {
 				#size-cells = <2>;
 				device_type = "pci";
 				#interrupt-cells = <1>;
-				interrupts = <1 IRQ_TYPE_LEVEL_LOW>;
+				interrupts = <1 IRQ_TYPE_LEVEL_HIGH>;
 				interrupt-parent = <&liointc1>;
 				interrupt-map-mask = <0 0 0 0>;
-				interrupt-map = <0 0 0 0 &liointc1 1 IRQ_TYPE_LEVEL_LOW>;
+				interrupt-map = <0 0 0 0 &liointc1 1 IRQ_TYPE_LEVEL_HIGH>;
 				ranges;
 				external-facing;
 			};
@@ -244,10 +244,10 @@ pcie@b,0 {
 				#size-cells = <2>;
 				device_type = "pci";
 				#interrupt-cells = <1>;
-				interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
+				interrupts = <2 IRQ_TYPE_LEVEL_HIGH>;
 				interrupt-parent = <&liointc1>;
 				interrupt-map-mask = <0 0 0 0>;
-				interrupt-map = <0 0 0 0 &liointc1 2 IRQ_TYPE_LEVEL_LOW>;
+				interrupt-map = <0 0 0 0 &liointc1 2 IRQ_TYPE_LEVEL_HIGH>;
 				ranges;
 				external-facing;
 			};
@@ -263,10 +263,10 @@ pcie@c,0 {
 				#size-cells = <2>;
 				device_type = "pci";
 				#interrupt-cells = <1>;
-				interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+				interrupts = <3 IRQ_TYPE_LEVEL_HIGH>;
 				interrupt-parent = <&liointc1>;
 				interrupt-map-mask = <0 0 0 0>;
-				interrupt-map = <0 0 0 0 &liointc1 3 IRQ_TYPE_LEVEL_LOW>;
+				interrupt-map = <0 0 0 0 &liointc1 3 IRQ_TYPE_LEVEL_HIGH>;
 				ranges;
 				external-facing;
 			};
@@ -282,10 +282,10 @@ pcie@d,0 {
 				#size-cells = <2>;
 				device_type = "pci";
 				#interrupt-cells = <1>;
-				interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
+				interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
 				interrupt-parent = <&liointc1>;
 				interrupt-map-mask = <0 0 0 0>;
-				interrupt-map = <0 0 0 0 &liointc1 4 IRQ_TYPE_LEVEL_LOW>;
+				interrupt-map = <0 0 0 0 &liointc1 4 IRQ_TYPE_LEVEL_HIGH>;
 				ranges;
 				external-facing;
 			};
@@ -301,10 +301,10 @@ pcie@e,0 {
 				#size-cells = <2>;
 				device_type = "pci";
 				#interrupt-cells = <1>;
-				interrupts = <5 IRQ_TYPE_LEVEL_LOW>;
+				interrupts = <5 IRQ_TYPE_LEVEL_HIGH>;
 				interrupt-parent = <&liointc1>;
 				interrupt-map-mask = <0 0 0 0>;
-				interrupt-map = <0 0 0 0 &liointc1 5 IRQ_TYPE_LEVEL_LOW>;
+				interrupt-map = <0 0 0 0 &liointc1 5 IRQ_TYPE_LEVEL_HIGH>;
 				ranges;
 				external-facing;
 			};

-- 
2.43.0


