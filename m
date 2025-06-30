Return-Path: <linux-mips+bounces-9559-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 161F2AEE377
	for <lists+linux-mips@lfdr.de>; Mon, 30 Jun 2025 18:07:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD9561BC080D
	for <lists+linux-mips@lfdr.de>; Mon, 30 Jun 2025 16:06:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE60D293C44;
	Mon, 30 Jun 2025 16:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ApnEO8WU"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786E8293B53;
	Mon, 30 Jun 2025 16:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751299526; cv=none; b=Ud2g2uKOtEyVp9VTDBHMu19jtcTmiXA/fm6fhXAzyEQlW4z1ih6Lg157J/d8PJBSNBXvI342G+9AjNizSAfk5INnkAkSKVieamlnNb1UOR7QW0c+p6ZOZLbM/gwP/LmwWX+nvswFwgN37T2RwaxziSqcPfrLY/xMKe7Kfp6uBmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751299526; c=relaxed/simple;
	bh=JG4DTgucZUrWoEuYJPtjg0ziG3DV7kKAWZi/WwQtPT8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XGatXojMEtPDrWNVw7ZawJO4bIFUX947RMPJtAwRnb4zkArWckDWImx0+Uy04HiRt27eBoo0PLEMcVGa79xBLTqNAhHsKuce20RfGyy0PlQTYg/4YOxad1yvUfJdsRfoQsGC1thgia+Cuo3lUOKIxskwU1EH3tYSk8waZ3Zs0M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ApnEO8WU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B72D0C4CEF5;
	Mon, 30 Jun 2025 16:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751299526;
	bh=JG4DTgucZUrWoEuYJPtjg0ziG3DV7kKAWZi/WwQtPT8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ApnEO8WUpJ+HKPFHeRZUHExWJBFUYzvVnT6VdNOePMw9WGwx8hz6EmDTiW70uLQ1D
	 JVwjyKEx1AEGxEvedB7Hsm1TGLFnWP+Iz1kWVUW13AlOPPasV+0VIpNabEw5Ztz996
	 gtgEP6gkKn8Lf+T7iqB71BKDIReiN/L0P5pUiEkmApW0eQ/JybpRt3W3xIAWXsjj8I
	 +DZuchFl4lzxIpizrG+v3v3higRcxF2I1ZGnPKWcatTcoMhuC6kA4jMZ8jLlFtjV52
	 vQePNePrSq1BSGwtEjjE7ygZUS1d1mJMEWQcscWCIIH5OcSga0/DyKYR5gH6Yazmws
	 FJ1WA8zdeA8nw==
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
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v3 09/16] mips: cavium-octeon: Move octeon-crypto.h into asm directory
Date: Mon, 30 Jun 2025 09:03:13 -0700
Message-ID: <20250630160320.2888-10-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250630160320.2888-1-ebiggers@kernel.org>
References: <20250630160320.2888-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since arch/mips/cavium-octeon/crypto/octeon-crypto.h is now needed
outside of its directory, move it to
arch/mips/include/asm/octeon/crypto.h so that it can be included as
<asm/octeon/crypto.h>.

Acked-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
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
2.50.0


