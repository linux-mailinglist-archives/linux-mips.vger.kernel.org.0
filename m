Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46AEE2F906E
	for <lists+linux-mips@lfdr.de>; Sun, 17 Jan 2021 05:25:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727090AbhAQEZs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 16 Jan 2021 23:25:48 -0500
Received: from mail.kernel.org ([198.145.29.99]:37714 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728138AbhAQEZr (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 16 Jan 2021 23:25:47 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id BC7D022DBF
        for <linux-mips@vger.kernel.org>; Sun, 17 Jan 2021 04:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610857506;
        bh=KNw+xp5b5SHz2IYFdayTRXUEkjnRZa3lb6AgSo+RQ6o=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=IAXLPHXn9m5W/wuE88Z0LsgFa0Gw2JI2n/u4btApHMlTdVrzU6UA3A4S6VHeDJrJt
         p7sZpJDnpkeI1dxqmMo0fcmYexHzH66iz3gxF/OdbE2lDIP+8fz80Q//qkhtVcgvCo
         O5BwwEdk/uKD92C7CbkbhbbB86cy7x9PCe3U9OujAPdkpUgZyDGt3M3Pi4GzAoD20G
         K8Zxz9RV2m0w6RE2ku2thWlU/7FrUvQYQV3xnKhizPbn8rBgvroVlSRo/GDby6GBmV
         U6ElcLl7hAUh2WFKzbDI59nYz4H8V5/V11rCk0KKKX74YTeyNCAflbinH2lw4fP9cy
         AomgaHD0el1RQ==
Received: by mail-io1-f44.google.com with SMTP id p72so1604167iod.12
        for <linux-mips@vger.kernel.org>; Sat, 16 Jan 2021 20:25:06 -0800 (PST)
X-Gm-Message-State: AOAM532pXWc4ULr29MyozY28t6jMOtqUaZKM4cWu0UZb4YZ9JolChM1S
        iZmXDSTr5nO1mDQZD9+4MMtU9J3NXFg+lw7+pII=
X-Google-Smtp-Source: ABdhPJxZOaZfD20xMGVs3XrAoTNGt9vxXTA5dvFuFVKkCnBpUoqIOthaPfQ1wtcQZ9B7Fh9y+RQDBXMp9irgC2hKCzw=
X-Received: by 2002:a5e:9612:: with SMTP id a18mr13175639ioq.13.1610857506200;
 Sat, 16 Jan 2021 20:25:06 -0800 (PST)
MIME-Version: 1.0
References: <20201221120220.3186744-1-chenhuacai@kernel.org>
 <a671a323-768b-b461-2ce4-ecc1e92d4cc6@loongson.cn> <CAAhV-H4GDxhg1YqWy-g7VuCeE7BZ0ibaVSr1ibzJqXjuaBn3_w@mail.gmail.com>
 <20210107172620.GA13201@alpha.franken.de> <1085845b-2c5a-dbb6-62b7-28b55aeacb4c@loongson.cn>
 <13b3f842-61e8-db13-67ff-7d2a9d894484@flygoat.com> <CAAhV-H5VUY20ADeXjNvOO_aP3ubikgpRJkmHJwDo71HhDGx+3A@mail.gmail.com>
 <3aed5286-bf91-8e51-7e30-5dbff1ed539c@flygoat.com>
In-Reply-To: <3aed5286-bf91-8e51-7e30-5dbff1ed539c@flygoat.com>
From:   Huacai Chen <chenhuacai@kernel.org>
Date:   Sun, 17 Jan 2021 12:24:54 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4cqnFGe+GfV3gBDDttGRfh9zVAjacVS6=Y6wgiOcqz1g@mail.gmail.com>
Message-ID: <CAAhV-H4cqnFGe+GfV3gBDDttGRfh9zVAjacVS6=Y6wgiOcqz1g@mail.gmail.com>
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

On Sat, Jan 9, 2021 at 3:38 PM Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>
> =E5=9C=A8 2021/1/9 =E4=B8=8A=E5=8D=889:36, Huacai Chen =E5=86=99=E9=81=93=
:
> > Hi, Jiaxun,
> >
> > On Fri, Jan 8, 2021 at 6:15 PM Jiaxun Yang <jiaxun.yang@flygoat.com> wr=
ote:
> >> =E5=9C=A8 2021/1/8 =E4=B8=8B=E5=8D=886:07, Jinyang He =E5=86=99=E9=81=
=93:
> >>> Hi, Thomas,
> >>>
> >>> On 01/08/2021 01:26 AM, Thomas Bogendoerfer wrote:
> >>>>>>> --- a/arch/mips/kernel/relocate_kernel.S
> >>>>>>> +++ b/arch/mips/kernel/relocate_kernel.S
> >>>>>>> @@ -6,6 +6,7 @@
> >>>>>>>
> >>>>>>>     #include <asm/asm.h>
> >>>>>>>     #include <asm/asmmacro.h>
> >>>>>>> +#include <asm/cpu.h>
> >>>>>>>     #include <asm/regdef.h>
> >>>>>>>     #include <asm/mipsregs.h>
> >>>>>>>     #include <asm/stackframe.h>
> >>>>>>> @@ -133,6 +134,33 @@ LEAF(kexec_smp_wait)
> >>>>>>>     #else
> >>>>>>>         sync
> >>>>>>>     #endif
> >>>>>>> +
> >>>>>>> +#ifdef CONFIG_CPU_LOONGSON64
> >>>> Is there a reason why you can't use the already existing infrastruct=
ure
> >>>> the way cavium-octeon is doing it ? If you can't please explain why
> >>>> so we can find a way to extend it. But having some sort of poking
> >>>> loongson registers in generic MIPS code is a non starter.
> >>>>
> >>>> Thomas.
> >>>>
> >>> Unlike the cavium-octeon platform, the Loongson64 platform needs some
> >>> changes. Before the kernel starts, (before entering the kernel_entry)=
,
> >>> each CPU has its own state (the SMP system). For Loongson64, only the
> >>> boot CPU will enter the kernel_entry, and other CPUs will query their
> >>> mailbox value in a loop. This is what the BIOS does for the CPU. Here
> >>> is different from cavium-octeon. All CPUs will enter the kernel_entry
> >>> on cavium-octeon platform. Then the kernel_entry_setup, the co-CPUs
> >>> will enter the query loop. I saw the kernel_entry_setup of other
> >>> platforms, such as ip27, malta, and generic. They are not like
> >>> cavium-octeon and the co-CPUs entering the loop may be earlier than
> >>> entering kernel_entry. So I have reason to guess that most SMP system
> >>> platform CPUs are similar to Loongson64.
> >> Hi Jingyang,
> >>
> >> As I commented before you may reuse play_dead logic in Loongson's smp.=
c.
> >>
> >>> relocate_kernel.S is like BIOS doing s omething for the CPU. It allow=
s
> >>> the boot CPU to start from the new kernel_entry and makes the co-CPUs
> >>> enter a loop. The already existing infrastructure may be more suitabl=
e
> >>> for non-smp platforms. Although we can do something with
> >>> plat_smp_ops.kexec_nonboot_cpu, more new problems will arise in that
> >>> case. The kexec process actually runs on a copy of relocate_kernel.S,
> >>> which will bring a lot of problems...
> >> It won't be a problem as you can keep all data on-stack without extern=
al
> >> reference.
> >>
> >> Thanks.
> > As I said before, only the control page is safe during kexec, so we
> > cannot reuse smp.c. If BIOS provides play_dead(), that is also a safe
> > region, but currently there is no runtime service from BIOS.
>
> Sorry, ignored the overlap case :-(
>
> Jumping to 0xbfc00000 to use firmware boot vector seems a little bit
> overkill.
>
> But we'd better delivery it into platform folder, just like
> kernel-entry-init.h
Even if we move something to kernel-entry-init.h, we still need to
modify arch/mips/kernel/relocate_kernel.S.

Huacai
>
> Thanks.
>
> - Jiaxun
>
> >
> > Huacai
> >> - Jiaxun
> >>
> >>> Above all just my personal thoughts.
> >>>
> >>> Thanks,
> >>> Jinyang
> >>>
>
