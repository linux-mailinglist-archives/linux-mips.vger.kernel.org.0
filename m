Return-Path: <linux-mips+bounces-4561-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 571E693E80E
	for <lists+linux-mips@lfdr.de>; Sun, 28 Jul 2024 18:22:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C3091F2142C
	for <lists+linux-mips@lfdr.de>; Sun, 28 Jul 2024 16:22:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34D3615697B;
	Sun, 28 Jul 2024 16:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jlSUuKX7"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6D2156880;
	Sun, 28 Jul 2024 16:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722182909; cv=none; b=VnUj9b9AlLAdvgNPr06kSaN9mR4PjuD6YdEYU0Tw3d3rqr+ZIhjGJnwgNAPXfHSjByLTZog4ZTzmwp5rM60xi4kLrAS1Liqt8gFH2N5YsLju5iniYsSjgK6BQshklYWEOZzeQxU5P05FFScmPyUXMNk6047PGCbV0akrqmK9Ur8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722182909; c=relaxed/simple;
	bh=IiKPslQhoPMkXdwWwmKfLu5ZsNAFZC3dSPSZhdALLlI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uUuprZbixBnQ6e+jvWtIGz5JyuZgil+aQ1VQLIz0XXPa1RLpcDmDIOMTMmeWpXK0Lhxq56Yjo2IIp9lXISBfr46/K9+Q2kNQV2GTBYDWEBsSKgSqYsXbORACab/tBf3wxBKKMonDbfHZ66Nbc8dRIaQ4PUWREPrO4Lzfkan1dWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jlSUuKX7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DBB3C116B1;
	Sun, 28 Jul 2024 16:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722182908;
	bh=IiKPslQhoPMkXdwWwmKfLu5ZsNAFZC3dSPSZhdALLlI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jlSUuKX7CxFA9ksW3subnmfTOaWncGmsgliamIWm4mjc6iDW/LP3WgM+LQaEg8Ien
	 L8ezgRcAYeQXyI+cZtaEioRT7L4xLyzouPG0+pRnGqATDUwjS4yl5YYcq+0KtEWpVO
	 p6xrLO9TQRK26r70dSZCfw3NZQFur/zYaoHCpWoKmWkfK2Tep+IN2HoQXdQixS+jBb
	 qCzGpeF60rIl+C9ZjNDA3smG8vo1TFDBWApDLBVQe/ENLRSX1D9ge3avCJhG2TdT9d
	 Sbh4Ji0ZBwq91FrTREkHxqr8hUZZBUa3uP9T30hVNds9kuATL2F47XHixKoLXHxnIC
	 8iIf5i9OdOanA==
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
Subject: [PATCH AUTOSEL 6.1 06/15] MIPS: Loongson64: DTS: Fix msi node for ls7a
Date: Sun, 28 Jul 2024 12:07:50 -0400
Message-ID: <20240728160813.2053107-6-sashal@kernel.org>
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


