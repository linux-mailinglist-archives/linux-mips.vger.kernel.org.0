Return-Path: <linux-mips+bounces-9315-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 568B1ADA5BE
	for <lists+linux-mips@lfdr.de>; Mon, 16 Jun 2025 03:42:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 44D427A13C3
	for <lists+linux-mips@lfdr.de>; Mon, 16 Jun 2025 01:40:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03F19287504;
	Mon, 16 Jun 2025 01:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F6u+Y88r"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0903287500;
	Mon, 16 Jun 2025 01:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750038113; cv=none; b=e+SfK+0y7N9HoNl0F4/oLTseTJrbTHJaMx8zWE9wZZb6osaEXDRZffsXcnE+kCzU4L6qsnSrb/9w68lNN8ZuGjCaspIEi4aR5GVWqV2KqxJYTnk3ukzRHLqPbfE7/flPvyCczyCp8Fx6QCOUZ6rrFcZzcpXUynJLc2rd+bIOpG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750038113; c=relaxed/simple;
	bh=y2sfSOcIVIm5TLfKyQ/mKLJQuEYlH2/C3vDsfThYsOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ko6AFJvRx9R+Or0XRO9awzRJRz0Zb+apJ68GBZH+dAWxg7IVJsMgnbg/I+rrrM3wGKIkjIVagcrGsv6cTeA2hn1xGVkXZcWIMNJMOQ3hMVnOCcEll8vcKBGlmZYZXR26Cwbat8v5ZP5tGl9GIyqe8mduGlMOxmpY/zWldHRF/aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F6u+Y88r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA266C4CEE3;
	Mon, 16 Jun 2025 01:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750038113;
	bh=y2sfSOcIVIm5TLfKyQ/mKLJQuEYlH2/C3vDsfThYsOQ=;
	h=From:To:Cc:Subject:Date:From;
	b=F6u+Y88r8vCozKhMCTzW2dZdkrJcwXbJDB1FSnsp95/7isEVv89ggIP9yDlbCC0S3
	 /BXK7SzXm8ldeLwexN2XjhlqUqygRif3DxjcrH8y4Di8rAXRRV5z81+3LYgBRTuKvT
	 NjnPqSO4515WsN5VWoDAJ9AYGAOPLq7Qy1jUgm6Ufbv80qnwyebgwUWWowSM6ZvVJN
	 91lm0uwCzLAd443g1dDNPBlTWTiCBDU62YmnNLTmJ+lpnT8C19rkRy9KgC+s4SZOHg
	 6WDEe1J8iRxTjFQ1l4lI5Pxg9ndmU43AiL3tEc1R3zJoeMt7+2dguorpPn1FX4Gqor
	 wbd89LkQaOjHw==
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
Subject: [PATCH v2 00/17] SHA-512 library functions
Date: Sun, 15 Jun 2025 18:40:02 -0700
Message-ID: <20250616014019.415791-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series applies to v6.16-rc1 and is targeting the libcrypto-next
tree.  It is also available at:

    git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git sha512-lib-v2

This series adds support for SHA-384, SHA-512, HMAC-SHA384, and
HMAC-SHA512 to lib/crypto/.  The new functions take advantage of the
kernel's existing architecture-optimized implementations of the SHA-512
compression function.  The new functions are fully tested using KUnit.

To avoid duplicating all arch-optimized implementations of the SHA-512
compression function (~3000 lines of code total), they are moved into
lib/crypto/ rather than copied.  To make the "sha384", "sha512",
"hmac(sha384)", and "hmac(sha512)" crypto_shash algorithms in the
old-school crypto API continue to be properly optimized after that, they
are reimplemented on top of lib/crypto/, which is straightforward.

The following lists some of the design choices and conventions that I've
followed in more detail.  Where these differ from the code or APIs for
other algorithms (e.g., SHA-256 in some cases), I'd like to do it this
way going forward and plan to fix up the other algorithms accordingly:

- APIs are fully documented with kerneldoc comments.

- APIs cannot fail, and return void.

- APIs work in all contexts.  This doesn't mean that they *should* be
  called in all contexts, but rather they always just work as expected.

- Tests are KUnit tests, and they are fairly thorough (more thorough
  than crypto/testmgr.c) and also optionally include benchmarks.

- Architecture-optimized code is integrated the same way I'm doing it
  for lib/crc/: it's in subdirectories lib/crypto/$(SRCARCH), it's
  enabled by default, and it's inlined into the same module as the
  generic code.  This solves a number of problems; for more details, see
  https://lore.kernel.org/r/20250607200454.73587-1-ebiggers@kernel.org

- HMAC support is a first-class citizen.

- APIs handle zeroization, when applicable.

- Message contexts are *_ctx instead of *_state.  It's shorter, avoids
  ambiguity with the compression function state, and matches OpenSSL.

- Length arguments are size_t, are in bytes, are named len or *_len, and
  immediately follow the corresponding buffer.  "Object" being operated
  on is first argument; outputs otherwise follow inputs.

- The structures for different algorithms use different types, which
  prevents usage errors where functions are mixed up between algorithms.

- The compression function state is strongly typed, not a plain array.

Changed in v2:
- Added "crypto: sha512 - use same state format as legacy drivers"
- Fixed build on user-mode Linux
- Fixed W=1 build warning by adding <linux/export.h>
- Optimized __sha512_final() and __hmac_sha512_final() slightly

Eric Biggers (17):
  crypto: sha512 - rename conflicting symbols
  lib/crypto/sha512: add support for SHA-384 and SHA-512
  lib/crypto/sha512: add HMAC-SHA384 and HMAC-SHA512 support
  lib/crypto/sha512: add KUnit tests for SHA-384 and SHA-512
  lib/crypto/sha256: add KUnit tests for SHA-224 and SHA-256
  crypto: riscv/sha512 - stop depending on sha512_generic_block_fn
  crypto: sha512 - replace sha512_generic with wrapper around SHA-512
    library
  crypto: sha512 - use same state format as legacy drivers
  lib/crypto/sha512: migrate arm-optimized SHA-512 code to library
  lib/crypto/sha512: migrate arm64-optimized SHA-512 code to library
  mips: cavium-octeon: move octeon-crypto.h into asm directory
  lib/crypto/sha512: migrate mips-optimized SHA-512 code to library
  lib/crypto/sha512: migrate riscv-optimized SHA-512 code to library
  lib/crypto/sha512: migrate s390-optimized SHA-512 code to library
  lib/crypto/sha512: migrate sparc-optimized SHA-512 code to library
  lib/crypto/sha512: migrate x86-optimized SHA-512 code to library
  crypto: sha512 - remove sha512_base.h

 arch/arm/configs/exynos_defconfig             |   1 -
 arch/arm/configs/milbeaut_m10v_defconfig      |   1 -
 arch/arm/configs/multi_v7_defconfig           |   1 -
 arch/arm/configs/omap2plus_defconfig          |   1 -
 arch/arm/configs/pxa_defconfig                |   1 -
 arch/arm/crypto/Kconfig                       |  10 -
 arch/arm/crypto/Makefile                      |  15 -
 arch/arm/crypto/sha512-glue.c                 | 110 ---
 arch/arm/crypto/sha512-neon-glue.c            |  75 --
 arch/arm/crypto/sha512.h                      |   3 -
 arch/arm64/configs/defconfig                  |   1 -
 arch/arm64/crypto/Kconfig                     |  19 -
 arch/arm64/crypto/Makefile                    |  14 -
 arch/arm64/crypto/sha512-ce-glue.c            |  96 ---
 arch/arm64/crypto/sha512-glue.c               |  83 ---
 arch/mips/cavium-octeon/crypto/Makefile       |   1 -
 .../mips/cavium-octeon/crypto/octeon-crypto.c |   3 +-
 arch/mips/cavium-octeon/crypto/octeon-md5.c   |   3 +-
 arch/mips/cavium-octeon/crypto/octeon-sha1.c  |   3 +-
 .../mips/cavium-octeon/crypto/octeon-sha256.c |   3 +-
 .../mips/cavium-octeon/crypto/octeon-sha512.c | 167 -----
 arch/mips/configs/cavium_octeon_defconfig     |   1 -
 arch/mips/crypto/Kconfig                      |  10 -
 .../asm/octeon/crypto.h}                      |   0
 arch/riscv/crypto/Kconfig                     |  11 -
 arch/riscv/crypto/Makefile                    |   3 -
 arch/riscv/crypto/sha512-riscv64-glue.c       | 124 ----
 arch/s390/configs/debug_defconfig             |   1 -
 arch/s390/configs/defconfig                   |   1 -
 arch/s390/crypto/Kconfig                      |  10 -
 arch/s390/crypto/Makefile                     |   1 -
 arch/s390/crypto/sha512_s390.c                | 151 ----
 arch/sparc/crypto/Kconfig                     |  10 -
 arch/sparc/crypto/Makefile                    |   2 -
 arch/sparc/crypto/sha512_glue.c               | 122 ----
 arch/x86/crypto/Kconfig                       |  13 -
 arch/x86/crypto/Makefile                      |   3 -
 arch/x86/crypto/sha512_ssse3_glue.c           | 322 ---------
 crypto/Kconfig                                |   4 +-
 crypto/Makefile                               |   2 +-
 crypto/sha512.c                               | 338 +++++++++
 crypto/sha512_generic.c                       | 217 ------
 crypto/testmgr.c                              |  16 +
 drivers/crypto/starfive/jh7110-hash.c         |   8 +-
 include/crypto/sha2.h                         | 350 +++++++++
 include/crypto/sha512_base.h                  | 120 ----
 lib/crypto/Kconfig                            |  20 +
 lib/crypto/Makefile                           |  38 +
 lib/crypto/arm/.gitignore                     |   2 +
 .../crypto => lib/crypto/arm}/sha512-armv4.pl |   0
 lib/crypto/arm/sha512.h                       |  38 +
 lib/crypto/arm64/.gitignore                   |   2 +
 .../crypto/arm64}/sha512-ce-core.S            |  10 +-
 lib/crypto/arm64/sha512.h                     |  46 ++
 lib/crypto/mips/sha512.h                      |  74 ++
 .../riscv}/sha512-riscv64-zvknhb-zvkb.S       |   4 +-
 lib/crypto/riscv/sha512.h                     |  41 ++
 lib/crypto/s390/sha512.h                      |  28 +
 lib/crypto/sha512.c                           | 400 +++++++++++
 lib/crypto/sparc/sha512.h                     |  42 ++
 .../crypto => lib/crypto/sparc}/sha512_asm.S  |   0
 lib/crypto/tests/Kconfig                      |  24 +
 lib/crypto/tests/Makefile                     |   6 +
 lib/crypto/tests/hash-test-template.h         | 512 ++++++++++++++
 lib/crypto/tests/sha224-testvecs.h            | 223 ++++++
 lib/crypto/tests/sha224_kunit.c               |  50 ++
 lib/crypto/tests/sha256-testvecs.h            | 223 ++++++
 lib/crypto/tests/sha256_kunit.c               |  39 ++
 lib/crypto/tests/sha384-testvecs.h            | 566 +++++++++++++++
 lib/crypto/tests/sha384_kunit.c               |  48 ++
 lib/crypto/tests/sha512-testvecs.h            | 662 ++++++++++++++++++
 lib/crypto/tests/sha512_kunit.c               |  48 ++
 .../crypto/x86}/sha512-avx-asm.S              |  11 +-
 .../crypto/x86}/sha512-avx2-asm.S             |  11 +-
 .../crypto/x86}/sha512-ssse3-asm.S            |  12 +-
 lib/crypto/x86/sha512.h                       |  54 ++
 scripts/crypto/gen-hash-testvecs.py           |  83 +++
 77 files changed, 4012 insertions(+), 1756 deletions(-)
 delete mode 100644 arch/arm/crypto/sha512-glue.c
 delete mode 100644 arch/arm/crypto/sha512-neon-glue.c
 delete mode 100644 arch/arm/crypto/sha512.h
 delete mode 100644 arch/arm64/crypto/sha512-ce-glue.c
 delete mode 100644 arch/arm64/crypto/sha512-glue.c
 delete mode 100644 arch/mips/cavium-octeon/crypto/octeon-sha512.c
 rename arch/mips/{cavium-octeon/crypto/octeon-crypto.h => include/asm/octeon/crypto.h} (100%)
 delete mode 100644 arch/riscv/crypto/sha512-riscv64-glue.c
 delete mode 100644 arch/s390/crypto/sha512_s390.c
 delete mode 100644 arch/sparc/crypto/sha512_glue.c
 delete mode 100644 arch/x86/crypto/sha512_ssse3_glue.c
 create mode 100644 crypto/sha512.c
 delete mode 100644 crypto/sha512_generic.c
 delete mode 100644 include/crypto/sha512_base.h
 create mode 100644 lib/crypto/arm/.gitignore
 rename {arch/arm/crypto => lib/crypto/arm}/sha512-armv4.pl (100%)
 create mode 100644 lib/crypto/arm/sha512.h
 create mode 100644 lib/crypto/arm64/.gitignore
 rename {arch/arm64/crypto => lib/crypto/arm64}/sha512-ce-core.S (97%)
 create mode 100644 lib/crypto/arm64/sha512.h
 create mode 100644 lib/crypto/mips/sha512.h
 rename {arch/riscv/crypto => lib/crypto/riscv}/sha512-riscv64-zvknhb-zvkb.S (98%)
 create mode 100644 lib/crypto/riscv/sha512.h
 create mode 100644 lib/crypto/s390/sha512.h
 create mode 100644 lib/crypto/sha512.c
 create mode 100644 lib/crypto/sparc/sha512.h
 rename {arch/sparc/crypto => lib/crypto/sparc}/sha512_asm.S (100%)
 create mode 100644 lib/crypto/tests/Kconfig
 create mode 100644 lib/crypto/tests/Makefile
 create mode 100644 lib/crypto/tests/hash-test-template.h
 create mode 100644 lib/crypto/tests/sha224-testvecs.h
 create mode 100644 lib/crypto/tests/sha224_kunit.c
 create mode 100644 lib/crypto/tests/sha256-testvecs.h
 create mode 100644 lib/crypto/tests/sha256_kunit.c
 create mode 100644 lib/crypto/tests/sha384-testvecs.h
 create mode 100644 lib/crypto/tests/sha384_kunit.c
 create mode 100644 lib/crypto/tests/sha512-testvecs.h
 create mode 100644 lib/crypto/tests/sha512_kunit.c
 rename {arch/x86/crypto => lib/crypto/x86}/sha512-avx-asm.S (97%)
 rename {arch/x86/crypto => lib/crypto/x86}/sha512-avx2-asm.S (98%)
 rename {arch/x86/crypto => lib/crypto/x86}/sha512-ssse3-asm.S (97%)
 create mode 100644 lib/crypto/x86/sha512.h
 create mode 100755 scripts/crypto/gen-hash-testvecs.py


base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
-- 
2.49.0


