Return-Path: <linux-mips+bounces-12315-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE13C763A3
	for <lists+linux-mips@lfdr.de>; Thu, 20 Nov 2025 21:47:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 68C50352E11
	for <lists+linux-mips@lfdr.de>; Thu, 20 Nov 2025 20:47:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A6C630149C;
	Thu, 20 Nov 2025 20:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fZVbHn60"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409AC2F6928;
	Thu, 20 Nov 2025 20:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763671653; cv=none; b=WXicuu1DxjZ357Ms2aR6SFOZipXKyhXtwZpdOgxVtouWt7YFEKZavEMM31UBHRh8bMVZs/KmG5JWUMaElgooxF5GQBFqKhrK3kculgbDHOS8wYtkVucmUCP8iWcSdC4ymsBa00m399kCRKHabR17XVR57IS/Tjaktc0tWtQBV0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763671653; c=relaxed/simple;
	bh=jr09kTz/vPoYXzoascQ6RRUxCvMuEo5/bEh1N99uRxs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aYIC663ZKzsEchl1JAA48X5v3BQ81ZnFuE5/e+EYTSM23tMhwX/QkqQUOSnVlW6f2bLpX+vVFWloImyY1AwzNt0kPPtZk6e1AQIXXZHSL3KFPqDQDThA4505aCfzeZP5Am0n2DUlimpd82rzOewfYWvroYwJW/wCL3fq9BlyMzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fZVbHn60; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B512EC116B1;
	Thu, 20 Nov 2025 20:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763671652;
	bh=jr09kTz/vPoYXzoascQ6RRUxCvMuEo5/bEh1N99uRxs=;
	h=From:To:Cc:Subject:Date:From;
	b=fZVbHn608JP6IMyXIPCAq/gFmcPRJo/D5be3pzh4tkm21D365umzuB2llfnhEv0hi
	 VPVyB4c772eZZWHIc2xtIRVWujCf0IACxgSD8SW2Bu24uGTSzYKGKH4jJi3WlkQhoS
	 1qS8QCdvdFmzuP9Vjq+4Iu90U7iUWXP//xa8+vxjhH1zzHUz90H76D0TQ2TaVlgEJo
	 etjv0bN9pI77XAl2hrUJHw9f6jizjI6zHkuumDkNMDJyHmA110CXfRVgFNF7ojfAjd
	 KwtFGfkagtwkMVdjF9BhAwYhIpv/QoBDCjzyZMVIUvohlIo3HQvEsdDg45kzXX0dJn
	 3XUxpu+TP/Glg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: dts: Always descend vendor subdirectories
Date: Thu, 20 Nov 2025 14:47:16 -0600
Message-ID: <20251120204717.1982418-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 41528ba6afe6 ("MIPS: DTS: Only build subdir of current platform")
broke building of all DTBs when CONFIG_OF_ALL_DTBS is enabled unless all
the various kconfig options were also enabled. The only effect that commit
had was getting rid of some harmless build lines such as:

      AR      arch/mips/boot/dts/mti/built-in.a

Those lines were part of the built-in DTB support. Since commit
04e4ec98e405 ("MIPS: migrate to generic rule for built-in DTBs"), how the
built-in DTBs are handled has changed and those lines are no longer
generated, so revert to the prior behavior.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/mips/boot/dts/Makefile         | 35 +++++++++++++----------------
 arch/mips/boot/dts/realtek/Makefile |  4 ++--
 2 files changed, 18 insertions(+), 21 deletions(-)

diff --git a/arch/mips/boot/dts/Makefile b/arch/mips/boot/dts/Makefile
index 6d9dbe945541..36c5e4c6e640 100644
--- a/arch/mips/boot/dts/Makefile
+++ b/arch/mips/boot/dts/Makefile
@@ -1,20 +1,17 @@
 # SPDX-License-Identifier: GPL-2.0
-subdir-$(CONFIG_BMIPS_GENERIC)		+= brcm
-subdir-$(CONFIG_CAVIUM_OCTEON_SOC)	+= cavium-octeon
-subdir-$(CONFIG_ECONET)			+= econet
-subdir-$(CONFIG_EYEQ)			+= mobileye
-subdir-$(CONFIG_FIT_IMAGE_FDT_MARDUK)   += img
-subdir-$(CONFIG_FIT_IMAGE_FDT_BOSTON)	+= img
-subdir-$(CONFIG_MACH_INGENIC)		+= ingenic
-subdir-$(CONFIG_LANTIQ)			+= lantiq
-subdir-$(CONFIG_MACH_LOONGSON64)	+= loongson
-subdir-$(CONFIG_MACH_LOONGSON32)	+= loongson
-subdir-$(CONFIG_SOC_VCOREIII)		+= mscc
-subdir-$(CONFIG_MIPS_MALTA)		+= mti
-subdir-$(CONFIG_LEGACY_BOARD_SEAD3)	+= mti
-subdir-$(CONFIG_FIT_IMAGE_FDT_NI169445)	+= ni
-subdir-$(CONFIG_MACH_PIC32)		+= pic32
-subdir-$(CONFIG_ATH79)			+= qca
-subdir-$(CONFIG_RALINK)			+= ralink
-subdir-$(CONFIG_MACH_REALTEK_RTL)	+= realtek
-subdir-$(CONFIG_FIT_IMAGE_FDT_XILFPGA)	+= xilfpga
+subdir-y	+= brcm
+subdir-y	+= cavium-octeon
+subdir-y	+= econet
+subdir-y	+= mobileye
+subdir-y	+= img
+subdir-y	+= ingenic
+subdir-y	+= lantiq
+subdir-y	+= loongson
+subdir-y	+= mscc
+subdir-y	+= mti
+subdir-y	+= ni
+subdir-y	+= pic32
+subdir-y	+= qca
+subdir-y	+= ralink
+subdir-y	+= realtek
+subdir-y	+= xilfpga
diff --git a/arch/mips/boot/dts/realtek/Makefile b/arch/mips/boot/dts/realtek/Makefile
index d2709798763f..3ac795d85236 100644
--- a/arch/mips/boot/dts/realtek/Makefile
+++ b/arch/mips/boot/dts/realtek/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
-dtb-y	+= cisco_sg220-26.dtb
-dtb-y	+= cameo-rtl9302c-2x-rtl8224-2xge.dtb
+dtb-$(CONFIG_MACH_REALTEK_RTL)	+= cisco_sg220-26.dtb
+dtb-$(CONFIG_MACH_REALTEK_RTL)	+= cameo-rtl9302c-2x-rtl8224-2xge.dtb
-- 
2.51.0


