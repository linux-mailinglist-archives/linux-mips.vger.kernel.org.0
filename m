Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F419D1134D
	for <lists+linux-mips@lfdr.de>; Thu,  2 May 2019 08:22:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726055AbfEBGWT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 2 May 2019 02:22:19 -0400
Received: from mail-it1-f196.google.com ([209.85.166.196]:55119 "EHLO
        mail-it1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725764AbfEBGWS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 2 May 2019 02:22:18 -0400
Received: by mail-it1-f196.google.com with SMTP id a190so1381374ite.4;
        Wed, 01 May 2019 23:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k56mmNJm2c37muwGSNyw5prel5SUd23hcD0vEkYllYY=;
        b=OUxx+AAHpV80+7jWx8f1+E7itJj9D1rgHeIv5/3VMm7TKAnaU1bHWCA0kR/Uu4B/N0
         YiDM2kOhNwjBsVDh7yPbvcSscs4wrg/XbXz1H/w3lDdnJU4TQ9QwedxsTFe/Bbjt18D3
         JRn/qzW0ooD8Rl7s9nAI0qgl8XU1Fhb9EsRc0VNWcSWwmT5yQ/Ep3gbO5ZmDWB/2TOjs
         56aGZ16FpdQ10TxCUNbdRMfiLjvkeIGo1brUr0GBhS/X+j6ZJRXFbl8XXTiVI/tpSorx
         HgJ21xXoiQgpOYV/KzFy4OYZm4ZtO8AhUMxPfwPWagYl7mDnLgavitYf7mYuADYjNy/N
         5KRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k56mmNJm2c37muwGSNyw5prel5SUd23hcD0vEkYllYY=;
        b=MIyo4SDSGi/WvE33ca1hznAocUQEWoDqMwzG+5wsQ8x40U+aElZTVV6cC1Cay8TR+M
         KI654MWkZ+5cI6RqMrG+Fq+ijr0oCojrjuLS0dpAbm2IDNcKuG9jFI2I+ue5JVnChLwO
         tF/tdKd5JmbtCLlErt2pO87fridJB/nnsFlLngNnYFi+fn084SQYS+K8xx6ur+tiKdlM
         3j3klGWMGeanQkoCtACPslOEvMj4G9tKlM9s/4LcW4uco0583l+ldyM/HjsKxet/i4+3
         vnZeub/YcYzhfV/b7z9ZKnk6B2BWAGdpsF2bWqrrs9w2MbbNAwK9oKxCkxQDuimTJ87C
         5cLw==
X-Gm-Message-State: APjAAAVC7lf9nWQ7pU6RjkY1B7DsjoFlcku1nJgZzzMxboY5YwajECx/
        hZAeysXcmv0Kj+IDOSlrwExVawlnhycTOLvuTg==
X-Google-Smtp-Source: APXvYqx2USGvNZCoaLJnd+1UamBCWbf1OMfqf8foQXGwbUGpu68tSJhvorSVm2AnXEjYEs1kPbB4DdJnuY+hXU3VFhQ=
X-Received: by 2002:a05:660c:38e:: with SMTP id x14mr1138760itj.146.1556778137619;
 Wed, 01 May 2019 23:22:17 -0700 (PDT)
MIME-Version: 1.0
References: <1556087581-14513-1-git-send-email-kernelfans@gmail.com>
 <10dc5468-6cd9-85c7-ba66-1dfa5aa922b7@suse.com> <CAFgQCTstd667wP6g+maxYekz4u3iBR2R=FHUiS1V=XxTs6MKUw@mail.gmail.com>
In-Reply-To: <CAFgQCTstd667wP6g+maxYekz4u3iBR2R=FHUiS1V=XxTs6MKUw@mail.gmail.com>
From:   Pingfan Liu <kernelfans@gmail.com>
Date:   Thu, 2 May 2019 14:22:06 +0800
Message-ID: <CAFgQCTtQm7SuBRfXik6B065Aa+uQ=Mx6i+Y1q+NJU1GEiUgH4g@mail.gmail.com>
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

On Thu, Apr 25, 2019 at 4:20 PM Pingfan Liu <kernelfans@gmail.com> wrote:
>
> On Wed, Apr 24, 2019 at 4:31 PM Matthias Brugger <mbrugger@suse.com> wrote:
> >
> >
> [...]
> > > @@ -139,6 +141,8 @@ static int __init parse_crashkernel_simple(char *cmdline,
> > >               pr_warn("crashkernel: unrecognized char: %c\n", *cur);
> > >               return -EINVAL;
> > >       }
> > > +     if (*crash_size == 0)
> > > +             return -EINVAL;
> >
> > This covers the case where I pass an argument like "crashkernel=0M" ?
> > Can't we fix that by using kstrtoull() in memparse and check if the return value
> > is < 0? In that case we could return without updating the retptr and we will be
> > fine.
After a series of work, I suddenly realized that it can not be done
like this way. "0M" causes kstrtoull() to return -EINVAL, but this is
caused by "M", not "0". If passing "0" to kstrtoull(), it will return
0 on success.

> >
> It seems that kstrtoull() treats 0M as invalid parameter, while
> simple_strtoull() does not.
>
My careless going through the code. And I tested with a valid value
"256M" using kstrtoull(), it also returned -EINVAL.

So I think there is no way to distinguish 0 from a positive value
inside this basic math function.
Do I miss anything?

Thanks and regards,
Pingfan
