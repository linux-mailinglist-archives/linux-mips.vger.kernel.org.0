Return-Path: <linux-mips+bounces-9481-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF3AAE77EF
	for <lists+linux-mips@lfdr.de>; Wed, 25 Jun 2025 09:11:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C55517FAF8
	for <lists+linux-mips@lfdr.de>; Wed, 25 Jun 2025 07:11:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B99020C030;
	Wed, 25 Jun 2025 07:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nqVpQzpx"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80AC20B218;
	Wed, 25 Jun 2025 07:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750835430; cv=none; b=tV5HNDWjEnkTzR1nrLL3d+sMX0cUeaHhVALIVfXK2pUPfbE2siL5knoLQnU4aRCsxmInmAcmPpFuIXuaA9HbKFi7Wf33ztPw+oPVyfPvgMFewVL4tj6x3e73JESYyWT5Kw6cS6yP/4+nMouHkerrfE6X1UNeEmmYKH3BjrHW8H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750835430; c=relaxed/simple;
	bh=1DNk7tX1YvvlA6uSWHlfTS+Bb3s1eS+aWteQQPlb1JM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hu7cDyXjRdIL8ocCQJpPMJUlJPgMvLHpC5QZp/qdvnH4Dzt/j/Pi1YJHiMqGZdAwfJxgglVk1hX+PPUtye2QvZooxU5XWKuzAxtslpORe2p8Jy/Omcc9TfqKwpSQMtkMe3hM3fBK2Uq+jaTd0rqaj5l2ylHUweKYGuhxENdkAQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nqVpQzpx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 303BCC4CEF4;
	Wed, 25 Jun 2025 07:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750835429;
	bh=1DNk7tX1YvvlA6uSWHlfTS+Bb3s1eS+aWteQQPlb1JM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nqVpQzpxUnKXPMGrZ1EGYozacdniZ2Ei1z0BDb9CArbXCIdhByuU9MICPVrjgSPOs
	 7I9XtCbuuhB6jWShxX4zi3pBcGSRDxsestEYjY/AaCTGarh3AmLmMYGVmsNHH1evss
	 mVm19s4IODFj3zJjHA7UoVak1Yktt1eeG3x4UvGqP1eBFy9no7S/Z2ct6nwLqYlGJV
	 Hfjb4JOyB1ZwjnDHOmsYhRJU6IML4Cg4wPn/XWbASQCigU+IWieRPJoRfKCL2onHLw
	 c93er26kDV2ZMVmMh48fmsPNOWrh8d0egdKTyR/kurxPY6+tKSegQkxGRUJK1Iqp4n
	 jcy1kRYUqSgXw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 05/18] lib/crypto: sha512: Do not include <crypto/internal/sha2.h>
Date: Wed, 25 Jun 2025 00:08:06 -0700
Message-ID: <20250625070819.1496119-6-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250625070819.1496119-1-ebiggers@kernel.org>
References: <20250625070819.1496119-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since the SHA-512 code is now consolidated into a single translation
unit except for assembly code, there is no longer any need for an
internal header.  Indeed, lib/crypto/sha512.c relies on
<crypto/internal/sha2.h> only for indirect inclusions.  Stop including
it.  This prepares for the later removal of this header, once the
SHA-256 code is reorganized similarly and stops needing it too.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 lib/crypto/sha512.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/crypto/sha512.c b/lib/crypto/sha512.c
index fe9d98b9b7db9..f5a9569a7ef96 100644
--- a/lib/crypto/sha512.c
+++ b/lib/crypto/sha512.c
@@ -7,15 +7,16 @@
  * Copyright (c) 2003 Kyle McMartin <kyle@debian.org>
  * Copyright 2025 Google LLC
  */
 
 #include <crypto/hmac.h>
-#include <crypto/internal/sha2.h>
+#include <crypto/sha2.h>
 #include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/overflow.h>
+#include <linux/unaligned.h>
 #include <linux/wordpart.h>
 
 static const struct sha512_block_state sha384_iv = {
 	.h = {
 		SHA384_H0, SHA384_H1, SHA384_H2, SHA384_H3,
-- 
2.50.0


