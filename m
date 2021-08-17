Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 204DC3EE75C
	for <lists+linux-mips@lfdr.de>; Tue, 17 Aug 2021 09:39:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234486AbhHQHjm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 17 Aug 2021 03:39:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234402AbhHQHjm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 17 Aug 2021 03:39:42 -0400
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6FABC061764;
        Tue, 17 Aug 2021 00:39:09 -0700 (PDT)
Received: by mail-io1-xd34.google.com with SMTP id z1so2296825ioh.7;
        Tue, 17 Aug 2021 00:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MDPsHQ/akN4vCRT1wIJ4JXeom4VNeQEZd5BhT+CkH8s=;
        b=XVM4mv5bsoQcsFcig6CBjSCpH2lzT36DktAQOp/CMO/Q5BRq3F3ZeQrEt4OE0pmzv+
         Q4NzbovwBeYXaXqdmJ2SCoAs3BMRnXcunStVZ14jLyjS9z6CbKzPnnJBfJIK3SNZzOCq
         IEnnYmWA+IFSVDRDqZPB2hGwUSEwc9tTHvC9ZO8K6oKOQeq2RrqaDN/hnf9XjQJZ8TaC
         iEptgJpwEWKpFsml4JL/DckzOsTFPxq1j9sydwRfFJZnbzDXZqPKYXKaUn0/zKgmqcI5
         BTKCXUcHV5kbP5773t3mJE/TzO5571Hx3Ej/Iyly1B3mC36qQksEYaUYhf6FIUYN9xs1
         El3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MDPsHQ/akN4vCRT1wIJ4JXeom4VNeQEZd5BhT+CkH8s=;
        b=OX/9W9BAX/fAABny4WyEUMEHIy2seO5qk1HqmjH2kmToHU3x1o0p2HDJzY6qZjtHsS
         In0iFtx4yAyygjYAU/o48z8jxJ657zJhvLx8Tfy9O7JRFJNaFpO4alF7m42d3s8yjq+h
         f7hLfaU5PJ+VQRzKF3/4ziJlPIbxYaVZ7DBEzPe6aME2nNiWkbsN88naLKRaFjP4W/bV
         /o/df2okc7LikOWF6IaoynvRfoyKNSMQfBGQW2qLoBglxwzZO1lbaNpAIUdWTeeLVVM7
         xaxmobremh0uZWEI8QKO1n00X6q3wXvqMkaBRMSDLEvXryqni9p/lWdqTAqvetb+4r0H
         Fsbg==
X-Gm-Message-State: AOAM531vhlHsYpHe9En/c9tN/QqdNkNduyU2Y3BqJgabMn6Gw/i4vxZz
        ANAd7FRJAeApYK5fKMWopL9m9lCSUKOFvYr32Xk=
X-Google-Smtp-Source: ABdhPJwcxmRXQPXRbI43BkpbAqymYA3NA65lCUbhsJYYXLZ/TEWVEN2wJF15cEtFmqMOV1TVlzC3/C/ptjnxqC6ip4w=
X-Received: by 2002:a05:6602:1210:: with SMTP id y16mr1865988iot.159.1629185949315;
 Tue, 17 Aug 2021 00:39:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210816065417.3987596-1-chenhuacai@loongson.cn>
 <20210816182750.26i535ilc6nef5k6@offworld> <874kbpp5zd.ffs@tglx>
 <CAAhV-H5TKLMi0GSQmh9RFK_k5eNRwx8AE8MjMKjJfbnyVYP-+w@mail.gmail.com> <871r6spn0r.ffs@tglx>
In-Reply-To: <871r6spn0r.ffs@tglx>
From:   Huacai Chen <chenhuacai@gmail.com>
Date:   Tue, 17 Aug 2021 15:38:58 +0800
Message-ID: <CAAhV-H6=MbBFwgxT75Bqr5SY0e5E6gtpCUCZhrVgFE_h1A0q2A@mail.gmail.com>
Subject: Re: [PATCH] futex: Fix fault_in_user_writeable()
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     Davidlohr Bueso <dave@stgolabs.net>,
        Huacai Chen <chenhuacai@loongson.cn>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Darren Hart <dvhart@infradead.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Hongchen Zhang <zhanghongchen@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Thomas,

On Tue, Aug 17, 2021 at 3:07 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> On Tue, Aug 17 2021 at 09:53, Huacai Chen wrote:
> > On Tue, Aug 17, 2021 at 3:03 AM Thomas Gleixner <tglx@linutronix.de> wrote:
> >> That's surely one way to fix that. If that does not work for whatever
> >> reason, then we really don't want this find_vma() hack there, but rather
> >> something like:
> > I don't know why find_vma() is unacceptable here, there is also
> > find_vma() in fixup_user_fault().
>
> Wrong. find_extend_vma() != find_vma(). Aside of that fixup_user_fault()
> does way more than that.
>
> >>     if (IS_ENABLED(CONFIG_ARCH_USER_FAULT_VOODOO) && get_user(&tmp, uaddr))
> >>         return -EFAULT;
> >
> > get_user() may be better than find_vma(), but can we drop
> > CONFIG_ARCH_USER_FAULT_VOODOO here? On those "W implies R" archs,
> > get_user() always success, this can simplify the logic.
>
> For architectures which imply R fixup_user_fault() is way more
> effinicient than taking the fault on get_user() and then invoking
> fixup_user_fault() to ensure that the mapping is writeable.
>
> No, we are not making stuff less efficient just because of MIPS.
>

We use this program to test MIPS and X86:

int main(int argc, char** argv)
{
        int fd;
        void *ptr;
        int ret;
        int syscall_nr = 98;

        fd = open("/dev/zero", O_RDWR);
        if (fd == -1)
                exit(EXIT_FAILURE);

        ptr = mmap(NULL, 16384, PROT_WRITE, MAP_ANONYMOUS | MAP_SHARED, fd, 0);
        close(fd);
        /*
         * futex syscall nr:
         * x86_64: 202
         * MIPS84: 5194
         */
#ifdef __mips__
        syscall_nr = 5194;
#elif __x86_64__
        syscall_nr = 202;
#endif

        ret = syscall(syscall_nr,ptr,FUTEX_LOCK_PI,0, NULL, NULL, 0,0);
        printf("syscall %d ret = %d\n",syscall_nr,ret);

        return 0;
}

On X86, it returns 0; on MIPS64 without patch, it hangs in kernel; on
MIPS64 with this patch, it returns -1.

Then, I want to know, on "W implies R" archs (such as X86), should it
return 0? Maybe return -1 is more reasonable? (because the VMA is
marked as write-only). If this program should return -1, then I don't
think this is a MIPS-specific problem.

Huacai

> Thanks,
>
>         tglx
