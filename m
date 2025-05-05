Return-Path: <linux-mips+bounces-8911-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAC3AA9B58
	for <lists+linux-mips@lfdr.de>; Mon,  5 May 2025 20:19:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F09E1895BBE
	for <lists+linux-mips@lfdr.de>; Mon,  5 May 2025 18:19:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC04F25F78A;
	Mon,  5 May 2025 18:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mzytHTPC"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FA31B0F2C;
	Mon,  5 May 2025 18:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746469163; cv=none; b=pOVmRrT/lw/VewBgq0XjvffaU4aNBDQANYKI0DkNNDuiOQwynnLSIY1npBijeQACOxEGTRYqwaobdij4ZQi8E63VrtEnlg4DbWROgi85l+hiaDgI1+QGHTulpGEE2ewZQtZiSIWZqZle2ggIKg3mQQ6GgOyXKsouKawb/6pKd/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746469163; c=relaxed/simple;
	bh=pbhM6rLT2xsCdlCwZPtBBqUWZLiG5jVy62L9rIqPZ4I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pqChjtadvRxxobNRfp5xQ+gaeo7LCMThWk84owzSuxmF0srawU68MM9WY5OWmE0xG/kdC/CIirWPVEaobihqRACQurC1Kj3Q+eeP4ZUM+mLY/5cbQiFZlobvgxZtcRPN8yrsAbFb8TLjq/z3s5r95G6y1cJQkm47xN8DdQlEGWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mzytHTPC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9282EC4CEE4;
	Mon,  5 May 2025 18:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746469162;
	bh=pbhM6rLT2xsCdlCwZPtBBqUWZLiG5jVy62L9rIqPZ4I=;
	h=From:To:Cc:Subject:Date:From;
	b=mzytHTPCELw1tkhhvQDNh8uKIRJjgJDj3AlNf+4JofNJtTifEWR30wCTuxKIyu0me
	 QN+7I66DbuHlus5hisqRBjCEh2nK1WKef2WDYjS12LNJWbiAHOoXEY/+frhhJOs497
	 DCqrG5f1RXOBfUBx8+nMklnWQucJNibqQ22tBCji4XqbKfMSc39BF+4s67mQ7nL4kI
	 ES2QJJScttT2ogYASeUY34JaWu7woaOruNgPT2l94Bb2iZ748DXJiKnUnv4ffYgrr7
	 fKbP2C5npdC7BsQnHGZcHBIpVQfg6boJRuZvJnlqJ5+xRXN2IfkemruT37Sw+qDPKy
	 x14IyErqCxSbg==
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
Subject: [PATCH 0/4] crypto: lib/chacha - improve type safety
Date: Mon,  5 May 2025 11:18:20 -0700
Message-ID: <20250505181824.647138-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series can also be retrieved from:

    git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git chacha-prototypes-v1

This series improves type safety and clarity in the ChaCha functions by
strongly typing the state array and adding explicit array bounds for
other fixed-length arrays.  No functional changes.

Eric Biggers (4):
  crypto: lib/chacha - strongly type the ChaCha state
  crypto: lib/chacha - use struct assignment to copy state
  crypto: lib/chacha - add strongly-typed state zeroization
  crypto: lib/chacha - add array bounds to function prototypes

 arch/arm/lib/crypto/chacha-glue.c             | 34 ++++----
 arch/arm/lib/crypto/chacha-scalar-core.S      |  5 +-
 arch/arm64/lib/crypto/chacha-neon-glue.c      | 27 ++++---
 arch/mips/lib/crypto/chacha-glue.c            |  6 +-
 arch/powerpc/lib/crypto/chacha-p10-glue.c     | 17 ++--
 arch/powerpc/lib/crypto/chacha-p10le-8x.S     |  6 +-
 arch/riscv/lib/crypto/chacha-riscv64-glue.c   |  9 ++-
 arch/riscv/lib/crypto/chacha-riscv64-zvkb.S   | 10 +--
 arch/s390/lib/crypto/chacha-glue.c            | 13 +--
 arch/x86/lib/crypto/chacha_glue.c             | 62 ++++++++------
 crypto/chacha.c                               | 20 ++---
 drivers/char/random.c                         | 41 +++++-----
 fs/bcachefs/checksum.c                        | 18 ++---
 include/crypto/chacha.h                       | 80 ++++++++++++-------
 lib/crypto/chacha.c                           | 40 +++++-----
 lib/crypto/chacha20poly1305-selftest.c        |  8 +-
 lib/crypto/chacha20poly1305.c                 | 53 ++++++------
 lib/crypto/libchacha.c                        |  2 +-
 .../crypto/chacha20-s390/test-cipher.c        | 10 +--
 19 files changed, 253 insertions(+), 208 deletions(-)


base-commit: 64745a9ca890ed60d78162ec511e1983e1946d73
-- 
2.49.0


