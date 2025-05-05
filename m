Return-Path: <linux-mips+bounces-8914-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A8AAA9B62
	for <lists+linux-mips@lfdr.de>; Mon,  5 May 2025 20:19:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F2F21189CD25
	for <lists+linux-mips@lfdr.de>; Mon,  5 May 2025 18:19:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 966BF26FA5F;
	Mon,  5 May 2025 18:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IdccGkzZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCC12566D9;
	Mon,  5 May 2025 18:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746469164; cv=none; b=E9dmV5/FKJQaGjTSmx0M+jBsi5MesgpKmA8Uxzk6ffqqWBvDhkVoDWs9kH0We6E2xa66woMwFRYpUNognritkWIivN5l2zvhLGiWy9Z3j7pFVEabNPjeaoWNNh62iH2yhBgL2vbNC0q+Ohu7Q6/BbMrJhzJyNrHO4zvzaPKJ/fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746469164; c=relaxed/simple;
	bh=mMc5BO3KaWzzAhqaUs9saVNrK9FbauW+oehe6PKy+Aw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ARe09G9pKwPVroAza6KARXGdcSXuCW08kjG0+mg5IAendOput5Dzpg9etv8AfMTGA6rVjNXIb40zcnm4O7MgFM2OgFPHZOwjSu+9PN97gCPkzpQXlTkgIqz0h1V8PNIgA6kVwfXXhKWFpeOKuvvT0siNhm5Pjw21tMrTmqzmZdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IdccGkzZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA062C4CEF2;
	Mon,  5 May 2025 18:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746469164;
	bh=mMc5BO3KaWzzAhqaUs9saVNrK9FbauW+oehe6PKy+Aw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IdccGkzZQnmV4j3zL0qW2HEPMFQO7Lbww2PjWdjgi17/TjJjHo3Rabs0jOB2pLBFR
	 BNystxBX4qdoUELqjrc8NRgh4C6DjNKebmGQQv4FS+8mziYF0YiD5rENIf9z+kTYQo
	 d/5anHb8+6JLhMlascA+6GaHteo22tUvh09FwyEJKqzORMaKb3DgTTSNzhVmuXmmE0
	 Jr1NQbeZonSiGvqI9p9VDbFjLVPnTv/FDbVSc+/MEpQj9N6o9vOdldAqt/tkvpP1fX
	 RlHYn2sj2qI+hhlBZdf50Md2DXuONGO0ckmyZ6fIjPKP/cDcPY76pUPCDIqrLnfjvV
	 E3yOy0SyJb5hA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-bcachefs@vger.kernel.org,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Theodore Ts'o <tytso@mit.edu>
Subject: [PATCH 3/4] crypto: lib/chacha - add strongly-typed state zeroization
Date: Mon,  5 May 2025 11:18:23 -0700
Message-ID: <20250505181824.647138-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250505181824.647138-1-ebiggers@kernel.org>
References: <20250505181824.647138-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Eric Biggers <ebiggers@google.com>

Now that the ChaCha state matrix is strongly-typed, add a helper
function chacha_zeroize_state() which zeroizes it.  Then convert all
applicable callers to use it instead of direct memzero_explicit.  No
functional changes.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 drivers/char/random.c         | 4 ++--
 fs/bcachefs/checksum.c        | 4 ++--
 include/crypto/chacha.h       | 6 ++++++
 lib/crypto/chacha20poly1305.c | 6 +++---
 4 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/char/random.c b/drivers/char/random.c
index 9f876ed2655b..5f22a08101f6 100644
--- a/drivers/char/random.c
+++ b/drivers/char/random.c
@@ -420,11 +420,11 @@ static void _get_random_bytes(void *buf, size_t len)
 			++chacha_state.x[13];
 		len -= CHACHA_BLOCK_SIZE;
 		buf += CHACHA_BLOCK_SIZE;
 	}
 
-	memzero_explicit(&chacha_state, sizeof(chacha_state));
+	chacha_zeroize_state(&chacha_state);
 }
 
 /*
  * This returns random bytes in arbitrary quantities. The quality of the
  * random bytes is good as /dev/urandom. In order to ensure that the
@@ -483,11 +483,11 @@ static ssize_t get_random_bytes_user(struct iov_iter *iter)
 		}
 	}
 
 	memzero_explicit(block, sizeof(block));
 out_zero_chacha:
-	memzero_explicit(&chacha_state, sizeof(chacha_state));
+	chacha_zeroize_state(&chacha_state);
 	return ret ? ret : -EFAULT;
 }
 
 /*
  * Batched entropy returns random integers. The quality of the random
diff --git a/fs/bcachefs/checksum.c b/fs/bcachefs/checksum.c
index 312fda4bb1b5..a4df8eba75f3 100644
--- a/fs/bcachefs/checksum.c
+++ b/fs/bcachefs/checksum.c
@@ -111,11 +111,11 @@ static void bch2_chacha20(const struct bch_key *key, struct nonce nonce,
 {
 	struct chacha_state state;
 
 	bch2_chacha20_init(&state, key, nonce);
 	chacha20_crypt(&state, data, data, len);
-	memzero_explicit(&state, sizeof(state));
+	chacha_zeroize_state(&state);
 }
 
 static void bch2_poly1305_init(struct poly1305_desc_ctx *desc,
 			       struct bch_fs *c, struct nonce nonce)
 {
@@ -281,11 +281,11 @@ int __bch2_encrypt_bio(struct bch_fs *c, unsigned type,
 
 		p = bvec_kmap_local(&bv);
 		chacha20_crypt(&chacha_state, p, p, bv.bv_len);
 		kunmap_local(p);
 	}
-	memzero_explicit(&chacha_state, sizeof(chacha_state));
+	chacha_zeroize_state(&chacha_state);
 	return ret;
 }
 
 struct bch_csum bch2_checksum_merge(unsigned type, struct bch_csum a,
 				    struct bch_csum b, size_t b_len)
diff --git a/include/crypto/chacha.h b/include/crypto/chacha.h
index 64fb270f2bfc..7c2e6c68919b 100644
--- a/include/crypto/chacha.h
+++ b/include/crypto/chacha.h
@@ -14,10 +14,11 @@
 
 #ifndef _CRYPTO_CHACHA_H
 #define _CRYPTO_CHACHA_H
 
 #include <linux/unaligned.h>
+#include <linux/string.h>
 #include <linux/types.h>
 
 /* 32-bit stream position, then 96-bit nonce (RFC7539 convention) */
 #define CHACHA_IV_SIZE		16
 
@@ -106,10 +107,15 @@ static inline void chacha20_crypt(struct chacha_state *state,
 				  u8 *dst, const u8 *src, unsigned int bytes)
 {
 	chacha_crypt(state, dst, src, bytes, 20);
 }
 
+static inline void chacha_zeroize_state(struct chacha_state *state)
+{
+	memzero_explicit(state, sizeof(*state));
+}
+
 #if IS_ENABLED(CONFIG_CRYPTO_ARCH_HAVE_LIB_CHACHA)
 bool chacha_is_arch_optimized(void);
 #else
 static inline bool chacha_is_arch_optimized(void)
 {
diff --git a/lib/crypto/chacha20poly1305.c b/lib/crypto/chacha20poly1305.c
index ed81f0658956..2e7bbc1a67ea 100644
--- a/lib/crypto/chacha20poly1305.c
+++ b/lib/crypto/chacha20poly1305.c
@@ -82,11 +82,11 @@ __chacha20poly1305_encrypt(u8 *dst, const u8 *src, const size_t src_len,
 	b.lens[1] = cpu_to_le64(src_len);
 	poly1305_update(&poly1305_state, (u8 *)b.lens, sizeof(b.lens));
 
 	poly1305_final(&poly1305_state, dst + src_len);
 
-	memzero_explicit(chacha_state, sizeof(*chacha_state));
+	chacha_zeroize_state(chacha_state);
 	memzero_explicit(&b, sizeof(b));
 }
 
 void chacha20poly1305_encrypt(u8 *dst, const u8 *src, const size_t src_len,
 			      const u8 *ad, const size_t ad_len,
@@ -186,11 +186,11 @@ bool chacha20poly1305_decrypt(u8 *dst, const u8 *src, const size_t src_len,
 
 	chacha_init(&chacha_state, k, (u8 *)iv);
 	ret = __chacha20poly1305_decrypt(dst, src, src_len, ad, ad_len,
 					 &chacha_state);
 
-	memzero_explicit(&chacha_state, sizeof(chacha_state));
+	chacha_zeroize_state(&chacha_state);
 	memzero_explicit(iv, sizeof(iv));
 	memzero_explicit(k, sizeof(k));
 	return ret;
 }
 EXPORT_SYMBOL(chacha20poly1305_decrypt);
@@ -326,11 +326,11 @@ bool chacha20poly1305_crypt_sg_inplace(struct scatterlist *src,
 			       sizeof(b.mac[1]), src_len, !encrypt);
 		ret = encrypt ||
 		      !crypto_memneq(b.mac[0], b.mac[1], POLY1305_DIGEST_SIZE);
 	}
 
-	memzero_explicit(&chacha_state, sizeof(chacha_state));
+	chacha_zeroize_state(&chacha_state);
 	memzero_explicit(&b, sizeof(b));
 
 	return ret;
 }
 
-- 
2.49.0


