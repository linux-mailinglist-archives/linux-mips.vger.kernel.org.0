Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85F2D2C4691
	for <lists+linux-mips@lfdr.de>; Wed, 25 Nov 2020 18:24:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731902AbgKYRXP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 25 Nov 2020 12:23:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730695AbgKYRXO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 25 Nov 2020 12:23:14 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A0B5C061A4F
        for <linux-mips@vger.kernel.org>; Wed, 25 Nov 2020 09:23:14 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id z5so4100712ejp.4
        for <linux-mips@vger.kernel.org>; Wed, 25 Nov 2020 09:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=MW8U021JzvFtVr7JpE11QNz129nE9ceQfCdsjjgn81w=;
        b=N48gmdP3/E4zK4dbKtHwQGb7p2a7xOFxdstz1RiqBMkooyN0+QynZaApOiC5TRWSLR
         sgY+iodVhoJqe+wrM5CCfon6gEHXv9ZG7XXhvRE/ysVsDFyWqEk/vaEzhlrWF1oX2U1d
         pIMzEwSQdEu25Wm+6C+oWphBV2iZ8AR2XEFuw8cMj1nmyB5i7x1cSaw+ADufLhpaZaiP
         uSfql3GxAnR6OSJYhnXcsUsRxq1biX4UwEsqWq4T/ybRtEPzNiChqpMLSUHHA647vc6V
         q2rsPum8EqAZLVVTVn4FPOKWpMEQvXvE5zgjv65bjmXwg+B0HGA5o5KMJjRHg60zcFhE
         Tv5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=MW8U021JzvFtVr7JpE11QNz129nE9ceQfCdsjjgn81w=;
        b=uTUZjL3iYfiBRaSgLRHY2+hV8Wjj27v/xuRpUCYz8QFR1kJaFjrGotbAW5MghJSiap
         2FDNrA9l3rJCvaK3hQaLNEMtkDaXa2e0j/silA9gEBB0nJYWJQLLglixGcLnzRG9VlgU
         8wlk+Zo3hqMtBKMbcQof40ffXmZ81/0bViyvSQcY94yH2e3u07p0/8lzi4/AeMMBP32w
         jrEhM0siXwLpguS4Tan7eB91jXAKFiag4yjf7tgILlCgNCnukHhuFQ7GplTkkZyd/93b
         TF5dpulGcsp4eF8lQOKLnocK3Q1DkwjiIJeJOadUXi0YVUnffPFi66UWGazFB1Tnq7cG
         c2EA==
X-Gm-Message-State: AOAM5317E7wBIin8ohNGlpwufIUk3TW6R9lqaPd4KL5hJdcVBQK2UopY
        Q/D8CtgGqkrKa5hyWKDJ6u4twMdREIwaqyJs06YTswmhYdrLhlx/
X-Google-Smtp-Source: ABdhPJxBIzJRUsMAz0dpkbiWLjdqKtmUEbyZd3XhckIDyHKly0G/u0iD+5KhkbLv/vsAQUltIMyYw/RmrBgpWGIPUWA=
X-Received: by 2002:a17:906:f881:: with SMTP id lg1mr4014615ejb.133.1606324991996;
 Wed, 25 Nov 2020 09:23:11 -0800 (PST)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Wed, 25 Nov 2020 22:53:00 +0530
Message-ID: <CA+G9fYtofC2yzWWB4+YmSp2gv-CoG=boZJ4kXbdO250p1d3MBg@mail.gmail.com>
Subject: MIPS + clang-11 + allnoconfig / tinyconfig builds failed
To:     linux-mips@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>,
        tsbogend@alpha.franken.de, xie.he.0141@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Recently we have setup clang build and found that,
MIPS + clang-11 + allnoconfig  build failed
MIPS + clang-11 + tinyconfig  build failed

MIPS + clang-10 + allnoconfig  build failed
MIPS + clang-10 + tinyconfig  build failed

We have noticed these build failures on
 - stable-4.19
 - stable-5.4
 - stable-5.9
 - mainline
 - next-master

FYI, The defconfig builds are successful.
BTW, May I know what are the configs you build often ?

Steps to reproduce build failure:
-----------------------------------------
# sudo pip3 install -U tuxmake
# tuxmake --runtime docker --target-arch mips --toolchain clang-11
--kconfig allnoconfig
# tuxmake --runtime docker --target-arch mips --toolchain clang-11
--kconfig tinyconfig

Build failed log:
ake --silent --keep-going --jobs=16
O=/home/tuxbuild/.cache/tuxmake/builds/2/tmp ARCH=mips
CROSS_COMPILE=mips-linux-gnu- 'HOSTCC=sccache clang' 'CC=sccache
clang' allnoconfig
make --silent --keep-going --jobs=16
O=/home/tuxbuild/.cache/tuxmake/builds/2/tmp ARCH=mips
CROSS_COMPILE=mips-linux-gnu- 'HOSTCC=sccache clang' 'CC=sccache
clang'
/builds/1kl9SVppm6wRdzlQ3UcQKIBaUrx/arch/mips/vdso/elf.S:14:1:
warning: DWARF2 only supports one section per compilation unit
.pushsection .note.Linux, "a",@note ; .balign 4 ; .long 2f - 1f ;
.long 4484f - 3f ; .long 0 ; 1:.asciz "Linux" ; 2:.balign 4 ; 3:
^
/builds/1kl9SVppm6wRdzlQ3UcQKIBaUrx/arch/mips/vdso/elf.S:34:2:
warning: DWARF2 only supports one section per compilation unit
 .section .mips_abiflags, "a"
 ^
/builds/1kl9SVppm6wRdzlQ3UcQKIBaUrx/arch/mips/lib/uncached.c:45:6:
warning: variable 'sp' is uninitialized when used here
[-Wuninitialized]
        if (sp >= (long)CKSEG0 && sp < (long)CKSEG2)
            ^~
/builds/1kl9SVppm6wRdzlQ3UcQKIBaUrx/arch/mips/lib/uncached.c:40:18:
note: initialize the variable 'sp' to silence this warning
        register long sp __asm__("$sp");
                        ^
                         = 0
1 warning generated.
WARNING: modpost: vmlinux.o(.text+0x1a124): Section mismatch in
reference from the function r4k_cache_init() to the function
.init.text:loongson3_sc_init()
The function r4k_cache_init() references
the function __init loongson3_sc_init().
This is often because r4k_cache_init lacks a __init
annotation or the annotation of loongson3_sc_init is wrong.
WARNING: modpost: vmlinux.o(.text+0x1f1c8): Section mismatch in
reference from the function mips_sc_init() to the function
.init.text:mips_sc_probe()
The function mips_sc_init() references
the function __init mips_sc_probe().
This is often because mips_sc_init lacks a __init
annotation or the annotation of mips_sc_probe is wrong.
FATAL: modpost: Section mismatches detected.
Set CONFIG_SECTION_MISMATCH_WARN_ONLY=y to allow them.
make[2]: *** [/builds/1kl9SVppm6wRdzlQ3UcQKIBaUrx/scripts/Makefile.modpost:59:
vmlinux.symvers] Error 1

-- 
Linaro LKFT
https://lkft.linaro.org
