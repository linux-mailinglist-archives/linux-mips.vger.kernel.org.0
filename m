Return-Path: <linux-mips+bounces-13959-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKXhAKqbxWnP/wQAu9opvQ
	(envelope-from <linux-mips+bounces-13959-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 26 Mar 2026 21:48:42 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2ED33B8CD
	for <lists+linux-mips@lfdr.de>; Thu, 26 Mar 2026 21:48:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A50D33048448
	for <lists+linux-mips@lfdr.de>; Thu, 26 Mar 2026 20:48:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 955383A6EFC;
	Thu, 26 Mar 2026 20:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z0qW4FBp"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7239D3A6B8B;
	Thu, 26 Mar 2026 20:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774558115; cv=none; b=rhJMX6KuC2fjdAwG59cmU5B9Nsi6eBdKHup+YHlNEPY3n+v15Ap3EOMPT6QYKGJ6yOCEIKywmyHS6B463snNpx8rUwrfYFJDy+B6nuYLE0X45kuSMkhR81qbj53B4b9b55itqHidV3EHNt6rZhSxvXNZdHpldc4DfjD2f7kDLXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774558115; c=relaxed/simple;
	bh=6LoLx7+aqrBPNFDurIy0LwoP04hwrB/2gDEyo0yPcT8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SMrjuT7CvLAUA0EmCvQuiL3iHyqU1Jf4iyFmYXB3Yj4te2lDg7QMOTBHvaz2PhfyYESvQoHGvOpc630eMm6mmDM9Ss6Qz4IIaV/ZXZfF4I0DFU3qffG/hl1yPBvLqY4W7yDxrHN2ctQjUjDFhPTQj+/bJnAzS2DBeKPW6NSMi6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z0qW4FBp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12FBBC19423;
	Thu, 26 Mar 2026 20:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774558115;
	bh=6LoLx7+aqrBPNFDurIy0LwoP04hwrB/2gDEyo0yPcT8=;
	h=From:To:Cc:Subject:Date:From;
	b=Z0qW4FBpjsVkidAfp2bDKU/xuaIf3zwUx2PkDNEgGZEr+53Oc25pPypuT2ZQbd5wm
	 VhVWJda7VYPppnCg3XTeKqpfWiV6Is2rMIHl3b4EciO9TGFWtW3NjX/mFnnZORQsJo
	 n4PEqTY7gbDUCBjW04MP4p/HtbYVf64uU8iYH9M8e5MVukZh3hwLIcrghV3I+C8eLO
	 gdd9cCQA6G1l8VuBlPP3dfVFdc3Ekzrm6sSlefYaf4gGXhkeWYxI6xDG5MeYUs2EfC
	 W1vxKmUn82gryFgkUmeof9KYWopPjNy3h3rPV6VQLe/tk4FQI1IHLdsjXuecPAAPfc
	 OoT6YDvRcURhQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-mips@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH] lib/crypto: mips: Drop optimized MD5 code
Date: Thu, 26 Mar 2026 13:48:24 -0700
Message-ID: <20260326204824.62010-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13959-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[ebiggers@kernel.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iki.fi:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9C2ED33B8CD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

MD5 is obsolete.  Continuing to maintain architecture-optimized
implementations of MD5 is unnecessary and risky.  It diverts resources
from the modern algorithms that are actually important.

While there was demand for continuing to maintain the PowerPC optimized
MD5 code to accommodate userspace programs that are misusing AF_ALG
(https://lore.kernel.org/linux-crypto/c4191597-341d-4fd7-bc3d-13daf7666c41@csgroup.eu/),
no such demand has been seen for the MIPS Cavium Octeon optimized MD5
code.  Note that this code runs on only one particular line of SoCs.

Thus, let's drop it and focus effort on the more modern SHA algorithms,
which already have optimized code for the same SoCs.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---

This patch is targeting libcrypto-next

 lib/crypto/Kconfig    |  1 -
 lib/crypto/mips/md5.h | 65 -------------------------------------------
 2 files changed, 66 deletions(-)
 delete mode 100644 lib/crypto/mips/md5.h

diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index 4b6f593dc72f..9f31f03062f0 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -132,11 +132,10 @@ config CRYPTO_LIB_MD5
 	  uses any of the functions from <crypto/md5.h>.
 
 config CRYPTO_LIB_MD5_ARCH
 	bool
 	depends on CRYPTO_LIB_MD5 && !UML
-	default y if MIPS && CPU_CAVIUM_OCTEON
 	default y if PPC
 	default y if SPARC64
 
 config CRYPTO_LIB_MLDSA
 	tristate
diff --git a/lib/crypto/mips/md5.h b/lib/crypto/mips/md5.h
deleted file mode 100644
index e08e28aeffa4..000000000000
--- a/lib/crypto/mips/md5.h
+++ /dev/null
@@ -1,65 +0,0 @@
-/*
- * Cryptographic API.
- *
- * MD5 Message Digest Algorithm (RFC1321).
- *
- * Adapted for OCTEON by Aaro Koskinen <aaro.koskinen@iki.fi>.
- *
- * Based on crypto/md5.c, which is:
- *
- * Derived from cryptoapi implementation, originally based on the
- * public domain implementation written by Colin Plumb in 1993.
- *
- * Copyright (c) Cryptoapi developers.
- * Copyright (c) 2002 James Morris <jmorris@intercode.com.au>
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of the GNU General Public License as published by the Free
- * Software Foundation; either version 2 of the License, or (at your option)
- * any later version.
- */
-
-#include <asm/octeon/crypto.h>
-#include <asm/octeon/octeon.h>
-
-/*
- * We pass everything as 64-bit. OCTEON can handle misaligned data.
- */
-
-static void md5_blocks(struct md5_block_state *state,
-		       const u8 *data, size_t nblocks)
-{
-	struct octeon_cop2_state cop2_state;
-	u64 *state64 = (u64 *)state;
-	unsigned long flags;
-
-	if (!octeon_has_crypto())
-		return md5_blocks_generic(state, data, nblocks);
-
-	cpu_to_le32_array(state->h, ARRAY_SIZE(state->h));
-
-	flags = octeon_crypto_enable(&cop2_state);
-	write_octeon_64bit_hash_dword(state64[0], 0);
-	write_octeon_64bit_hash_dword(state64[1], 1);
-
-	do {
-		const u64 *block = (const u64 *)data;
-
-		write_octeon_64bit_block_dword(block[0], 0);
-		write_octeon_64bit_block_dword(block[1], 1);
-		write_octeon_64bit_block_dword(block[2], 2);
-		write_octeon_64bit_block_dword(block[3], 3);
-		write_octeon_64bit_block_dword(block[4], 4);
-		write_octeon_64bit_block_dword(block[5], 5);
-		write_octeon_64bit_block_dword(block[6], 6);
-		octeon_md5_start(block[7]);
-
-		data += MD5_BLOCK_SIZE;
-	} while (--nblocks);
-
-	state64[0] = read_octeon_64bit_hash_dword(0);
-	state64[1] = read_octeon_64bit_hash_dword(1);
-	octeon_crypto_disable(&cop2_state, flags);
-
-	le32_to_cpu_array(state->h, ARRAY_SIZE(state->h));
-}

base-commit: 7ac21b4032e5b9b8a6a312b6f1d54f4ba24d1c16
-- 
2.53.0


