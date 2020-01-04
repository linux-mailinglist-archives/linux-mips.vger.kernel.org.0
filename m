Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 928BC13044F
	for <lists+linux-mips@lfdr.de>; Sat,  4 Jan 2020 21:07:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726135AbgADUHt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 4 Jan 2020 15:07:49 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:46307 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726118AbgADUHt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 4 Jan 2020 15:07:49 -0500
Received: by mail-pl1-f194.google.com with SMTP id y8so20268678pll.13;
        Sat, 04 Jan 2020 12:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=b1kS8vLLxH+4vuJg2IabnHI/ekmjCC3BWGHgeYGsuEM=;
        b=bzBJeX1D8MNFJgd0awEstuyFH5D6i8ny8uRt3JuVi8elyM2N546yMBRUnBKTOO1cTP
         ylUw2uQkAbNeDlBjBGUedfHTSQ0+rg9IQ9wXh/0HqkOYkYRU6etBrlqYtSE+2AnocbFA
         qSQ+FwakcnFxNDAmdxAVk2q7K/h35M4k2ND2JZaNs/u+9MF1GRWx1Y1kUdpUYYvoOWRB
         xPQqgQRHAKosOYamVly+M7QO9cnv27b5lcK8zuZosS8KLkEgRH3c824DmVmqjezz0sS1
         vv9DUuk+j5oKo7ozqM7NPSdw8xw1uz4iHcCkMkJUUIcozVeMsG6yTRCZ5a60WRRH2RSt
         x18w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=b1kS8vLLxH+4vuJg2IabnHI/ekmjCC3BWGHgeYGsuEM=;
        b=UOnPOcHJYWDPtMQsHC0iEIjPYS27JdpXG36f38c61KOM2TKEKbbEwQvMT7xK6TrTSn
         FjGFvlWrarrxYoQzVN8+MNu3yXroyxXjZGtge63RHZVwHgUVDJquOlN6TLo+0UzH1AfR
         gaSArFINLqVDG3wK+y2h8hBZmUmcLg2hAVUBdtafQLRG+iB2Gam3S8RHV3pH1kf8slk4
         nXEFtFo0rIydmAUTLlXa9vDkCwCOoMNlgphxj0i4hmq5OKNizeaOCewX9xYx/pvSi470
         FuMk+sx+5Ci13J1uKzZTMDKXCC6s44qJFlD3FThhUmpN5nvY37UECDUWGRiAUaUBLZcV
         /QUg==
X-Gm-Message-State: APjAAAVCBsVQKPogjouxUgdSGI592VCGxHXVQK2usDrnupA5YEYbq5fY
        gYzFVA2scp1Sx/502FurPGs=
X-Google-Smtp-Source: APXvYqwG9e1Fi0ErEe2MKf+tkoMuAZ96ttyrs4dZi6OTW4BKM5MuzUzmthYoAbzHA+PuclHk4LtVhw==
X-Received: by 2002:a17:902:6bca:: with SMTP id m10mr99318980plt.212.1578168468597;
        Sat, 04 Jan 2020 12:07:48 -0800 (PST)
Received: from localhost ([2601:646:8a80:3eb0::9760])
        by smtp.gmail.com with ESMTPSA id p12sm19055183pjo.5.2020.01.04.12.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2020 12:07:47 -0800 (PST)
From:   Paul Burton <paulburton89@gmail.com>
X-Google-Original-From: Paul Burton <paul.burton@mips.com>
Date:   Sat, 4 Jan 2020 12:07:46 -0800
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Subject: [GIT PULL] MIPS fixes
Message-ID: <20200104200746.imnkglnarvkhzrtw@pburton-laptop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2ai2goydcsnlwrgd"
Content-Disposition: inline
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


--2ai2goydcsnlwrgd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Here is a collection of MIPS fixes for the 5.5 cycle; please pull.

Thanks,
    Paul


The following changes since commit a8d0f11ee50ddbd9f243c7a8b1a393a4f23ba093:

  MIPS: SGI-IP27: Enable ethernet phy on second Origin 200 module (2019-11-23 14:20:30 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mips/linux.git tags/mips_fixes_5.5_1

for you to fetch changes up to bbcc5672b0063b0e9d65dc8787a4f09c3b5bb5cc:

  MIPS: Avoid VDSO ABI breakage due to global register variable (2020-01-02 16:41:16 -0800)

----------------------------------------------------------------
A collection of MIPS fixes:

- Fill the struct cacheinfo shared_cpu_map field with sensible values,
  notably avoiding issues with perf which was unhappy in the absence of
  these values.

- A boot fix for Loongson 2E & 2F machines which was fallout from some
  refactoring performed this cycle.

- A Kconfig dependency fix for the Loongson CPU HWMon driver.

- A couple of VDSO fixes, ensuring gettimeofday() behaves appropriately
  for kernel configurations that don't include support for a clocksource
  the VDSO can use & fixing the calling convention for the n32 & n64
  VDSOs which would previously clobber the $gp/$28 register.

- A build fix for vmlinuz compressed images which were inappropriately
  building with -fsanitize-coverage despite not being part of the kernel
  proper, then failing to link due to the missing
  __sanitizer_cov_trace_pc() function.

- A couple of eBPF JIT fixes, including disabling it for MIPS32 due to a
  large number of issues with the code generated there & reflecting ISA
  dependencies in Kconfig to enforce that systems which don't support
  the JIT must include the interpreter.

----------------------------------------------------------------
Alexander Lobakin (1):
      MIPS: BPF: eBPF JIT: check for MIPS ISA compliance in Kconfig

Guenter Roeck (1):
      MIPS: Fix boot on Fuloong2 systems

Joe Perches (1):
      MIPS: Kconfig: Use correct form for 'depends on'

Jouni Hogander (1):
      MIPS: Prevent link failure with kcov instrumentation

Paul Burton (2):
      MIPS: BPF: Disable MIPS32 eBPF JIT
      MIPS: Avoid VDSO ABI breakage due to global register variable

Vincenzo Frascino (1):
      mips: Fix gettimeofday() in the vdso library

Vladimir Kondratiev (1):
      mips: cacheinfo: report shared CPU map

 arch/mips/Kconfig                         |  2 +-
 arch/mips/boot/compressed/Makefile        |  3 +++
 arch/mips/include/asm/cpu-type.h          |  3 ++-
 arch/mips/include/asm/thread_info.h       | 20 +++++++++++++++++++-
 arch/mips/include/asm/vdso/gettimeofday.h | 13 -------------
 arch/mips/kernel/cacheinfo.c              | 27 ++++++++++++++++++++++++++-
 arch/mips/net/ebpf_jit.c                  |  2 +-
 arch/mips/vdso/vgettimeofday.c            | 20 ++++++++++++++++++++
 drivers/platform/mips/Kconfig             |  2 +-
 9 files changed, 73 insertions(+), 19 deletions(-)

--2ai2goydcsnlwrgd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQRgLjeFAZEXQzy86/s+p5+stXUA3QUCXhDwkgAKCRA+p5+stXUA
3WA+AP4gipdFlYw9AY80dvui8y9ph7DmF+IWucVh8tR/JSloYwEAq536C46uZUVK
2Um1a69eqD+VNQj7Q9svBs4j2n9xYgg=
=e6VX
-----END PGP SIGNATURE-----

--2ai2goydcsnlwrgd--
