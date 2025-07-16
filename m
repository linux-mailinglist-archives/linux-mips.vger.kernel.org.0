Return-Path: <linux-mips+bounces-9830-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AB088B074AF
	for <lists+linux-mips@lfdr.de>; Wed, 16 Jul 2025 13:25:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DAC52170234
	for <lists+linux-mips@lfdr.de>; Wed, 16 Jul 2025 11:25:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8BD42F4303;
	Wed, 16 Jul 2025 11:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OdJSB8a4"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDD62F3C26;
	Wed, 16 Jul 2025 11:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752665139; cv=none; b=PHsjsGUjZ4jWs8Rjw62o7ju9IbViuZZsNehsRwSiJ0zEddyEhu853TVrQ2/fjkyPIzjlrjswcNYCP8jH3yfZ455Bg/N5caZwxCQ38TXV9c9or2/9nEy7R3YGruoer0RoWqAEZ0r62/IMLvElXJvJQRf+uztujmCkEGSkjnQ93E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752665139; c=relaxed/simple;
	bh=Dw45gw+pwKS7YT972Q3bF/W07Imi23MfWHlBCA3QWNA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W6fXYm2m5FEAqfkPR64kaY1y9HqPQiLNN2Li5bK+vPYDunEVBJJBcRIwoyU3/+AJiYRyggQ8PTzNdjDXilqzRengx3h8su3KVYT6TkfqpDBrlBO9VA5PvrG08FHLftcP5wSHjMvG1a32u0SufAy1iGH6buAG532usA+OtHqG3pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OdJSB8a4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 37D92C113D0;
	Wed, 16 Jul 2025 11:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752665139;
	bh=Dw45gw+pwKS7YT972Q3bF/W07Imi23MfWHlBCA3QWNA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OdJSB8a4lreQSbVkuGufrxPLwz8roXHsSGGa5K2b15pNfpqYVqgWOYEi4JkRJa1e5
	 Gamy6QLqUMfJeb6zNjSgdigbiCZOP65VuOvvYn+T62fhymaeBJL6dU3gewA73cLXkT
	 AQ7Lsx1ja/bhVty3BKg39yq6hl2XHCaX/QCa5GE6tooveVU8j7YTqWgS09ddMDAmHM
	 6TOSNGwKMEwbCJ8f+3a0hGg4ZgA2uT8J9muk0fBewmZ/pz72uh4X9lshkJdpSP8mi4
	 tK43PInb6pp3kO+SXchqFQW0GlkZELJHb4J9KIXN/B84XYbFdGLGvV1YagYeQ19gvD
	 7GODggEFBVuvA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30B3CC83F22;
	Wed, 16 Jul 2025 11:25:39 +0000 (UTC)
From: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>
Date: Wed, 16 Jul 2025 19:25:15 +0800
Subject: [PATCH v3 6/9] MIPS: loongson: Add built-in DTB support
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250716-loongson1-arch-v3-6-d160974d696b@gmail.com>
References: <20250716-loongson1-arch-v3-0-d160974d696b@gmail.com>
In-Reply-To: <20250716-loongson1-arch-v3-0-d160974d696b@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Keguang Zhang <keguang.zhang@gmail.com>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752665136; l=1673;
 i=keguang.zhang@gmail.com; s=20231129; h=from:subject:message-id;
 bh=31SQDWI+tNppoJhNVuSV6AMxuxSd2DNTM292TR9KcKg=;
 b=L+LoNxrEHQl2Mx+K+EVi55An15Kt4JUfoUjnUxlLuX2OLJMHqpJ61OBLIkj4O8uqrNDnvVUGa
 s7m4DrreF/bAw+lOUx3wM7mh26FovUCvITkzkdAqWLcVeFbTiYG4T3t
X-Developer-Key: i=keguang.zhang@gmail.com; a=ed25519;
 pk=FMKGj/JgKll/MgClpNZ3frIIogsh5e5r8CeW2mr+WLs=
X-Endpoint-Received: by B4 Relay for keguang.zhang@gmail.com/20231129 with
 auth_id=102
X-Original-From: Keguang Zhang <keguang.zhang@gmail.com>
Reply-To: keguang.zhang@gmail.com

From: Keguang Zhang <keguang.zhang@gmail.com>

Since the current bootloader for Loongson-1 does not support FDT,
introduce CONFIG_BUILTIN_DTB_NAME to enable a built-in DTB.

Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
---
 arch/mips/boot/dts/loongson/Makefile | 5 +++++
 arch/mips/loongson32/Kconfig         | 8 ++++++++
 2 files changed, 13 insertions(+)

diff --git a/arch/mips/boot/dts/loongson/Makefile b/arch/mips/boot/dts/loongson/Makefile
index e8f76e7ac303..8ee12504d353 100644
--- a/arch/mips/boot/dts/loongson/Makefile
+++ b/arch/mips/boot/dts/loongson/Makefile
@@ -1,4 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
+
+ifneq ($(CONFIG_BUILTIN_DTB_NAME),)
+dtb-y	:= $(addsuffix .dtb, $(CONFIG_BUILTIN_DTB_NAME))
+else
 dtb-$(CONFIG_MACH_LOONGSON64)	+= loongson64_2core_2k1000.dtb
 dtb-$(CONFIG_MACH_LOONGSON64)	+= loongson64c_4core_ls7a.dtb
 dtb-$(CONFIG_MACH_LOONGSON64)	+= loongson64c_4core_rs780e.dtb
@@ -10,3 +14,4 @@ dtb-$(CONFIG_MACH_LOONGSON32)	+= cq-t300b.dtb
 dtb-$(CONFIG_MACH_LOONGSON32)	+= ls1b-demo.dtb
 dtb-$(CONFIG_MACH_LOONGSON32)	+= lsgz_1b_dev.dtb
 dtb-$(CONFIG_MACH_LOONGSON32)	+= smartloong-1c.dtb
+endif
diff --git a/arch/mips/loongson32/Kconfig b/arch/mips/loongson32/Kconfig
index a7c500959577..52e925309f15 100644
--- a/arch/mips/loongson32/Kconfig
+++ b/arch/mips/loongson32/Kconfig
@@ -36,3 +36,11 @@ config LOONGSON1_LS1C
 endchoice
 
 endif # MACH_LOONGSON32
+
+config BUILTIN_DTB_NAME
+	string "Source file for built-in DTB"
+	depends on BUILTIN_DTB
+	help
+	  Base name (without suffix, relative to arch/mips/boot/dts/loongson)
+	  for the DTS file that will be used to produce the DTB linked into
+	  the kernel.

-- 
2.43.0



