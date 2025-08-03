Return-Path: <linux-mips+bounces-9974-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E1FB1953C
	for <lists+linux-mips@lfdr.de>; Sun,  3 Aug 2025 22:45:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EC0E67A54A5
	for <lists+linux-mips@lfdr.de>; Sun,  3 Aug 2025 20:44:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3438C204F9B;
	Sun,  3 Aug 2025 20:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N+KsnGpw"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020B02040A8;
	Sun,  3 Aug 2025 20:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754253932; cv=none; b=QEKj2RNJe+qYwa5peUw730MQNhD5rjX3NoVVI5ahx3zwxJR/wmF5vGXjznmUmKaa9mLXhIvqq8nHfT2Vino7g1h0JbDyMCqakEbUiKfG4/MXESNpKcDpZH+/8YJLShxsCD/VHkx8mYmvfxJCyPA0wAO++YUEToGBkFEJXXGN+E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754253932; c=relaxed/simple;
	bh=VRc4KV6AcWRLoeXQnbyPvjrtyrIbJyC0ogU8BITtRHo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UTb/rXLCEoYTB5N2mWybErzNG4m+WivvYPGIcH5VmfUj556+NIlZhcPGtEVvPMT8DLoHaaDwHyJEbbIgcoBJFFxkJaRga0hKToy2f7tjzXZddBl5Debka4lHalufgDloSZ3k/7JkF+/NWszCiHNkx4yTpIoGekzBJUEkOrmqMc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N+KsnGpw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E213FC4CEF8;
	Sun,  3 Aug 2025 20:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754253931;
	bh=VRc4KV6AcWRLoeXQnbyPvjrtyrIbJyC0ogU8BITtRHo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N+KsnGpwwuxsYDM6Sea4+60NJiUpAY1xBL7i4Ncuh9/IGMN+PP98T5E33HylbqP5x
	 ywCULf8wxqBHVYCyozXKT5KtiYKzTnv6N2133o0uDoVwjmQAZ0g7ISNmkU7ynDCy0u
	 Z3AbK/lF0H4tUAlfc/8/8EXgbifVXGEzY1sT7mFWbjeWMNlnFb/aIdS5hLN1Dqj2PB
	 SC/MQLHXzpVPseIOmW/BdQitYsHQbMCgpSg1DmhcS/w6aQ/UiRww15xIqbPCEC21Qt
	 auxAaPZr3YaHE+cATbrrESlpIvPJSquumBHOI/8luwN/6JuUf77351xY1YfZ/qoJEU
	 lsW4TtCEcyKYA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 2/7] mips: cavium-octeon: Move octeon-crypto.c into parent dir
Date: Sun,  3 Aug 2025 13:44:28 -0700
Message-ID: <20250803204433.75703-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803204433.75703-1-ebiggers@kernel.org>
References: <20250803204433.75703-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since octeon-crypto.c is the only remaining source file in
arch/mips/cavium-octeon/crypto/, move it into its parent directory
arch/mips/cavium-octeon/.  Then remove the directory
arch/mips/cavium-octeon/crypto/, including its Makefile.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/mips/cavium-octeon/Makefile                     | 2 +-
 arch/mips/cavium-octeon/crypto/Makefile              | 6 ------
 arch/mips/cavium-octeon/{crypto => }/octeon-crypto.c | 0
 3 files changed, 1 insertion(+), 7 deletions(-)
 delete mode 100644 arch/mips/cavium-octeon/crypto/Makefile
 rename arch/mips/cavium-octeon/{crypto => }/octeon-crypto.c (100%)

diff --git a/arch/mips/cavium-octeon/Makefile b/arch/mips/cavium-octeon/Makefile
index 2a59265788413..ab84ede0cbe0e 100644
--- a/arch/mips/cavium-octeon/Makefile
+++ b/arch/mips/cavium-octeon/Makefile
@@ -9,12 +9,12 @@
 # Copyright (C) 2005-2009 Cavium Networks
 #
 
 obj-y := cpu.o setup.o octeon-platform.o octeon-irq.o csrc-octeon.o
 obj-y += dma-octeon.o
+obj-y += octeon-crypto.o
 obj-y += octeon-memcpy.o
 obj-y += executive/
-obj-y += crypto/
 
 obj-$(CONFIG_MTD)		      += flash_setup.o
 obj-$(CONFIG_SMP)		      += smp.o
 obj-$(CONFIG_OCTEON_ILM)	      += oct_ilm.o
diff --git a/arch/mips/cavium-octeon/crypto/Makefile b/arch/mips/cavium-octeon/crypto/Makefile
deleted file mode 100644
index b7d03e8a03187..0000000000000
--- a/arch/mips/cavium-octeon/crypto/Makefile
+++ /dev/null
@@ -1,6 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-#
-# OCTEON-specific crypto modules.
-#
-
-obj-y += octeon-crypto.o
diff --git a/arch/mips/cavium-octeon/crypto/octeon-crypto.c b/arch/mips/cavium-octeon/octeon-crypto.c
similarity index 100%
rename from arch/mips/cavium-octeon/crypto/octeon-crypto.c
rename to arch/mips/cavium-octeon/octeon-crypto.c
-- 
2.50.1


