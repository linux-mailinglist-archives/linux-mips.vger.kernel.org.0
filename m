Return-Path: <linux-mips+bounces-9784-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBAEB02E05
	for <lists+linux-mips@lfdr.de>; Sun, 13 Jul 2025 01:30:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D6E61894334
	for <lists+linux-mips@lfdr.de>; Sat, 12 Jul 2025 23:30:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB328242D8E;
	Sat, 12 Jul 2025 23:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TruHvLVH"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5170242D6D;
	Sat, 12 Jul 2025 23:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752362789; cv=none; b=Nmi1LOg+bK4t7Nl65wUCbXg+V6AzyMp5U9DUG6sV5YjJ+O7LBhaGL4ngBcCo2D3X7dCkeGmAIsVcSCLhEcRSxqEdsPlDjmFlrsSY8Nf5IpTVHl6UAdTLGPS0sPEX9EF21QW3qBKJhvXqlRIE5vQkDspsavQoLrOiOKPshdBoi4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752362789; c=relaxed/simple;
	bh=RedRxFFHKVy5vtVyY+MZJNiBk1oOHQ1I/68b2H+lbA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=scySWXBw4KFxUmEMkh7pJ0lSFVZwWKsINRe31jyknr8Jgf/bB6j9U4rvp+DEUCG33+yqSRfO0tjhCsTBYHRCUB+K/THtUrEX9M2llrSsmyJsu/bBEYd+jFF2wQV3kCpJQ1vTfjnZdpSyzx+S4qd7z32/hzd9DKAnDC+WwiFhZII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TruHvLVH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9DD0C4CEEF;
	Sat, 12 Jul 2025 23:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752362789;
	bh=RedRxFFHKVy5vtVyY+MZJNiBk1oOHQ1I/68b2H+lbA4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TruHvLVHxzmKSDlYw1X7RzNkw2reqbswxSziZxBysLXETgCfeJYJssRnoaL1nzchi
	 mi9LuEPvy1/hCsL7g5ruwnoqxWESCQwA0R6D++X5zLp+a1AP/SYpw+WEAZjvmFQX6i
	 m5sZe95u3ReCd2zA9v1HzPEzPx2HWU3ceCbr7feHlOPjPGB1S+Avh8UHhOh6Qd9t+q
	 9f4qhYO4xgQ30f+8sg3fvb3SJc4mvuEfy5lY9MGKg3uEMndll+YQh3+Gn88Rkq4xXy
	 9QbE4KXhY4FA2wx4Y5mO4lq71JIx2mLl3fKyCGcWwCY0X/KHwZI+dqmIh49OgDsD95
	 5DEcBVAIH3xUw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 19/26] tee: Use SHA-1 library instead of crypto_shash
Date: Sat, 12 Jul 2025 16:23:10 -0700
Message-ID: <20250712232329.818226-20-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250712232329.818226-1-ebiggers@kernel.org>
References: <20250712232329.818226-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the SHA-1 library functions instead of crypto_shash.  This is
simpler and faster.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 drivers/tee/Kconfig    |  3 +--
 drivers/tee/tee_core.c | 55 +++++++-----------------------------------
 2 files changed, 10 insertions(+), 48 deletions(-)

diff --git a/drivers/tee/Kconfig b/drivers/tee/Kconfig
index 61b507c187801..a84767940fbfc 100644
--- a/drivers/tee/Kconfig
+++ b/drivers/tee/Kconfig
@@ -1,12 +1,11 @@
 # SPDX-License-Identifier: GPL-2.0-only
 # Generic Trusted Execution Environment Configuration
 menuconfig TEE
 	tristate "Trusted Execution Environment support"
 	depends on HAVE_ARM_SMCCC || COMPILE_TEST || CPU_SUP_AMD
-	select CRYPTO
-	select CRYPTO_SHA1
+	select CRYPTO_LIB_SHA1
 	select DMA_SHARED_BUFFER
 	select GENERIC_ALLOCATOR
 	help
 	  This implements a generic interface towards a Trusted Execution
 	  Environment (TEE).
diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index acc7998758ad8..4c82a171bff20 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -12,11 +12,10 @@
 #include <linux/module.h>
 #include <linux/overflow.h>
 #include <linux/slab.h>
 #include <linux/tee_core.h>
 #include <linux/uaccess.h>
-#include <crypto/hash.h>
 #include <crypto/sha1.h>
 #include "tee_private.h"
 
 #define TEE_NUM_DEVICES	32
 
@@ -140,72 +139,36 @@ static int tee_release(struct inode *inode, struct file *filp)
  * UUIDv5 is specific in RFC 4122.
  *
  * This implements section (for SHA-1):
  * 4.3.  Algorithm for Creating a Name-Based UUID
  */
-static int uuid_v5(uuid_t *uuid, const uuid_t *ns, const void *name,
-		   size_t size)
+static void uuid_v5(uuid_t *uuid, const uuid_t *ns, const void *name,
+		    size_t size)
 {
+	struct sha1_ctx ctx;
 	unsigned char hash[SHA1_DIGEST_SIZE];
-	struct crypto_shash *shash = NULL;
-	struct shash_desc *desc = NULL;
-	int rc;
-
-	shash = crypto_alloc_shash("sha1", 0, 0);
-	if (IS_ERR(shash)) {
-		rc = PTR_ERR(shash);
-		pr_err("shash(sha1) allocation failed\n");
-		return rc;
-	}
-
-	desc = kzalloc(sizeof(*desc) + crypto_shash_descsize(shash),
-		       GFP_KERNEL);
-	if (!desc) {
-		rc = -ENOMEM;
-		goto out_free_shash;
-	}
-
-	desc->tfm = shash;
 
-	rc = crypto_shash_init(desc);
-	if (rc < 0)
-		goto out_free_desc;
-
-	rc = crypto_shash_update(desc, (const u8 *)ns, sizeof(*ns));
-	if (rc < 0)
-		goto out_free_desc;
-
-	rc = crypto_shash_update(desc, (const u8 *)name, size);
-	if (rc < 0)
-		goto out_free_desc;
-
-	rc = crypto_shash_final(desc, hash);
-	if (rc < 0)
-		goto out_free_desc;
+	sha1_init(&ctx);
+	sha1_update(&ctx, (const u8 *)ns, sizeof(*ns));
+	sha1_update(&ctx, (const u8 *)name, size);
+	sha1_final(&ctx, hash);
 
 	memcpy(uuid->b, hash, UUID_SIZE);
 
 	/* Tag for version 5 */
 	uuid->b[6] = (hash[6] & 0x0F) | 0x50;
 	uuid->b[8] = (hash[8] & 0x3F) | 0x80;
-
-out_free_desc:
-	kfree(desc);
-
-out_free_shash:
-	crypto_free_shash(shash);
-	return rc;
 }
 
 int tee_session_calc_client_uuid(uuid_t *uuid, u32 connection_method,
 				 const u8 connection_data[TEE_IOCTL_UUID_LEN])
 {
 	gid_t ns_grp = (gid_t)-1;
 	kgid_t grp = INVALID_GID;
 	char *name = NULL;
 	int name_len;
-	int rc;
+	int rc = 0;
 
 	if (connection_method == TEE_IOCTL_LOGIN_PUBLIC ||
 	    connection_method == TEE_IOCTL_LOGIN_REE_KERNEL) {
 		/* Nil UUID to be passed to TEE environment */
 		uuid_copy(uuid, &uuid_null);
@@ -258,11 +221,11 @@ int tee_session_calc_client_uuid(uuid_t *uuid, u32 connection_method,
 	default:
 		rc = -EINVAL;
 		goto out_free_name;
 	}
 
-	rc = uuid_v5(uuid, &tee_client_uuid_ns, name, name_len);
+	uuid_v5(uuid, &tee_client_uuid_ns, name, name_len);
 out_free_name:
 	kfree(name);
 
 	return rc;
 }
-- 
2.50.1


