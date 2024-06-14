Return-Path: <linux-mips+bounces-3681-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 435F3908F13
	for <lists+linux-mips@lfdr.de>; Fri, 14 Jun 2024 17:41:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1D2828510A
	for <lists+linux-mips@lfdr.de>; Fri, 14 Jun 2024 15:41:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5725C195FDE;
	Fri, 14 Jun 2024 15:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="o/mgGA4g";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RQh+CsZ4"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfout4-smtp.messagingengine.com (wfout4-smtp.messagingengine.com [64.147.123.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16E716FF5B;
	Fri, 14 Jun 2024 15:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718379634; cv=none; b=SBS9I/qrukM+KD7zDiIsVhTjG7/ZjoW0V4IWFIpmOQw5EjjtB8PofjXlZkS8g8zk+O1JG/nhfYOPuCBatlqxR5cIsr/LaN/RB/dfs53kZFBwTXn0hfmAGoSki8DKuBs8AkStUdQU/319WBJKNTbgdM3j6RnycZR3SjZ0ZXBLVlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718379634; c=relaxed/simple;
	bh=HzMhEsr51vYpidTghc9maE7b4789hAfmuqm/KoGBGWg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bXcU3k4cmJXtpNhhnPhraHshhvjMXCrD7Arv4ghcLCOPtNXn6SaJ6P2qtAZs39q0X8Y15ggdrvWlr1glA9JQjtMXs+sVRGMYh6Nxs1Mp5HFdEljG60vJx4s1tYq6NCofrMO7pIhTBKFcNEp1aWEnuqX0dIh75rGD6V0yZSeE2DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=o/mgGA4g; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RQh+CsZ4; arc=none smtp.client-ip=64.147.123.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfout.west.internal (Postfix) with ESMTP id 54B2D1C0014D;
	Fri, 14 Jun 2024 11:40:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 14 Jun 2024 11:40:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1718379630;
	 x=1718466030; bh=QaCvkT5gjowegsNR38maMud8/3kZWd7+YmbceMRJp0E=; b=
	o/mgGA4gZYsjgxflitD2eVtb0WDdorrl3vobWGPtwe/0G4GCdEPpUIfX/5l5Z29m
	x3D1DTPUvfZAh40JKkAb/ihHfIsNe8RTr2vML+7rKkxoRn6i0Lji0hKPtfjQVHob
	wFLZYXWhmmiqQ2K48BkpwBOXhfd2qXVqvzOK/vmBKLuGNeJPGJLUOsOCzsmUktTi
	HRLW75S0wkl3V5lSAW0lSYKnkTcYM7TKEY+9VBDF8CAzEWk0IDZqZjtQtUkvOOYm
	xf2KDOD5K9RgLEyFeJs921QIPM9WM5OE0+EbRBd9D2QvBODQNHPgHKLwUFj1WDfl
	dAnhn3RuCReuTZhyE2iF+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718379630; x=
	1718466030; bh=QaCvkT5gjowegsNR38maMud8/3kZWd7+YmbceMRJp0E=; b=R
	Qh+CsZ4qNJ4ANscNQPiaLEtqDHqNQxkYeNdYn7YoOIyJCvQniTPeRghXRD56cxRw
	EaMFOVlzeoZIB2Ih8ITSRZF1904SLvbhGcSwnNNKXlboyS5umQJRUIdkZfF0yr74
	IjM8hscs/NF4PruLoBu8ht+Dn0vJ/Bsk+5fSS/QgV7Xmbs3btNCLxdZze3P1s77C
	9urgAe9QFD3FgS/21becaIWF3+TyINaaDccM+ftoJIzK+vxyIsYj4gZHbHQlSv47
	VK5MQn5wOwNYvc2ocEd3aUA0Dr0JKiq+N5Hj1C3DaT/yrFOkbMLOQaLtma25gB9m
	7xoPqnmktJO9B9dle+SKA==
X-ME-Sender: <xms:bmRsZv0BsAH8YgnthFnbWOtplu67exYdgvPm2fXoSL1GYdaPdopFNA>
    <xme:bmRsZuFC7Fw9uL4fYkG2teHWBrARpw3EYXO-_av9DflAxph_BG0qkU6sLy1xX70Fm
    FskiDvzIGK7V4cHCJk>
X-ME-Received: <xmr:bmRsZv73epFEgTv8AwUkMDNnPr7C4ebT-0gz5Hn03NsR5Kb7k7hgQ-w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeduledgleduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffekgedugefhtdduudeghfeu
    veegffegudekjeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:bmRsZk03NZOR8iRNlxM9Cj4YeGQAYjrmbBQhWoVrrobhvljbT4mDgw>
    <xmx:bmRsZiF-l3qY0he6R9QEwn3P3l7w-FAVWW7RQt5lp93EEtmfAoTmdg>
    <xmx:bmRsZl_2JLOr0Nvp0bvX17uceQYy2cb9_HApoc7JAa2UviWZBEf2RA>
    <xmx:bmRsZvnRR3CTF9wuWKPmOgpOP3SP2cxZsp0Qk6sdZ78uVaNguzVpig>
    <xmx:bmRsZpdCYD2SuoAHU9h4aZYS868rdlJSxBHhGlqlyJAqJVpQbjjoGZ4H>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Jun 2024 11:40:29 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Fri, 14 Jun 2024 16:40:12 +0100
Subject: [PATCH 04/10] MIPS: dts: loongson: Fix GMAC phy node
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240614-ls3k-mips-v1-4-7614340ace7d@flygoat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1305;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=HzMhEsr51vYpidTghc9maE7b4789hAfmuqm/KoGBGWg=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrSclLjIC54V+ve4vrM7tqoe2bL2he0Tp52196S9Olfxz
 XlkmB3UUcrCIMbFICumyBIioNS3ofHigusPsv7AzGFlAhnCwMUpABOZ/57hf80PL1a1+NqEnfUR
 +1ZFLX0hEXycOea+6fWDk5vv3VLsaWX4H8/uGKGzyU+zM+rNrKu3FbVruN6lfpN7E5T65l3uxTt
 /mQE=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

phy-mode should be rgmii-id to match hardware configuration.

Also there should be a phy-handle to reference phy node.

Fixes: f8a11425075f ("MIPS: Loongson64: Add GMAC support for Loongson-2K1000")
Cc: stable@vger.kernel.org
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
index c3a57a0befa7..b2f66f6bb2fe 100644
--- a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
+++ b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
@@ -128,7 +128,8 @@ gmac@3,0 {
 					     <13 IRQ_TYPE_LEVEL_HIGH>;
 				interrupt-names = "macirq", "eth_lpi";
 				interrupt-parent = <&liointc0>;
-				phy-mode = "rgmii";
+				phy-mode = "rgmii-id";
+				phy-handle = <&phy1>;
 				mdio {
 					#address-cells = <1>;
 					#size-cells = <0>;
@@ -151,7 +152,8 @@ gmac@3,1 {
 					     <15 IRQ_TYPE_LEVEL_HIGH>;
 				interrupt-names = "macirq", "eth_lpi";
 				interrupt-parent = <&liointc0>;
-				phy-mode = "rgmii";
+				phy-mode = "rgmii-id";
+				phy-handle = <&phy1>;
 				mdio {
 					#address-cells = <1>;
 					#size-cells = <0>;

-- 
2.43.0


