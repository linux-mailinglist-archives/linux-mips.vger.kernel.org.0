Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92BDA2EFCC3
	for <lists+linux-mips@lfdr.de>; Sat,  9 Jan 2021 02:37:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725836AbhAIBhA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 8 Jan 2021 20:37:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:39122 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725793AbhAIBhA (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 8 Jan 2021 20:37:00 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id F294223AAC
        for <linux-mips@vger.kernel.org>; Sat,  9 Jan 2021 01:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610156179;
        bh=N5EK9fSWDFhUC2wdc9pqIutD/zXL7TkEPxISWKRjgSs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Kl1g4XvoYC2Ld2n+c4YRmbfP392euYH+AfUMhknWrp59NjpJ2SlUZJdQMw/rCON8c
         oKOwB8Jv3L+HyAyZJU3Bxa8EkGTe5j+9FI7eJGxKg879YpipROITh0X2w2JZULfAOr
         AfjdWx6jrsg9FW+E9HlMLr2ZKEBpXQsIRUjfHdIhzQSthuOs90r2P75vyyFrb1JAFz
         tezROl6MxFhVX5oQNOrYjAJwyrU32O+Q8NiRR0fP69w93YmAvOzo2m96P7v3FmJraB
         F+nIOWcZLiKG5kdDuSsctN1kQXlbo2/D1O/lxBuYLI7P4gdaqrzeQBt03EsSfTomya
         y2UQKuQUpUXYA==
Received: by mail-il1-f179.google.com with SMTP id e7so12238114ile.7
        for <linux-mips@vger.kernel.org>; Fri, 08 Jan 2021 17:36:18 -0800 (PST)
X-Gm-Message-State: AOAM530wPK5jcK4Xt9PNIP80959u0CYCBeVRtQ6wzxafSKvuwxLhILSv
        HiNG/pNsdbULwzrZEdO8K0nn/1faOuWZ42Df3ZQ=
X-Google-Smtp-Source: ABdhPJzrra+GJnqQARXn5+k1m+b7BcBTV8rKqcAnBHIxx/GlLIJUKkA/BGXENwLvjajQ9uOhxRy4GEoJNfcQmt78rVU=
X-Received: by 2002:a92:874d:: with SMTP id d13mr6454110ilm.270.1610156178447;
 Fri, 08 Jan 2021 17:36:18 -0800 (PST)
MIME-Version: 1.0
References: <20201221120220.3186744-1-chenhuacai@kernel.org>
 <a671a323-768b-b461-2ce4-ecc1e92d4cc6@loongson.cn> <CAAhV-H4GDxhg1YqWy-g7VuCeE7BZ0ibaVSr1ibzJqXjuaBn3_w@mail.gmail.com>
 <20210107172620.GA13201@alpha.franken.de> <1085845b-2c5a-dbb6-62b7-28b55aeacb4c@loongson.cn>
 <13b3f842-61e8-db13-67ff-7d2a9d894484@flygoat.com>
In-Reply-To: <13b3f842-61e8-db13-67ff-7d2a9d894484@flygoat.com>
From:   Huacai Chen <chenhuacai@kernel.org>
Date:   Sat, 9 Jan 2021 09:36:06 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5VUY20ADeXjNvOO_aP3ubikgpRJkmHJwDo71HhDGx+3A@mail.gmail.com>
Message-ID: <CAAhV-H5VUY20ADeXjNvOO_aP3ubikgpRJkmHJwDo71HhDGx+3A@mail.gmail.com>
Subject: Re: [PATCH V3] MIPS: Loongson64: Add kexec/kdump support
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Jinyang He <hejinyang@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Eric Biederman <ebiederm@xmission.com>,
        Dave Young <dyoung@redhat.com>, Baoquan He <bhe@redhat.com>,
        Vivek Goyal <vgoyal@redhat.com>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        kexec@lists.infradead.org, Youling Tang <tangyouling@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Jiaxun,

On Fri, Jan 8, 2021 at 6:15 PM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>
> =E5=9C=A8 2021/1/8 =E4=B8=8B=E5=8D=886:07, Jinyang He =E5=86=99=E9=81=93:
> > Hi, Thomas,
> >
> > On 01/08/2021 01:26 AM, Thomas Bogendoerfer wrote:
> >>>>> --- a/arch/mips/kernel/relocate_kernel.S
> >>>>> +++ b/arch/mips/kernel/relocate_kernel.S
> >>>>> @@ -6,6 +6,7 @@
> >>>>>
> >>>>>    #include <asm/asm.h>
> >>>>>    #include <asm/asmmacro.h>
> >>>>> +#include <asm/cpu.h>
> >>>>>    #include <asm/regdef.h>
> >>>>>    #include <asm/mipsregs.h>
> >>>>>    #include <asm/stackframe.h>
> >>>>> @@ -133,6 +134,33 @@ LEAF(kexec_smp_wait)
> >>>>>    #else
> >>>>>        sync
> >>>>>    #endif
> >>>>> +
> >>>>> +#ifdef CONFIG_CPU_LOONGSON64
> >> Is there a reason why you can't use the already existing infrastructur=
e
> >> the way cavium-octeon is doing it ? If you can't please explain why
> >> so we can find a way to extend it. But having some sort of poking
> >> loongson registers in generic MIPS code is a non starter.
> >>
> >> Thomas.
> >>
> >
> > Unlike the cavium-octeon platform, the Loongson64 platform needs some
> > changes. Before the kernel starts, (before entering the kernel_entry),
> > each CPU has its own state (the SMP system). For Loongson64, only the
> > boot CPU will enter the kernel_entry, and other CPUs will query their
> > mailbox value in a loop. This is what the BIOS does for the CPU. Here
> > is different from cavium-octeon. All CPUs will enter the kernel_entry
> > on cavium-octeon platform. Then the kernel_entry_setup, the co-CPUs
> > will enter the query loop. I saw the kernel_entry_setup of other
> > platforms, such as ip27, malta, and generic. They are not like
> > cavium-octeon and the co-CPUs entering the loop may be earlier than
> > entering kernel_entry. So I have reason to guess that most SMP system
> > platform CPUs are similar to Loongson64.
>
> Hi Jingyang,
>
> As I commented before you may reuse play_dead logic in Loongson's smp.c.
>
> >
> > relocate_kernel.S is like BIOS doing s omething for the CPU. It allows
> > the boot CPU to start from the new kernel_entry and makes the co-CPUs
> > enter a loop. The already existing infrastructure may be more suitable
> > for non-smp platforms. Although we can do something with
> > plat_smp_ops.kexec_nonboot_cpu, more new problems will arise in that
> > case. The kexec process actually runs on a copy of relocate_kernel.S,
> > which will bring a lot of problems...
>
> It won't be a problem as you can keep all data on-stack without external
> reference.
>
> Thanks.
As I said before, only the control page is safe during kexec, so we
cannot reuse smp.c. If BIOS provides play_dead(), that is also a safe
region, but currently there is no runtime service from BIOS.

Huacai
>
> - Jiaxun
>
> >
> > Above all just my personal thoughts.
> >
> > Thanks,
> > Jinyang
> >
>
