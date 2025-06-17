Return-Path: <linux-mips+bounces-9371-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14407ADDEEA
	for <lists+linux-mips@lfdr.de>; Wed, 18 Jun 2025 00:31:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CFD467AC6E3
	for <lists+linux-mips@lfdr.de>; Tue, 17 Jun 2025 22:29:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6222E2EBBAC;
	Tue, 17 Jun 2025 22:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SovLzznF"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2932C2E54A0;
	Tue, 17 Jun 2025 22:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750199402; cv=none; b=ng3x6muhAeYYTVLWS3z8Ud13KJAuYskhM1VPzNrVXlc+7ZmStpiYDjQ8E7P/JlBI1deEq0xZIDEfksi0WN9kV4jTqhndKMThQzHcglN4ZVmcHqLYJZ5gTekV7Fd7PXxt/PIpDInyUzfr1XlcAJJbljOoVwIM24DY0lvC+Q1C/wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750199402; c=relaxed/simple;
	bh=oGJq6YZzLbO82TcEMZLZBS9E98OIIOd5KDDOCIIYowQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jPMIFCZiIVVcsYln0yh0IW0fz5qKqGQFwS1wsXKbyhwBA84xF7XBSpglF0g7ePz9xDfG2FbB9Ax6+Lie9N3Z64bVeIVadKVe2iX0kAeq9fzCaKMqOiPm9JXITaEnvmQMcESjyA44bzCRT0PFAoVuNrIZyG9QRPzfmWmAKdjTuVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SovLzznF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF370C4CEF8;
	Tue, 17 Jun 2025 22:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750199402;
	bh=oGJq6YZzLbO82TcEMZLZBS9E98OIIOd5KDDOCIIYowQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SovLzznFPfIAEgcoGd3wa7ftl9jecC4+XnxcYbmljKPn6KsHB6owxneOsiWiHlnab
	 muiKIw9awT6KzPqUeNlzqPMNRQ6FYy7/UhXGHPM/wLDCfc1FPzhQZtrSQX6W5VQKa4
	 50B2rUTWfZHWORPDSaKSt4nf8HFzuFx1dUcky6sSdjuVTg5jP3l3Ie8z4zoxN0BeIB
	 5vJahEvic3FD72FGGK9qwYIGiNTNyNAnjg9FNwA98XjMM+3bCyH7NImzGI7tl4fW1C
	 By1EilFtNRcoK8uUYNAou3W+ESJ441BuamWF8ppNnSTp3K+Rnnx3FCX2Vt8euhkRiM
	 JB91sT3DxJ9UQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH 9/9] MAINTAINERS: drop arch/*/lib/crypto/ pattern
Date: Tue, 17 Jun 2025 15:27:26 -0700
Message-ID: <20250617222726.365148-10-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617222726.365148-1-ebiggers@kernel.org>
References: <20250617222726.365148-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Eric Biggers <ebiggers@google.com>

arch/*/lib/crypto/ will no longer be used, and its contents have been
moved to lib/crypto/.  (Well, except for a few .gitignore files which
are intentionally being kept for a while.)  Therefore, remove the
arch/*/lib/crypto/ pattern from MAINTAINERS.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a92290fffa163..8ca374b24a806 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6408,11 +6408,10 @@ M:	Jason A. Donenfeld <Jason@zx2c4.com>
 M:	Ard Biesheuvel <ardb@kernel.org>
 L:	linux-crypto@vger.kernel.org
 S:	Maintained
 T:	git https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git libcrypto-next
 T:	git https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git libcrypto-fixes
-F:	arch/*/lib/crypto/
 F:	lib/crypto/
 
 CRYPTO SPEED TEST COMPARE
 M:	Wang Jinchao <wangjinchao@xfusion.com>
 L:	linux-crypto@vger.kernel.org
-- 
2.49.0


