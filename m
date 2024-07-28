Return-Path: <linux-mips+bounces-4565-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5C693E865
	for <lists+linux-mips@lfdr.de>; Sun, 28 Jul 2024 18:29:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CA843B24397
	for <lists+linux-mips@lfdr.de>; Sun, 28 Jul 2024 16:29:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A903718F2E8;
	Sun, 28 Jul 2024 16:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jPD+TsJe"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF0778C68;
	Sun, 28 Jul 2024 16:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722183014; cv=none; b=th+A7iT7LS4/2fd+A3n65PSMgdGuEoSmyxKQSSJLzZ7Dw19kSe63wBAYuWHzscypvZIQ6F/K7Oga7hm+/1hxxugGG25u2pOssCTXaLEHTGSWNDP9YcIsupD8G7nRkBKfcazidyCbksOrB/UcLdraann7IXRT2+/mzSyH2v03xYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722183014; c=relaxed/simple;
	bh=IiKPslQhoPMkXdwWwmKfLu5ZsNAFZC3dSPSZhdALLlI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=erBmGuaydQbVfxu1XWA3NTvU6Ite8go3Nwu/5d+fOivSVsml2f1oOpUIDh4w1NV0Hi5rm4Lvk65F57ZISwlDnybrPIe9i5seFjCRI9fwq56gEYRl7db9NJwzB7S0GoT9EdZo1/GiZRdnhIKjyGKRGNy2rDCfGOe4s0BAVu/phgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jPD+TsJe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CE8EC4AF0B;
	Sun, 28 Jul 2024 16:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722183014;
	bh=IiKPslQhoPMkXdwWwmKfLu5ZsNAFZC3dSPSZhdALLlI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jPD+TsJe19aRoP0UL7tNYCdd8l3enpmTk4ayJ49uDNRxiXx8MWTQgDznPfDon0S5n
	 xpkRGVVX7ur1RupQ+etSuWkYZ0Bsjb1Sf+j6GCxZ6GyZ8r+9kym9YScr+Q4iS9rIAR
	 dnESb1AmL8uLMJBi6nDF1s10galQl9newfdvuLyppujnRbRl98pd47eDa9DRMGX44Y
	 z4pieomoDW+5EyEMpv9enFTTECOh33nlBatjFSDluzeIU0LE3pqUSICZ5Dapw91HFA
	 Rp34/pe3ps44/hEoDMlwEZ/OtqieS0ek8dYCG+0xjwp0dxdG+KdiPWz1muX1Bj2AQl
	 wWBFqgN5jx6Vg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Sasha Levin <sashal@kernel.org>,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 07/11] MIPS: Loongson64: DTS: Fix msi node for ls7a
Date: Sun, 28 Jul 2024 12:09:40 -0400
Message-ID: <20240728160954.2054068-7-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240728160954.2054068-1-sashal@kernel.org>
References: <20240728160954.2054068-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.223
Content-Transfer-Encoding: 8bit

From: Jiaxun Yang <jiaxun.yang@flygoat.com>

[ Upstream commit 98a9e2ac3755a353eefea8c52e23d5b0c50f3899 ]

Add it to silent warning:
arch/mips/boot/dts/loongson/ls7a-pch.dtsi:68.16-416.5: Warning (interrupt_provider): /bus@10000000/pci@1a000000: '#interrupt-cells' found, but node is not an interrupt provider
arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dts:32.31-40.4: Warning (interrupt_provider): /bus@10000000/msi-controller@2ff00000: Missing '#interrupt-cells' in interrupt provider
arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dts b/arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dts
index c945f8565d543..fb180cb2b8e2c 100644
--- a/arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dts
+++ b/arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dts
@@ -33,6 +33,7 @@ msi: msi-controller@2ff00000 {
 		compatible = "loongson,pch-msi-1.0";
 		reg = <0 0x2ff00000 0 0x8>;
 		interrupt-controller;
+		#interrupt-cells = <1>;
 		msi-controller;
 		loongson,msi-base-vec = <64>;
 		loongson,msi-num-vecs = <192>;
-- 
2.43.0


