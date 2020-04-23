Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAB9C1B5E15
	for <lists+linux-mips@lfdr.de>; Thu, 23 Apr 2020 16:42:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726450AbgDWOmv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 23 Apr 2020 10:42:51 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:35184 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726963AbgDWOmu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 23 Apr 2020 10:42:50 -0400
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 03NEgXG8015496;
        Thu, 23 Apr 2020 23:42:34 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 03NEgXG8015496
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1587652954;
        bh=ZbrX8HgIq0QwRra2pCZbmne6rmEly6+QxtlCHSyKHGM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=23X9GSV0v29umhRrIZR0Xvdms/zTPnXPEHWQlfuP97fiFzR4OsLTLmVmJt7NdEK0u
         2DUBkFskpTt1rY+FzwI9dsW12gQuftqeSP+oERyF/jQ8ULyRjEQABuArwRmCdpTUJ7
         AYZwGGjBXZAPRti2Y94YcEeBHYVMh65eTHPw7gcqp/T6gE2+60xDA92iui/CCujRsK
         v1DfGsV9xBdZsiCsiFoSVHl/Ced1famCL+gCAvOLVxPqwxLijzOhFFFWzK7H16D97D
         ria/7IDQwuvqhytqVC1/rTEVHvVU+uuK3MFCQHhJi4btb9hAmLJvrgJP5f0BK/Y5RH
         wae1fmb2TH5UA==
X-Nifty-SrcIP: [209.85.222.48]
Received: by mail-ua1-f48.google.com with SMTP id i5so5914326uaq.1;
        Thu, 23 Apr 2020 07:42:34 -0700 (PDT)
X-Gm-Message-State: AGi0PuaqZiCtx0VNpVZ90km9DV4V2cc4KcRpKHnOXRbPNu3Q39sVICnj
        b8hf1dZIQ59GGCUtqkoSY9G4OMA+SntOLmeKyeo=
X-Google-Smtp-Source: APiQypJrKKb72liE11VFowlb87QsF1jPVb/XNG6Tjg9gH8WKWsWX5WAPsXhORsdlkATG9DI+inT1M7eivCuMKc1B89M=
X-Received: by 2002:a05:6102:240f:: with SMTP id j15mr3574415vsi.155.1587652953014;
 Thu, 23 Apr 2020 07:42:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200419180445.26722-1-natechancellor@gmail.com>
 <20200419202128.20571-1-natechancellor@gmail.com> <20200419202128.20571-2-natechancellor@gmail.com>
 <CA+icZUVaLW+38WEJhqnfO7B_unHvrbSr0moKnfJ6zXGGA06CWQ@mail.gmail.com> <20200421024256.GA42179@ubuntu-s3-xlarge-x86>
In-Reply-To: <20200421024256.GA42179@ubuntu-s3-xlarge-x86>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 23 Apr 2020 23:41:56 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT-rcfbri48rA8yNYN6ySvRUWg=DoppvrU9eerY5ckBVQ@mail.gmail.com>
Message-ID: <CAK7LNAT-rcfbri48rA8yNYN6ySvRUWg=DoppvrU9eerY5ckBVQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] MIPS: VDSO: Move disabling the VDSO logic to Kconfig
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Sedat Dilek <sedat.dilek@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Dmitry Golovin <dima@golovin.in>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Apr 21, 2020 at 11:43 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> On Mon, Apr 20, 2020 at 11:53:55AM +0200, Sedat Dilek wrote:
> > On Sun, Apr 19, 2020 at 10:21 PM Nathan Chancellor
> > <natechancellor@gmail.com> wrote:
> > >
> > > After commit 9553d16fa671 ("init/kconfig: Add LD_VERSION Kconfig"), we
> > > have access to GNU ld's version at configuration time. As a result, we
> > > can make it clearer under what configuration circumstances the MIPS VDSO
> > > needs to be disabled.
> > >
> > > This is a prerequisite for getting rid of the MIPS VDSO binutils
> > > warning and linking the VDSO when LD is ld.lld. Wrapping the call to
> > > ld-ifversion with CONFIG_LD_IS_LLD does not work because the config
> > > values are wiped away during 'make clean'.
> > >
> > > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> > > ---
> > >
> > > v1 -> v2:
> > >
> > > * New patch.
> > >
> > >  arch/mips/Kconfig         |  2 ++
> > >  arch/mips/vdso/Kconfig    | 18 ++++++++++++++++++
> > >  arch/mips/vdso/Makefile   | 30 ++----------------------------
> > >  arch/mips/vdso/vdso.lds.S |  2 +-
> > >  4 files changed, 23 insertions(+), 29 deletions(-)
> > >  create mode 100644 arch/mips/vdso/Kconfig
> > >
> > > diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> > > index 690718b3701a..45220e4b8a65 100644
> > > --- a/arch/mips/Kconfig
> > > +++ b/arch/mips/Kconfig
> > > @@ -3275,3 +3275,5 @@ endmenu
> > >  source "drivers/firmware/Kconfig"
> > >
> > >  source "arch/mips/kvm/Kconfig"
> > > +
> > > +source "arch/mips/vdso/Kconfig"
> > > diff --git a/arch/mips/vdso/Kconfig b/arch/mips/vdso/Kconfig
> > ...
> > > --- /dev/null
> > > +++ b/arch/mips/vdso/Kconfig
> > ...
> > > +config MIPS_DISABLE_VDSO
> > > +       def_bool CPU_MICROMIPS || (!CPU_MIPSR6 && !MIPS_LD_CAN_LINK_VDSO)
> > ...
> > > diff --git a/arch/mips/vdso/vdso.lds.S b/arch/mips/vdso/vdso.lds.S
> > ...
> > > --- a/arch/mips/vdso/vdso.lds.S
> > > +++ b/arch/mips/vdso/vdso.lds.S
> > ...
> > > -#ifndef DISABLE_MIPS_VDSO
> > > +#ifndef CONFIG_DISABLE_MIPS_VDSO
> >
> > Should be s/CONFIG_DISABLE_MIPS_VDSO/CONFIG_MIPS_DISABLE_VDSO ?
> >
> > - Sedat -
>
> Ugh yes, thank you much for pointing it out.
>
> I'll send a v3 once I get further feedback on the series.


I just wondered if we could raise the minimal binutils
version from 2.23 to 2.25, but it might be too aggressive...
I do not know.

Other than what Sedat pointed out, this looks good me.

-- 
Best Regards
Masahiro Yamada
