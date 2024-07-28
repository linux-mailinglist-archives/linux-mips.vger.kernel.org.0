Return-Path: <linux-mips+bounces-4563-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF2593E83A
	for <lists+linux-mips@lfdr.de>; Sun, 28 Jul 2024 18:25:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AD39282A01
	for <lists+linux-mips@lfdr.de>; Sun, 28 Jul 2024 16:25:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3741188CB0;
	Sun, 28 Jul 2024 16:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gCKPykh+"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DDA188CA5;
	Sun, 28 Jul 2024 16:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722182962; cv=none; b=qiSiB37sqCUE3L2mkEo9OsvvBSQjQbULN81URS/S2jMuFV9nZmVpZOIyDnv/TYZ3wJl/9s65+Z0PFgSPANimFbCskcScnU87NpqsaXke+B3ZAR00Huu9GQ8FWKfSXMxI55dbqoVuVS7NEgNiiQxMjSoaL5TAf1qeEBuaGowjg60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722182962; c=relaxed/simple;
	bh=IiKPslQhoPMkXdwWwmKfLu5ZsNAFZC3dSPSZhdALLlI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a8FPHTHHpo2zzKZVEcqW18FiE8Z8d5yTatXydRXOhKphvcS96YE8LQG8eZj59d/If5FeFuVceQg9bxAbpg4oosAJShXPZj8l4dXDy2t4zkys9cW0FGNzfRNlBSeLDvRabGjGrJk3bselHbZx+t/XwFbTiq6WyxdgJdmmkqYkDvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gCKPykh+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DBF7C116B1;
	Sun, 28 Jul 2024 16:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722182962;
	bh=IiKPslQhoPMkXdwWwmKfLu5ZsNAFZC3dSPSZhdALLlI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gCKPykh+Vo9/vzuVHFpG3B8P53Yk+dm1VNJHxgDuwAmWFslJNU1WXQwjJqKsJXUHw
	 2IKk9tOlB6K/GF8JWPbGShbYdps49sUFD632Y0QrPcq/6Ek8oL3KiQBcYLFztKiZvj
	 Rb9+5AU2tsfrzO+HZIVYBnn4QOiNiIIJdyD7kk97obFCfLqd/LNNfRBWO4SQ8Z0X/g
	 mZZNXiykqdWY/GW6PljvApdVih/bNBtuImnWtPu07dse5s868f+hw3AIXm3Ez9YsDo
	 My8p2HDk71gBHO0g3Z7IymDYrcCvAHm8W2FoxmlFAjVt8y/Emael0xwBxvH2+zT3BS
	 AW51j0qLuSMqw==
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
Subject: [PATCH AUTOSEL 5.15 06/13] MIPS: Loongson64: DTS: Fix msi node for ls7a
Date: Sun, 28 Jul 2024 12:08:48 -0400
Message-ID: <20240728160907.2053634-6-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240728160907.2053634-1-sashal@kernel.org>
References: <20240728160907.2053634-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.164
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


