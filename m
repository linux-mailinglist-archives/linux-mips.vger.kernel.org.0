Return-Path: <linux-mips+bounces-9226-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6CDAD4869
	for <lists+linux-mips@lfdr.de>; Wed, 11 Jun 2025 04:13:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C18B3A5851
	for <lists+linux-mips@lfdr.de>; Wed, 11 Jun 2025 02:12:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E976C1714B4;
	Wed, 11 Jun 2025 02:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PYKA3dc2"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1081156F45;
	Wed, 11 Jun 2025 02:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749607972; cv=none; b=iJSdjZn7imSJTYQk1D7cnrZDbVK91t+GH7UtAKCE6Xvjtfm73RsfyimSD+LEJhoUjAzekYiOY0jn2Ae9nNRjRsu547uCXvZxb9zo/H0utMGaL2R38yuNPmEhEG/obUtP+iK6fc4Dw2HnOkloKfBTAOz9Q4cTGKryIp0JnFoATAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749607972; c=relaxed/simple;
	bh=H6nrs/ntjG5cZgZMn/Mw/s7NFoDXvl6Tqz/mtTtGbAk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Tiewwi8mLMF0LNbP/2et+SdNf59+fJQKQXHoa2Z6ARsF1a+6RAunywNWAkUYg0vLXkQWBRfNbRo/wOAKDOYh6AzKH9mET0tWsskNM4EsvRyC6+GVLEecp16Df0JrZhyF+zI4b4Q9sDHw/mIPoCiOc027Jvsvo1bQzsduUaZLKrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PYKA3dc2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2851C4CEED;
	Wed, 11 Jun 2025 02:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749607972;
	bh=H6nrs/ntjG5cZgZMn/Mw/s7NFoDXvl6Tqz/mtTtGbAk=;
	h=From:To:Cc:Subject:Date:From;
	b=PYKA3dc2syWyr6YVP6t0ca76B97xO8mJG7hrM6OKlq+h4g/iVbtMAnPJ7En0+89/b
	 Oy2VApdT31w9w5YJBMuqLkCWbLYkoIHX7VKsFw9+kKkeSp34hKz+LfwpuSFAa/0jUn
	 BwoiICSLlHnaZUHBIjsarOIHjcXUo9jX1jWYGdQ+ECyqBJ+KsE8DWmZHHBANZHv5N0
	 ZvSFNDQr0rYd/M5dCfIkLU4RHgNuKWaucik9Oxad3XnA55F3K1s4il2JkPrKt75+a+
	 W0BY6uoFVICpQNOX5+BVh8NZ46X5n6E04FKVLBiuX9oyBN15oBt5QT47gllSYdGFGS
	 0OwoOxuJDCeRQ==
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
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 00/16] SHA-512 library functions
Date: Tue, 10 Jun 2025 19:09:07 -0700
Message-ID: <20250611020923.1482701-1-ebiggers@kernel.org>
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

    git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git sha512-lib-v1

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

Eric Biggers (16):
  crypto: sha512 - rename conflicting symbols
  lib/crypto/sha512: add support for SHA-384 and SHA-512
  lib/crypto/sha512: add HMAC-SHA384 and HMAC-SHA512 support
  lib/crypto/sha512: add KUnit tests for SHA-384 and SHA-512
  lib/crypto/sha256: add KUnit tests for SHA-224 and SHA-256
  crypto: riscv/sha512 - stop depending on sha512_generic_block_fn
  crypto: sha512 - replace sha512_generic with wrapper around SHA-512
    library
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
 crypto/sha512.c                               | 254 +++++++
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
 lib/crypto/sha512.c                           | 403 +++++++++++
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
 77 files changed, 3931 insertions(+), 1756 deletions(-)
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


