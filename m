Return-Path: <linux-mips+bounces-10032-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B109B1BC91
	for <lists+linux-mips@lfdr.de>; Wed,  6 Aug 2025 00:30:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9314627F87
	for <lists+linux-mips@lfdr.de>; Tue,  5 Aug 2025 22:30:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3050291C12;
	Tue,  5 Aug 2025 22:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r/HPibEG"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE358283FEE;
	Tue,  5 Aug 2025 22:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754433008; cv=none; b=ro/+B/YIc62JaLQRcH5aD7PDfz25+bfNVJ2yUXTcbkVa7ZQ2B4yvgceXYQxHLfHyDxd9HCj2GqS9WPtZWsgsBs7V94utLSNuYlZJRDSk6t9hXbYhiQKVt+2K9zV192OUSTd/AUzk7isQpXnxXEJR6mO7q78Cfah5redFgaqR4LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754433008; c=relaxed/simple;
	bh=VRc4KV6AcWRLoeXQnbyPvjrtyrIbJyC0ogU8BITtRHo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FvzW3l4zCp9Fg1VIsDT7TW4WPgAHUqNJdYWQbz0iY9c/lPv3G4OJ1B8UMJrhkKWsKBBskX4lmhslCWc1AHt9TCbqXa799VdhsPsueZ91Pvy8rhcWpKlTwf18Nl1DvowfQtNiKfQN2WbLQZMcOg5cLMy7w7zNmgt7HxXAvbRpvnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r/HPibEG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1517BC4CEFA;
	Tue,  5 Aug 2025 22:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754433008;
	bh=VRc4KV6AcWRLoeXQnbyPvjrtyrIbJyC0ogU8BITtRHo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r/HPibEGVSJ55Kdivcxfl4OtFhQRmH//SQRo23gj/tJjHsIsd0mSraovQNVi/WBKA
	 cY3UZo2uOlhxH8Wyu4EMvmZeA3Wrs/Y05176OMN0ofcWIXSsDAq6vwnjaXPLJLIvt+
	 ewDrV1sjW00zJcNzAT81G6fHrNvoPsTF4EGf2NyJ6HkOUIcv0vvOEVe9wR6yM/Zl0k
	 ZurMIu/XzEApEyKYVjQLRl6Ttg59UYm43evi3Qy5YX+fpbkFu2XmJYf6IqLWcm6+bY
	 Mp7Od81jWSCz7WBPI/STFw11P18reMYBoAJn8ntZCGM1TW633Y2im6rxoGUcKpDISA
	 tCE7HqgIx6VYw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v2 3/7] mips: cavium-octeon: Move octeon-crypto.c into parent dir
Date: Tue,  5 Aug 2025 15:28:51 -0700
Message-ID: <20250805222855.10362-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250805222855.10362-1-ebiggers@kernel.org>
References: <20250805222855.10362-1-ebiggers@kernel.org>
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


