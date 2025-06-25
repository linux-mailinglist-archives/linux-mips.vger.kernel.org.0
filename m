Return-Path: <linux-mips+bounces-9476-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF74AE77CE
	for <lists+linux-mips@lfdr.de>; Wed, 25 Jun 2025 09:10:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1AF561672DA
	for <lists+linux-mips@lfdr.de>; Wed, 25 Jun 2025 07:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C45901FCFF8;
	Wed, 25 Jun 2025 07:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f8mx/QGa"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBFE1F9F51;
	Wed, 25 Jun 2025 07:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750835427; cv=none; b=QzjeQhJpfGl7Ix+nv3wmMIbvGCSLi1r/iCM/ujXhvINnDZyVz4x4p3KQAgAB83IgOfQ2NHicEpjes8ZLlmABGjNX1KPui+7nqpcLkxTllj6r5RUPoxVNSrxLUoM7tsM7+sQuGETqVqYHZFZx7W5A/MFRUIJJ3ZVbgrzljvbp9rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750835427; c=relaxed/simple;
	bh=dNjTP1K/kwMastCEsJrXq3spz7hep3Wcru9OBJvpwJA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iCFx+OZi8voWKWDO1Qhuw+74c0id/+OB33X+zzPAw6J9PsBfQ1Wf24anRwnIGbMJf5HouOelMuSo6BGQ5qFdFcgNaQw08VCKVVFaY9lk4rMrDYLcnlehMyRxaThxKFCexnWqjoo8nZA7uZAq7EbjeEyqPBzo8aBU5MuwIHyg9p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f8mx/QGa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCD40C4CEEA;
	Wed, 25 Jun 2025 07:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750835427;
	bh=dNjTP1K/kwMastCEsJrXq3spz7hep3Wcru9OBJvpwJA=;
	h=From:To:Cc:Subject:Date:From;
	b=f8mx/QGaAe/zXMItJZ0F55QwX91jS97FGsefAFIby9DnkyFtMYmePw0hWX0k2Vjz0
	 BNtUus02OG1FPiTEiuTLnKq4XdAPibOkbVuuWIwqr6Teh6x7q+npmu7RYtGSs3TgKh
	 yHlR3Z3sFMiJF1JmEr21Vz4XeDobauDmgAKuguO0wLRUkdQZo1+uNogSSTox5pjMRA
	 Q9S3L7aW2Ha3BEGdVnUoHxi0bZrXRDXM98wQvtA8KqOd6w32WkvBpZ7zvQj5cG+WOI
	 oDpEQEOqm7HuwDrOxoiqqiywB1kYtRddglKdLZktyv2YJSKY5cUtjgQmHokaeRDEJb
	 SXMChrbYairMQ==
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
	x86@kernel.org
Subject: [PATCH 00/18] SHA-256 library improvements
Date: Wed, 25 Jun 2025 00:08:01 -0700
Message-ID: <20250625070819.1496119-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series is targeting libcrypto-next and can also be retrieved from:

    git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git sha256-lib-cleanup-v1

This series improves the SHA-224 and SHA-256 library code to be
consistent with what I did for SHA-384 and SHA-512.  This includes:

- Use stronger typing in the SHA-224 and SHA-256 functions.

- Add support for HMAC-SHA224 and HMAC-SHA256.  (I'll send a separate
  patch with KUnit test cases for this.)

- Make the old-school crypto API's support for sha224 and sha256 just
  use the actual library API, instead of unsafe low-level functions.

- Consolidate the CPU-based SHA-224 and SHA-256 code into a single
  module, with better inlining and dead code elimination.

- Properly document the SHA-224 and SHA-256 functions.

- Other changes to synchronize the code with SHA-384 and SHA-512.

Patches 3-6 are a few fixes/cleanups for the SHA-384 and SHA-512 code
that I noticed while doing this.

Eric Biggers (18):
  libceph: Rename hmac_sha256() to ceph_hmac_sha256()
  cxl/test: Simplify fw_buf_checksum_show()
  crypto: sha512 - Use the correct legacy export format
  lib/crypto: sha512: Reorder some code in sha512.c
  lib/crypto: sha512: Do not include <crypto/internal/sha2.h>
  lib/crypto: sha512: Fix a grammatical error in kerneldoc comments
  lib/crypto: sha256: Reorder some code
  lib/crypto: sha256: Remove sha256_blocks_simd()
  lib/crypto: sha256: Add sha224() and sha224_update()
  lib/crypto: sha256: Make library API use strongly-typed contexts
  lib/crypto: sha256: Propagate sha256_block_state type to
    implementations
  lib/crypto: sha256: Add HMAC-SHA224 and HMAC-SHA256 support
  crypto: sha256 - Wrap library and add HMAC support
  crypto: sha256 - Use same state format as legacy drivers
  lib/crypto: sha512: Remove sha256_is_arch_optimized()
  lib/crypto: sha256: Consolidate into single module
  lib/crypto: sha256: Sync sha256_update() with sha512_update()
  lib/crypto: sha256: Document the SHA-224 and SHA-256 API

 arch/mips/cavium-octeon/Kconfig               |   6 -
 arch/mips/cavium-octeon/crypto/Makefile       |   1 -
 arch/riscv/purgatory/purgatory.c              |   8 +-
 arch/s390/purgatory/purgatory.c               |   2 +-
 arch/x86/purgatory/purgatory.c                |   2 +-
 crypto/Kconfig                                |   4 +-
 crypto/sha256.c                               | 371 +++++++++-------
 crypto/sha512.c                               |  22 +-
 crypto/testmgr.c                              |  12 +
 drivers/char/tpm/tpm2-sessions.c              |  12 +-
 drivers/crypto/img-hash.c                     |   4 +-
 drivers/crypto/starfive/jh7110-hash.c         |   8 +-
 include/crypto/internal/sha2.h                |  66 ---
 include/crypto/sha2.h                         | 402 +++++++++++++++--
 kernel/kexec_file.c                           |  10 +-
 lib/crypto/Kconfig                            |  34 +-
 lib/crypto/Makefile                           |  39 +-
 lib/crypto/arm/Kconfig                        |   7 -
 lib/crypto/arm/Makefile                       |   8 +-
 lib/crypto/arm/sha256-armv4.pl                |  20 +-
 lib/crypto/arm/sha256-ce.S                    |   2 +-
 lib/crypto/arm/sha256.c                       |  64 ---
 lib/crypto/arm/sha256.h                       |  46 ++
 lib/crypto/arm64/Kconfig                      |   6 -
 lib/crypto/arm64/Makefile                     |   9 +-
 lib/crypto/arm64/sha2-armv8.pl                |   2 +-
 lib/crypto/arm64/sha256-ce.S                  |   2 +-
 lib/crypto/arm64/sha256.c                     |  75 ----
 lib/crypto/arm64/sha256.h                     |  58 +++
 lib/crypto/arm64/sha512.h                     |   6 +-
 .../crypto/mips/sha256.h                      |  20 +-
 lib/crypto/powerpc/Kconfig                    |   6 -
 lib/crypto/powerpc/Makefile                   |   3 -
 lib/crypto/powerpc/{sha256.c => sha256.h}     |  19 +-
 lib/crypto/riscv/Kconfig                      |   8 -
 lib/crypto/riscv/Makefile                     |   3 -
 .../sha256-riscv64-zvknha_or_zvknhb-zvkb.S    |   2 +-
 lib/crypto/riscv/sha256.c                     |  67 ---
 lib/crypto/riscv/sha256.h                     |  42 ++
 lib/crypto/s390/Kconfig                       |   6 -
 lib/crypto/s390/Makefile                      |   3 -
 lib/crypto/s390/sha256.c                      |  47 --
 lib/crypto/s390/sha256.h                      |  28 ++
 lib/crypto/sha256-generic.c                   | 138 ------
 lib/crypto/sha256.c                           | 411 ++++++++++++++++--
 lib/crypto/sha512.c                           |  75 ++--
 lib/crypto/sparc/Kconfig                      |   8 -
 lib/crypto/sparc/Makefile                     |   4 -
 lib/crypto/sparc/{sha256.c => sha256.h}       |  37 +-
 lib/crypto/tests/sha224_kunit.c               |  15 +-
 lib/crypto/tests/sha256_kunit.c               |   2 +-
 lib/crypto/x86/Kconfig                        |   8 -
 lib/crypto/x86/Makefile                       |   3 -
 lib/crypto/x86/sha256-avx-asm.S               |   2 +-
 lib/crypto/x86/sha256-avx2-asm.S              |   2 +-
 lib/crypto/x86/sha256-ni-asm.S                |   2 +-
 lib/crypto/x86/sha256-ssse3-asm.S             |   2 +-
 lib/crypto/x86/sha256.c                       |  80 ----
 lib/crypto/x86/sha256.h                       |  55 +++
 net/ceph/messenger_v2.c                       |  12 +-
 tools/testing/cxl/test/mem.c                  |  21 +-
 61 files changed, 1369 insertions(+), 1070 deletions(-)
 delete mode 100644 include/crypto/internal/sha2.h
 delete mode 100644 lib/crypto/arm/sha256.c
 create mode 100644 lib/crypto/arm/sha256.h
 delete mode 100644 lib/crypto/arm64/sha256.c
 create mode 100644 lib/crypto/arm64/sha256.h
 rename arch/mips/cavium-octeon/crypto/octeon-sha256.c => lib/crypto/mips/sha256.h (76%)
 rename lib/crypto/powerpc/{sha256.c => sha256.h} (76%)
 delete mode 100644 lib/crypto/riscv/sha256.c
 create mode 100644 lib/crypto/riscv/sha256.h
 delete mode 100644 lib/crypto/s390/sha256.c
 create mode 100644 lib/crypto/s390/sha256.h
 delete mode 100644 lib/crypto/sha256-generic.c
 delete mode 100644 lib/crypto/sparc/Kconfig
 delete mode 100644 lib/crypto/sparc/Makefile
 rename lib/crypto/sparc/{sha256.c => sha256.h} (53%)
 delete mode 100644 lib/crypto/x86/sha256.c
 create mode 100644 lib/crypto/x86/sha256.h


base-commit: d74152ec2b5106263c2a502380acfaf5954f9898
-- 
2.50.0


