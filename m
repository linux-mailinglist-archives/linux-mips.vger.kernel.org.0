Return-Path: <linux-mips+bounces-12396-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E85C9CA2D83
	for <lists+linux-mips@lfdr.de>; Thu, 04 Dec 2025 09:38:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D33F93006622
	for <lists+linux-mips@lfdr.de>; Thu,  4 Dec 2025 08:38:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54975309EFF;
	Thu,  4 Dec 2025 08:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QaO9nUzK"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93D33254AD
	for <linux-mips@vger.kernel.org>; Thu,  4 Dec 2025 08:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764837520; cv=none; b=nSCfVpV6KXrcPrVyDJd19nWgHvooBsSi9LXQmXWNM/D9DXEvgDwWf5n1TwAR0WAXVYoohfD73wUyW3zNDLSejtMwWxELjdklOluw0KZ3+zNMf6BkF/WY3uBBv4LGoHvmFQ4O0H6Fk7qOCRJ0bK6IALXXKnw9mjQVA9YMJQAPFwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764837520; c=relaxed/simple;
	bh=mqhXiD/NpVQgpF5pRnCUAPxzIeECRU0KQVh4dg8DiKU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rrWuRzO3hj0gTzq5FP2uQf7D5wDQ7cVFcGTI9XkIHbHV4SacA2U0JzmrJQ94xQFHbZ45lzseKSmCCe7L1Jn0H0XMhR6m5LLSOaxrp+vygfsAEF3HpsZULrwMdkiOlr+JsW4h4g19N6+2IJVIq6yHg3URfX+CkaWjcXFGB2vxYQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QaO9nUzK; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-bf5ac50827dso455205a12.2
        for <linux-mips@vger.kernel.org>; Thu, 04 Dec 2025 00:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764837517; x=1765442317; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0JlKi5Mxej8/+ZcumeV18Yc+KKJCP9ofTFD7HkIbArE=;
        b=QaO9nUzKXLmW5DjnepNYuJFMmVJGSTqsSkR3dzx1VMm5rH4Wupe157F5H1G9ZCL3Go
         OEq2qlEOpO2bi+J/R5mgX/Gm2/d/u4QgazmWp7PsF4QecgwkzEd2vSrbz79r5zSXThkr
         ZHyvUpufah7xWA0vyaRR8+Q0jUJp3EDTQAo/2ZaLPM0NB+ysnvs22pkalZr1fgcOS28+
         88mQcorzLZ7EIYeuNquUtcK0ZOltiOXWVfxKG2d4q8LYMx0k9otU31zTTv/PUi57RbKk
         Cq8qkZfwyNV7MSro/FsvXXljFZJzZ5rV1JhEPA8tbamo41v6ZhPLJs6sJ+lNDgzNEciQ
         HoKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764837517; x=1765442317;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0JlKi5Mxej8/+ZcumeV18Yc+KKJCP9ofTFD7HkIbArE=;
        b=lAVevVwhTSw7BgOhCH0b9r38eEkjXa8WFTB4yp/U3gdn17VDlHh1UfZuT5C2Y4+KKB
         gxE8eJDQaaBnF/0uKKE84ApHL5OmRRvhnCP8i4aNjqEaAOjI0q9AbBAQH6KIDWqsW1e9
         50kPHf6VwoeenJHUpiYoRrV8rEN6cgKE0TyFtvs3dG3meqYgnB9H1q3MKlRcwaenCX+v
         G3UH8zknxGJqFDK1LrKHUCI4Gs+Tg138UK7Zk3DV4dAHi1rPsnCfayZDaISRPLf+snWQ
         g6FPUNwYb6ogpPUmuoc8m6rnlduRPESKTPZDUpdGF6GK0LB2WOy7uUMDUXhHrE2L0Y2Z
         PcKA==
X-Forwarded-Encrypted: i=1; AJvYcCUCJ8eF7f5skE6Ardc3uZ6Fj0ejI0HauiDuIFnZW3CefvLkYjYzNnbLNh7GxskSmwXBF8BO6t15Rexm@vger.kernel.org
X-Gm-Message-State: AOJu0YwdDQC0zLlaWrKVBLKDjngaWInttQqhWinXpi+pL8eNtFtTWPjv
	TEnPckPfBCYBYsAq4P/ajY7xbilGTTLuDhnPcjw26U3+J6VdAbN7ImKuBjjTj3FwiNX3Bfay6Bf
	qjl0hWGKxXeVPDYTsZYKiZ22zr3WFAE/KvLwwyJ2n/A==
X-Gm-Gg: ASbGncveFlHmXGBU4kFo1ydKtKBqTZoHGT9xOUI5zh9fNmMPFIt5SK2bwe530CCnbwX
	9POfu6346jvOryX06j4rStyH5nBMMJHbZdJUUL23+4XFQvbm8ivFVC96yyVvWGniMdzjGySeL9A
	P7c7stw0CjrFRfF/aRQSVRPMcxn65crjYYmhn8+33sVEuEtw8N0atTpTQQ9gtmOEuS6P0+tN6ch
	u7D2la6LNFLTAlLRrUfiQlQlfUkYoRbWfgiWrkIiALR4Vktyk7d2iKt1x5iiN3ziyfOJDmQfpzk
	VJo6dnjEjfnCDG+7fTQtgHXm3ZF6
X-Google-Smtp-Source: AGHT+IFZEAv1ezVPCker9GLaQZImi3N5jH6VXIGomJJWxOm3zS/LZIZssrCOD1GSIIbrPIuYSxinKKQkE6vNP8MxkPE=
X-Received: by 2002:a05:693c:3111:b0:2a4:3592:c5fb with SMTP id
 5a478bee46e88-2aba424d110mr1567722eec.12.1764837517021; Thu, 04 Dec 2025
 00:38:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251203152414.082328008@linuxfoundation.org>
In-Reply-To: <20251203152414.082328008@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 4 Dec 2025 14:08:24 +0530
X-Gm-Features: AWmQ_bnogH29i6myZ_z674xGj0T3c_RPNdGl1-x_I57yUAyVvG1sIUwN6973xXs
Message-ID: <CA+G9fYvmhQs9qx-XpLiaOUZQKj=gR=-X5MoJ1auRmbC7cC+AXw@mail.gmail.com>
Subject: Re: [PATCH 5.15 000/392] 5.15.197-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev, 
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, 
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, 
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de, 
	jonathanh@nvidia.com, f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, 
	rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, broonie@kernel.org, 
	achill@achill.org, sr@sladewatkins.com, Vlastimil Babka <vbabka@suse.cz>, 
	"Fabio M. De Francesco" <fabio.maria.de.francesco@linux.intel.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Svyatoslav Ryhel <clamor95@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Anders Roxell <anders.roxell@linaro.org>, Ben Copeland <benjamin.copeland@linaro.org>, 
	Ian Rogers <irogers@google.com>, linux-mips@vger.kernel.org, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Dec 2025 at 21:27, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 5.15.197 release.
> There are 392 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Fri, 05 Dec 2025 15:23:16 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.15.197-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.15.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

The arm, mips and powerpc builds failed on the stable-rc 5.15.197-rc1.

Build regressions: arm, fuse-tegra30.c:250:10: error: 'const struct
tegra_fuse_soc' has no member named 'cells'
Build regressions: arm, fuse-tegra30.c:250:18: error: initialization
of 'const struct attribute_group *' from incompatible pointer type
'const struct nvmem_cell_info *' [-Werror=incompatible-pointer-types]
Build regressions: arm, fuse-tegra30.c:251:10: error: 'const struct
tegra_fuse_soc' has no member named 'num_cells'

Build regressions: mips, tlb-r4k.c:591:31: error: passing argument 1
of 'memblock_free' makes integer from pointer without a cast
[-Werror=int-conversion]

Build regressions: powerpc, mm/mempool.c:68:17: error: 'for' loop
initial declarations are only allowed in C99 or C11 mode

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

ARM build regressions are due to,

  soc/tegra: fuse: Add Tegra114 nvmem cells and fuse lookups
  [ Upstream commit b9c01adedf38c69abb725a60a05305ef70dbce03 ]

MIPS build regressions are due to,

  MIPS: mm: kmalloc tlb_vpn array to avoid stack overflow
  commit 841ecc979b18d3227fad5e2d6a1e6f92688776b5 upstream.

Powerpc build regressions are due to,

  mm/mempool: replace kmap_atomic() with kmap_local_page()
  [ Upstream commit f2bcc99a5e901a13b754648d1dbab60f4adf9375 ]

### arm build error
drivers/soc/tegra/fuse/fuse-tegra30.c:250:10: error: 'const struct
tegra_fuse_soc' has no member named 'cells'
  250 |         .cells = tegra114_fuse_cells,
      |          ^~~~~
drivers/soc/tegra/fuse/fuse-tegra30.c:250:18: error: initialization of
'const struct attribute_group *' from incompatible pointer type 'const
struct nvmem_cell_info *' [-Werror=incompatible-pointer-types]
  250 |         .cells = tegra114_fuse_cells,
      |                  ^~~~~~~~~~~~~~~~~~~
drivers/soc/tegra/fuse/fuse-tegra30.c:250:18: note: (near
initialization for 'tegra114_fuse_soc.soc_attr_group')
drivers/soc/tegra/fuse/fuse-tegra30.c:251:10: error: 'const struct
tegra_fuse_soc' has no member named 'num_cells'
  251 |         .num_cells = ARRAY_SIZE(tegra114_fuse_cells),
      |          ^~~~~~~~~
cc1: some warnings being treated as errors

### mips Build error
arch/mips/mm/tlb-r4k.c: In function 'r4k_tlb_uniquify':
arch/mips/mm/tlb-r4k.c:591:31: error: passing argument 1 of
'memblock_free' makes integer from pointer without a cast
[-Werror=int-conversion]
  591 |                 memblock_free(tlb_vpns, tlb_vpn_size);
      |                               ^~~~~~~~
      |                               |
      |                               long unsigned int *
In file included from arch/mips/mm/tlb-r4k.c:15:
include/linux/memblock.h:107:31: note: expected 'phys_addr_t' {aka
'unsigned int'} but argument is of type 'long unsigned int *'
  107 | int memblock_free(phys_addr_t base, phys_addr_t size);
      |                   ~~~~~~~~~~~~^~~~
cc1: all warnings being treated as errors

### powerpc build error
mm/mempool.c: In function 'check_element':
mm/mempool.c:68:17: error: 'for' loop initial declarations are only
allowed in C99 or C11 mode
   68 |                 for (int i = 0; i < (1 << order); i++) {
      |                 ^~~
mm/mempool.c:68:17: note: use option '-std=c99', '-std=gnu99',
'-std=c11' or '-std=gnu11' to compile your code
mm/mempool.c: In function 'poison_element':
mm/mempool.c:101:17: error: 'for' loop initial declarations are only
allowed in C99 or C11 mode
  101 |                 for (int i = 0; i < (1 << order); i++) {
      |                 ^~~
make[2]: *** [scripts/Makefile.build:289: mm/mempool.o] Error 1

## Build
* kernel: 5.15.197-rc1
* git: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
* git commit: d6138097171ea16c4b0e51c3414d51c473f820cc
* git describe: v5.15.196-393-gd6138097171e
* test details:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-5.15.y/build/v5.15.196-393-gd6138097171e

## Test Regressions (compared to v5.15.195-118-g59a59821e6b5)
* arm, build
  - clang-21-defconfig
  - clang-21-lkftconfig
  - clang-21-lkftconfig-no-kselftest-frag
  - clang-nightly-lkftconfig-kselftest
  - gcc-12-defconfig
  - gcc-12-lkftconfig
  - gcc-12-lkftconfig-debug
  - gcc-12-lkftconfig-kasan
  - gcc-12-lkftconfig-kunit
  - gcc-12-lkftconfig-libgpiod
  - gcc-12-lkftconfig-no-kselftest-frag
  - gcc-12-lkftconfig-perf
  - gcc-12-lkftconfig-rcutorture
  - gcc-8-defconfig

* mips, build
  - clang-21-allnoconfig
  - clang-21-defconfig
  - clang-21-tinyconfig
  - gcc-12-allnoconfig
  - gcc-12-ath79_defconfig
  - gcc-12-bcm47xx_defconfig
  - gcc-12-bcm63xx_defconfig
  - gcc-12-cavium_octeon_defconfig
  - gcc-12-defconfig
  - gcc-12-e55_defconfig
  - gcc-12-malta_defconfig
  - gcc-12-rt305x_defconfig
  - gcc-12-tinyconfig
  - gcc-8-allnoconfig
  - gcc-8-ath79_defconfig
  - gcc-8-bcm47xx_defconfig
  - gcc-8-bcm63xx_defconfig
  - gcc-8-cavium_octeon_defconfig
  - gcc-8-defconfig
  - gcc-8-malta_defconfig
  - gcc-8-rt305x_defconfig
  - gcc-8-tinyconfig

* powerpc, build
  - gcc-12-ppc6xx_defconfig
  - gcc-8-allnoconfig
  - gcc-8-ppc6xx_defconfig


## Metric Regressions (compared to v5.15.195-118-g59a59821e6b5)

## Test Fixes (compared to v5.15.195-118-g59a59821e6b5)

## Metric Fixes (compared to v5.15.195-118-g59a59821e6b5)

## Test result summary
total: 28764, pass: 21862, fail: 2212, skip: 4511, xfail: 179

## Build Summary
* arc: 5 total, 5 passed, 0 failed
* arm: 101 total, 86 passed, 15 failed
* arm64: 28 total, 28 passed, 0 failed
* i386: 18 total, 18 passed, 0 failed
* mips: 22 total, 0 passed, 22 failed
* parisc: 3 total, 3 passed, 0 failed
* powerpc: 22 total, 19 passed, 3 failed
* riscv: 8 total, 8 passed, 0 failed
* s390: 9 total, 9 passed, 0 failed
* sh: 10 total, 10 passed, 0 failed
* sparc: 6 total, 6 passed, 0 failed
* x86_64: 24 total, 24 passed, 0 failed

## Test suites summary
* boot
* kselftest-arm64
* kselftest-breakpoints
* kselftest-capabilities
* kselftest-clone3
* kselftest-core
* kselftest-cpu-hotplug
* kselftest-exec
* kselftest-fpu
* kselftest-futex
* kselftest-intel_pstate
* kselftest-kcmp
* kselftest-livepatch
* kselftest-membarrier
* kselftest-mincore
* kselftest-mqueue
* kselftest-openat2
* kselftest-ptrace
* kselftest-rseq
* kselftest-rtc
* kselftest-sigaltstack
* kselftest-size
* kselftest-timers
* kselftest-tmpfs
* kselftest-tpm2
* kselftest-user_events
* kselftest-vDSO
* kselftest-x86
* kunit
* lava
* libgpiod
* libhugetlbfs
* log-parser-boot
* log-parser-build-clang
* log-parser-build-gcc
* log-parser-test
* ltp-capability
* ltp-commands
* ltp-containers
* ltp-controllers
* ltp-cpuhotplug
* ltp-crypto
* ltp-cve
* ltp-dio
* ltp-fcntl-locktests
* ltp-fs
* ltp-fs_bind
* ltp-fs_perms_simple
* ltp-hugetlb
* ltp-math
* ltp-mm
* ltp-nptl
* ltp-pty
* ltp-sched
* ltp-smoke
* ltp-syscalls
* ltp-tracing
* perf
* rcutorture

--
Linaro LKFT
https://lkft.linaro.org

