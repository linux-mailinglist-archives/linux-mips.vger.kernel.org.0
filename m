Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E2E44C10FA
	for <lists+linux-mips@lfdr.de>; Wed, 23 Feb 2022 12:05:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239632AbiBWLF2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 23 Feb 2022 06:05:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230325AbiBWLF1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 23 Feb 2022 06:05:27 -0500
X-Greylist: delayed 305 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 23 Feb 2022 03:04:59 PST
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD4C678062;
        Wed, 23 Feb 2022 03:04:59 -0800 (PST)
Received: from mail-wr1-f52.google.com ([209.85.221.52]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MlfCk-1o4Ra6312w-00inTg; Wed, 23 Feb 2022 11:59:52 +0100
Received: by mail-wr1-f52.google.com with SMTP id o4so2135193wrf.3;
        Wed, 23 Feb 2022 02:59:52 -0800 (PST)
X-Gm-Message-State: AOAM532w0I/FQasSXoRn7paj/0r708sN7Hcll05a600icEtPzbVFW5nu
        NA3gFKSoZzvNLofXWNFCuRR21wXtMvkt8QI7GtY=
X-Google-Smtp-Source: ABdhPJz3tjc3IejYq+UPcpb0b0B/1/NsttPG6/6KnMrBytsQxjHYO0/p2daBPMgz1AgVYfLNcxR3Ydw+Oyz4L5S8GiA=
X-Received: by 2002:adf:90c1:0:b0:1e4:ad27:22b9 with SMTP id
 i59-20020adf90c1000000b001e4ad2722b9mr23150986wri.219.1645613992251; Wed, 23
 Feb 2022 02:59:52 -0800 (PST)
MIME-Version: 1.0
References: <20220201150545.1512822-1-guoren@kernel.org> <mhng-36783ff3-37c2-454b-9337-8cb124195255@palmer-ri-x1c9>
In-Reply-To: <mhng-36783ff3-37c2-454b-9337-8cb124195255@palmer-ri-x1c9>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 23 Feb 2022 11:59:36 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1W3Ns1WYiSGXb3Qn6-p+SPsx1UGqXdTkk2taPB72OZUA@mail.gmail.com>
Message-ID: <CAK8P3a1W3Ns1WYiSGXb3Qn6-p+SPsx1UGqXdTkk2taPB72OZUA@mail.gmail.com>
Subject: Re: [PATCH V5 00/21] riscv: compat: Add COMPAT mode support for rv64
To:     Palmer Dabbelt <palmer@dabbelt.com>
Cc:     Guo Ren <guoren@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Anup Patel <anup@brainfault.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        liush <liush@allwinnertech.com>, Wei Fu <wefu@redhat.com>,
        Drew Fustini <drew@beagleboard.org>,
        Wang Junqiang <wangjunqiang@iscas.ac.cn>,
        Christoph Hellwig <hch@lst.de>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        linux-csky@vger.kernel.org,
        linux-s390 <linux-s390@vger.kernel.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Parisc List <linux-parisc@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Guo Ren <guoren@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:fDj8UNVRV8r/eEkDy+HCLSo5oTnkzwOoBxcvqklwcRxXRwi6wUV
 6SE5GCBES+rEkqbaFiHz6aGc/CNcIz7j4g51nG2OX1z+qqp19c2xUqQAOlXIpbA/+vI2jCi
 66nCed0HrHG8pKuBjTvpQfJ7mhp2uPg7qBZSY37R2iNdBB0GFnk2uzfcY2yijMhTM9tVR5a
 82jnAWH9+MAZlTC76Larg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Tk21r7KoD1U=:LKedfq+z13QAGf6g3pHobL
 qNudvffbsCYXzO9EGN1Z5B1rrCdr2Fcbz6+/CANHNZQCAc+E1q/3ZFmzjha7N9VFeqFKP7SsI
 LK4AIB8K6nFhw6XUH7jVeCxm7bC3VIXBEL1rMOOzVG32xRuqL+K0YB1CDOBm3832bnMFCR0L/
 DtH3CKvKGY5MFBqNl46CfQyBzP4FlQrHFSEpVs08yBQeKIgKna5fOrUQYq0u7xziCrpvN2SRu
 C94CNte8/G6nRuKvkQ32hM/+5XgZI9Q6YyXH3Y/DBPD+Q9+3ejD5jvinImkykTTDkQn3fzh7V
 F1WnCHIHGtdV6lpPwYAyCBNnY70HvTDBa3G4K68TiJWmhFaZlUbX1g4s7FhKRbbEpZbcHvMyN
 gCe654hGC76pNIoSYZAaSkzGGkjzvuMCpqg8gNhdXIyKgZ8C+5wOgNvFtSwtPz5Eahe53zJH3
 ht5euN78Jkw8wmAblemYdHG9STbDCMdRe+8CaWkLv0jJbaEOn0EiNidOWMFD5ZnTrtNv9bvr9
 d5xTBV6gmhzAEsys4XPR1Q+e3qETmcGcI97QNogu9luQcb6Jk+xszux0Uw2wieVQa059o8Iic
 bb/MkqhLaHFDrpGcFB7sVRg8EiFs/Kd0GZaLuCjnaEivgLqC547T5BJ/Mq7zZD69cbZo57PoQ
 oj8H55QCEVXhkpyMVG5yeZczW56G5yATMCnGiv0e+pp+M4EwQUlv42AH3xvSDE5VuyJIdjKUq
 2RoPonOuTxk/BVf17rGlfzuBHJZNE+J7viLdsXuCB2yVMtIoSHViqBAmQ+NkiB32UA20GZV9v
 eqkZqppq3SBJTTGEWOTBeq+yVQISfszRwROD8YTaodYTid2AFs=
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Feb 23, 2022 at 2:43 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Tue, 01 Feb 2022 07:05:24 PST (-0800), guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > Currently, most 64-bit architectures (x86, parisc, powerpc, arm64,
> > s390, mips, sparc) have supported COMPAT mode. But they all have
> > history issues and can't use standard linux unistd.h. RISC-V would
> > be first standard __SYSCALL_COMPAT user of include/uapi/asm-generic
> > /unistd.h.
>
> TBH, I'd always sort of hoped we wouldn't have to do this: it's a lot of
> ABI surface to keep around for a use case I'm not really sure is ever
> going to get any traction (it's not like we have legacy 32-bit
> userspaces floating around, the 32-bit userspace is newer than the
> 64-bit userspace).

The low-end embedded market isn't usually that newsworthy, but the
machines ship in huge quantities, and they all run 32-bit user
space for good reasons:

The cheapest Linux systems at the moment use a low-end MIPS or
Arm core with a single DDR2 (32MB to 128MB) or DDR3 (128MB
to 512MB) memory chip that for now is a bit cheaper than a larger
LP-DDR4 (256MB+). The smaller configurations will go away over
time as they get outpriced by systems with LP-DDR4, but a 32-bit
system with 256MB will keep beating a 64-bit-only system with
512MB on price, and will run most workloads better than a 64-bit
system with the same amount of RAM.

On the Arm side, I hope that these systems will migrate to Armv8
based designs (Cortex-A53/A35 or newer) running 64-bit kernel
with 32-bit user space to replace the currently dominant but aging
32-bit Cortex-A7 cores. As you say, RISC-V is at a disadvantage
here because there is no existing 32-bit ecosystem, but it may take
a chunk of that market anyway based on licensing cost. Between
doing this using pure 32-bit cores or on mixed 32/64-bit cores,
I found Guo Ren's explanation very sensible, it lets you use the
same chip both as a low-end embedded version with SiP
memory, or using an external DDR3/LPDDR4 chip with enough
capacity to run a generic 64-bit distro.

> My assumption is that users who actually wanted the
> memory savings (likely a very small number) would be better served with
> rv64/ilp32, as that'll allow the larger registers that the hardware
> supports.  From some earlier discussions it looks like rv64/ilp32 isn't
> going to be allowed, though, so this seems like the only way to go.

Right, between rv32 user space and a hypothetical rv64-ilp32 target,
I think it's clear that the former is better because it means introducing
only one fringe ABI rather than two incompatible ones with minor
performance differences.

        Arnd
