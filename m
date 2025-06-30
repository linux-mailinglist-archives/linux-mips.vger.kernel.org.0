Return-Path: <linux-mips+bounces-9572-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA32AEE3F4
	for <lists+linux-mips@lfdr.de>; Mon, 30 Jun 2025 18:15:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 338961BC1B69
	for <lists+linux-mips@lfdr.de>; Mon, 30 Jun 2025 16:11:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C626A29C355;
	Mon, 30 Jun 2025 16:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YUEz13tr"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7C829A9E4;
	Mon, 30 Jun 2025 16:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751299763; cv=none; b=JMVyRUiefSlJUSnK4AhFjmgpjKZM2/RiaIh72h0U9K08uk07uKwiArfglBzVd0OzC9U7jNhhL5LT2/+5nhnqC+1tYQSEhgvKh+rZm0CXGQcRGXmXX6pZqFaCdZv4sVNFatqLIkDX67WwfjknjabXOGkZwe1mrErHEQGNgFwTmbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751299763; c=relaxed/simple;
	bh=6di/lemdUUuURN063IywyRZhcwaKdCBZPfLQhM19GXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EK40qn/cY/2L2DSxjhTWXA9azxJsTE5DQPQuT+rdBAUFwYGBVyqFGeDG7tuQVtF3AYyXvKTwHgcysm11s1rlOUCav5RAmYRzuZVkZC1IHlP147NPwvvT3O1+e+Y15G97KXiwcfL9T7o31y4KTtzcKejvBEfO8wzDdGKfqY6yIzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YUEz13tr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB4A6C4CEF2;
	Mon, 30 Jun 2025 16:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751299763;
	bh=6di/lemdUUuURN063IywyRZhcwaKdCBZPfLQhM19GXE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YUEz13trRmGOF1EnTtptvIlzO1jaL21f4T0TLFxkW98FzmMLj6qDaW0ODvpbNWxVx
	 tfzJ5ASzjGW+jCVRJoRjoHWBYInTKNgLLwpEMauVZBla27IPaaN+Sguq8bUNybwcZ4
	 m+N6TBi5X7Aay6IJ+JyWUd5O6u3c4w4eAXAtYJv0zGGmEokWNCcro5PhDuNp1zwNIV
	 7GOiv6OLqYq9c2mtptz2nJBsjhusfEek4rvPdyXbAKJYVSSGkIMS15fAWfrnJ7CW2r
	 CftvB1tqiZa/uHE5fCme+6m0uY6xzuSfr5q5bF9mchP3IO8KvUpNaXsOLzSyGIIoJR
	 H3sy/rJqdx/Hw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v2 05/14] lib/crypto: sha256: Add sha224() and sha224_update()
Date: Mon, 30 Jun 2025 09:06:36 -0700
Message-ID: <20250630160645.3198-6-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250630160645.3198-1-ebiggers@kernel.org>
References: <20250630160645.3198-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a one-shot SHA-224 computation function sha224(), for consistency
with sha256(), sha384(), and sha512() which all already exist.

Similarly, add sha224_update().  While for now it's identical to
sha256_update(), omitting it makes the API harder to use since users
have to "know" which functions are the same between SHA-224 and SHA-256.
Also, this is a prerequisite for using different context types for each.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 include/crypto/sha2.h | 10 ++++++++--
 lib/crypto/sha256.c   | 10 ++++++++++
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/include/crypto/sha2.h b/include/crypto/sha2.h
index bb181b7996cdc..e31da0743a522 100644
--- a/include/crypto/sha2.h
+++ b/include/crypto/sha2.h
@@ -112,22 +112,28 @@ struct sha512_state {
 	u64 state[SHA512_DIGEST_SIZE / 8];
 	u64 count[2];
 	u8 buf[SHA512_BLOCK_SIZE];
 };
 
+void sha256_update(struct sha256_state *sctx, const u8 *data, size_t len);
+
 static inline void sha224_init(struct sha256_state *sctx)
 {
 	sha224_block_init(&sctx->ctx);
 }
-/* Simply use sha256_update as it is equivalent to sha224_update. */
+static inline void sha224_update(struct sha256_state *sctx,
+				 const u8 *data, size_t len)
+{
+	sha256_update(sctx, data, len);
+}
 void sha224_final(struct sha256_state *sctx, u8 out[SHA224_DIGEST_SIZE]);
+void sha224(const u8 *data, size_t len, u8 out[SHA224_DIGEST_SIZE]);
 
 static inline void sha256_init(struct sha256_state *sctx)
 {
 	sha256_block_init(&sctx->ctx);
 }
-void sha256_update(struct sha256_state *sctx, const u8 *data, size_t len);
 void sha256_final(struct sha256_state *sctx, u8 out[SHA256_DIGEST_SIZE]);
 void sha256(const u8 *data, size_t len, u8 out[SHA256_DIGEST_SIZE]);
 
 /* State for the SHA-512 (and SHA-384) compression function */
 struct sha512_block_state {
diff --git a/lib/crypto/sha256.c b/lib/crypto/sha256.c
index 573ccecbf48bf..ccaae70880166 100644
--- a/lib/crypto/sha256.c
+++ b/lib/crypto/sha256.c
@@ -68,10 +68,20 @@ void sha256_final(struct sha256_state *sctx, u8 out[SHA256_DIGEST_SIZE])
 {
 	__sha256_final(sctx, out, SHA256_DIGEST_SIZE);
 }
 EXPORT_SYMBOL(sha256_final);
 
+void sha224(const u8 *data, size_t len, u8 out[SHA224_DIGEST_SIZE])
+{
+	struct sha256_state sctx;
+
+	sha224_init(&sctx);
+	sha224_update(&sctx, data, len);
+	sha224_final(&sctx, out);
+}
+EXPORT_SYMBOL(sha224);
+
 void sha256(const u8 *data, size_t len, u8 out[SHA256_DIGEST_SIZE])
 {
 	struct sha256_state sctx;
 
 	sha256_init(&sctx);
-- 
2.50.0


