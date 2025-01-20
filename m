Return-Path: <linux-mips+bounces-7532-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7445AA16539
	for <lists+linux-mips@lfdr.de>; Mon, 20 Jan 2025 02:53:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0682A1884928
	for <lists+linux-mips@lfdr.de>; Mon, 20 Jan 2025 01:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9665182D9;
	Mon, 20 Jan 2025 01:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j5wscsX0"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9D628F3;
	Mon, 20 Jan 2025 01:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737338000; cv=none; b=K43L3suxaMULCxexbB6YXExM7dvk3LHgOREq/zkTAT2XC5QIP0fYI0g6LWxOPn2H28oH1eMibXCtWM7ZRW90Vfex0XOVCvk+LSPenb7oMBdYxt6DiZ9knRPlfs7Kp4I+sYqO4zbe0k+P0nb27KNz3fh//idFLNSOn5HAQ05/Et8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737338000; c=relaxed/simple;
	bh=LU0udvuRXtxgXB5LHa8JH12NUk1AnAUqR095fU3xvfA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cEo4nCLbfHlS1PRiUgtBRV8WwoDJMS/mxdCtFIWVHeiRD/mvCAdnBbWJAV5hYSY11ncwQtnPJkL1uMFVlm6AFFrEbuqDfwkHlPCyM3Ge5oPXtf4kurinckEZMuTZjOaRQjlrem/l3JgGU9DwDosHvR7L115f9MlH+fgqntwwgSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j5wscsX0; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2167141dfa1so68282865ad.1;
        Sun, 19 Jan 2025 17:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737337996; x=1737942796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XJeE97yxm0MQeS+RPgW3ZGWiAHeWrCY7zJMe0zbRCzI=;
        b=j5wscsX0USGDGQNekjy3tBklNjodWRbj9828aoeGmbk6upikUbg3A0DNQndjlSJDzn
         15lTdAV9f6mUGMBR7qpRjgvftNPfrLrIdB83VRLcWmETx0OOqDPoRlS7UoZJUUW3m6vQ
         4352LHUkkVvoKMOlPw9JwqPo2pK0Vi/9QlgaRx06W3GJXynBikP6XDTze2LWON03EPjI
         frGvVKbFLDyuWC7eV57N+8Q9DvE9UyVkD4oGq9vftFaDRVclNktwCxDUUwkIxHrIropk
         BDaFqhdazVB61lwJVQgHpa29V9PtSvQ4fMbom/kh5f2cCoLNw/l3X5n6mrATomFjiB11
         zpNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737337996; x=1737942796;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XJeE97yxm0MQeS+RPgW3ZGWiAHeWrCY7zJMe0zbRCzI=;
        b=KYVPcE5UexyDJjiC2vAuoUiycSAP3KuNhINniyYB2Bn1sQ7/lTN6wDyB+Tx1CJFqsN
         pkXaguJU478P81lodR7gkHMadUBYD8nMGDaj00JaNPLUxjHGCKBYbt7zxdON7gCXa9vo
         L/LWIjKZDqdhKzVbu+C7ssy9VZ3HB+gBr1De29M4ADY7hCoVMu+vhGEfF/vPcWb6Z/pI
         wG9GMAg8MsYXnLkivy9CNnqHodzpIe96XQ++qwekJodNtW5z4ciuD206eRJkRdZfHQSX
         e03LLbzUYUyuYKT2/CYiyUb5s5b4BJHtZfDvEd/7NAhDTqixEtDFy/1zA5lZ4si5ChnP
         dgAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXO88kntTwPNnfkIH17FAWDg6Z4uIyNHQT+lfju8wZKrM9jhXPtABevGNhvF+HG5oG9KDu+93phmVyAdI=@vger.kernel.org, AJvYcCWBLxVAAkg19FvBkpgp4z8dtDQrAZPrYerjOfTN04YyeeEVf8tHcpTYFsq1lnO8eZy4SczYIfVIu9R2WQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpdpqPJwwW2VPQtezOjzHJyK9kXOXMS/mS80FmP+q3z3/Ig7Ip
	4Xx1X/5K0SWNujfaAkhysUMqmFdChIeKP1Tx2/5sPAGN7XO6K3yj
X-Gm-Gg: ASbGncsNaT5I0XcxNJbqwCfirHJ7b/D2zXUCv+sX/u2vQuN9LUoLPTDlFVnUexGfVzr
	FYM8JG2zK37q77O/ZU17/GhLQWMk+uj6Vj8I7gUuH7hLPhLQz1nmT3sWny/3v08vp5Y00xMzFTF
	S3wcGFWUpEEa7yaIRgo8/yjd15kzZfS7NcfFVd6cA4C70FrIUCFb+4teCjzWz8fbByur/mRrUGo
	VDkWMZqp08Q92ZggPSaLhWkt4qo2nDkiAKwwvDZ676l9vRjE+TawKndS6/+Ygav0mC13l2tinh7
	dIc=
X-Google-Smtp-Source: AGHT+IFZhiN3GTsoinLNl5rf8k3Qxjv31GWF0WA6mvhepUghtjGQfGzO2ToYg58FNSmP/S+SLOL0AA==
X-Received: by 2002:a17:902:cec5:b0:215:a56f:1e50 with SMTP id d9443c01a7336-21c35c8b62fmr145226355ad.8.1737337996300;
        Sun, 19 Jan 2025 17:53:16 -0800 (PST)
Received: from guoguo-thinkbook.lan ([112.64.60.79])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2ce9f05dsm50417845ad.13.2025.01.19.17.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 17:53:15 -0800 (PST)
From: Chuanhong Guo <gch981213@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Burton <paulburton@kernel.org>
Cc: Chuanhong Guo <gch981213@gmail.com>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mips: add support for Siflower MIPS SoCs
Date: Mon, 20 Jan 2025 09:52:52 +0800
Message-ID: <20250120015254.124447-1-gch981213@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Siflower MIPS SoCs like SF19A2890 uses dual-core MIPS InterAptiv
processor, built-in GMAC, USB, dual-band WiFi and various other
peripherals.
Notably, it uses some ARM PLxxx peripherals, and ARM_AMBA is
selected for the drivers.
Most devices on the market with this chip come with 64M or less
DRAM. A kmalloc.h with malloc alignment override is added to
conserve memory, and a MACH_SIFLOWER_MIPS is created with reduced
features instead of using the generic kernel.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 arch/mips/Kconfig                             | 30 +++++++++++++++++++
 arch/mips/generic/Platform                    |  1 +
 arch/mips/include/asm/mach-siflower/kmalloc.h |  9 ++++++
 3 files changed, 40 insertions(+)
 create mode 100644 arch/mips/include/asm/mach-siflower/kmalloc.h

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 1924f2d83932..e26636f2bc66 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -895,6 +895,36 @@ config SIBYTE_BIGSUR
 	select ZONE_DMA32 if 64BIT
 	select SWIOTLB if ARCH_DMA_ADDR_T_64BIT && PCI
 
+config MACH_SIFLOWER_MIPS
+	bool "Siflower MIPS SoCs"
+	select MIPS_GENERIC
+	select MACH_GENERIC_CORE
+	select ARM_AMBA
+	select BOOT_RAW
+	select CEVT_R4K
+	select CLKSRC_MIPS_GIC
+	select COMMON_CLK
+	select CPU_MIPSR2_IRQ_EI
+	select CPU_MIPSR2_IRQ_VI
+	select CSRC_R4K
+	select DMA_NONCOHERENT
+	select IRQ_MIPS_CPU
+	select MIPS_CPU_SCACHE
+	select MIPS_GIC
+	select MIPS_L1_CACHE_SHIFT_5
+	select NO_EXCEPT_FILL
+	select SMP_UP if SMP
+	select SYS_HAS_CPU_MIPS32_R2
+	select SYS_SUPPORTS_32BIT_KERNEL
+	select SYS_SUPPORTS_LITTLE_ENDIAN
+	select SYS_SUPPORTS_MIPS16
+	select SYS_SUPPORTS_MIPS_CPS
+	select SYS_SUPPORTS_MULTITHREADING
+	select USE_OF
+	help
+	  Select this to build a kernel which supports SoCs from Siflower
+	  with MIPS InterAptiv cores, like Siflower SF19A2890.
+
 config SNI_RM
 	bool "SNI RM200/300/400"
 	select ARC_MEMORY
diff --git a/arch/mips/generic/Platform b/arch/mips/generic/Platform
index 0c03623f3897..c09a8484db9b 100644
--- a/arch/mips/generic/Platform
+++ b/arch/mips/generic/Platform
@@ -10,6 +10,7 @@
 
 # Note: order matters, keep the asm/mach-generic include last.
 cflags-$(CONFIG_MACH_INGENIC_SOC)	+= -I$(srctree)/arch/mips/include/asm/mach-ingenic
+cflags-$(CONFIG_MACH_SIFLOWER_MIPS)	+= -I$(srctree)/arch/mips/include/asm/mach-siflower
 cflags-$(CONFIG_MIPS_GENERIC)	+= -I$(srctree)/arch/mips/include/asm/mach-generic
 
 load-$(CONFIG_MIPS_GENERIC)	+= 0xffffffff80100000
diff --git a/arch/mips/include/asm/mach-siflower/kmalloc.h b/arch/mips/include/asm/mach-siflower/kmalloc.h
new file mode 100644
index 000000000000..d0b270e2ec64
--- /dev/null
+++ b/arch/mips/include/asm/mach-siflower/kmalloc.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_MACH_SIFLOWER_KMALLOC_H
+#define __ASM_MACH_SIFLOWER_KMALLOC_H
+
+#ifdef CONFIG_DMA_NONCOHERENT
+#define ARCH_DMA_MINALIGN	32
+#endif
+
+#endif /* __ASM_MACH_SIFLOWER_KMALLOC_H */
-- 
2.48.1


