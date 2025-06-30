Return-Path: <linux-mips+bounces-9554-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB842AEE34D
	for <lists+linux-mips@lfdr.de>; Mon, 30 Jun 2025 18:05:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E6D227ABC22
	for <lists+linux-mips@lfdr.de>; Mon, 30 Jun 2025 16:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FC702918D5;
	Mon, 30 Jun 2025 16:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G6SdNRxT"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF43291861;
	Mon, 30 Jun 2025 16:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751299524; cv=none; b=ejPfP8ilCuxIAUn4sPEEs+jpktKVcEbYE8RS++tUYN5XaJq/FobwnmkJUfnLphrzwY5Q4mpHknX/KNbt25s9A+PqtB0YEbm+eIROVILC/eSw7BpTHxTyrHzckZQZp35gVEdhN8HMKbwS0Lx36CjlYPrTV+Wu8CYKDX7yhcbJhn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751299524; c=relaxed/simple;
	bh=Weaemm5tVSSOITzoU3Exa8gIqcPO7agiHtgu1h0EiAY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CR4bczUTzjkOC4klTVwohwIjmtLoXHnxyyDic+v7g/8DbxuD7u6yE4suanYRG8omHqkB+D1sgDr4D9PJJdQPdHbHmEvf66Lxx0qsh+ogfovxY0SubRhZMurViJP88O6wAcbYzk4mG+8pUZONeXiVSyIzdAHGtq2ES18SgNUS0sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G6SdNRxT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B2EFC4CEF3;
	Mon, 30 Jun 2025 16:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751299523;
	bh=Weaemm5tVSSOITzoU3Exa8gIqcPO7agiHtgu1h0EiAY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G6SdNRxTh3Ciw7tvEBvdMJDJ2pBTRqKZrXnc4VCIBytKFkTJpt3yLkXrBQ43W5Xfc
	 MSaPHP2zGfS31WjYmnoGB/3etvzWfs59cG8i3V0bPCVh9lqS/ayx3PhzyweVM6SHpE
	 a8K3fbneg6OFdo2NJwZPzGn0ji5Zt97pbqCwuASSUt+oAi8zMRh4Zok+CG2MjbAfLp
	 kG5RyDFYNzMraJW04smN96tyaP7uFDnj9JCU1Qu8HE63kCi4qCBolaIG2pqAI1w2m+
	 mePoviuPsG+xzMDSE3fl0wEsBX9Y4iAWgwOE4kx+gzIx0neyORBtS1/NZ0dV58LGej
	 DeRbkpYFvI67A==
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
Subject: [PATCH v3 04/16] crypto: riscv/sha512 - Stop depending on sha512_generic_block_fn
Date: Mon, 30 Jun 2025 09:03:08 -0700
Message-ID: <20250630160320.2888-5-ebiggers@kernel.org>
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

sha512_generic_block_fn() will no longer be available when the SHA-512
support in the old-school crypto API is changed to just wrap the SHA-512
library.  Replace the use of sha512_generic_block_fn() in
sha512-riscv64-glue.c with temporary code that uses the library's
__sha512_update().  This is just a temporary workaround to keep the
kernel building and functional at each commit; this code gets superseded
when the RISC-V optimized SHA-512 is migrated to lib/crypto/ anyway.

Acked-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
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
2.50.0


