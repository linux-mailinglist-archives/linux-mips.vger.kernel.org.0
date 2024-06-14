Return-Path: <linux-mips+bounces-3678-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B7F908F08
	for <lists+linux-mips@lfdr.de>; Fri, 14 Jun 2024 17:40:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E04B1F28760
	for <lists+linux-mips@lfdr.de>; Fri, 14 Jun 2024 15:40:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B4ED16D4D5;
	Fri, 14 Jun 2024 15:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="IbqLDYCX";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="IAwcmSnJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfout4-smtp.messagingengine.com (wfout4-smtp.messagingengine.com [64.147.123.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E3016C438;
	Fri, 14 Jun 2024 15:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718379624; cv=none; b=IW6M643nAW5RSpaqaqa+Qkr1zAn4KoSiy3Lw4Mq0qK8Eus3fZGgjqZtgheCd4VlMx+KHLuBZBiz7xda0IMS6/TKzJJvHQF1iU3V6uur7GHbe+qffIRjcdNVwsIDyO3DQL5LxiPF3XjbQt65Gbo9Jy1grH+ohDFgsBmeC6PoR+nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718379624; c=relaxed/simple;
	bh=Xo0TOhtv48XsE5CIQS0AETSjzou4lRT4X0OouLxOG/8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bpq2ThlU98XLcTi8QS4UWqAYeUfoavtcoWptHLySABUqf4XpMA6C3wvN4gn6OQT2+P/iSlo6rl1HAhFRXC+3+zwulMdOzFLAySID5R5HTj5WY0A06mhjSqJlPMNv6VidLTAbSVcq0h9cv6UizpXRlZxGmJjHIdyq7Hai/yY4XMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=IbqLDYCX; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=IAwcmSnJ; arc=none smtp.client-ip=64.147.123.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailfout.west.internal (Postfix) with ESMTP id 182861C0012E;
	Fri, 14 Jun 2024 11:40:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Fri, 14 Jun 2024 11:40:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1718379620;
	 x=1718466020; bh=ywiNTEsyKVi9wfi8zp3VW1Yvi6T4GbWMP8Nn5IU0+o8=; b=
	IbqLDYCX7sbjg71Dyp7VLb5etZ58sWz3MnYUEqrP11LNhg3i4Q5EPZicoRTgLszU
	Q3nhmX6cWs4pUWGvbvNorzJMJPToeS22LalM/LcQxNoqZCKg9EI+pSNN8LxVgQth
	96Db0K8DsU8PpIAqB57nmxyJDFG1K9cOhL3WmJXR4jWRfXGnwokonBOnnO9abt7T
	7sa4Gwu5B1/tFC/6FlA35baqbp5uKIKTRBRpIcfA67ykOmxYgaRx+IEg36GJm96u
	a+kZxtKWgppxyRm+qy/M1uoMaUyPtayFxdVc9H/SN0zGq+dbgmdLL6ItAYYeJc7a
	rMPT+jZeuOKA2GQdpJGU7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1718379620; x=
	1718466020; bh=ywiNTEsyKVi9wfi8zp3VW1Yvi6T4GbWMP8Nn5IU0+o8=; b=I
	AwcmSnJAdkem2T/fuDHElvtNXKe2MIdTTRgYF03iqMyZlyoA7prKjINzBbQuQSAD
	tTO7n6jYTLZTKrGReAhHVaJbJkL8/tbUejgDOxEPSIKnox9lfzu7MUkTlz0Q/eQi
	AtmPW2ahx/YMRgEqnNSOnifEUm7Vtibm+bWKlgYtFn80FDT2jt9BoN9zgET6SRJZ
	Z03Yi0ypvqjg0SqVWabWpQRzf/qggDBupdm7LAcX9K0yB5qDY3AMFcrq7ZowyU1X
	1BZX6Aa+c5EdA/vQisxFdMKGt6nHmgO5UEQjDk/UD7QL96LgGHYGUWWU7IY9lDc4
	cpUhK0P5QkMmH5ukzJL+g==
X-ME-Sender: <xms:ZGRsZnwPTs-F7VRToYBr8eUJwLEA58YbYNi-3tHZCGO8NfsfWfN_eg>
    <xme:ZGRsZvQbbHxAGPCTywDYBIkRqJx2UBuUCDg-Bad7s77hwRRacSsVNuPm3LYWyou-h
    CmOUgPWRQt2l-_1E7I>
X-ME-Received: <xmr:ZGRsZhV3dW_DUyxfiNpfSFZAWvTKhrZQxN7pvRZgsW9MoVWF3eVy5zM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeduledgleduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffekgedugefhtdduudeghfeu
    veegffegudekjeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:ZGRsZhj-P0BCRVFnOG5i0C-PLfDbsUp-MX9uGpOxrysAHIzZuBaitA>
    <xmx:ZGRsZpCE7CNnVm-oUsLAbsjiigprSkc05Ym1FrrrTF3f_vOJHsIaxw>
    <xmx:ZGRsZqJtdGA41qcC_RWrFJXUx3_2xEnOzQmKJDkJQOCYsmE3bIXcUA>
    <xmx:ZGRsZoDLB6xfSzzM-Txe-ZUH9dOds9S7GBh7WYpiq9szlCOhk8QwoQ>
    <xmx:ZGRsZt6rPZrMBjhHnVUNV7-42u5RsxnsGWsdNUlcYAiC8Azhkeqhecl8>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Jun 2024 11:40:18 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Fri, 14 Jun 2024 16:40:09 +0100
Subject: [PATCH 01/10] MIPS: Loongson64: Remove memory node for builtin-dtb
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240614-ls3k-mips-v1-1-7614340ace7d@flygoat.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1140;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=Xo0TOhtv48XsE5CIQS0AETSjzou4lRT4X0OouLxOG/8=;
 b=owGbwMvMwCXmXMhTe71c8zDjabUkhrSclLhL9jcjAu/t/llecHhdSH+h8wdW/uf+F8y4mNb6h
 23i/Xqso5SFQYyLQVZMkSVEQKlvQ+PFBdcfZP2BmcPKBDKEgYtTACZSLM3wT/PfYv+Z3+9X2TTG
 H77a8DNVdInfvk3uZyY7a523blpds4Phn4rJtcvXGBybmRWL37xfcDc71SheTahPY4XAgpD1Vmf
 ecQMA
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67

Builtin DTBS should never contain memory node as memory is
going to be managed by LEFI interface.

Remove memory node to prevent confliction.

Fixes: b1a792601f26 ("MIPS: Loongson64: DeviceTree for Loongson-2K1000")
Cc: stable@vger.kernel.org
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
index b5593f7cc383..f5a74338bf05 100644
--- a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
+++ b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
@@ -23,14 +23,6 @@ cpu0: cpu@0 {
 		};
 	};
 
-	memory@200000 {
-		compatible = "memory";
-		device_type = "memory";
-		reg = <0x00000000 0x00200000 0x00000000 0x0ee00000>, /* 238 MB at 2 MB */
-			<0x00000000 0x20000000 0x00000000 0x1f000000>, /* 496 MB at 512 MB */
-			<0x00000001 0x10000000 0x00000001 0xb0000000>; /* 6912 MB at 4352MB */
-	};
-
 	cpu_clk: cpu_clk {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";

-- 
2.43.0


