Return-Path: <linux-mips+bounces-290-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 193437F9D5E
	for <lists+linux-mips@lfdr.de>; Mon, 27 Nov 2023 11:24:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2DBB28132F
	for <lists+linux-mips@lfdr.de>; Mon, 27 Nov 2023 10:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 232FD18AFB;
	Mon, 27 Nov 2023 10:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XEMxZRcS"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com [IPv6:2607:f8b0:4864:20::e2f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 179D11AB
	for <linux-mips@vger.kernel.org>; Mon, 27 Nov 2023 02:24:42 -0800 (PST)
Received: by mail-vs1-xe2f.google.com with SMTP id ada2fe7eead31-462f568bb0fso384053137.3
        for <linux-mips@vger.kernel.org>; Mon, 27 Nov 2023 02:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701080680; x=1701685480; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kQcYZagRH+sWiCa3XG+USxp4TwxsDCW824WxKRgWP4w=;
        b=XEMxZRcSfQeEQ6obLwkMbcFp3QxqqOCOx8PjtkJx29VIHbzd7oVZeuYYE2iLto5+o/
         5iXlrtQwZHtTdKK9380etlKks7o95uIQkTp2JeEpWXEZ4yXVAlw251/n0AeSLjJx1RBE
         PtBJ6eUOpyvFsbqsrVy4HjpO+UW2CXXREZ4j2JvFMDMhBDqeOHS7Wyuea0nPP0Ok+3Dy
         bzJz+fCBMLyGIFe2H3sx3gyb5zjHzZ6LL5a9HdnibAz2HPAFu0fzFlR9lJsd3XCjMbct
         2sOZXBTOROu0MKAtfrxBlqJQHwQrFzgGWpOCxm00HEvi+JQeltGZ4Q922LvR/qcQECHC
         N1MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701080680; x=1701685480;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kQcYZagRH+sWiCa3XG+USxp4TwxsDCW824WxKRgWP4w=;
        b=AuX4qrguJf+gr+U4EdbHBBqsYxusWqIE6arT6qG4HOcsy9M7rZNFh4j8e+yD93JB18
         fxYD2Z5zMM25qR8iSSeIc0M4xHFa0Wei7/B/+f1KmH1l+vuPLy2oohNfj5WWJ5dgUiVF
         u1/8+svHTwseB4yfvMl4Pv9mjzMJBCWHg+Ugq6TZwlC/wvmmuhODzKOBDue6y75asoWx
         q+B4DXCjNZsHeMk1VAydmlMoF22d5sd/skBFKxbqFcd4B9iaIJBpL8yuQQM7PggBzsh7
         yOezPtCbXY0qTZITJthe//E3yTKM4zAebn+2IVS6c+a/5vHdiVFNcyTax2EqKYgDIVt5
         sN0w==
X-Gm-Message-State: AOJu0YyKYGEWLyrxCufC7jLAk8ghp7W3jqtUfFKqIxcv52ISDjvWgTOg
	FhbeSn3V8KvU4zEzYUFsSsTx6oWBy91Yg6WveQCG916OeXQQVnUdS0I=
X-Google-Smtp-Source: AGHT+IFaIFutf6fTQvnQSmSKQhz1xEKeqV7M7kawbq782Uv+Ok5kW0UrGEYchQvkH0VI2ze/WXtrwKOfwYUBlpXj5NU=
X-Received: by 2002:a05:6102:f10:b0:462:99aa:a077 with SMTP id
 v16-20020a0561020f1000b0046299aaa077mr13681421vss.31.1701080680580; Mon, 27
 Nov 2023 02:24:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 27 Nov 2023 15:54:29 +0530
Message-ID: <CA+G9fYuM6SXzQSgvB4w=Ev4KL3_xV=rUdhs_BX9Ya_yYUqFXow@mail.gmail.com>
Subject: mips: ralink/irq.c:86:5: error: no previous prototype for 'get_c0_perfcount_int'
To: linux-mips@vger.kernel.org, clang-built-linux <llvm@lists.linux.dev>, 
	lkft-triage@lists.linaro.org, regressions@lists.linux.dev
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Arnd Bergmann <arnd@arndb.de>, 
	Nathan Chancellor <nathan@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

[Sorry for the long email]

Following MIPS defconfig and other builds failed with gcc-12 /8 and clang
toolchains on Linux next-20231127 tag.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

mips:
  build:
    * gcc-12-rt305x_defconfig
    * gcc-12-allnoconfig
    * gcc-12-ath79_defconfig
    * gcc-12-malta_defconfig
    * gcc-12-defconfig
    * gcc-12-bcm63xx_defconfig
    * gcc-12-tinyconfig
    * gcc-8-allnoconfig
    * gcc-8-tinyconfig
    * gcc-8-rt305x_defconfig
    * gcc-8-bcm63xx_defconfig
    * gcc-8-bcm47xx_defconfig
    * gcc-8-ath79_defconfig
    * gcc-8-defconfig
    * gcc-8-malta_defconfig
    * gcc-12-bcm47xx_defconfig
    * clang-17-tinyconfig
    * clang-17-defconfig
    * clang-17-allnoconfig
    * clang-nightly-defconfig
    * clang-nightly-tinyconfig
    * clang-nightly-allnoconfig


Build log:
----------
arch/mips/ralink/irq.c:86:5: error: no previous prototype for
'get_c0_perfcount_int' [-Werror=missing-prototypes]
   86 | int get_c0_perfcount_int(void)
      |     ^~~~~~~~~~~~~~~~~~~~
arch/mips/ralink/irq.c:92:14: error: no previous prototype for
'get_c0_compare_int' [-Werror=missing-prototypes]
   92 | unsigned int get_c0_compare_int(void)
      |              ^~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

arch/mips/kernel/signal.c:438:5: error: no previous prototype for
'setup_sigcontext' [-Werror=missing-prototypes]
  438 | int setup_sigcontext(struct pt_regs *regs, struct sigcontext __user *sc)
      |     ^~~~~~~~~~~~~~~~
arch/mips/kernel/signal.c:515:5: error: no previous prototype for
'restore_sigcontext' [-Werror=missing-prototypes]
  515 | int restore_sigcontext(struct pt_regs *regs, struct sigcontext
__user *sc)
      |     ^~~~~~~~~~~~~~~~~~
arch/mips/kernel/signal.c:636:17: error: no previous prototype for
'sys_sigreturn' [-Werror=missing-prototypes]
  636 | asmlinkage void sys_sigreturn(void)
      |                 ^~~~~~~~~~~~~
arch/mips/kernel/signal.c:673:17: error: no previous prototype for
'sys_rt_sigreturn' [-Werror=missing-prototypes]
  673 | asmlinkage void sys_rt_sigreturn(void)
      |                 ^~~~~~~~~~~~~~~~
arch/mips/kernel/signal.c:903:17: error: no previous prototype for
'do_notify_resume' [-Werror=missing-prototypes]
  903 | asmlinkage void do_notify_resume(struct pt_regs *regs, void *unused,
      |                 ^~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors


arch/mips/kernel/syscall.c:51:16: error: no previous prototype for
'sysm_pipe' [-Werror=missing-prototypes]
   51 | asmlinkage int sysm_pipe(void)
      |                ^~~~~~~~~
cc1: all warnings being treated as errors

arch/mips/kernel/traps.c:370:6: error: no previous prototype for
'show_registers' [-Werror=missing-prototypes]
  370 | void show_registers(struct pt_regs *regs)
      |      ^~~~~~~~~~~~~~
arch/mips/kernel/traps.c:447:17: error: no previous prototype for
'do_be' [-Werror=missing-prototypes]
  447 | asmlinkage void do_be(struct pt_regs *regs)
      |                 ^~~~~
arch/mips/kernel/traps.c:752:17: error: no previous prototype for
'do_ov' [-Werror=missing-prototypes]
  752 | asmlinkage void do_ov(struct pt_regs *regs)
      |                 ^~~~~
arch/mips/kernel/traps.c:874:17: error: no previous prototype for
'do_fpe' [-Werror=missing-prototypes]
  874 | asmlinkage void do_fpe(struct pt_regs *regs, unsigned long fcr31)
      |                 ^~~~~~
arch/mips/kernel/traps.c:1027:17: error: no previous prototype for
'do_bp' [-Werror=missing-prototypes]
 1027 | asmlinkage void do_bp(struct pt_regs *regs)
      |                 ^~~~~
arch/mips/kernel/traps.c:1114:17: error: no previous prototype for
'do_tr' [-Werror=missing-prototypes]
 1114 | asmlinkage void do_tr(struct pt_regs *regs)
      |                 ^~~~~
arch/mips/kernel/traps.c:1151:17: error: no previous prototype for
'do_ri' [-Werror=missing-prototypes]
 1151 | asmlinkage void do_ri(struct pt_regs *regs)
      |                 ^~~~~
arch/mips/kernel/traps.c:1402:17: error: no previous prototype for
'do_cpu' [-Werror=missing-prototypes]
 1402 | asmlinkage void do_cpu(struct pt_regs *regs)
      |                 ^~~~~~
arch/mips/kernel/traps.c:1507:17: error: no previous prototype for
'do_msa_fpe' [-Werror=missing-prototypes]
 1507 | asmlinkage void do_msa_fpe(struct pt_regs *regs, unsigned int msacsr)
      |                 ^~~~~~~~~~
arch/mips/kernel/traps.c:1527:17: error: no previous prototype for
'do_msa' [-Werror=missing-prototypes]
 1527 | asmlinkage void do_msa(struct pt_regs *regs)
      |                 ^~~~~~
arch/mips/kernel/traps.c:1548:17: error: no previous prototype for
'do_mdmx' [-Werror=missing-prototypes]
 1548 | asmlinkage void do_mdmx(struct pt_regs *regs)
      |                 ^~~~~~~
arch/mips/kernel/traps.c:1560:17: error: no previous prototype for
'do_watch' [-Werror=missing-prototypes]
 1560 | asmlinkage void do_watch(struct pt_regs *regs)
      |                 ^~~~~~~~
arch/mips/kernel/traps.c:1587:17: error: no previous prototype for
'do_mcheck' [-Werror=missing-prototypes]
 1587 | asmlinkage void do_mcheck(struct pt_regs *regs)
      |                 ^~~~~~~~~
arch/mips/kernel/traps.c:1612:17: error: no previous prototype for
'do_mt' [-Werror=missing-prototypes]
 1612 | asmlinkage void do_mt(struct pt_regs *regs)
      |                 ^~~~~
arch/mips/kernel/traps.c:1648:17: error: no previous prototype for
'do_dsp' [-Werror=missing-prototypes]
 1648 | asmlinkage void do_dsp(struct pt_regs *regs)
      |                 ^~~~~~
arch/mips/kernel/traps.c:1656:17: error: no previous prototype for
'do_reserved' [-Werror=missing-prototypes]
 1656 | asmlinkage void do_reserved(struct pt_regs *regs)
      |                 ^~~~~~~~~~~
arch/mips/kernel/traps.c:1832:17: error: no previous prototype for
'cache_parity_error' [-Werror=missing-prototypes]
 1832 | asmlinkage void cache_parity_error(void)
      |                 ^~~~~~~~~~~~~~~~~~
arch/mips/kernel/traps.c:1880:17: error: no previous prototype for
'do_ftlb' [-Werror=missing-prototypes]
 1880 | asmlinkage void do_ftlb(void)
      |                 ^~~~~~~
arch/mips/kernel/traps.c:1909:17: error: no previous prototype for
'do_gsexc' [-Werror=missing-prototypes]
 1909 | asmlinkage void do_gsexc(struct pt_regs *regs, u32 diag1)
      |                 ^~~~~~~~
arch/mips/kernel/traps.c:1944:6: error: no previous prototype for
'ejtag_exception_handler' [-Werror=missing-prototypes]
 1944 | void ejtag_exception_handler(struct pt_regs *regs)
      |      ^~~~~~~~~~~~~~~~~~~~~~~
arch/mips/kernel/traps.c:1989:17: error: no previous prototype for
'nmi_exception_handler' [-Werror=missing-prototypes]
 1989 | void __noreturn nmi_exception_handler(struct pt_regs *regs)
      |                 ^~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

arch/mips/kernel/unaligned.c:1516:17: error: no previous prototype for
'do_ade' [-Werror=missing-prototypes]
 1516 | asmlinkage void do_ade(struct pt_regs *regs)
      |                 ^~~~~~
cc1: all warnings being treated as errors

arch/mips/mm/fault.c:323:17: error: no previous prototype for
'do_page_fault' [-Werror=missing-prototypes]
  323 | asmlinkage void do_page_fault(struct pt_regs *regs,
      |                 ^~~~~~~~~~~~~
cc1: all warnings being treated as errors

arch/mips/kernel/spram.c:194:6: error: no previous prototype for
'spram_config' [-Werror=missing-prototypes]
  194 | void spram_config(void)
      |      ^~~~~~~~~~~~
cc1: all warnings being treated as errors

arch/mips/mm/init.c:60:6: error: no previous prototype for
'setup_zero_pages' [-Werror=missing-prototypes]
   60 | void setup_zero_pages(void)
      |      ^~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

arch/mips/mm/tlbex.c:2547:6: error: no previous prototype for
'build_tlb_refill_handler' [-Werror=missing-prototypes]
 2547 | void build_tlb_refill_handler(void)
      |      ^~~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

arch/mips/mm/uasm.c:421:5: error: no previous prototype for
'uasm_in_compat_space_p' [-Werror=missing-prototypes]
  421 | int uasm_in_compat_space_p(long addr)
      |     ^~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

arch/mips/mm/c-r4k.c:1588:6: error: no previous prototype for
'au1x00_fixup_config_od' [-Werror=missing-prototypes]
 1588 | void au1x00_fixup_config_od(void)
      |      ^~~~~~~~~~~~~~~~~~~~~~
arch/mips/mm/c-r4k.c:1703:6: error: no previous prototype for
'r4k_cache_init' [-Werror=missing-prototypes]
 1703 | void r4k_cache_init(void)
      |      ^~~~~~~~~~~~~~
arch/mips/mm/c-r4k.c:1831:12: error: no previous prototype for
'r4k_cache_init_pm' [-Werror=missing-prototypes]
 1831 | int __init r4k_cache_init_pm(void)
      |            ^~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

arch/mips/mm/tlb-r4k.c:553:6: error: no previous prototype for
'tlb_init' [-Werror=missing-prototypes]
  553 | void tlb_init(void)
      |      ^~~~~~~~
cc1: all warnings being treated as errors

steps to reproduce:
--------

# tuxmake --runtime podman --target-arch mips --toolchain gcc-12
--kconfig bcm63xx_defconfig


Links:
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20231127/testrun/21323584/suite/build/test/gcc-12-rt305x_defconfig/log
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20231127/testrun/21323584/suite/build/test/gcc-12-rt305x_defconfig/history/
- https://storage.tuxsuite.com/public/linaro/lkft/builds/2Yk9XTZIxZgMhlvkvmFPOkt1tLz/


--
Linaro LKFT
https://lkft.linaro.org

