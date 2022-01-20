Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA8D8494BC0
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jan 2022 11:31:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376287AbiATKb2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 20 Jan 2022 05:31:28 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:34027 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359821AbiATKb1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 20 Jan 2022 05:31:27 -0500
Received: from mail-yb1-f181.google.com ([209.85.219.181]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MZT2u-1mqAXb2MwY-00WXSU; Thu, 20 Jan 2022 11:31:25 +0100
Received: by mail-yb1-f181.google.com with SMTP id g81so16315857ybg.10;
        Thu, 20 Jan 2022 02:31:24 -0800 (PST)
X-Gm-Message-State: AOAM530i1rFy8RoQsWbFOx8Lh4Dz9sevMKDwwE8Ap+KWRMQknWrarX9a
        xBA3GOd0jYejqU4+LPfKREnuiw9IZszljyJK0/o=
X-Google-Smtp-Source: ABdhPJw23cQjee+wzKe1BZuP5Egl38StW0xVS2Lx2CrxQkm8C96LIXXcbD+ld7BJcIRLzViPyYDZ1TVXzpuf+zNTwjI=
X-Received: by 2002:a05:6830:2095:: with SMTP id y21mr25066257otq.368.1642670990087;
 Thu, 20 Jan 2022 01:29:50 -0800 (PST)
MIME-Version: 1.0
References: <20220120073911.99857-7-guoren@kernel.org>
In-Reply-To: <20220120073911.99857-7-guoren@kernel.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 20 Jan 2022 10:29:33 +0100
X-Gmail-Original-Message-ID: <CAK8P3a00uYPBBphpipBoqCnGFwr_C9vDzS1p1iLN==YTVOARug@mail.gmail.com>
Message-ID: <CAK8P3a00uYPBBphpipBoqCnGFwr_C9vDzS1p1iLN==YTVOARug@mail.gmail.com>
Subject: Re: [PATCH V3 06/17] riscv: compat: Add basic compat date type implementation
To:     Guo Ren <guoren@kernel.org>
Cc:     Palmer Dabbelt <palmer@dabbelt.com>, Arnd Bergmann <arnd@arndb.de>,
        Anup Patel <anup@brainfault.org>,
        gregkh <gregkh@linuxfoundation.org>,
        liush <liush@allwinnertech.com>, Wei Fu <wefu@redhat.com>,
        Drew Fustini <drew@beagleboard.org>,
        Wang Junqiang <wangjunqiang@iscas.ac.cn>,
        Christoph Hellwig <hch@lst.de>,
        Christoph Hellwig <hch@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        linux-csky@vger.kernel.org,
        linux-s390 <linux-s390@vger.kernel.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        inux-parisc@vger.kernel.org,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Guo Ren <guoren@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:/YrZFEbx0m1uHPEKUQKkFLX41ybymALXeZwa95Ver43ecocL+01
 VkusKCnCY435UYabAymjiaqEbCkKjnvVmkXoZhKWMKspaftuIB87JRW21PACROoIaS5mOt2
 t61sDWYl+4B9rsTTfcJM5zdAGFA0dRFKSNEj9/2vlVNRJgNiIUKT1Ese3rIOGUEmZpPLxo9
 MkM0azpjuJfqPWJM4R4Fw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:T7bI/xAO8l0=:qNCIqTulaofY9UgGdzj5lY
 ATdqoSNUNo0XJ6PgNk3+AgMF3KnQPf52A8y+L8vdS8MglIOZkpuz+jdZQWIviipSc+ILFj6TJ
 V2kDG0+Ru3nZDp7t3JaHomT2RWNo8C1NcamFdCBz7aRxGqXWjDjQihMwkgyalMA6p1nxiAxQd
 gYR++/VttGi++oIx2zyUGWruULnfQJfGxLsUDmJvCWVvtvxvimEXv0zRCYKtewrnMjiwTAE0z
 +aft7FKchhA397VhrdxgoZ6//aL+k9vylD25bMxigKCH0FpgSQs6/QJre+Q72BbfUXZLgXfxg
 khBBxOPtAqA7s+2fj8vbPg5v8BbskmglChPfZX28qFsABRp4zOGhAd83SL0fkiTi6fYmcZd+P
 dBq24bfvTxomAFc3uQjvZqO48V65ny8JBvsT8q6Fzo8W8M8fXFcVpS16XVU0Ub/9wq51wiWpB
 CF2wzN0dgQe0QcqRarjGi1PLDTRkjjWECFnIi3jQb/bEBBCKQtQMAAeRuVqM7nfhm4vFvR6b3
 METIKEiCFqBFyZgCczbVEghq74hQSxyCf/GJ7Nq7WCsBD615yDPnGOytFcoNX2qOzMwiLg3I/
 zmhS3e/Yas9npym27cEJ1eEs6WeYuraqrn+7S/Arq3Ig2OLYw+1/klIEYHjlugq8Yyja72/75
 qN3VmkWmPa4FPHFXZhiRRVD/G9/BTDxeoMa0WEHCgYpyJy8RLGzxGr4juS9ybpnjPF2uNw8Fn
 sH+h55Ktki2o8OXr310DYiUIvIT2Um4HwkEp9jYAVlASK0mjuEQ2SQawdbp84fedAQ7pfTVq5
 pFOodo0W5sulmF73m+AC4MKxw6P68EciMuFtq7wPhk8fmoQMEdCNKoC4nR8TjnJhGabmRmz
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jan 20, 2022 at 8:38 AM <guoren@kernel.org> wrote:

> @@ -0,0 +1,136 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __ASM_COMPAT_H
> +#define __ASM_COMPAT_H
> +
> +#define compat_mode_t  compat_mode_t
> +typedef u16            compat_mode_t;

I think this one is wrong, as rv32 should get the native definition from

include/uapi/asm-generic/posix_types.h:typedef unsigned int     __kernel_mode_t;

I think it works if you just remove those two lines. The rest looks good to me.

       Arnd
