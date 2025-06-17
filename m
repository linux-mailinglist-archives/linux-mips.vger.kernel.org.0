Return-Path: <linux-mips+bounces-9359-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 36166ADDD48
	for <lists+linux-mips@lfdr.de>; Tue, 17 Jun 2025 22:38:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1364C3A9406
	for <lists+linux-mips@lfdr.de>; Tue, 17 Jun 2025 20:37:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 546401F461A;
	Tue, 17 Jun 2025 20:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V+b+de44"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2792EFD89;
	Tue, 17 Jun 2025 20:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750192677; cv=none; b=QO5OBBW+UltPbQMb7nBqJ/TGZ1ugKbWMMFElvO2YUSVFN3gVz1XiHvhEAl2y055FEfDgcOQ4K6G3AaSoaQV3L72k8Mbcjc88CbCkzs7jIi9etIC02dRF+9PfyfMofhdfda0Fhlj5H1aCPy9gGnudItZ/7li/Fsx2PLESiZLRCBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750192677; c=relaxed/simple;
	bh=54r4znE4BXFv6bRlHG9/gifwZs8TUeyRhVX7bDrc6rU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KMwlUZWDQ/yG8H/B7ShNHEqviTLxDEwQxl9Mjq/ueIdzXxbokKaabCnn4z4qJXiO2NLAoXk72nL3EaFD4Of1s7O6Co+MkG6hjgwLjEcOX5UF9F2ZCgPTKBrigqsk+8uhBg6UbtzkRVlovT4FLAAo6YJpKaPutc5PXDpEDWgkdL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V+b+de44; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4624FC4CEE3;
	Tue, 17 Jun 2025 20:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750192676;
	bh=54r4znE4BXFv6bRlHG9/gifwZs8TUeyRhVX7bDrc6rU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V+b+de44XCuqsbVM2gPSQqPVm0WdGNUlqRBkLtWrdV+FwOXF3ttT9tRQ3SrjU8XjP
	 xAajZnol+FMY0k3u6Y/eoNT/xYM8iQ/rfrgq7EinZfzqW4axMOLb+xGQ1YLf4HCIiq
	 ntSlhcaR2Xl4jESgQFTDTdge2fxELUCsCpW+VVXBO3n4Dhkqishg81CcIOzoVqEmbp
	 HKwdl3VT77uNQnla0VuHiSdpOBVzK0266GlFGLHUZrFy0BMkM4ZceHOWsZPWu8kmro
	 HcjgwItg8W6ReZyV9qTGTU2VLTOCjf2zCJleOsH7TCyushCz/0yplJ0tLSz8MvemOL
	 3bSdC0WwjC0fQ==
Date: Tue, 17 Jun 2025 13:37:26 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH v2 00/17] SHA-512 library functions
Message-ID: <20250617203726.GC1288@sol>
References: <20250616014019.415791-1-ebiggers@kernel.org>
 <20250617060523.GH8289@sol>
 <CAHk-=wi5d4K+sF2L=tuRW6AopVxO1DDXzstMQaECmU2QHN13KA@mail.gmail.com>
 <20250617192212.GA1365424@google.com>
 <CAHk-=wiB6XYBt81zpebysAoya4T-YiiZEmW_7+TtoA=FSCA4XQ@mail.gmail.com>
 <20250617195858.GA1288@sol>
 <CAHk-=whJjS_wfxCDhkj2fNp1XPAbxDDdNwF1iqZbamZumBmZPg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=whJjS_wfxCDhkj2fNp1XPAbxDDdNwF1iqZbamZumBmZPg@mail.gmail.com>

On Tue, Jun 17, 2025 at 01:08:14PM -0700, Linus Torvalds wrote:
> On Tue, 17 Jun 2025 at 12:59, Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > Again, the tests depend on the code they test being added first.
> 
> Sure, and that's fine. We have lots of "this depends on that".
> 
> > I could do two pull requests, the first with all non-test code and the second
> > with all test code, where the second depends on the first, i.e. it will have the
> > last commit of the first as its base commit.  Is that what you want?
> 
> Yes.
> 
> Or if one single pull request, split out the diffstat with the
> explanation (that's the "Or at the very least spell things out *very*
> clearly" option). But two separate pull requests would actually be my
> preference.
> 
>           Linus

Okay.  For now I'll keep the test commits last and plan for a separate pull
request with them, based on the first.  I fear I'll quickly run into
interdependencies, in which case I'll need to fall back to "one pull request and
spell things out very clearly".  But I'll try it.

Just so it's clear, this is the diffstat of this patchset broken down by
non-test code (patches 1-3 and 6-17) and tests (4-5):

    Non-test:
         arch/arm/configs/exynos_defconfig                  |   1 -
         arch/arm/configs/milbeaut_m10v_defconfig           |   1 -
         arch/arm/configs/multi_v7_defconfig                |   1 -
         arch/arm/configs/omap2plus_defconfig               |   1 -
         arch/arm/configs/pxa_defconfig                     |   1 -
         arch/arm/crypto/Kconfig                            |  10 -
         arch/arm/crypto/Makefile                           |  15 -
         arch/arm/crypto/sha512-glue.c                      | 110 ------
         arch/arm/crypto/sha512-neon-glue.c                 |  75 ----
         arch/arm/crypto/sha512.h                           |   3 -
         arch/arm64/configs/defconfig                       |   1 -
         arch/arm64/crypto/Kconfig                          |  19 -
         arch/arm64/crypto/Makefile                         |  14 -
         arch/arm64/crypto/sha512-ce-glue.c                 |  96 -----
         arch/arm64/crypto/sha512-glue.c                    |  83 -----
         arch/mips/cavium-octeon/crypto/Makefile            |   1 -
         arch/mips/cavium-octeon/crypto/octeon-crypto.c     |   3 +-
         arch/mips/cavium-octeon/crypto/octeon-md5.c        |   3 +-
         arch/mips/cavium-octeon/crypto/octeon-sha1.c       |   3 +-
         arch/mips/cavium-octeon/crypto/octeon-sha256.c     |   3 +-
         arch/mips/cavium-octeon/crypto/octeon-sha512.c     | 167 ---------
         arch/mips/configs/cavium_octeon_defconfig          |   1 -
         arch/mips/crypto/Kconfig                           |  10 -
         .../asm/octeon/crypto.h}                           |   0
         arch/riscv/crypto/Kconfig                          |  11 -
         arch/riscv/crypto/Makefile                         |   3 -
         arch/riscv/crypto/sha512-riscv64-glue.c            | 124 -------
         arch/s390/configs/debug_defconfig                  |   1 -
         arch/s390/configs/defconfig                        |   1 -
         arch/s390/crypto/Kconfig                           |  10 -
         arch/s390/crypto/Makefile                          |   1 -
         arch/s390/crypto/sha512_s390.c                     | 151 --------
         arch/sparc/crypto/Kconfig                          |  10 -
         arch/sparc/crypto/Makefile                         |   2 -
         arch/sparc/crypto/sha512_glue.c                    | 122 -------
         arch/x86/crypto/Kconfig                            |  13 -
         arch/x86/crypto/Makefile                           |   3 -
         arch/x86/crypto/sha512_ssse3_glue.c                | 322 -----------------
         crypto/Kconfig                                     |   4 +-
         crypto/Makefile                                    |   2 +-
         crypto/sha512.c                                    | 338 +++++++++++++++++
         crypto/sha512_generic.c                            | 217 -----------
         crypto/testmgr.c                                   |  16 +
         drivers/crypto/starfive/jh7110-hash.c              |   8 +-
         include/crypto/sha2.h                              | 350 ++++++++++++++++++
         include/crypto/sha512_base.h                       | 120 -------
         lib/crypto/Kconfig                                 |  18 +
         lib/crypto/Makefile                                |  36 ++
         lib/crypto/arm/.gitignore                          |   2 +
         .../arm/crypto => lib/crypto/arm}/sha512-armv4.pl  |   0
         lib/crypto/arm/sha512.h                            |  38 ++
         lib/crypto/arm64/.gitignore                        |   2 +
         .../crypto => lib/crypto/arm64}/sha512-ce-core.S   |  10 +-
         lib/crypto/arm64/sha512.h                          |  46 +++
         lib/crypto/mips/sha512.h                           |  74 ++++
         .../crypto/riscv}/sha512-riscv64-zvknhb-zvkb.S     |   4 +-
         lib/crypto/riscv/sha512.h                          |  41 +++
         lib/crypto/s390/sha512.h                           |  28 ++
         lib/crypto/sha512.c                                | 400 +++++++++++++++++++++
         lib/crypto/sparc/sha512.h                          |  42 +++
         .../sparc/crypto => lib/crypto/sparc}/sha512_asm.S |   0
         .../x86/crypto => lib/crypto/x86}/sha512-avx-asm.S |  11 +-
         .../crypto => lib/crypto/x86}/sha512-avx2-asm.S    |  11 +-
         .../crypto => lib/crypto/x86}/sha512-ssse3-asm.S   |  12 +-
         lib/crypto/x86/sha512.h                            |  54 +++
         65 files changed, 1524 insertions(+), 1756 deletions(-)

    Test:
         lib/crypto/Kconfig                    |   2 +
         lib/crypto/Makefile                   |   2 +
         lib/crypto/tests/Kconfig              |  24 ++
         lib/crypto/tests/Makefile             |   6 +
         lib/crypto/tests/hash-test-template.h | 512 ++++++++++++++++++++++++++
         lib/crypto/tests/sha224-testvecs.h    | 223 ++++++++++++
         lib/crypto/tests/sha224_kunit.c       |  50 +++
         lib/crypto/tests/sha256-testvecs.h    | 223 ++++++++++++
         lib/crypto/tests/sha256_kunit.c       |  39 ++
         lib/crypto/tests/sha384-testvecs.h    | 566 +++++++++++++++++++++++++++++
         lib/crypto/tests/sha384_kunit.c       |  48 +++
         lib/crypto/tests/sha512-testvecs.h    | 662 ++++++++++++++++++++++++++++++++++
         lib/crypto/tests/sha512_kunit.c       |  48 +++
         scripts/crypto/gen-hash-testvecs.py   |  83 +++++
         14 files changed, 2488 insertions(+)

Note that the non-test part includes kerneldoc comments.  I'll assume you aren't
going to insist on those being in a separate "documentation" pull request...

If I need to resend this patchset for another reason, I'll also split it into
two patchsets, one depending on the other.  But I'm not planning to resend it
purely to do that split and with no other changes, as that seems a bit silly.

- Eric

