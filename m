Return-Path: <linux-mips+bounces-8485-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD54A7CB3F
	for <lists+linux-mips@lfdr.de>; Sat,  5 Apr 2025 20:30:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8668E16A0C5
	for <lists+linux-mips@lfdr.de>; Sat,  5 Apr 2025 18:30:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86F5C1A315D;
	Sat,  5 Apr 2025 18:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZADTKA2X"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546BCEAE7;
	Sat,  5 Apr 2025 18:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743877853; cv=none; b=IsUJUOhY2wuGqVeahrReauCaLclnmnKtw3TRo2czQgrt0nZt7BMbm+ck6Nx9kOO85zBEw/THK4mgCIYoUhwsYrnpyjL/oibmOS0hv8eXlsFQ+UZ0rjGPLtgmj9rWB2q7wD4Rq+yYG4zOpBDHiWueaXYwYDR6g1lre7r4SnGN6IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743877853; c=relaxed/simple;
	bh=NUeI4U0WXhSt3zBtNRQTMMK3/MdfX1g2dDF6Z2qmcBk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Nn1cxXV1o53a8jwDsUQbf6Uzz2EVvewGG37Ao9G/kA44sFaXcnF69rmJ+ShJAzDfh3m2z1hpnAUREhsBUBmvJkaV53hnvi/B3dKRbdTylgA5SL3zc0Ts7UbELQBNHyNkJp1TyCdeB7psKhW65i43YvKhfuaHS2qs6vKkrV+zndc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZADTKA2X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 571E2C4CEE4;
	Sat,  5 Apr 2025 18:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743877852;
	bh=NUeI4U0WXhSt3zBtNRQTMMK3/MdfX1g2dDF6Z2qmcBk=;
	h=From:To:Cc:Subject:Date:From;
	b=ZADTKA2XpWmUoC1UvEdiBW5vfd7VpA7EcazTAeFqV6IYRAcTwJj32Vg1Wq5fCGLgs
	 7JyOAjRuSsqqgqYWs71EQVJOb9Z2n5pA17nrPeJlhMKCA/eAK9NXkFZR3p91Y8caSt
	 jinR8neVOTsIM05C1MclF0w8iWixTieJ05Msm7l1WKlKmf9VdzyhgwbvbhsJ497vsg
	 XywIxp8b7zKgwiB5AvFpxMRMingbmpZEm6NwEgL/uIHCSdA3oOaTUTX2dXfFwk4hjZ
	 yqf7tRidgJduOJ/eghplQ3/3xFBzLYQ40Eu7Y4R9D9qCW1JAc/ukkE3kpFwTEyuN6k
	 35/hTz+afw7oA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 0/9] Remove per-architecture ChaCha skcipher glue code
Date: Sat,  5 Apr 2025 11:26:00 -0700
Message-ID: <20250405182609.404216-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently each architecture exposes ChaCha not only through the library
API, but also through the crypto_skcipher API.  That requires each
architecture to implement essentially the same skcipher glue code.

Following the example of what's been done for crc32 and crc32c,
eliminate this redundancy by making crypto/chacha.c register both the
generic and architecture-optimized skcipher algorithms, implemented on
top of the appropriate library functions.  This removes almost 800 lines
of code and disentangles the library code from the skcipher API.

From what I remember, the following are the reasons why it wasn't just
done this way originally.  But none of these really hold water:

- The skcipher code was there first, so it may have seemed more natural
  to add onto it rather than replace it.

- Architectures could register multiple skcipher algorithms using
  different CPU features and have them all be tested in a single boot.
  This was convenient in theory, but it never really worked properly.
  It didn't apply to the library code, the x86 ChaCha code wasn't
  actually doing this (it used static keys instead), and this cannot
  catch bugs like accidentally using an AVX instruction in SSE code.
  Instead, a correct solution, which also doesn't require any special
  kernel support, is to just boot the kernel in QEMU using different
  -cpu arguments as needed to test all the code.

- There was a concern about changing cra_driver_names potentially
  breaking users.  But in practice users rely on cra_name, not
  cra_driver_name.  We already change, add, and remove cra_driver_names
  occasionally for various reasons.  And even if someone was relying on
  a specific cra_driver_name, there are some more lightweight
  compatibility tricks that could be used.

- There was a desire for users to be able to override the kernel's
  choice of ChaCha implementation by blacklisting the arch-optimized
  ChaCha module.  But that already became mostly impossible when the
  library functions were added to the same module.  And in practice
  users don't do this anyway.  Even if, hypothetically, someone really
  needed to do this and for some reason the kernel couldn't be fixed to
  make the right choice in their case automatically, there are other
  ways this could be implemented such as a module parameter.

Eric Biggers (9):
  crypto: riscv/chacha - implement library instead of skcipher
  crypto: chacha - centralize the skcipher wrappers for arch code
  crypto: arm/chacha - remove the redundant skcipher algorithms
  crypto: arm64/chacha - remove the skcipher algorithms
  crypto: mips/chacha - remove the skcipher algorithms
  crypto: powerpc/chacha - remove the skcipher algorithms
  crypto: s390/chacha - remove the skcipher algorithms
  crypto: x86/chacha - remove the skcipher algorithms
  crypto: chacha - remove <crypto/internal/chacha.h>

 arch/arm/crypto/Kconfig                 |   7 -
 arch/arm/crypto/chacha-glue.c           | 243 +---------------------
 arch/arm/crypto/chacha-neon-core.S      |   2 +-
 arch/arm64/crypto/Kconfig               |   7 -
 arch/arm64/crypto/chacha-neon-core.S    |   2 +-
 arch/arm64/crypto/chacha-neon-glue.c    | 146 +------------
 arch/mips/crypto/Kconfig                |   6 -
 arch/mips/crypto/chacha-glue.c          | 131 +-----------
 arch/powerpc/crypto/Kconfig             |   8 -
 arch/powerpc/crypto/chacha-p10-glue.c   | 147 +-------------
 arch/riscv/crypto/Kconfig               |  11 +-
 arch/riscv/crypto/chacha-riscv64-glue.c | 112 ++++------
 arch/riscv/crypto/chacha-riscv64-zvkb.S |  71 +++----
 arch/s390/crypto/Kconfig                |   7 -
 arch/s390/crypto/chacha-glue.c          |  99 ++-------
 arch/x86/crypto/Kconfig                 |   9 -
 arch/x86/crypto/chacha_glue.c           | 144 +------------
 crypto/Makefile                         |   3 +-
 crypto/chacha.c                         | 260 ++++++++++++++++++++++++
 crypto/chacha_generic.c                 | 139 -------------
 include/crypto/chacha.h                 |   9 +
 include/crypto/internal/chacha.h        |  43 ----
 22 files changed, 413 insertions(+), 1193 deletions(-)
 create mode 100644 crypto/chacha.c
 delete mode 100644 crypto/chacha_generic.c
 delete mode 100644 include/crypto/internal/chacha.h

base-commit: 56f944529ec2292cbe63377a76df3759d702dd39
-- 
2.49.0


