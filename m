Return-Path: <linux-mips+bounces-8581-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7711BA870C5
	for <lists+linux-mips@lfdr.de>; Sun, 13 Apr 2025 06:57:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 955717AD6E6
	for <lists+linux-mips@lfdr.de>; Sun, 13 Apr 2025 04:55:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0543C191499;
	Sun, 13 Apr 2025 04:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VPbt2eYH"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD99819047C;
	Sun, 13 Apr 2025 04:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744520144; cv=none; b=Qg02ogl6cpsRGNehkdNUPyGKSmn+6P2HQhk1VgeI23F+5tpf9hYpMpIQseK66/zZ+tjtYe5fTVhyPxkSM2p99LGYXWh61TQgbVBYekt7b5ANj3K8Y0m+tYdQ4/6CzHbKaiZs9hrxby3ArQx6Vbfnwy9EWpBlrPQFsVxyQ8/gI5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744520144; c=relaxed/simple;
	bh=Pjh4oxagSvmSLpMze4F+AJtO3zI0zTnD0Z/7n/bgK3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oBf5BYY2WI30oxWyxWDnMQ+AURYjkTFg4R4LvQpeDCc1E6mJoYBsrbyIl2Zq9FqvFhPvBZLd1uAbPsporUq0bPgLbX5N4NyS/G9jdxfzNDrzouyuC32mEuzrU3kAUknx+iFaBwFZ42PYKDl/c5qda6Z3FuCVq7N4JfYey7A5W/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VPbt2eYH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED062C4CEE5;
	Sun, 13 Apr 2025 04:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744520144;
	bh=Pjh4oxagSvmSLpMze4F+AJtO3zI0zTnD0Z/7n/bgK3Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VPbt2eYHx4ya3q///NGVA+AfQZlakY1oxpGQeb7fGWngp5KXaZC77Br8qfTNiMxOF
	 a0yRZBbFGdP0Ge1p6UvtaE6HpdagU5RcBH8PHsYZznsnc2E+5GSoTGtWjUf5BOZ38d
	 xl2D4cTxo/C6gD3zEbMcY7RGKWgmJvMhxQeyfrpqf8TkMCykFbw0CDhQ/NqWpVSvKr
	 whrKmS6Y3bYwNpgL8SBOl/zDxkVdM8YcH0r540WTf3WAXoTLcnZtbXa6mDy47x6n5t
	 TXob2tBZQ8oVEVJrwPDVxV28rDMGu4vb5MvlT5HCoNUlqboVAlJNnupjCvQN8jVi1+
	 TFmIPLUmM5/Hg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org
Subject: [PATCH 8/9] crypto: x86/poly1305 - don't select CRYPTO_LIB_POLY1305_GENERIC
Date: Sat, 12 Apr 2025 21:54:20 -0700
Message-ID: <20250413045421.55100-9-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250413045421.55100-1-ebiggers@kernel.org>
References: <20250413045421.55100-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Eric Biggers <ebiggers@google.com>

The x86 Poly1305 code never falls back to the generic code, so selecting
CRYPTO_LIB_POLY1305_GENERIC is unnecessary.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/x86/crypto/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/x86/crypto/Kconfig b/arch/x86/crypto/Kconfig
index 31804dacf9a4..a25765186ba3 100644
--- a/arch/x86/crypto/Kconfig
+++ b/arch/x86/crypto/Kconfig
@@ -397,11 +397,10 @@ config CRYPTO_POLYVAL_CLMUL_NI
 	  - CLMUL-NI (carry-less multiplication new instructions)
 
 config CRYPTO_POLY1305_X86_64
 	tristate
 	depends on X86 && 64BIT
-	select CRYPTO_LIB_POLY1305_GENERIC
 	select CRYPTO_ARCH_HAVE_LIB_POLY1305
 	default CRYPTO_LIB_POLY1305_INTERNAL
 
 config CRYPTO_SHA1_SSSE3
 	tristate "Hash functions: SHA-1 (SSSE3/AVX/AVX2/SHA-NI)"
-- 
2.49.0


