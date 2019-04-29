Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99CE7DA91
	for <lists+linux-mips@lfdr.de>; Mon, 29 Apr 2019 05:05:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727096AbfD2DFB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 28 Apr 2019 23:05:01 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:43716 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726819AbfD2DFB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 28 Apr 2019 23:05:01 -0400
Received: by mail-io1-f68.google.com with SMTP id v9so7687410iol.10;
        Sun, 28 Apr 2019 20:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dJMl90O95ELh7MccR/gotQ0iR4kxpXltz+n2rVMWVek=;
        b=sCS33Wo854rOecdEepHQFeUD38yV4m0fx8fxGIDGiFttKs1dNNsEKXEkbVeyxlSjum
         3xNFDFhJ2iF9Fh9LzN6/xoVy+YhiXgEoshszIQJUnps+YrJhuuw9lAxDcYmGEDff9HrD
         TJ6Xu79Wqbtq1Tpi2wfMrvCOrwmCbJWN+8K8iOxPa9yGhqwXJHYJPfAWhw1jyiGBSsz3
         6X4n0WUjEhAKyIGR/WesQJtN5xfG2amZp32CAU7q0+TYECzjxRQ/mdLi88A/Ti2/Vfqv
         +JnR2yMzE207qkPhJUQQMzIyz+UetNgniIOCbX3kN+O9VLWgT/dAd33CFP0gKgTqhMkH
         ZRgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dJMl90O95ELh7MccR/gotQ0iR4kxpXltz+n2rVMWVek=;
        b=sAdYSg1EjYElLG7jtebHV/HI/gPxCMWKQwE5rtAZtOaaqLAgRTdjT4fVyP2UZt5hRV
         NaQN+xpy8zlRx4uWLu+EUWSKO4oloQvhgfxFtnCHQkSUwcWQ9sYPLBZugGQQgdWTT3+m
         VkSbXvnIr4bdZVp/F4SmAzCs4UflMy9bNmbbBIErmGADh8vkiW6ONpRozBdjY96MVIno
         QIZEF34VLWrMdJPW12ISl1Oi0QDdyqetmMhEDgVkN4ESuxc6y41W9IaAXIFH5u70DjRZ
         xFP8VUJKto0WAwXYvpGxH6XGdNFeu1GivYfg/5AI+dGhYjw45hO9QGurn3xhXkUc8j3b
         bCQw==
X-Gm-Message-State: APjAAAX1go70D3LyyGiI9BUwQjrbJ5uYCjILrqcEUFFN2AteVQB9fbY6
        RVjS09t3in3DPJ/hB4/0IrmYCaDAC0cB9XUy/A==
X-Google-Smtp-Source: APXvYqzeszOwZP14RtOC6mV9rY3uOhFyM1yQpZi/QDojtM4wzbayqEf6L0iWYkrbUvWs9aPmzqXndCUfaebQxYOHnc8=
X-Received: by 2002:a6b:7d08:: with SMTP id c8mr3138801ioq.259.1556507100502;
 Sun, 28 Apr 2019 20:05:00 -0700 (PDT)
MIME-Version: 1.0
References: <1556087581-14513-1-git-send-email-kernelfans@gmail.com>
 <10dc5468-6cd9-85c7-ba66-1dfa5aa922b7@suse.com> <CAFgQCTstd667wP6g+maxYekz4u3iBR2R=FHUiS1V=XxTs6MKUw@mail.gmail.com>
 <20190428083710.GA11981@dhcp-128-65.nay.redhat.com>
In-Reply-To: <20190428083710.GA11981@dhcp-128-65.nay.redhat.com>
From:   Pingfan Liu <kernelfans@gmail.com>
Date:   Mon, 29 Apr 2019 11:04:49 +0800
Message-ID: <CAFgQCTvQezGM7xgY2Q1RSUiQ7wLdxtUAeztrO3AqDfjx8f2kdg@mail.gmail.com>
Subject: Re: [PATCHv2] kernel/crash: make parse_crashkernel()'s return value
 more indicant
To:     Dave Young <dyoung@redhat.com>
Cc:     Matthias Brugger <mbrugger@suse.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
        Julien Thierry <julien.thierry@arm.com>,
        Yangtao Li <tiny.windzz@gmail.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Palmer Dabbelt <palmer@sifive.com>,
        Heiko Carstens <heiko.carstens@de.ibm.com>, x86@kernel.org,
        linux-mips@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
        "H. Peter Anvin" <hpa@zytor.com>, linux-s390@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        linux-sh@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
        David Hildenbrand <david@redhat.com>,
        Russell King <linux@armlinux.org.uk>,
        Ingo Molnar <mingo@redhat.com>,
        linux-arm-kernel@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        James Hogan <jhogan@kernel.org>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Will Deacon <will.deacon@arm.com>,
        linuxppc-dev@lists.ozlabs.org,
        Ananth N Mavinakayanahalli <ananth@linux.vnet.ibm.com>,
        Borislav Petkov <bp@alien8.de>, Stefan Agner <stefan@agner.ch>,
        Thomas Gleixner <tglx@linutronix.de>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Jens Axboe <axboe@kernel.dk>, Tony Luck <tony.luck@intel.com>,
        Baoquan He <bhe@redhat.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Thomas Bogendoerfer <tbogendoerfer@suse.de>,
        Paul Burton <paul.burton@mips.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Martin Schwidefsky <schwidefsky@de.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Logan Gunthorpe <logang@deltatee.com>,
        Greg Hackmann <ghackmann@android.com>,
        kexec@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Apr 28, 2019 at 4:37 PM Dave Young <dyoung@redhat.com> wrote:
>
> On 04/25/19 at 04:20pm, Pingfan Liu wrote:
> > On Wed, Apr 24, 2019 at 4:31 PM Matthias Brugger <mbrugger@suse.com> wrote:
> > >
> > >
> > [...]
> > > > @@ -139,6 +141,8 @@ static int __init parse_crashkernel_simple(char *cmdline,
> > > >               pr_warn("crashkernel: unrecognized char: %c\n", *cur);
> > > >               return -EINVAL;
> > > >       }
> > > > +     if (*crash_size == 0)
> > > > +             return -EINVAL;
> > >
> > > This covers the case where I pass an argument like "crashkernel=0M" ?
> > > Can't we fix that by using kstrtoull() in memparse and check if the return value
> > > is < 0? In that case we could return without updating the retptr and we will be
> > > fine.
> > >
> > It seems that kstrtoull() treats 0M as invalid parameter, while
> > simple_strtoull() does not.
> >
> > If changed like your suggestion, then all the callers of memparse()
> > will treats 0M as invalid parameter. This affects many components
> > besides kexec.  Not sure this can be done or not.
>
> simple_strtoull is obsolete, move to kstrtoull is the right way.
>
> $ git grep memparse|wc
>     158     950   10479
>
> Except some documentation/tools etc there are still a log of callers
> which directly use the return value as the ull number without error
> checking.
>
> So it would be good to mark memparse as obsolete as well in
> lib/cmdline.c, and introduce a new function eg. kmemparse() to use
> kstrtoull,  and return a real error code, and save the size in an
> argument like &size.  Then update X86 crashkernel code to use it.
>
Thank for your good suggestion.

Regards,
Pingfan
