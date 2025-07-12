Return-Path: <linux-mips+bounces-9765-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F1070B02D8A
	for <lists+linux-mips@lfdr.de>; Sun, 13 Jul 2025 01:26:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9AC5189E7B3
	for <lists+linux-mips@lfdr.de>; Sat, 12 Jul 2025 23:26:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 184BA2309B2;
	Sat, 12 Jul 2025 23:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BXGecH2O"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4713229B36;
	Sat, 12 Jul 2025 23:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752362781; cv=none; b=rAdirqH+SNe2MgNvPW2Xk+Gxh8kxWwXyEIMlcblJsuT5V9q/Y7EAqdw/1bKY+68pUTBZVn3DwEBo9UvG4xmBzTafNelt/YekCfNyXy/50Hnl8xNAgQNrCbuzIS8L3gUwgnWKtmnByaVXgWeBAqK/zIHszya1CiGjNO7/4euGdwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752362781; c=relaxed/simple;
	bh=Wm+b+cUSHRkFTh2D1w+em+29oqKwtZr3rYSZ3dM2NKk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AGHH4XtsyG0LEP2bAuXLOua1JmVnVgWeZ542PnhvtTo+BhKCJHPRs0IZcMrxeKAYXcOYF7ZyJ1SVYtb2WVIY1QRuFQCY2WujSGJdSJybLxyjOX6ooeQUTg+UMgtBVMBmB5OSJMm1Jpcqi5FVX1XP9xWYJZemeVal/QU4iMpPGZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BXGecH2O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA2EEC4CEEF;
	Sat, 12 Jul 2025 23:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752362780;
	bh=Wm+b+cUSHRkFTh2D1w+em+29oqKwtZr3rYSZ3dM2NKk=;
	h=From:To:Cc:Subject:Date:From;
	b=BXGecH2Oi09zYYogLQHo2bcCstSs3o8GTy/y92HPFCq1Vd1rAkWZDhHndg8qF7W9t
	 hY7U8iag2AUbYsiKLN3G0YIlG4R3dwHnDcePSMDa4a/qmR6ruDaJYbtFY8Two6AY4+
	 7qzComryaIIpcoUBCP4hHCTfmnsSsJzMbgLZH62EkCgnIIOWHpuygf4BYTME+XdxXI
	 zXtsID8UasU+xHkOi2LOcQC4dX9EBk5jnaAjd22aerVY2n7+JISpevPL8uzubPkLTn
	 jzSWK2I+AzXSQ6LPbtB5yzjG7yed3vDW9oqHq9T9T+XfD+wHRIRpSNmG/aMOAzNcDm
	 N4SU7huVFEjrA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 00/26] SHA-1 library functions
Date: Sat, 12 Jul 2025 16:22:51 -0700
Message-ID: <20250712232329.818226-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series is also available at:

    git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git sha1-lib-v1

Patches 1-14 reorganize the kernel's SHA-1 code to be consistent with
the way the SHA-2 code is now organized:

- Add SHA-1 and HMAC-SHA1 library functions.
- Make the SHA-1 (and HMAC-SHA1) library functions use the existing
  architecture-optimized SHA-1 code, which is moved into lib/crypto/.
- Reimplement the old-school crypto API's "sha1" and "hmac(sha1)"
  algorithms on top of the SHA-1 and HMAC-SHA1 library functions.

The diffstat for that part is:

    65 files changed, 1052 insertions(+), 1582 deletions(-)

This hopefully should look quite boring and familiar by now, as
essentially the same cleanup was already applied to SHA-2.

Patch 15 adds sha1_kunit.

Note that while SHA-1 is a legacy algorithm, it still has many in-kernel
users for legacy protocols.  So it's not like we'll be able to remove
the SHA-1 code from the kernel anytime soon.  And some of these users
are currently having to jump through some *major* hoops to work around
the limitations of the old-school crypto API.  The library API greatly
simplifies things, and it makes the SHA-1 code consistent with the SHA-2
code.  So, IMO it's well worth doing this reorganization of the SHA-1
code, even though SHA-1 is a legacy algorithm.

To show this even more clearly, patches 16-26 convert various users to
use the SHA-1 library API (or both SHA-1 and SHA-2, in the case of some
users that use both algorithms).  The diffstat for that part is:

    27 files changed, 169 insertions(+), 903 deletions(-)

For 6.17, I'd like to take patches 1-15 at the most.  Patches 16-26
would be for later, and I'll probably resend them individually later for
subsystem maintainers to take.

Eric Biggers (26):
  crypto: x86/sha1 - Rename conflicting symbol
  lib/crypto: sha1: Rename sha1_init() to sha1_init_raw()
  lib/crypto: sha1: Add SHA-1 library functions
  lib/crypto: sha1: Add HMAC support
  crypto: sha1 - Wrap library and add HMAC support
  crypto: sha1 - Use same state format as legacy drivers
  lib/crypto: arm/sha1: Migrate optimized code into library
  lib/crypto: arm64/sha1: Migrate optimized code into library
  lib/crypto: mips/sha1: Migrate optimized code into library
  lib/crypto: powerpc/sha1: Migrate optimized code into library
  lib/crypto: s390/sha1: Migrate optimized code into library
  lib/crypto: sparc/sha1: Migrate optimized code into library
  lib/crypto: x86/sha1: Migrate optimized code into library
  crypto: sha1 - Remove sha1_base.h
  lib/crypto: tests: Add KUnit tests for SHA-1 and HMAC-SHA1
  bpf: Use sha1() instead of sha1_transform() in bpf_prog_calc_tag()
  sctp: Use HMAC-SHA1 and HMAC-SHA256 library functions
  ipv6: sr: Use HMAC-SHA1 and HMAC-SHA256 library functions
  tee: Use SHA-1 library instead of crypto_shash
  lib/digsig: Use SHA-1 library instead of crypto_shash
  drm/bridge: it6505: Use SHA-1 library instead of crypto_shash
  nfc: s3fwrn5: Use SHA-1 library instead of crypto_shash
  ppp: mppe: Use SHA-1 library instead of crypto_shash
  KEYS: trusted_tpm1: Use SHA-1 library instead of crypto_shash
  ipv6: Switch to higher-level SHA-1 functions
  lib/crypto: sha1: Remove low-level functions from API

 arch/arm/configs/exynos_defconfig             |   1 -
 arch/arm/configs/milbeaut_m10v_defconfig      |   2 -
 arch/arm/configs/multi_v7_defconfig           |   2 -
 arch/arm/configs/omap2plus_defconfig          |   1 -
 arch/arm/configs/pxa_defconfig                |   1 -
 arch/arm/crypto/Kconfig                       |  31 --
 arch/arm/crypto/Makefile                      |   6 -
 arch/arm/crypto/sha1-ce-glue.c                |  72 ----
 arch/arm/crypto/sha1_glue.c                   |  75 ----
 arch/arm/crypto/sha1_neon_glue.c              |  83 -----
 arch/arm64/configs/defconfig                  |   1 -
 arch/arm64/crypto/Kconfig                     |  11 -
 arch/arm64/crypto/Makefile                    |   3 -
 arch/arm64/crypto/sha1-ce-glue.c              | 118 -------
 arch/mips/cavium-octeon/crypto/Makefile       |   1 -
 arch/mips/cavium-octeon/crypto/octeon-sha1.c  | 146 --------
 arch/mips/configs/cavium_octeon_defconfig     |   1 -
 arch/mips/crypto/Kconfig                      |  10 -
 arch/powerpc/configs/44x/akebono_defconfig    |   1 -
 arch/powerpc/configs/powernv_defconfig        |   1 -
 arch/powerpc/configs/ppc64_defconfig          |   1 -
 arch/powerpc/crypto/Kconfig                   |  16 -
 arch/powerpc/crypto/Makefile                  |   4 -
 arch/powerpc/crypto/sha1-spe-glue.c           | 107 ------
 arch/powerpc/crypto/sha1.c                    |  78 -----
 arch/s390/configs/debug_defconfig             |   1 -
 arch/s390/configs/defconfig                   |   1 -
 arch/s390/crypto/Kconfig                      |  10 -
 arch/s390/crypto/Makefile                     |   1 -
 arch/s390/crypto/sha1_s390.c                  | 103 ------
 arch/sparc/crypto/Kconfig                     |  10 -
 arch/sparc/crypto/Makefile                    |   2 -
 arch/sparc/crypto/sha1_glue.c                 |  94 -----
 arch/x86/crypto/Kconfig                       |  14 -
 arch/x86/crypto/Makefile                      |   3 -
 arch/x86/crypto/sha1_ssse3_glue.c             | 324 ------------------
 crypto/Makefile                               |   2 +-
 crypto/sha1.c                                 | 201 +++++++++++
 crypto/sha1_generic.c                         |  87 -----
 crypto/testmgr.c                              |   6 +
 drivers/crypto/img-hash.c                     |   2 +-
 drivers/gpu/drm/bridge/Kconfig                |   3 +-
 drivers/gpu/drm/bridge/ite-it6505.c           |  33 +-
 drivers/net/ppp/Kconfig                       |   3 +-
 drivers/net/ppp/ppp_mppe.c                    | 109 +-----
 drivers/nfc/s3fwrn5/Kconfig                   |   3 +-
 drivers/nfc/s3fwrn5/firmware.c                |  17 +-
 drivers/tee/Kconfig                           |   3 +-
 drivers/tee/tee_core.c                        |  55 +--
 include/crypto/sha1.h                         | 186 +++++++++-
 include/crypto/sha1_base.h                    |  82 -----
 include/linux/filter.h                        |   6 -
 include/net/sctp/auth.h                       |  12 +-
 include/net/sctp/constants.h                  |   2 -
 include/net/sctp/structs.h                    |   5 -
 include/net/seg6_hmac.h                       |  12 -
 kernel/bpf/core.c                             |  49 +--
 lib/Kconfig                                   |   3 +-
 lib/crypto/Kconfig                            |  14 +
 lib/crypto/Makefile                           |  23 +-
 .../crypto/arm}/sha1-armv4-large.S            |   0
 .../crypto/arm}/sha1-armv7-neon.S             |  13 +-
 .../crypto => lib/crypto/arm}/sha1-ce-core.S  |   4 +-
 lib/crypto/arm/sha1.h                         |  46 +++
 .../crypto/arm64}/sha1-ce-core.S              |  40 +--
 lib/crypto/arm64/sha1.h                       |  39 +++
 lib/crypto/mips/sha1.h                        |  81 +++++
 .../crypto/powerpc}/sha1-powerpc-asm.S        |   0
 .../crypto/powerpc}/sha1-spe-asm.S            |   0
 lib/crypto/powerpc/sha1.h                     |  67 ++++
 lib/crypto/s390/sha1.h                        |  28 ++
 lib/crypto/sha1.c                             | 267 ++++++++++++---
 lib/crypto/sparc/sha1.h                       |  43 +++
 .../crypto => lib/crypto/sparc}/sha1_asm.S    |   0
 lib/crypto/tests/Kconfig                      |  10 +
 lib/crypto/tests/Makefile                     |   1 +
 lib/crypto/tests/sha1-testvecs.h              | 212 ++++++++++++
 lib/crypto/tests/sha1_kunit.c                 |  39 +++
 .../crypto/x86/sha1-avx2-asm.S                |   7 +-
 .../crypto/x86/sha1-ni-asm.S                  |  23 +-
 .../crypto/x86/sha1-ssse3-and-avx.S           |  13 +-
 lib/crypto/x86/sha1.h                         |  75 ++++
 lib/digsig.c                                  |  46 +--
 net/ipv6/Kconfig                              |   6 +-
 net/ipv6/addrconf.c                           |  23 +-
 net/ipv6/seg6.c                               |   7 -
 net/ipv6/seg6_hmac.c                          | 199 ++---------
 net/sctp/Kconfig                              |  15 +-
 net/sctp/auth.c                               | 153 ++-------
 net/sctp/socket.c                             |  10 -
 security/keys/trusted-keys/Kconfig            |   4 +-
 security/keys/trusted-keys/trusted_tpm1.c     | 221 ++----------
 92 files changed, 1472 insertions(+), 2474 deletions(-)
 delete mode 100644 arch/arm/crypto/sha1-ce-glue.c
 delete mode 100644 arch/arm/crypto/sha1_glue.c
 delete mode 100644 arch/arm/crypto/sha1_neon_glue.c
 delete mode 100644 arch/arm64/crypto/sha1-ce-glue.c
 delete mode 100644 arch/mips/cavium-octeon/crypto/octeon-sha1.c
 delete mode 100644 arch/powerpc/crypto/sha1-spe-glue.c
 delete mode 100644 arch/powerpc/crypto/sha1.c
 delete mode 100644 arch/s390/crypto/sha1_s390.c
 delete mode 100644 arch/sparc/crypto/sha1_glue.c
 delete mode 100644 arch/x86/crypto/sha1_ssse3_glue.c
 create mode 100644 crypto/sha1.c
 delete mode 100644 crypto/sha1_generic.c
 delete mode 100644 include/crypto/sha1_base.h
 rename {arch/arm/crypto => lib/crypto/arm}/sha1-armv4-large.S (100%)
 rename {arch/arm/crypto => lib/crypto/arm}/sha1-armv7-neon.S (98%)
 rename {arch/arm/crypto => lib/crypto/arm}/sha1-ce-core.S (96%)
 create mode 100644 lib/crypto/arm/sha1.h
 rename {arch/arm64/crypto => lib/crypto/arm64}/sha1-ce-core.S (76%)
 create mode 100644 lib/crypto/arm64/sha1.h
 create mode 100644 lib/crypto/mips/sha1.h
 rename {arch/powerpc/crypto => lib/crypto/powerpc}/sha1-powerpc-asm.S (100%)
 rename {arch/powerpc/crypto => lib/crypto/powerpc}/sha1-spe-asm.S (100%)
 create mode 100644 lib/crypto/powerpc/sha1.h
 create mode 100644 lib/crypto/s390/sha1.h
 create mode 100644 lib/crypto/sparc/sha1.h
 rename {arch/sparc/crypto => lib/crypto/sparc}/sha1_asm.S (100%)
 create mode 100644 lib/crypto/tests/sha1-testvecs.h
 create mode 100644 lib/crypto/tests/sha1_kunit.c
 rename arch/x86/crypto/sha1_avx2_x86_64_asm.S => lib/crypto/x86/sha1-avx2-asm.S (98%)
 rename arch/x86/crypto/sha1_ni_asm.S => lib/crypto/x86/sha1-ni-asm.S (90%)
 rename arch/x86/crypto/sha1_ssse3_asm.S => lib/crypto/x86/sha1-ssse3-and-avx.S (97%)
 create mode 100644 lib/crypto/x86/sha1.h

-- 
2.50.1


