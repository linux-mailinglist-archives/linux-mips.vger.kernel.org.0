Return-Path: <linux-mips+bounces-4559-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A3B93E7DD
	for <lists+linux-mips@lfdr.de>; Sun, 28 Jul 2024 18:18:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9D8C1F21B81
	for <lists+linux-mips@lfdr.de>; Sun, 28 Jul 2024 16:18:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B209145B2D;
	Sun, 28 Jul 2024 16:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YgPwK9PW"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DAD145A03;
	Sun, 28 Jul 2024 16:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722182847; cv=none; b=qTjjn38pXfVzz9EQ6k7EY+Y/K6w5WEl1LoBpIf2Ki3UsK5GDwGN1kwTPLf863buH7aYnhuaOG4sZdP5lk/Nl3uLYCEd8GuAj22n6c/URtO9Bd3O2kUN9b7Rp2KBTYSLLvyHfgYhXP58Dm/E8WCkZ0vW4b4YESwDMtCvHMuE9xEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722182847; c=relaxed/simple;
	bh=IiKPslQhoPMkXdwWwmKfLu5ZsNAFZC3dSPSZhdALLlI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bEJi+sreimERBg/VIFdS/eo9iqLbL037tDOYzJNqT4R2QssQ6tIZwy9YoNQzJvTAVWVxKdEbaYD0CwwrHc2I8awMLGtEralVh5EOjSNhfo++lw3ENkxpV5dmfEIry0yd5fnw34Kutled1Y3Fzh9izRM1NjRk76pK9wnM3ywsHfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YgPwK9PW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78AF3C4AF0A;
	Sun, 28 Jul 2024 16:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722182846;
	bh=IiKPslQhoPMkXdwWwmKfLu5ZsNAFZC3dSPSZhdALLlI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YgPwK9PWCA7lTKqxvadecTQxHNkJLDqetM0E3HzD70AJEeOrKbJuO4+ZMlFVCNj9X
	 PnVLYQbZoDrFIFJ3exo44Th4eOvv1RJPmTDGhIcU4Tjkzn266nE73r5DSPLpTHwiWr
	 lHPZel2KEhm/wJimH96W7/chCX7p9VgXzMLv59HAI2dmfc4AyShDpvW/Uy+v3QCwDV
	 j6Fj6jH8T4HkZwwd6vgZ+Je7qYK7YexMaRYxrmBM8hPzQBXpcV8Vb0DjtjBhS81pMc
	 Alrfkm5U77hAHCAjKmHmCPDRd9ZJzP6o5+ptx70zi3rcPgQYjeJddC/YJDi78qoeMk
	 qcoDlW+FQ5M6A==
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
Subject: [PATCH AUTOSEL 6.6 07/17] MIPS: Loongson64: DTS: Fix msi node for ls7a
Date: Sun, 28 Jul 2024 12:06:43 -0400
Message-ID: <20240728160709.2052627-7-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240728160709.2052627-1-sashal@kernel.org>
References: <20240728160709.2052627-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.43
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


