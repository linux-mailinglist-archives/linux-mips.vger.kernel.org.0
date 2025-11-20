Return-Path: <linux-mips+bounces-12316-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED134C763C7
	for <lists+linux-mips@lfdr.de>; Thu, 20 Nov 2025 21:52:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 00AEF2912D
	for <lists+linux-mips@lfdr.de>; Thu, 20 Nov 2025 20:52:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C034312809;
	Thu, 20 Nov 2025 20:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pjPQ0z9H"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F59C2D2382;
	Thu, 20 Nov 2025 20:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763671921; cv=none; b=rTrqYmvOh8dYQCKyKVdbq7i+ajOd7lfhpG3Yp4MRD+WuJ020fuBj2VQUN07X5ckZeda4F3U3vG5hODugfXCUTD2xX4GOQhorEIdO0j1PUmm2U3P9vE0NdUt2h6rxxeziaAZT3+Ov7hommYgV7C25Xa7J4gh4eIrRwHYoAofyvA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763671921; c=relaxed/simple;
	bh=/2MLYZFt2UK8yikPPD+7q2Ovh6jii1HpUvg+KerpW/s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EzsK/AVcSuGSC6PVVetT9houne8XOyHo6VDsr3yjr2cr50ENdaPiEPhDZTDP3kolZBitZqJRkBj3L9EiZq4o9azqVTfFr2qYVAsX/zX6i3ZM/Be88F3kFQMX+n7hKMgOOi8T6GAyDLMuYUY0pLWwmlllgkRuDBQYeT2DwTrSuD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pjPQ0z9H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99F48C4CEF1;
	Thu, 20 Nov 2025 20:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763671920;
	bh=/2MLYZFt2UK8yikPPD+7q2Ovh6jii1HpUvg+KerpW/s=;
	h=From:To:Cc:Subject:Date:From;
	b=pjPQ0z9Hs2ySC+uoLN3NFLrILTqXtCvDqFyqSfOAVl1MCOVCrsXUyNPLUAiYb0o8h
	 /3+kVk6iB1rfxBaDld9qmw++i5ZYtDrfDBusVWL5p7Y5k0BirMalh5YAhG7Zy+qH9+
	 EZeblU6urmxotwaEh75Nok9ViV7jYaQ0i7qUkh9UROx7+ZHo0nesFJTXEp/GpbIJ7u
	 /JIfoZ5fOl82GQZceIS2NGmBC0+rOKGg45m9ojUIptCuA6mTpC4NuT6JzwQ22gBFRS
	 hxqD7xPITEGMixxETVFLyCNWmTFUGwVofHg5WI5KqZdOfV2k4DHK7b0JR27Z+HMzGo
	 iv97OrLZWR4Fg==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2] kbuild: Support directory targets for building DTBs
Date: Thu, 20 Nov 2025 14:48:13 -0600
Message-ID: <20251120204812.1983452-4-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is useful to be able to build all the DTBs for a vendor. One can list
all the .dts files in a directory and convert those to %.dtb targets,
but that doesn't work for base+overlay DTB targets.

Adding the dts subdirectory is straight-forward, but building the
DTBs should only happen for certain targets (dtbs, dtbs_check, %.dtb,
%.dtbo, and the directory target(s)).

The 'scripts_dtc' rule doesn't really depend on 'dt_binding_schemas',
but the directory target only depends on 'scripts' which depends on
'scripts_dtc'.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Please ack and I'll take this in the DT tree.

I don't really like looking at MAKECMDGOALS, but that's the only way I
could come up with that works. Maybe someone knows a better way.

v2:
 - Convert arm, mips and riscv. The other DT enabled arches don't have 
   vendor directories.
 - Link to v1: https://lore.kernel.org/all/20251113225952.867138-1-robh@kernel.org/ 

---
 Makefile              | 2 +-
 arch/arm/Kbuild       | 2 ++
 arch/arm64/Kbuild     | 2 ++
 arch/mips/Kbuild      | 2 ++
 arch/riscv/Kbuild     | 2 ++
 scripts/Makefile.dtbs | 3 +++
 6 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 17cfa11ca716..85018d461575 100644
--- a/Makefile
+++ b/Makefile
@@ -1494,7 +1494,7 @@ export CHECK_DTBS=y
 endif
 
 ifneq ($(CHECK_DTBS),)
-dtbs_prepare: dt_binding_schemas
+scripts_dtc: dt_binding_schemas
 endif
 
 dtbs_check: dtbs
diff --git a/arch/arm/Kbuild b/arch/arm/Kbuild
index 69de6b6243c7..af7dd53585c3 100644
--- a/arch/arm/Kbuild
+++ b/arch/arm/Kbuild
@@ -10,5 +10,7 @@ obj-y				+= probes/
 obj-y				+= net/
 obj-y				+= crypto/
 
+subdir-y += boot/dts
+
 # for cleaning
 subdir- += boot
diff --git a/arch/arm64/Kbuild b/arch/arm64/Kbuild
index 5bfbf7d79c99..9e9820af48c9 100644
--- a/arch/arm64/Kbuild
+++ b/arch/arm64/Kbuild
@@ -5,5 +5,7 @@ obj-$(CONFIG_XEN)	+= xen/
 obj-$(subst m,y,$(CONFIG_HYPERV))	+= hyperv/
 obj-$(CONFIG_CRYPTO)	+= crypto/
 
+subdir-y += boot/dts
+
 # for cleaning
 subdir- += boot
diff --git a/arch/mips/Kbuild b/arch/mips/Kbuild
index e901bf554483..6125d00cdcef 100644
--- a/arch/mips/Kbuild
+++ b/arch/mips/Kbuild
@@ -21,5 +21,7 @@ ifdef CONFIG_KVM
 obj-y += kvm/
 endif
 
+subdir-y += boot/dts
+
 # for cleaning
 subdir- += boot
diff --git a/arch/riscv/Kbuild b/arch/riscv/Kbuild
index 126fb738fc44..3cf7f84eb287 100644
--- a/arch/riscv/Kbuild
+++ b/arch/riscv/Kbuild
@@ -7,5 +7,7 @@ obj-$(CONFIG_KVM) += kvm/
 
 obj-$(CONFIG_ARCH_SUPPORTS_KEXEC_PURGATORY) += purgatory/
 
+subdir-y += boot/dts
+
 # for cleaning
 subdir- += boot
diff --git a/scripts/Makefile.dtbs b/scripts/Makefile.dtbs
index 2d321b813600..4d0d164df275 100644
--- a/scripts/Makefile.dtbs
+++ b/scripts/Makefile.dtbs
@@ -14,7 +14,10 @@ dtb-y           := $(addprefix $(obj)/, $(dtb-y))
 multi-dtb-y     := $(addprefix $(obj)/, $(multi-dtb-y))
 real-dtb-y      := $(addprefix $(obj)/, $(real-dtb-y))
 
+ifneq ($(findstring /dts/,$(MAKECMDGOALS))$(findstring dtb,$(MAKECMDGOALS)),)
 always-y        += $(dtb-y)
+endif
+
 targets         += $(real-dtb-y)
 
 # dtbs-list
-- 
2.51.0


