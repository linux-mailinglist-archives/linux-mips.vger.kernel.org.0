Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59683474C24
	for <lists+linux-mips@lfdr.de>; Tue, 14 Dec 2021 20:38:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234414AbhLNTiY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 14 Dec 2021 14:38:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232183AbhLNTiX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 14 Dec 2021 14:38:23 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AE33C061574
        for <linux-mips@vger.kernel.org>; Tue, 14 Dec 2021 11:38:23 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id u22so29881026lju.7
        for <linux-mips@vger.kernel.org>; Tue, 14 Dec 2021 11:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=gwYi1rI+bxocddJOBVbjpZJA3AmdQnqRzO2lYmmrsgY=;
        b=Div/HhmH4RCtHWkZ1859MpQC3yiLB6TOGrzKMFds+7TNExXlYJFtR2gBv1YXbg3/D4
         4aJkSskJJm6xN9padbU03O8cy3+Q18EwG6FRBF4/zdxit9uWzLL03+lRyp1zy6R0W06g
         EDciv0skjjV2G8NFxRNEMQ3vKFUBPkWPWsHpbqKTOyANfde4s4NEVTJDh9En+nWD6WN4
         KM5TLIlFji/603qwwoHSCNYhSz7NtwJwg/l3kNSgQTnztTkMiRnc3Lz+2JqmcZJdYGx7
         QY+PjYijtP7JJ1fWJxAsgFMOgRZKdFfMQmLpnEdkms52rbp5WFJuqw2CLNA0sGN/CI8D
         WY5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gwYi1rI+bxocddJOBVbjpZJA3AmdQnqRzO2lYmmrsgY=;
        b=4BIUlMHkcH/skATY3A1Oy9fgusLALLM8YRZPsXG4O2E4eMZpcuosKKF9g/n0Sk5sT+
         cKmhoHfNDHhawx+Fpbt7jiHfCLcQYUSHjdJ1Tg6/antB8h8IYbKZLTNo+YE37hVehSKq
         k82PehWXRFRAfDatOQTGRTsLxmjHDjKXXEqeGpAs5XyNpytk1DVujPlAJrSMJgoulG1T
         aKL/aPnXTIJCGM3voZEo78OQLlPenI3z/PmoMpc6rpThHd2UrKL/uZaZaTPE91QPC+um
         lgpAX0w55HBXV3j9bQv7JhSFOPvDyAgJkNpSmqtwWjRpVRsNvpSg4HzoLs+ZtxO4bLVo
         Wszg==
X-Gm-Message-State: AOAM531HoTK4pohJzvb1aub29/mlHolR3rp/UI5t2l5HlhGrnJIao1k8
        adXRztKg7kNR96BqG0EnaNtu3jC++5z7vj2CpD6IbxN4E/0=
X-Google-Smtp-Source: ABdhPJx8om+XMz0h3Ay4OHau2F75Mq0XqEqyMUiAsL9iDos45N8zLgtgM/5e6sfcZWF/kfntoET6gm4rrIMTjQR8+rQ=
X-Received: by 2002:a2e:b6ce:: with SMTP id m14mr6663712ljo.128.1639510701231;
 Tue, 14 Dec 2021 11:38:21 -0800 (PST)
MIME-Version: 1.0
References: <20211213224914.1501303-1-paul@crapouillou.net>
 <20211213224914.1501303-2-paul@crapouillou.net> <YbjdQfrC+EjeJjRV@archlinux-ax161>
 <67D44R.5C6XHAZPCYVU3@crapouillou.net>
In-Reply-To: <67D44R.5C6XHAZPCYVU3@crapouillou.net>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 14 Dec 2021 11:38:10 -0800
Message-ID: <CAKwvOdnC_LyvcVGE3PGZ=B+2EWweXRhsZOXsnBjU0aSXY26Frg@mail.gmail.com>
Subject: Re: [PATCH 1/3] MIPS: boot/compressed: Disable abicalls
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        list@opendingux.net, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Dec 14, 2021 at 11:09 AM Paul Cercueil <paul@crapouillou.net> wrote=
:
>
> Hi Nathan,
>
> Le mar., d=C3=A9c. 14 2021 at 11:06:57 -0700, Nathan Chancellor
> <nathan@kernel.org> a =C3=A9crit :
> > On Mon, Dec 13, 2021 at 10:49:12PM +0000, Paul Cercueil wrote:
> >>  Avoid complaints from Clang/LLVM by building the decompress program
> >> with
> >>  -mno-abicalls.
> >
> > What is the message?
>
> ld.lld: warning: lto.tmp: linking abicalls code with non-abicalls code
> arch/mips/kernel/head.o

That might be good to put in the commit message, as well as a link to
the corresponding issue in our issue tracker.

Though, I'm unfamiliar with that flag; removing it may allow us to
link, but it may cause problems at runtime.  It sounds like clang
supports the flag, so I have a sinking feeling this is a flag that LTO
is dropping by accident, which we've seen in the past.  Please file a
bug in the issue tracker and let's follow up there?

>
> Cheers,
> -Paul
>
> >
> >>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> >>  ---
> >>   arch/mips/boot/compressed/Makefile | 4 ++--
> >>   1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >>  diff --git a/arch/mips/boot/compressed/Makefile
> >> b/arch/mips/boot/compressed/Makefile
> >>  index f27cf31b4140..4c9ecfbb0ef4 100644
> >>  --- a/arch/mips/boot/compressed/Makefile
> >>  +++ b/arch/mips/boot/compressed/Makefile
> >>  @@ -27,10 +27,10 @@ ifdef CONFIG_CPU_LOONGSON64
> >>   KBUILD_CFLAGS :=3D $(filter-out -march=3Dloongson3a, $(KBUILD_CFLAGS=
))
> >> -march=3Dmips64r2
> >>   endif
> >>
> >>  -KBUILD_CFLAGS :=3D $(KBUILD_CFLAGS) -D__KERNEL__ -D__DISABLE_EXPORTS
> >> \
> >>  +KBUILD_CFLAGS :=3D $(KBUILD_CFLAGS) -mno-abicalls -D__KERNEL__
> >> -D__DISABLE_EXPORTS \
> >>      -DBOOT_HEAP_SIZE=3D$(BOOT_HEAP_SIZE)
> >> -D"VMLINUX_LOAD_ADDRESS_ULL=3D$(VMLINUX_LOAD_ADDRESS)ull"
> >>
> >>  -KBUILD_AFLAGS :=3D $(KBUILD_AFLAGS) -D__ASSEMBLY__ \
> >>  +KBUILD_AFLAGS :=3D $(KBUILD_AFLAGS) -mno-abicalls -D__ASSEMBLY__ \
> >>      -DBOOT_HEAP_SIZE=3D$(BOOT_HEAP_SIZE) \
> >>      -DKERNEL_ENTRY=3D$(VMLINUX_ENTRY_ADDRESS)
> >>
> >>  --
> >>  2.33.0
> >>
> >>
>
>


--=20
Thanks,
~Nick Desaulniers
