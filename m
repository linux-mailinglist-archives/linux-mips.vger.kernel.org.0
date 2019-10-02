Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94524C4A62
	for <lists+linux-mips@lfdr.de>; Wed,  2 Oct 2019 11:18:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726162AbfJBJRj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 2 Oct 2019 05:17:39 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:41772 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbfJBJRi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 2 Oct 2019 05:17:38 -0400
Received: by mail-ot1-f65.google.com with SMTP id g13so14063050otp.8;
        Wed, 02 Oct 2019 02:17:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ls6EK3vubSTuihO8bhZK7PjFeD0RgzqQTr2Z4JO8PkE=;
        b=HVgwShvbvsIuGc03VzYv+tXBhEd7uvXoV3wX/9+ylPvUhOALYYQY7fmbUzcrXAuF4f
         fsjwUmUpVTCRd/kTZMsvwmnAo0PPIRVpH+1nYVVEjdKSA4ilnEd0uPN8+mNWQv86P5Ao
         Rt6v6pDpTCgc1sYs5RrEVpPhDSUsYTvqFPln6XlQA5CV09T9/ECJdl1ekqlyM1CBdoe8
         F8IyNnVbJjQSnYdA9xfN8VRpRp69/YstqD27MBvvUILTiCzDUglfliPzDnZWMZwaldQG
         qGhUY8bhmNgayN2fhMhI7nB3Rm3ywscDe95TTgsijg1V/DY7X5q0no1mv68SAeDJwLwF
         VxoQ==
X-Gm-Message-State: APjAAAUk9GAlsPIOVCwk9atEcm3Z2KM/PQSItM4QxNOgrRa0JVWcwErb
        VK8cv6BrdOO1iglKRgXNdK0awjVJC0GqjuXOVRn2QLMo
X-Google-Smtp-Source: APXvYqy+Nj/99JkY+AGWCoI9iuwNtvxD/sJXf6Ney2dGy6HlRLq+mQUTdRIlpehSzHEHq3WZ2Fmrs1jkwV4XzPvS5oY=
X-Received: by 2002:a9d:730d:: with SMTP id e13mr1857379otk.145.1570007857612;
 Wed, 02 Oct 2019 02:17:37 -0700 (PDT)
MIME-Version: 1.0
References: <20191002085809.16381-1-geert@linux-m68k.org>
In-Reply-To: <20191002085809.16381-1-geert@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 2 Oct 2019 11:17:26 +0200
Message-ID: <CAMuHMdUHG-4=HEOspGH=-6P_nTdbR_wYnyKdyUR9+-2=r1fNkQ@mail.gmail.com>
Subject: Re: Build regressions/improvements in v5.4-rc1
To:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc:     linux-mips@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
        Arnd Bergmann <arnd@arndb.de>,
        David Daney <ddaney.cavm@gmail.com>,
        Alex Vesker <valex@mellanox.com>,
        Matt Fleming <matt@codeblueprint.co.uk>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Oct 2, 2019 at 11:05 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> Below is the list of build error/warning regressions/improvements in
> v5.4-rc1[1] compared to v5.3[2].
>
> Summarized:
>   - build errors: +15/-3
>   - build warnings: +215/-117
>
> Note that there may be false regressions, as some logs are incomplete.
> Still, they're build errors/warnings.
>
> Happy fixing! ;-)
>
> Thanks to the linux-next team for providing the build service.
>
> [1] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c/ (233 out of 242 configs)
> [2] http://kisskb.ellerman.id.au/kisskb/branch/linus/head/4d856f72c10ecb060868ed10ff1b1453943fc6c8/ (all 242 configs)
>
>
> *** ERRORS ***
>
> 15 error regressions:
>   + /kisskb/build/tmp/cc1Or5dj.s: Error: can't resolve `_start' {*UND* section} - `L0 ' {.text section}:  => 663, 1200, 222, 873, 1420
>   + /kisskb/build/tmp/cc2uWmof.s: Error: can't resolve `_start' {*UND* section} - `L0 ' {.text section}:  => 1213, 919, 688, 1434, 226
>   + /kisskb/build/tmp/ccc6hBqd.s: Error: can't resolve `_start' {*UND* section} - `L0 ' {.text section}:  => 513, 1279, 1058, 727
>   + /kisskb/build/tmp/cclSQ19p.s: Error: can't resolve `_start' {*UND* section} - `L0 ' {.text section}:  => 1396, 881, 1175, 671, 226
>   + /kisskb/build/tmp/ccu3SlxY.s: Error: can't resolve `_start' {*UND* section} - `L0 ' {.text section}:  => 1238, 911, 222, 680, 1457

Various mips (allmodconfig, allnoconfig, malta_defconfig, ip22_defconfig)

Related to

    /kisskb/src/arch/mips/vdso/Makefile:61: MIPS VDSO requires binutils >= 2.25

?

>   + /kisskb/src/arch/mips/include/asm/octeon/cvmx-ipd.h: error: 'CVMX_PIP_SFT_RST' undeclared (first use in this function):  => 331:36
>   + /kisskb/src/arch/mips/include/asm/octeon/cvmx-ipd.h: error: 'CVMX_PIP_SFT_RST' undeclared (first use in this function); did you mean 'CVMX_CIU_SOFT_RST'?:  => 331:36
>   + /kisskb/src/arch/mips/include/asm/octeon/cvmx-ipd.h: error: storage size of 'pip_sft_rst' isn't known:  => 330:27

mips-allmodconfig (CC Matthew Wilcox)

>   + /kisskb/src/drivers/watchdog/cpwd.c: error: 'compat_ptr_ioctl' undeclared here (not in a function):  => 500:19

sparc64-allmodconfig (CC Arnd Bergmann)

>   + error: "__delay" [drivers/net/phy/mdio-cavium.ko] undefined!:  => N/A

sh-allmodconfig (CC David Daney)

>   + error: "__moddi3" [drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.ko] undefined!:  => N/A
>   + error: "__umoddi3" [drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.ko] undefined!:  => N/A

parisc-allmodconfig (CC Alex Vesker)

>   + error: c2p_iplan2.c: undefined reference to `c2p_unsupported':  => .text+0xc4), .text+0x150)
>   + error: c2p_planar.c: undefined reference to `c2p_unsupported':  => .text+0xd6), .text+0x1dc)

m68k-defconfig (https://lore.kernel.org/lkml/20190927094708.11563-1-geert@linux-m68k.org/)

>   + error: page_alloc.c: undefined reference to `node_reclaim_distance':  => .text+0x3180), .text+0x3148)

Various sh4 (migor_defconfig, se7722_defconfig, ul2_defconfig) (CC Matt Fleming)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
