Return-Path: <linux-mips+bounces-10029-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BFBB1BC83
	for <lists+linux-mips@lfdr.de>; Wed,  6 Aug 2025 00:30:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D60A86280C8
	for <lists+linux-mips@lfdr.de>; Tue,  5 Aug 2025 22:30:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A2AD2609CC;
	Tue,  5 Aug 2025 22:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uI+dm8Jr"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DB4215198;
	Tue,  5 Aug 2025 22:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754433007; cv=none; b=SxDn1x7wGK2qc+2JbeptRhRqE3kxqgstVxmLHiajVAlHS/2Scm9LI0Bnsj8jQ2YNk4mOqgPPhIh7XJEJ+6zL0FYf/qNe/D+AdfwDp1EM1QSi39iIClcsJH0/LwDLbqRPVmNTqNwggJdAivw6MQ/zz+10ob8Mg9hvwldqgML2Ao8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754433007; c=relaxed/simple;
	bh=7ylTPhqKIZKqcaCZzAUkFz0JFvQR09C/unf3SduQA68=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c5HwvTk5ybnUnh5nXjZEy3gpAwnJBSdbHP/Brb1INqexzrzM0yUB/mKV9+0vBVuEsLNNRNWOjm46O7HsqAHKDMtjYEG1slxvoVLBFOuArvf8XJ9p6XAzDLsPGhlx55LoRGIx4D6rC1wQzh/u6NrD4mhpWEjUDX7MQSb1biGGE0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uI+dm8Jr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E859BC4CEF0;
	Tue,  5 Aug 2025 22:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754433006;
	bh=7ylTPhqKIZKqcaCZzAUkFz0JFvQR09C/unf3SduQA68=;
	h=From:To:Cc:Subject:Date:From;
	b=uI+dm8JrGYlbEptuLosbA376eEtZB3eyNYrv7b5JBvFPQSxCZXVXb+gHdeAkVZAes
	 C7h6VOmn3DI/jO1iy81zLEC64c4bGfyw7Xn1Z0gnFy3GJHHOODVU18dw+NdH1UWatj
	 vaXBnMEEqR96Fv81P8iqtkf9SM968MEnDOXEbpZK9NSiIOqsPL9UnF1/uYElHxkTYu
	 dY5FExx/Gh0Gp1GVh50gEomRbvqQ+P66nq3xIquMXRh0O5aCUvUnJdWS4lYwTdf+HX
	 WWcGDMVh0kOnqKg5kB9kPMbBGYyW95b52Zn6HoJXKITouqAY2RYQZoO/Ia1q1ZoMK2
	 9UAsRpJ37UeVg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v2 0/7] MD5 library functions
Date: Tue,  5 Aug 2025 15:28:48 -0700
Message-ID: <20250805222855.10362-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series is targeting libcrypto-next and can also be retrieved from:

    git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git md5-lib-v2

This series introduces a library API for MD5 and HMAC-MD5 and
reimplements the crypto_shash "md5" and "hmac(md5)" on top of it.

The library API will also be usable directly by various in-kernel users
that are stuck with MD5 due to having to implement legacy protocols.

This should again look quite boring and familiar, as it mirrors the
SHA-1 and SHA-2 changes closely.

Changed in v2:
  - Kept the architecture-optimized MD5 code, since unfortunately there
    were objections to removing it.

Eric Biggers (7):
  lib/crypto: md5: Add MD5 and HMAC-MD5 library functions
  lib/crypto: mips/md5: Migrate optimized code into library
  mips: cavium-octeon: Move octeon-crypto.c into parent dir
  lib/crypto: powerpc/md5: Migrate optimized code into library
  lib/crypto: sparc/md5: Migrate optimized code into library
  crypto: md5 - Wrap library and add HMAC support
  lib/crypto: tests: Add KUnit tests for MD5 and HMAC-MD5

 arch/mips/cavium-octeon/Makefile              |   2 +-
 arch/mips/cavium-octeon/crypto/Makefile       |   8 -
 arch/mips/cavium-octeon/crypto/octeon-md5.c   | 214 -----------
 .../{crypto => }/octeon-crypto.c              |   0
 arch/mips/configs/cavium_octeon_defconfig     |   1 -
 arch/mips/crypto/Kconfig                      |  10 -
 arch/powerpc/configs/powernv_defconfig        |   1 -
 arch/powerpc/configs/ppc64_defconfig          |   1 -
 arch/powerpc/crypto/Kconfig                   |   8 -
 arch/powerpc/crypto/Makefile                  |   2 -
 arch/powerpc/crypto/md5-glue.c                |  99 -----
 arch/sparc/crypto/Kconfig                     |  10 -
 arch/sparc/crypto/Makefile                    |   4 -
 arch/sparc/crypto/md5_glue.c                  | 174 ---------
 crypto/Kconfig                                |   2 +-
 crypto/md5.c                                  | 359 ++++++++----------
 crypto/testmgr.c                              |   3 +
 drivers/crypto/img-hash.c                     |   2 +-
 include/crypto/md5.h                          | 181 ++++++++-
 lib/crypto/Kconfig                            |  13 +
 lib/crypto/Makefile                           |  12 +
 lib/crypto/md5.c                              | 322 ++++++++++++++++
 lib/crypto/mips/md5.h                         |  65 ++++
 .../crypto => lib/crypto/powerpc}/md5-asm.S   |   0
 lib/crypto/powerpc/md5.h                      |  12 +
 lib/crypto/sparc/md5.h                        |  48 +++
 .../crypto => lib/crypto/sparc}/md5_asm.S     |   0
 lib/crypto/tests/Kconfig                      |  10 +
 lib/crypto/tests/Makefile                     |   1 +
 lib/crypto/tests/md5-testvecs.h               | 186 +++++++++
 lib/crypto/tests/md5_kunit.c                  |  39 ++
 31 files changed, 1060 insertions(+), 729 deletions(-)
 delete mode 100644 arch/mips/cavium-octeon/crypto/Makefile
 delete mode 100644 arch/mips/cavium-octeon/crypto/octeon-md5.c
 rename arch/mips/cavium-octeon/{crypto => }/octeon-crypto.c (100%)
 delete mode 100644 arch/powerpc/crypto/md5-glue.c
 delete mode 100644 arch/sparc/crypto/md5_glue.c
 create mode 100644 lib/crypto/md5.c
 create mode 100644 lib/crypto/mips/md5.h
 rename {arch/powerpc/crypto => lib/crypto/powerpc}/md5-asm.S (100%)
 create mode 100644 lib/crypto/powerpc/md5.h
 create mode 100644 lib/crypto/sparc/md5.h
 rename {arch/sparc/crypto => lib/crypto/sparc}/md5_asm.S (100%)
 create mode 100644 lib/crypto/tests/md5-testvecs.h
 create mode 100644 lib/crypto/tests/md5_kunit.c


base-commit: 186f3edfdd41f2ae87fc40a9ccba52a3bf930994
-- 
2.50.1


