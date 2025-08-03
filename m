Return-Path: <linux-mips+bounces-9972-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C17B19530
	for <lists+linux-mips@lfdr.de>; Sun,  3 Aug 2025 22:45:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 003DB3B4660
	for <lists+linux-mips@lfdr.de>; Sun,  3 Aug 2025 20:45:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACFDD1DEFE8;
	Sun,  3 Aug 2025 20:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EWoNC4zj"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606AE12BF24;
	Sun,  3 Aug 2025 20:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754253930; cv=none; b=gB6PmcjVOEUHLkPhZWfDQXMXJcG+aTtAF+NqUzdfH7yHOe9KXj1+QW3IU6vJMr6GTLMOzMnFZ2KQ1yuI5sfrZqUqxjlwM63lwEyndLtNTlyis3c8VLOTMxwObkSlETOQUr4p/Iux8Y4QU078USFsqzP3mFirw6AGfcrn+nTohkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754253930; c=relaxed/simple;
	bh=fIsnggQ9bSogOYsC/oCooZJEKpFlIjgSJ+O2mM0ik/g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uebnB28695KfwXaBEGmi5QL8AtuAr8fmjU0kSDxqE5zj3GN0a9eRjlbFdQIlJr0rePxeJHNoVTlOtDK/lPybMNOBKr9mAvVfkqfb/7NPcJCwKmlzm10+WuMyPaoDf3uLqIJ2RZIg0zjVltVV2urlEWBBnn72teDzqO2xzMfYr3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EWoNC4zj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AE1EC4CEEB;
	Sun,  3 Aug 2025 20:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754253929;
	bh=fIsnggQ9bSogOYsC/oCooZJEKpFlIjgSJ+O2mM0ik/g=;
	h=From:To:Cc:Subject:Date:From;
	b=EWoNC4zj60IkF748py5lD143qrk8WMoOpmcQeQ+NC5PoeQKL1jJgTiyyteh1M5MC8
	 wJP/9/XZnmxbN+qq/oM/Wj7x4a/abxCh+2BVJ9o0n00s80/plMl1wskCZLsiaiV8ns
	 qjc4p9Xg+1Pet7M1z7PhtLPl1cKyB0aL67v35awvlDuhmwNVoivOT1fSrmF8bl5lfv
	 2rytBpIDtMTon6+n+XvB9kUJZkWk8tgr+W/D4pVPKzXHmMAJVHU84etSXr0T9oEdF0
	 cS9P1E0SO+IKSzuujuWHHIftTgkZ+FvAwEn/tI6CZuNW59BGG/XWXa+sydGqZns+Qu
	 m9hMGJf1qFtSQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 0/7] MD5 library functions
Date: Sun,  3 Aug 2025 13:44:26 -0700
Message-ID: <20250803204433.75703-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series is targeting libcrypto-next and can also be retrieved from:

    git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git md5-lib-v1

Patches 1-4 remove the MD5 implementations for mips, powerpc, and sparc.
These were the only architecture-optimized MD5 implementations and are
not worth keeping around.

Patches 5-7 introduce a library API for MD5 and HMAC-MD5 and reimplement
the crypto_shash "md5" and "hmac(md5)" on top of it.

The library API will also be usable directly by various in-kernel users
that are stuck with MD5 due to having to implement legacy protocols.

This should again look quite boring and familiar, as it mirrors the
SHA-1 and SHA-2 changes closely.  The MD5 changes are quite a bit
simpler, though, since we'll only be supporting the generic C MD5 code.
Of course there's also only one variant of MD5, unlike e.g. SHA-2.

Eric Biggers (7):
  mips: cavium-octeon: Remove Octeon optimized MD5 code
  mips: cavium-octeon: Move octeon-crypto.c into parent dir
  crypto: powerpc/md5 - Remove PowerPC optimized MD5 code
  crypto: sparc/md5 - Remove SPARC64 optimized MD5 code
  lib/crypto: md5: Add MD5 and HMAC-MD5 library functions
  crypto: md5 - Wrap library and add HMAC support
  lib/crypto: tests: Add KUnit tests for MD5 and HMAC-MD5

 arch/mips/cavium-octeon/Makefile              |   2 +-
 arch/mips/cavium-octeon/crypto/Makefile       |   8 -
 arch/mips/cavium-octeon/crypto/octeon-md5.c   | 214 -----------
 .../{crypto => }/octeon-crypto.c              |   0
 arch/mips/configs/cavium_octeon_defconfig     |   1 -
 arch/mips/crypto/Kconfig                      |  10 -
 arch/mips/include/asm/octeon/crypto.h         |  21 +-
 arch/powerpc/configs/powernv_defconfig        |   1 -
 arch/powerpc/configs/ppc64_defconfig          |   1 -
 arch/powerpc/crypto/Kconfig                   |   8 -
 arch/powerpc/crypto/Makefile                  |   2 -
 arch/powerpc/crypto/md5-asm.S                 | 235 ------------
 arch/powerpc/crypto/md5-glue.c                |  99 -----
 arch/sparc/crypto/Kconfig                     |  10 -
 arch/sparc/crypto/Makefile                    |   4 -
 arch/sparc/crypto/md5_asm.S                   |  70 ----
 arch/sparc/crypto/md5_glue.c                  | 174 ---------
 crypto/Kconfig                                |   2 +-
 crypto/md5.c                                  | 359 ++++++++----------
 crypto/testmgr.c                              |   3 +
 drivers/crypto/img-hash.c                     |   2 +-
 include/crypto/md5.h                          | 181 ++++++++-
 lib/crypto/Kconfig                            |   6 +
 lib/crypto/Makefile                           |   3 +
 lib/crypto/md5.c                              | 290 ++++++++++++++
 lib/crypto/tests/Kconfig                      |  10 +
 lib/crypto/tests/Makefile                     |   1 +
 lib/crypto/tests/md5-testvecs.h               | 186 +++++++++
 lib/crypto/tests/md5_kunit.c                  |  39 ++
 29 files changed, 891 insertions(+), 1051 deletions(-)
 delete mode 100644 arch/mips/cavium-octeon/crypto/Makefile
 delete mode 100644 arch/mips/cavium-octeon/crypto/octeon-md5.c
 rename arch/mips/cavium-octeon/{crypto => }/octeon-crypto.c (100%)
 delete mode 100644 arch/powerpc/crypto/md5-asm.S
 delete mode 100644 arch/powerpc/crypto/md5-glue.c
 delete mode 100644 arch/sparc/crypto/md5_asm.S
 delete mode 100644 arch/sparc/crypto/md5_glue.c
 create mode 100644 lib/crypto/md5.c
 create mode 100644 lib/crypto/tests/md5-testvecs.h
 create mode 100644 lib/crypto/tests/md5_kunit.c


base-commit: 186f3edfdd41f2ae87fc40a9ccba52a3bf930994
-- 
2.50.1


