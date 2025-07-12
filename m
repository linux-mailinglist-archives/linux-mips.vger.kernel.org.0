Return-Path: <linux-mips+bounces-9767-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 49561B02D93
	for <lists+linux-mips@lfdr.de>; Sun, 13 Jul 2025 01:26:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D30B4A3D32
	for <lists+linux-mips@lfdr.de>; Sat, 12 Jul 2025 23:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2C88231A30;
	Sat, 12 Jul 2025 23:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cmmwf+fA"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FB7231840;
	Sat, 12 Jul 2025 23:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752362781; cv=none; b=neO53Ow9EfwcwfLIZ7R40SERHeg2rGo4IAiRX/UU2XkyDVbhrjP6xucEOz7B+qcSqy7SBMCLisse5cgaQIYgV46+C42Aa/DD8YHbgQxOGdy9u5rKPILlgsdXTiG1q/C5VplsEKNO+5kUfh5D9m4ZuNiCRTcHwEl/N6GRy7bG+kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752362781; c=relaxed/simple;
	bh=E22JI/nh2KoyIuwx+c+Le9v+4pE3ucXhZL4d/YBdz7g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NI7a5C73oqMM3Mnhw7fuVV4OD5sJRGXmqzMJgnAA7hDrqYHp2WgPfl+uW550C0O2WMi7CimEz01xQgD2DqZJp8E+mgV4KWz1ECJSGo0mr77+xRHwGLIWFW2WRpCIaO78+ic79TXV+GG/jOtvSmF3Ibh+K5bQbpvAzzk4YMgwy8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cmmwf+fA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E19DEC4CEF8;
	Sat, 12 Jul 2025 23:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752362781;
	bh=E22JI/nh2KoyIuwx+c+Le9v+4pE3ucXhZL4d/YBdz7g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cmmwf+fAlxfZeUlUdvV1RStLqLkPiW2zfJ2zBPrVlnr7L04CcfPF3I/ZY61mhxqzF
	 UmqYAUQ4svnDAjD64/qd2nbDs5VfdmZ+Wdl6axs+Pp2dBobCdfzKvfiUfyjWyV0Emu
	 bnFJy4JMfW/NLQp1h1EAuLTEdvJJVjXcMFnzNKc2usi851QxfTu1Eem5KjkNwGll5f
	 lgQrbXzEIq4c4ZedmXzCDpa9WeJNZgMl9S3h/6kVtOWN5EVdkv3MDG/a3Oum868UU6
	 SfJiyW/fELObXrfYbVzrJFLlz3eNbYdmWQXsdfzTPEmjVRv+y4B1yYLAvoaYPKAIou
	 1xYQp8kEh20rg==
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
Subject: [PATCH 02/26] lib/crypto: sha1: Rename sha1_init() to sha1_init_raw()
Date: Sat, 12 Jul 2025 16:22:53 -0700
Message-ID: <20250712232329.818226-3-ebiggers@kernel.org>
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

Rename the existing sha1_init() to sha1_init_raw(), since it conflicts
with the upcoming library function.  This will later be removed, but
this keeps the kernel building for the introduction of the library.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 include/crypto/sha1.h | 2 +-
 kernel/bpf/core.c     | 2 +-
 lib/crypto/sha1.c     | 6 +++---
 net/ipv6/addrconf.c   | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/crypto/sha1.h b/include/crypto/sha1.h
index f48230b1413c3..d853d3b931699 100644
--- a/include/crypto/sha1.h
+++ b/include/crypto/sha1.h
@@ -31,9 +31,9 @@ struct sha1_state {
  * You shouldn't be using SHA-1, and even if you *have* to use SHA-1, this isn't
  * the correct way to hash something with SHA-1 (use crypto_shash instead).
  */
 #define SHA1_DIGEST_WORDS	(SHA1_DIGEST_SIZE / 4)
 #define SHA1_WORKSPACE_WORDS	16
-void sha1_init(__u32 *buf);
+void sha1_init_raw(__u32 *buf);
 void sha1_transform(__u32 *digest, const char *data, __u32 *W);
 
 #endif /* _CRYPTO_SHA1_H */
diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
index c20babbf998f4..dae281a1286d5 100644
--- a/kernel/bpf/core.c
+++ b/kernel/bpf/core.c
@@ -302,11 +302,11 @@ int bpf_prog_calc_tag(struct bpf_prog *fp)
 
 	raw = vmalloc(raw_size);
 	if (!raw)
 		return -ENOMEM;
 
-	sha1_init(digest);
+	sha1_init_raw(digest);
 	memset(ws, 0, sizeof(ws));
 
 	/* We need to take out the map fd for the digest calculation
 	 * since they are unstable from user space side.
 	 */
diff --git a/lib/crypto/sha1.c b/lib/crypto/sha1.c
index 6d809c3088be3..813ad96daa25a 100644
--- a/lib/crypto/sha1.c
+++ b/lib/crypto/sha1.c
@@ -122,20 +122,20 @@ void sha1_transform(__u32 *digest, const char *data, __u32 *array)
 	digest[4] += E;
 }
 EXPORT_SYMBOL(sha1_transform);
 
 /**
- * sha1_init - initialize the vectors for a SHA1 digest
+ * sha1_init_raw - initialize the vectors for a SHA1 digest
  * @buf: vector to initialize
  */
-void sha1_init(__u32 *buf)
+void sha1_init_raw(__u32 *buf)
 {
 	buf[0] = 0x67452301;
 	buf[1] = 0xefcdab89;
 	buf[2] = 0x98badcfe;
 	buf[3] = 0x10325476;
 	buf[4] = 0xc3d2e1f0;
 }
-EXPORT_SYMBOL(sha1_init);
+EXPORT_SYMBOL(sha1_init_raw);
 
 MODULE_DESCRIPTION("SHA-1 Algorithm");
 MODULE_LICENSE("GPL");
diff --git a/net/ipv6/addrconf.c b/net/ipv6/addrconf.c
index ba2ec7c870ccb..d0e5b94c10af4 100644
--- a/net/ipv6/addrconf.c
+++ b/net/ipv6/addrconf.c
@@ -3365,11 +3365,11 @@ static int ipv6_generate_stable_address(struct in6_addr *address,
 		return -1;
 
 retry:
 	spin_lock_bh(&lock);
 
-	sha1_init(digest);
+	sha1_init_raw(digest);
 	memset(&data, 0, sizeof(data));
 	memset(workspace, 0, sizeof(workspace));
 	memcpy(data.hwaddr, idev->dev->perm_addr, idev->dev->addr_len);
 	data.prefix[0] = address->s6_addr32[0];
 	data.prefix[1] = address->s6_addr32[1];
-- 
2.50.1


