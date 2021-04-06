Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6873E354AA2
	for <lists+linux-mips@lfdr.de>; Tue,  6 Apr 2021 03:54:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238146AbhDFByp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 5 Apr 2021 21:54:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241966AbhDFByo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 5 Apr 2021 21:54:44 -0400
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA9D4C06174A;
        Mon,  5 Apr 2021 18:54:37 -0700 (PDT)
Received: by mail-io1-xd29.google.com with SMTP id v26so13868006iox.11;
        Mon, 05 Apr 2021 18:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t25T+rgagAfz6leDub/fM3zqPijNsuQRhQY7XhO5GHM=;
        b=YZEZ3Bc7eKUg4mmZ5JEbZSOAjOj3QE9vpUq89jQ7azK2nwKyOBk/pjnPCVV6qUBuZ2
         DqjIEsInQsaFFxRo3M/LDt/Aynvu9S2XY9a8tbKrS+/7EwdP0MJ3Mrrhx6ll7irF3sQS
         0tDfZhIBMr48jNTwk8Lf8Gr2y2/Q+RgQUS8mYNmaTZHVK8dcNgniTzJW32qe/oI+SqNB
         Yjg3LVhiShSwyu7W7UaVBwDyBXhSp6n5D9ffLd5p1FzVQoYDndS+o+lvX+S8vgfWbKsH
         WZP9Pdu0gy2YfgS5qu4NMGVUINrkbr+lHXCFfeahXu2qSGyJvLfuLn7p6CazcF+nwwvw
         MM7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t25T+rgagAfz6leDub/fM3zqPijNsuQRhQY7XhO5GHM=;
        b=Q2hFE57auX1FtzZslNQvwobHcq8WWFSGaP/uTyLG73hlvMQORNpZOAoj/UZJJcXmne
         0gnex5Xp3QlNYJSu63nusSZ7qrwd0gH47BBCd72P+PdL37RAyxizTuOUVwDYGCTjjyRY
         snXfiyVbjPNtuKgcDV/x3rtCZYciegIR4aLJeSlSHyee9smSZ0w4XuZHUm9k+ZIMQNYc
         ySwW0+EwR7byz1hAPu1bHhw3wRro+/sEZ+6LBpn/eD1/fVMPw6erGeqaL+QNrpHVjZU3
         /UB0TpSAfgM3OjxuFuUlrVs92pK5xMdvrc0EXRmGlv0zHAVjIHNHnnAFWcxSgYx4azSY
         LZJA==
X-Gm-Message-State: AOAM533gnN9JkF2RyiQc1RzcG9fsEH68/ev/byXlpPwqqy/tKp91JtD2
        gJCl6ltRKgjyq9pRwBfcsF6ow9MSeZLy/wDkWsjkB7w8PWNXLvzt
X-Google-Smtp-Source: ABdhPJyJKgupfl3ZMjH1LGft7cf+n34Wul1+AxXlhp7/ETzPXnDZhAigojxLvpHvy3whc2CdCEVURHjSXyMi7C48VCs=
X-Received: by 2002:a6b:fc05:: with SMTP id r5mr22109705ioh.103.1617674077135;
 Mon, 05 Apr 2021 18:54:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210403061912.1012509-1-ilya.lipnitskiy@gmail.com> <alpine.DEB.2.21.2104060311490.65251@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2104060311490.65251@angie.orcam.me.uk>
From:   Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Date:   Mon, 5 Apr 2021 18:54:26 -0700
Message-ID: <CALCv0x0SwiOAWXk36vuFkspNSM16nS=wdMhm5ZNyOdFUia5zuw@mail.gmail.com>
Subject: Re: [PATCH] MIPS: add support for buggy MT7621S core detection
To:     "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Wei Li <liwei391@huawei.com>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        linux-mips@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Apr 5, 2021 at 6:22 PM Maciej W. Rozycki <macro@orcam.me.uk> wrote:
>
> On Fri, 2 Apr 2021, Ilya Lipnitskiy wrote:
>
> > diff --git a/arch/mips/include/asm/bugs.h b/arch/mips/include/asm/bugs.h
> > index d72dc6e1cf3c..d32f0c4e61f7 100644
> > --- a/arch/mips/include/asm/bugs.h
> > +++ b/arch/mips/include/asm/bugs.h
> > @@ -50,4 +51,21 @@ static inline int r4k_daddiu_bug(void)
> >       return daddiu_bug != 0;
> >  }
> >
> > +static inline void cm_gcr_pcores_bug(unsigned int *ncores)
> > +{
> > +     struct cpulaunch *launch;
> > +
> > +     if (!IS_ENABLED(CONFIG_SOC_MT7621) || !ncores)
> > +             return;
> > +
> > +     /*
> > +      * Ralink MT7621S SoC is single core, but GCR_CONFIG always reports 2 cores.
>
>  Overlong line.
>
> > diff --git a/arch/mips/kernel/smp-cps.c b/arch/mips/kernel/smp-cps.c
> > index bcd6a944b839..e1e9c11e8a7c 100644
> > --- a/arch/mips/kernel/smp-cps.c
> > +++ b/arch/mips/kernel/smp-cps.c
> > @@ -60,6 +61,7 @@ static void __init cps_smp_setup(void)
> >               pr_cont("{");
> >
> >               ncores = mips_cps_numcores(cl);
> > +             cm_gcr_pcores_bug(&ncores);
> >               for (c = 0; c < ncores; c++) {
> >                       core_vpes = core_vpe_count(cl, c);
> >
> > @@ -170,6 +172,7 @@ static void __init cps_prepare_cpus(unsigned int max_cpus)
> >
> >       /* Allocate core boot configuration structs */
> >       ncores = mips_cps_numcores(0);
> > +     cm_gcr_pcores_bug(&ncores);
>
>  Why called at each `mips_cps_numcores' call site rather than within the
> callee?  Also weird inefficient interface: why isn't `ncores' passed by
> value for a new value to be returned?
Thanks for the comments. Including asm/bugs.h in asm/mips-cps.h led to
some circular dependencies when I tried it, but I will try again based
on your feedback - indeed it would be much cleaner to have this logic
in mips_cps_numcores. The only wrinkle is that mips_cps_numcores may
return a different value on MT7621 after the cores have started due to
CPULAUNCH flags changing, but nobody calls mips_cps_numcores later
anyway, so it's a moot point today. I will clean up the change and
resend.

Ilya
