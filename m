Return-Path: <linux-mips+bounces-3682-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD06908F17
	for <lists+linux-mips@lfdr.de>; Fri, 14 Jun 2024 17:41:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B547B1F291AB
	for <lists+linux-mips@lfdr.de>; Fri, 14 Jun 2024 15:41:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27B3D19ADA6;
	Fri, 14 Jun 2024 15:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="Gt3nE5f4";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="IaYfgN9I"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfout4-smtp.messagingengine.com (wfout4-smtp.messagingengine.com [64.147.123.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BA719AA7F;
	Fri, 14 Jun 2024 15:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718379638; cv=none; b=tA+PnWBXcuVDKUsnpo1prbljTQJmPunlvsKBrJXp98/1vZ8apfwAbmz2VHfXLtEcoGWakEQfDXCrW9KBCKXZPflif5Rm7rCUO8DhqGFKqetUcFDdxEzxR3gBxpvRvpEkbPefaRu+WS4H1nh1kVCmAGABMJyDFrrv5vsMJnNXrUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718379638; c=relaxed/simple;
	bh=nMstPhZ3IHyfgbRTq1p6DivostC6/RTEzw9Bpio8i4c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MRY1ZPmdF8mOE6lsVBRDW+QMjDUXiwZRJSEbuoUm9sMhCT0vTrgpTPqjEarzDXrE+hgtfg61h7K7bZHWjbm9dwDAlUNA1VsPKzCsvIyLKYS/iszkxXJgGKT0dv6M27HpCTrLqnovDuoA1VZODQJMCshj8tsUfxCA5uYAwwzgnFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=Gt3nE5f4; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=IaYfgN9I; arc=none smtp.client-ip=64.147.123.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.west.internal (Postfix) with ESMTP id E311E1C0012E;
	Fri, 14 Jun 2024 11:40:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 14 Jun 2024 11:40:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1718379634;
	 x=1718466034; bh=JdIJBCdpmCXJWIOw3lIk90zwyTgGeseiehiiVbV0Vms=; b=
	Gt3nE5f4ic5tmPYzu+AhvqxhV2ILzXGCUVVLpBhOWxRgIMa5ZO3a52XS33Hl9iqn
	hkzd0wTAiZ6+0gLoGyFpm8mfYANWA6Vg9RLXNwwwA/sHyrUWl1f40qkHf0gb+VHQ
	hp7bS4/1eLKGEej8zWSaCKtGXuEnqikJf7z8FzXH9syKGH1AWZueTVFZmrEAYFtM
	4fLNBe/E16sV4U+AiGSluGqbDd/QLAS9GOCnpIMLgVqoA649l+IjSxmyzxcS5OvK
	+DXrEk/hVy09f70LyFokTaH/qi4Vv/cmPFTXG200KklcEelLTC97LWjdV21OrMKz
	x8cbIgm7ZLqYQ6tNYWmF3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718379634; x=
	1718466034; bh=JdIJBCdpmCXJWIOw3lIk90zwyTgGeseiehiiVbV0Vms=; b=I
	aYfgN9IPGFzU+6/ZVRWrMMaWbKRvhsOjagKOE1zfmXiY8L1vmnYrnajP3Kp1econ
	o/Pks8tqM1Y+Muu90TRmunvIHzyu+rk+4zH5CpqAlsLyam723G4Qnnph+XDrOtF3
	PzyRlXu1D2SCHXEv6T6EaJPeCMg9ir04iIvDlLTx0gdxosf4mSrVaGSZPJoTUdoB
	91Q0YpP9uJEgVpRDq32XI+Y2iFoHwjYfSwaUurtrablpDC4N4I1yBzHP/YI7aw0q
	LRg652ijb+DQvxPH30+yKyHR09NkCIxs53k8n0zSZhulYBFMGQBcDUK2Z95rZy8r
	r1CL8P08DFJgKeOUTjklA==
X-ME-Sender: <xms:cmRsZvAkZoib3Y_Psg2IxrzScqbae605nFapEEaOm10dE15YuAZvqw>
    <xme:cmRsZlh2401fISIWe-muLK_f7AIm-bVYZX4GMsRhNNmEimX0WCYQC9Wqw8vjPhsWa
    dQGA44ysCjgW5hxcf0>
X-ME-Received: <xmr:cmRsZqnLrObkpX1nRnZFuWBY3AUGPY3foTbGhxiC545M37z8Sb0X7_k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeduledgleduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffekgedugefhtdduudeghfeu
    veegffegudekjeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:cmRsZhz5OwlVLXAMMD56tSzJUHlvV3PKLOZWNj4QgvyBK46-6XU_wg>
    <xmx:cmRsZkT9a_o55HKaA4Qth0r2Gj4kmiMFIxnbdBTpx2wHhz8dNmu76g>
    <xmx:cmRsZkaKHJkpT_x0amgmXyv-3t8RscucxHCfG4G0ACYFOEbtiqCQMg>
    <xmx:cmRsZlRVh3THF8SjYTDxvhneZk-xi7gYEEhyNsicC-qSfZbnkyfdfA>
    <xmx:cmRsZrJSw3VqQolHVnv4ztPIu9RM2qcs3UPF-U1QqqCyTWOpqmsZq2HA>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Jun 2024 11:40:32 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Fri, 14 Jun 2024 16:40:13 +0100
Subject: [PATCH 05/10] MIPS: dts: loongson: Add ISA node
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240614-ls3k-mips-v1-5-7614340ace7d@flygoat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1003;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=nMstPhZ3IHyfgbRTq1p6DivostC6/RTEzw9Bpio8i4c=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrSclLgZc9VuWF+cLdi69FWKg4ukfptm6tHXYeubDu11z
 fUxNd/ZUcrCIMbFICumyBIioNS3ofHigusPsv7AzGFlAhnCwMUpABP58Z/hr7zzknwm8Xlx8pwO
 uydP3sBe0th+fIPup+JJ35WL3jkeesXI0JpuN3P3QebjCe4loc+u++yT2m6fu/j6pyWNbiI+/ul
 cXAA=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

ISA node is required by Loongson64 platforms to initialize
PIO support.

Kernel will hang at boot without ISA node.

Cc: stable@vger.kernel.org
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
index b2f66f6bb2fe..cc7747c5f21f 100644
--- a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
+++ b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
@@ -44,6 +44,13 @@ package0: bus@10000000 {
 			0 0x40000000 0 0x40000000 0 0x40000000
 			0xfe 0x00000000 0xfe 0x00000000 0 0x40000000>;
 
+		isa@18000000 {
+			compatible = "isa";
+			#size-cells = <1>;
+			#address-cells = <2>;
+			ranges = <1 0x0 0x0 0x18000000 0x4000>;
+		};
+
 		pm: reset-controller@1fe07000 {
 			compatible = "loongson,ls2k-pm";
 			reg = <0 0x1fe07000 0 0x422>;

-- 
2.43.0


