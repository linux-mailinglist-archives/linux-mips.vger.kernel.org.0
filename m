Return-Path: <linux-mips+bounces-9550-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 46369AEE33B
	for <lists+linux-mips@lfdr.de>; Mon, 30 Jun 2025 18:05:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1D883BDA0A
	for <lists+linux-mips@lfdr.de>; Mon, 30 Jun 2025 16:04:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8258528D85E;
	Mon, 30 Jun 2025 16:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sBYmJ8H3"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497421E51D;
	Mon, 30 Jun 2025 16:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751299522; cv=none; b=Gh2IlKA06rolYP0uXj/YgLxE4hssFiqvsmxBjwRdPLj7d72t27492lXyaibfnpY2lP/X0kgCRYQpEpe93dAWPkzyBJs201izk9303xdgulgLN36Z0/ipG9y8JB+LjfIJAhZBUn66ntlxWTsHjnQLIEloq3IrEpJGDV05jJhtbp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751299522; c=relaxed/simple;
	bh=UkM9WqpU5Sx5JdLDa3qEPydxoH8maIJf8+SQ9HnNupo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AK2r2b0UICuAhI2AqqbSx8pHFuVs700nXlAsquKxWgPqQ9Hp4KgIp3aIhXZlqYyb/loInrTv3E3/mlZ/6YrTuoVK2FiwQnRprEYpn00+lBr63J/yQV6bCl3cxCZnNohhtGRer7KnlxkbytJzRhJhyrauTLTTKfJpmf/3Hm227EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sBYmJ8H3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CF64C4CEE3;
	Mon, 30 Jun 2025 16:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751299521;
	bh=UkM9WqpU5Sx5JdLDa3qEPydxoH8maIJf8+SQ9HnNupo=;
	h=From:To:Cc:Subject:Date:From;
	b=sBYmJ8H3kL3CkKIDl8seNCQySJ0kDr96EADkNECv264riK/6RWSRB6enyEPbhlRMC
	 EEbAWcaPtQQgSgERS4LFaWhrPd67ViW9ZwIwoCS7ZUWuwku2ljagMRaEKaNkfI5lWa
	 E2KENqUzzaFSAPFwi+eAAwSxROzfbCH82TCE+XnzNtIiDItAnNPrnKommdUgNbu1i+
	 2EQfNtFttk+JJQqq8RJTLDrZfwufYxeMSD8VaLlJ37LuUVDRVO1wI39q5FJ3PWIvrh
	 vWg7U67Yv3qMhNPykLFteLKS3EEFWJR+BxML9LC887iUl7PHuUmoHtN+nuTyAJ1APk
	 /UWmXZ65pEwSQ==
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
Subject: [PATCH v3 00/16] SHA-512 library functions
Date: Mon, 30 Jun 2025 09:03:04 -0700
Message-ID: <20250630160320.2888-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

[ I had applied v2 of this earlier, but since it's been accumulating
  some minor fixups and it's still -rc4, I figured I'd just refresh it ]

This series is also available at:

    git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git sha512-lib-v3

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

Changed in v3:
- Dropped KUnit tests from this series, since they'll be separate and
  will need to go last in the branch (as per request from Linus)
- Folded in the following fixups I previously sent:
  "crypto: testmgr/sha512 - Omit generic_driver for no-op tests",
  "crypto: sha512 - Use the correct legacy export format",
  "lib/crypto: sha512: Reorder some code in sha512.c",
  "lib/crypto: sha512: Do not include <crypto/internal/sha2.h>",
  "lib/crypto: sha512: Fix a grammatical error in kerneldoc comments",
  "lib/crypto: x86/sha512: Drop unnecessary ANNOTATE_NOENDBR"
- Updated cra_priority values to be consistent with sha256.c and not
  decreased from what the arch-optimized code used before
- Added MODULE_ALIAS_CRYPTO() lines for the *-lib cra_driver_names
- Updated commit titles to align with the conventions I'm adopting

Changed in v2:
- Added "crypto: sha512 - use same state format as legacy drivers"
- Fixed build on user-mode Linux
- Fixed W=1 build warning by adding <linux/export.h>
- Optimized __sha512_final() and __hmac_sha512_final() slightly

Eric Biggers (16):
  crypto: sha512 - Rename conflicting symbols
  lib/crypto: sha512: Add support for SHA-384 and SHA-512
  lib/crypto: sha512: Add HMAC-SHA384 and HMAC-SHA512 support
  crypto: riscv/sha512 - Stop depending on sha512_generic_block_fn
  crypto: sha512 - Replace sha512_generic with wrapper around SHA-512
    library
  crypto: sha512 - Use same state format as legacy drivers
  lib/crypto: arm/sha512: Migrate optimized SHA-512 code to library
  lib/crypto: arm64/sha512: Migrate optimized SHA-512 code to library
  mips: cavium-octeon: Move octeon-crypto.h into asm directory
  lib/crypto: mips/sha512: Migrate optimized SHA-512 code to library
  lib/crypto: riscv/sha512: Migrate optimized SHA-512 code to library
  lib/crypto: s390/sha512: Migrate optimized SHA-512 code to library
  lib/crypto: sparc/sha512: Migrate optimized SHA-512 code to library
  lib/crypto: x86/sha512: Migrate optimized SHA-512 code to library
  lib/crypto: x86/sha512: Remove unnecessary checks for nblocks==0
  crypto: sha512 - Remove sha512_base.h

 arch/arm/configs/exynos_defconfig             |   1 -
 arch/arm/configs/milbeaut_m10v_defconfig      |   1 -
 arch/arm/configs/multi_v7_defconfig           |   1 -
 arch/arm/configs/omap2plus_defconfig          |   1 -
 arch/arm/configs/pxa_defconfig                |   1 -
 arch/arm/crypto/Kconfig                       |  10 -
 arch/arm/crypto/Makefile                      |  15 -
 arch/arm/crypto/sha512-glue.c                 | 110 -----
 arch/arm/crypto/sha512-neon-glue.c            |  75 ----
 arch/arm/crypto/sha512.h                      |   3 -
 arch/arm64/configs/defconfig                  |   1 -
 arch/arm64/crypto/Kconfig                     |  19 -
 arch/arm64/crypto/Makefile                    |  14 -
 arch/arm64/crypto/sha512-ce-glue.c            |  96 -----
 arch/arm64/crypto/sha512-glue.c               |  83 ----
 arch/mips/cavium-octeon/crypto/Makefile       |   1 -
 .../mips/cavium-octeon/crypto/octeon-crypto.c |   3 +-
 arch/mips/cavium-octeon/crypto/octeon-md5.c   |   3 +-
 arch/mips/cavium-octeon/crypto/octeon-sha1.c  |   3 +-
 .../mips/cavium-octeon/crypto/octeon-sha256.c |   3 +-
 .../mips/cavium-octeon/crypto/octeon-sha512.c | 167 --------
 arch/mips/configs/cavium_octeon_defconfig     |   1 -
 arch/mips/crypto/Kconfig                      |  10 -
 .../asm/octeon/crypto.h}                      |   0
 arch/riscv/crypto/Kconfig                     |  11 -
 arch/riscv/crypto/Makefile                    |   3 -
 arch/riscv/crypto/sha512-riscv64-glue.c       | 124 ------
 arch/s390/configs/debug_defconfig             |   1 -
 arch/s390/configs/defconfig                   |   1 -
 arch/s390/crypto/Kconfig                      |  10 -
 arch/s390/crypto/Makefile                     |   1 -
 arch/s390/crypto/sha512_s390.c                | 151 -------
 arch/sparc/crypto/Kconfig                     |  10 -
 arch/sparc/crypto/Makefile                    |   2 -
 arch/sparc/crypto/sha512_glue.c               | 122 ------
 arch/x86/crypto/Kconfig                       |  13 -
 arch/x86/crypto/Makefile                      |   3 -
 arch/x86/crypto/sha512_ssse3_glue.c           | 322 --------------
 crypto/Kconfig                                |   4 +-
 crypto/Makefile                               |   2 +-
 crypto/sha512.c                               | 354 +++++++++++++++
 crypto/sha512_generic.c                       | 217 ----------
 crypto/testmgr.c                              |  10 +
 drivers/crypto/starfive/jh7110-hash.c         |   8 +-
 include/crypto/sha2.h                         | 350 +++++++++++++++
 include/crypto/sha512_base.h                  | 120 ------
 lib/crypto/Kconfig                            |  18 +
 lib/crypto/Makefile                           |  36 ++
 lib/crypto/arm/.gitignore                     |   2 +
 .../crypto => lib/crypto/arm}/sha512-armv4.pl |   0
 lib/crypto/arm/sha512.h                       |  38 ++
 lib/crypto/arm64/.gitignore                   |   2 +
 .../crypto/arm64}/sha512-ce-core.S            |  10 +-
 lib/crypto/arm64/sha512.h                     |  46 ++
 lib/crypto/mips/sha512.h                      |  74 ++++
 .../riscv}/sha512-riscv64-zvknhb-zvkb.S       |   4 +-
 lib/crypto/riscv/sha512.h                     |  41 ++
 lib/crypto/s390/sha512.h                      |  28 ++
 lib/crypto/sha512.c                           | 402 ++++++++++++++++++
 lib/crypto/sparc/sha512.h                     |  42 ++
 .../crypto => lib/crypto/sparc}/sha512_asm.S  |   0
 .../crypto/x86}/sha512-avx-asm.S              |  11 +-
 .../crypto/x86}/sha512-avx2-asm.S             |  12 +-
 .../crypto/x86}/sha512-ssse3-asm.S            |  14 +-
 lib/crypto/x86/sha512.h                       |  54 +++
 65 files changed, 1529 insertions(+), 1766 deletions(-)
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
 rename {arch/x86/crypto => lib/crypto/x86}/sha512-avx-asm.S (98%)
 rename {arch/x86/crypto => lib/crypto/x86}/sha512-avx2-asm.S (99%)
 rename {arch/x86/crypto => lib/crypto/x86}/sha512-ssse3-asm.S (97%)
 create mode 100644 lib/crypto/x86/sha512.h

-- 
2.50.0


