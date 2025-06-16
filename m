Return-Path: <linux-mips+bounces-9321-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B30ADA5DD
	for <lists+linux-mips@lfdr.de>; Mon, 16 Jun 2025 03:42:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE4E23B031A
	for <lists+linux-mips@lfdr.de>; Mon, 16 Jun 2025 01:42:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90AFB288C1C;
	Mon, 16 Jun 2025 01:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CiAuMb9d"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3CA288C06;
	Mon, 16 Jun 2025 01:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750038116; cv=none; b=ho2Alo6lBH1gVL6HEETzFJOTdzzOPS5JIarLluaWlcDoPBhUf5PT6yv9EIh9WL781r/MktEErPiDSZKsSFAdzUgLdejgcP2AQcDSVQu0wAyIs3sFPdzQ9cp2uCcUTt8du8uL/x4/n68eKu5OlDbdZSnEidHoGLX6UTwjp2QiwNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750038116; c=relaxed/simple;
	bh=VjWSxk5rTs8+2YM7TLECuuSPNRzmvS+Q0pNNnwsrogA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QyjfzC/lXXISwe5J7PhhwIP72VrBb0GNP+kSiym0b/JV4gekGqWgZK2U8SNj4JNMqafSiaVmm2iQPv0Zl9cCEqrkU9jP91GXLK+bbGM3bImzIXfBC8ksHqphAgbNnrCROZQhTDw1aUTnachUuJu8j2HQQcV3XzgX+ynZLF6ASz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CiAuMb9d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1247C4CEE3;
	Mon, 16 Jun 2025 01:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750038116;
	bh=VjWSxk5rTs8+2YM7TLECuuSPNRzmvS+Q0pNNnwsrogA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CiAuMb9d7mmtKBMUulKV3/UTe5RZysm0JpnYZwLbGs6jV1P3vUsg5o4uOvygNJ/83
	 dw8cGEoVj0DmZI9hYag3R+CAxJcA9AuGaqIVz0NniqY6pBFfuV90Uo3oD6AqMSVP+O
	 gtRJMEHLyKGkWOtG5D2LGkmD/Y0eG86FpYsP2c+kHCB798QeWbyZ9zzpyRkTsOZxoV
	 f3UdKrKe7v87n2RfFmdWq7ltSp89FkpaGRMGcHgIN4h2EGbvBa2yW1rdFYeNp0V7XR
	 0uT+daSuOyX27OcrSxK+kTYbtQqFbMJ0qyufcc0dCs5bgP3nn8oqvNYeOjq15wrM19
	 hV/0ribyGmzUQ==
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
Subject: [PATCH v2 06/17] crypto: riscv/sha512 - stop depending on sha512_generic_block_fn
Date: Sun, 15 Jun 2025 18:40:08 -0700
Message-ID: <20250616014019.415791-7-ebiggers@kernel.org>
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

sha512_generic_block_fn() will no longer be available when the SHA-512
support in the old-school crypto API is changed to just wrap the SHA-512
library.  Replace the use of sha512_generic_block_fn() in
sha512-riscv64-glue.c with temporary code that uses the library's
__sha512_update().  This is just a temporary workaround to keep the
kernel building and functional at each commit; this code gets superseded
when the RISC-V optimized SHA-512 is migrated to lib/crypto/ anyway.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/riscv/crypto/Kconfig               | 1 +
 arch/riscv/crypto/sha512-riscv64-glue.c | 8 +++++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/crypto/Kconfig b/arch/riscv/crypto/Kconfig
index cd9b776602f89..53e4e1eacf554 100644
--- a/arch/riscv/crypto/Kconfig
+++ b/arch/riscv/crypto/Kconfig
@@ -29,10 +29,11 @@ config CRYPTO_GHASH_RISCV64
 	  - Zvkg vector crypto extension
 
 config CRYPTO_SHA512_RISCV64
 	tristate "Hash functions: SHA-384 and SHA-512"
 	depends on 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
+	select CRYPTO_LIB_SHA512
 	select CRYPTO_SHA512
 	help
 	  SHA-384 and SHA-512 secure hash algorithm (FIPS 180)
 
 	  Architecture: riscv64 using:
diff --git a/arch/riscv/crypto/sha512-riscv64-glue.c b/arch/riscv/crypto/sha512-riscv64-glue.c
index 4634fca78ae24..b3dbc71de07b0 100644
--- a/arch/riscv/crypto/sha512-riscv64-glue.c
+++ b/arch/riscv/crypto/sha512-riscv64-glue.c
@@ -36,11 +36,17 @@ static void sha512_block(struct sha512_state *state, const u8 *data,
 	if (crypto_simd_usable()) {
 		kernel_vector_begin();
 		sha512_transform_zvknhb_zvkb(state, data, num_blocks);
 		kernel_vector_end();
 	} else {
-		sha512_generic_block_fn(state, data, num_blocks);
+		struct __sha512_ctx ctx = {};
+
+		static_assert(sizeof(ctx.state) == sizeof(state->state));
+		memcpy(&ctx.state, state->state, sizeof(ctx.state));
+		__sha512_update(&ctx, data,
+				(size_t)num_blocks * SHA512_BLOCK_SIZE);
+		memcpy(state->state, &ctx.state, sizeof(state->state));
 	}
 }
 
 static int riscv64_sha512_update(struct shash_desc *desc, const u8 *data,
 				 unsigned int len)
-- 
2.49.0


