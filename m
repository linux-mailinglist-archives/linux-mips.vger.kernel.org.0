Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5574428F72
	for <lists+linux-mips@lfdr.de>; Fri, 24 May 2019 05:11:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387654AbfEXDL1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 23 May 2019 23:11:27 -0400
Received: from mail-it1-f194.google.com ([209.85.166.194]:39143 "EHLO
        mail-it1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387559AbfEXDL1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 23 May 2019 23:11:27 -0400
Received: by mail-it1-f194.google.com with SMTP id 9so11694522itf.4;
        Thu, 23 May 2019 20:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E7hznSwoqjG8X1odMBGc2satoFe87v1Y0P/9fKHS9SY=;
        b=a7Sc0ZmlEG6jC7OpcrRVUkNXq0SBb3Dc/hNdk5Vi6ayUDLd0Dm8M0wWvJFgwttZZ4M
         aninTKfSUZDRjfNGqPsMzWLja++EezX/hO4fX5nJBzfyFI6kNO7dvjypaoVQz4ys7+R5
         9IVPBxW1C4i6BRZ4f3bqLocvJh1c9QUTPILj4gipCVXMgVTUpT9LBYkMiRDL2TaalXNe
         rQ6wJugIty6JwVWYs5nF97JpvrTENcxT3PWNqVTqRhEna4JwxQokvn2SUzkeP09LHMDC
         DgccA6RcG2CmDNt2DoIHjZymnDK30hw9WxWvnBoApiNxfRbL6LLAu65RJr1Ih71O/P5e
         SodQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E7hznSwoqjG8X1odMBGc2satoFe87v1Y0P/9fKHS9SY=;
        b=Ezz2Tgeoxjdv/gvVJ/MA5BphhJp0ROY7eGuEAPB34pjOfZ9Qhjq2ttOZI492SrJqID
         oYb+trVWohcEsTTnuvrXvqhM9++ob+KDmqye9lu5WGczS9UEq2zlUGooX0bFUTQ7eDNO
         73TpY8KHHy+M7pkUnZ7s50p4JClZ/FVH+/BnIUFnJHG2PFE26yzI5AaPHTyZc6iITSaB
         nqFqf1RuwcGj8pV4vQ7v0OO0m5cntojFaB/EJT2diuKOwc2KO87DKUsVqyDu/xj3efNO
         jRbywuuPXIY3ktLzuRoSCd49qjhz+CSclAPfHslijAnC/ldpKQ38cq/SakMisXgIe5f4
         /CnQ==
X-Gm-Message-State: APjAAAU/nXJChSYn3/OkCY5jM66bpCt/c1PazWN/OjkBlJQ/qjpoKeug
        A1Ap6yIXeByCvDlPB2sRDwiDyk7343xDzT5OICXlSzV8sA==
X-Google-Smtp-Source: APXvYqz4ssg3ircx9GKZ/bOQFSdzkDIVdQtquf3WB1GzGhZLWMOO7FDaVjBjQGy32wO2lRBtVYsHwdCKMGdQi1fBKFw=
X-Received: by 2002:a24:1dce:: with SMTP id 197mr16766439itj.16.1558667486023;
 Thu, 23 May 2019 20:11:26 -0700 (PDT)
MIME-Version: 1.0
References: <1556087581-14513-1-git-send-email-kernelfans@gmail.com>
 <10dc5468-6cd9-85c7-ba66-1dfa5aa922b7@suse.com> <CAFgQCTstd667wP6g+maxYekz4u3iBR2R=FHUiS1V=XxTs6MKUw@mail.gmail.com>
 <CAFgQCTtQm7SuBRfXik6B065Aa+uQ=Mx6i+Y1q+NJU1GEiUgH4g@mail.gmail.com>
In-Reply-To: <CAFgQCTtQm7SuBRfXik6B065Aa+uQ=Mx6i+Y1q+NJU1GEiUgH4g@mail.gmail.com>
From:   Pingfan Liu <kernelfans@gmail.com>
Date:   Fri, 24 May 2019 11:11:13 +0800
Message-ID: <CAFgQCTuAEbST8ZdSJmPDTPbqkL3uZ8j6U-vTWT879wARDhUwTw@mail.gmail.com>
Subject: Re: [PATCHv2] kernel/crash: make parse_crashkernel()'s return value
 more indicant
To:     Matthias Brugger <mbrugger@suse.com>
Cc:     LKML <linux-kernel@vger.kernel.org>, Rich Felker <dalias@libc.org>,
        linux-ia64@vger.kernel.org,
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
        Dave Young <dyoung@redhat.com>,
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
        Greg Hackmann <ghackmann@android.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Matthias, ping? Any suggestions?

Thanks,
Pingfan


On Thu, May 2, 2019 at 2:22 PM Pingfan Liu <kernelfans@gmail.com> wrote:
>
> On Thu, Apr 25, 2019 at 4:20 PM Pingfan Liu <kernelfans@gmail.com> wrote:
> >
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
> After a series of work, I suddenly realized that it can not be done
> like this way. "0M" causes kstrtoull() to return -EINVAL, but this is
> caused by "M", not "0". If passing "0" to kstrtoull(), it will return
> 0 on success.
>
> > >
> > It seems that kstrtoull() treats 0M as invalid parameter, while
> > simple_strtoull() does not.
> >
> My careless going through the code. And I tested with a valid value
> "256M" using kstrtoull(), it also returned -EINVAL.
>
> So I think there is no way to distinguish 0 from a positive value
> inside this basic math function.
> Do I miss anything?
>
> Thanks and regards,
> Pingfan
