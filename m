Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E6841A10E9
	for <lists+linux-mips@lfdr.de>; Tue,  7 Apr 2020 18:03:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728005AbgDGQDt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 7 Apr 2020 12:03:49 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:24499 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727991AbgDGQDt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 7 Apr 2020 12:03:49 -0400
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 037G3Ue9024707;
        Wed, 8 Apr 2020 01:03:30 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 037G3Ue9024707
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1586275411;
        bh=H1J7FezWT1dgglGN/erJ3S7DC6IYDiQ5DhPkx5GnfYo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=djBLvGd0L88sTtMnV7Ktcs7LOCu7upEpPBj4r3AIG6B3UH80aD6p0N80wXfqBwexX
         GmI2q73EAYBwYtYWbCYlXFHLvCk0pmkSQe7agC/KKcQcmjoZR+h0rbU2Yq0JACA1ny
         XCKJt7iKiI+sEqKyVoMsaqGz1LsWXxTKQvfWa3Ud3YJaWoQ+vr/7oZU4wZ0cAyyBBZ
         LEi0D3KUjNTJbnHCtOGF976xzP0f7k0HYwaZx3Pi5729+UL1iRziZsZbOIigrzHzxj
         TE8La+DxQ1PoUTkQxvPG38FHx+NP2C5EJ6yAZ3l13CasR4auPyw7KC8VV3UwbW2lJp
         qrMaiN+3XQoeQ==
X-Nifty-SrcIP: [209.85.217.44]
Received: by mail-vs1-f44.google.com with SMTP id s10so2507357vsi.9;
        Tue, 07 Apr 2020 09:03:30 -0700 (PDT)
X-Gm-Message-State: AGi0PuYav1JspkgY3FaVtAbcoJieQT8N6gSe4oRdkT3VJJ3lNyFxMjKR
        g+Z3gcVjx7pdfSgZmeW6gZSA0aLxFTOrN+iId8M=
X-Google-Smtp-Source: APiQypJdib1woalCQ47LsPcjFIUt+uD0oJywtqnU3blPMN/3x09w4VC5A1Jftlia+RledGNP4o+h/SP9BtoezdZD7j8=
X-Received: by 2002:a67:6542:: with SMTP id z63mr2511247vsb.179.1586275409554;
 Tue, 07 Apr 2020 09:03:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200405163052.18942-1-masahiroy@kernel.org> <20200406110333.GA6266@alpha.franken.de>
In-Reply-To: <20200406110333.GA6266@alpha.franken.de>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 8 Apr 2020 01:02:53 +0900
X-Gmail-Original-Message-ID: <CAK7LNARGO5ciqaseZ7z1k+e-dVh9rU+HY3-1H0XYMwq6+5PqaQ@mail.gmail.com>
Message-ID: <CAK7LNARGO5ciqaseZ7z1k+e-dVh9rU+HY3-1H0XYMwq6+5PqaQ@mail.gmail.com>
Subject: Re: [PATCH] MIPS: fw: arc: add __weak to prom_meminit and prom_free_prom_memory
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux-MIPS <linux-mips@linux-mips.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Paul Burton <paulburton@kernel.org>, linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Apr 6, 2020 at 8:36 PM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Mon, Apr 06, 2020 at 01:30:52AM +0900, Masahiro Yamada wrote:
> > As far as I understood, prom_meminit() in arch/mips/fw/arc/memory.c
> > is overridden by the one in arch/mips/sgi-ip32/ip32-memory.c if
> > CONFIG_SGI_IP32 is enabled.
> >
> > The use of EXPORT_SYMBOL in static libraries potentially causes a
> > problem for the llvm linker [1]. So, I want to forcibly link lib-y
> > objects to vmlinux when CONFIG_MODULES=y.
> >
> > As a groundwork, we must fix multiple definitions that have previously
> > been hidden by lib-y.
> >
> > The prom_cleanup() in this file is already marked as __weak (because
> > it is overridden by the one in arch/mips/sgi-ip22/ip22-mc.c).
> > I think it should be OK to do the same for these two.
> >
> > [1]: https://github.com/ClangBuiltLinux/linux/issues/515
> >
> > Reported-by: kbuild test robot <lkp@intel.com>
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> > If MIPS maintainers ack this patch,
> > I want to inser it before the following patch:
>
>
> Acked-By: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
>
> Thomas.


Applied to linux-kbuild with Thomas' Ack.

Thanks.


>
> --
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20200406110333.GA6266%40alpha.franken.de.



-- 
Best Regards
Masahiro Yamada
