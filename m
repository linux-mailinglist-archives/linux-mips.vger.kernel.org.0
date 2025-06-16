Return-Path: <linux-mips+bounces-9326-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8B2ADA5ED
	for <lists+linux-mips@lfdr.de>; Mon, 16 Jun 2025 03:43:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0334D18902FC
	for <lists+linux-mips@lfdr.de>; Mon, 16 Jun 2025 01:43:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 896C1289814;
	Mon, 16 Jun 2025 01:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aqiXmBrA"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E81289802;
	Mon, 16 Jun 2025 01:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750038118; cv=none; b=IGj+iKZGQM4fw13ttatFj2JWSgutyPdWbf5cU/1wmvI50jMdE9Qxpaoav9vITrE51jJgQ7GTmCi1UNdEe04coxfdIf0uKKIbEQHlz5r9XvJvbKdW7LkhVUP1WboNizVqHcqdyeNzrB16/DU3DS/w/Xl9Kr4qdx8tbUubFohDEm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750038118; c=relaxed/simple;
	bh=/OUBebx8cR5O9HN1vrTP7fR+8DbcCfZAKgQbXYsaEr0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dTIbRH5wVMtRQgboC7Aa6LiCP/2B34qt+KRRWQGNqF4oXNUwZvfz6F8IJBFsV4mVV6s4KXcXW3cYlSaw3RES4L82k6b0TslPuw73RpTpb6I4JUIV3mn/7vAEC7vpr6U0lgC++06wNK/jADN0Xin2EcYY9r55dZooMGYDip/k7zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aqiXmBrA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E196AC4CEF5;
	Mon, 16 Jun 2025 01:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750038118;
	bh=/OUBebx8cR5O9HN1vrTP7fR+8DbcCfZAKgQbXYsaEr0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aqiXmBrAwvo++zUC0AbPG0JOVgYhBgrunpGmDYtJECvE7XRPuLb3FBKSKMfhWUj3c
	 1y1GZIgLVACfZkZNZaFg4t4LXbVB+lXsnHSqznQI53o8IF/xu3emEl+50Q1L8vCHge
	 hvx5243UCiq5zPWhEtkov4qVzMCX8fqHmYIENQlHHu2MyOj/2hfnxxKxk+Xuz8JKno
	 c8gBEX4acW1gIY3jASt5OEaHzhWH1E31Esk3j2VhT1CSXIPwBX0TdKht7xJvHqEoBZ
	 Ibw/4+eIEkipFB1KPKOHjGUSKyJzBWX9a+tRgmN38G8vD4Ch/xGnezKv0Qopj3dpw1
	 dwKvCIARJ+Ncw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH v2 11/17] mips: cavium-octeon: move octeon-crypto.h into asm directory
Date: Sun, 15 Jun 2025 18:40:13 -0700
Message-ID: <20250616014019.415791-12-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250616014019.415791-1-ebiggers@kernel.org>
References: <20250616014019.415791-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Eric Biggers <ebiggers@google.com>

Since arch/mips/cavium-octeon/crypto/octeon-crypto.h is now needed
outside of its directory, move it to
arch/mips/include/asm/octeon/crypto.h so that it can be included as
<asm/octeon/crypto.h>.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/mips/cavium-octeon/crypto/octeon-crypto.c                 | 3 +--
 arch/mips/cavium-octeon/crypto/octeon-md5.c                    | 3 +--
 arch/mips/cavium-octeon/crypto/octeon-sha1.c                   | 3 +--
 arch/mips/cavium-octeon/crypto/octeon-sha256.c                 | 3 +--
 arch/mips/cavium-octeon/crypto/octeon-sha512.c                 | 3 +--
 .../crypto/octeon-crypto.h => include/asm/octeon/crypto.h}     | 0
 6 files changed, 5 insertions(+), 10 deletions(-)
 rename arch/mips/{cavium-octeon/crypto/octeon-crypto.h => include/asm/octeon/crypto.h} (100%)

diff --git a/arch/mips/cavium-octeon/crypto/octeon-crypto.c b/arch/mips/cavium-octeon/crypto/octeon-crypto.c
index cfb4a146cf178..0ff8559391f5b 100644
--- a/arch/mips/cavium-octeon/crypto/octeon-crypto.c
+++ b/arch/mips/cavium-octeon/crypto/octeon-crypto.c
@@ -5,16 +5,15 @@
  *
  * Copyright (C) 2004-2012 Cavium Networks
  */
 
 #include <asm/cop2.h>
+#include <asm/octeon/crypto.h>
 #include <linux/export.h>
 #include <linux/interrupt.h>
 #include <linux/sched/task_stack.h>
 
-#include "octeon-crypto.h"
-
 /**
  * Enable access to Octeon's COP2 crypto hardware for kernel use. Wrap any
  * crypto operations in calls to octeon_crypto_enable/disable in order to make
  * sure the state of COP2 isn't corrupted if userspace is also performing
  * hardware crypto operations. Allocate the state parameter on the stack.
diff --git a/arch/mips/cavium-octeon/crypto/octeon-md5.c b/arch/mips/cavium-octeon/crypto/octeon-md5.c
index fbc84eb7fedf5..a8ce831e2cebd 100644
--- a/arch/mips/cavium-octeon/crypto/octeon-md5.c
+++ b/arch/mips/cavium-octeon/crypto/octeon-md5.c
@@ -17,20 +17,19 @@
  * under the terms of the GNU General Public License as published by the Free
  * Software Foundation; either version 2 of the License, or (at your option)
  * any later version.
  */
 
+#include <asm/octeon/crypto.h>
 #include <asm/octeon/octeon.h>
 #include <crypto/internal/hash.h>
 #include <crypto/md5.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/string.h>
 #include <linux/unaligned.h>
 
-#include "octeon-crypto.h"
-
 struct octeon_md5_state {
 	__le32 hash[MD5_HASH_WORDS];
 	u64 byte_count;
 };
 
diff --git a/arch/mips/cavium-octeon/crypto/octeon-sha1.c b/arch/mips/cavium-octeon/crypto/octeon-sha1.c
index e70f21a473daf..e4a369a7764fb 100644
--- a/arch/mips/cavium-octeon/crypto/octeon-sha1.c
+++ b/arch/mips/cavium-octeon/crypto/octeon-sha1.c
@@ -11,20 +11,19 @@
  * Copyright (c) Alan Smithee.
  * Copyright (c) Andrew McDonald <andrew@mcdonald.org.uk>
  * Copyright (c) Jean-Francois Dive <jef@linuxbe.org>
  */
 
+#include <asm/octeon/crypto.h>
 #include <asm/octeon/octeon.h>
 #include <crypto/internal/hash.h>
 #include <crypto/sha1.h>
 #include <crypto/sha1_base.h>
 #include <linux/errno.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 
-#include "octeon-crypto.h"
-
 /*
  * We pass everything as 64-bit. OCTEON can handle misaligned data.
  */
 
 static void octeon_sha1_store_hash(struct sha1_state *sctx)
diff --git a/arch/mips/cavium-octeon/crypto/octeon-sha256.c b/arch/mips/cavium-octeon/crypto/octeon-sha256.c
index f93faaf1f4af6..c20038239cb6b 100644
--- a/arch/mips/cavium-octeon/crypto/octeon-sha256.c
+++ b/arch/mips/cavium-octeon/crypto/octeon-sha256.c
@@ -10,17 +10,16 @@
  * Copyright (c) Andrew McDonald <andrew@mcdonald.org.uk>
  * Copyright (c) 2002 James Morris <jmorris@intercode.com.au>
  * SHA224 Support Copyright 2007 Intel Corporation <jonathan.lynch@intel.com>
  */
 
+#include <asm/octeon/crypto.h>
 #include <asm/octeon/octeon.h>
 #include <crypto/internal/sha2.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 
-#include "octeon-crypto.h"
-
 /*
  * We pass everything as 64-bit. OCTEON can handle misaligned data.
  */
 
 void sha256_blocks_arch(u32 state[SHA256_STATE_WORDS],
diff --git a/arch/mips/cavium-octeon/crypto/octeon-sha512.c b/arch/mips/cavium-octeon/crypto/octeon-sha512.c
index 215311053db3c..53de74f642db0 100644
--- a/arch/mips/cavium-octeon/crypto/octeon-sha512.c
+++ b/arch/mips/cavium-octeon/crypto/octeon-sha512.c
@@ -11,19 +11,18 @@
  * Copyright (c) Jean-Luc Cooke <jlcooke@certainkey.com>
  * Copyright (c) Andrew McDonald <andrew@mcdonald.org.uk>
  * Copyright (c) 2003 Kyle McMartin <kyle@debian.org>
  */
 
+#include <asm/octeon/crypto.h>
 #include <asm/octeon/octeon.h>
 #include <crypto/internal/hash.h>
 #include <crypto/sha2.h>
 #include <crypto/sha512_base.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 
-#include "octeon-crypto.h"
-
 /*
  * We pass everything as 64-bit. OCTEON can handle misaligned data.
  */
 
 static void octeon_sha512_store_hash(struct sha512_state *sctx)
diff --git a/arch/mips/cavium-octeon/crypto/octeon-crypto.h b/arch/mips/include/asm/octeon/crypto.h
similarity index 100%
rename from arch/mips/cavium-octeon/crypto/octeon-crypto.h
rename to arch/mips/include/asm/octeon/crypto.h
-- 
2.49.0


