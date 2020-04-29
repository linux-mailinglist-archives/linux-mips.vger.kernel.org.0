Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DD3E1BD46F
	for <lists+linux-mips@lfdr.de>; Wed, 29 Apr 2020 08:11:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726274AbgD2GLp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 Apr 2020 02:11:45 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:41704 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726181AbgD2GLp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 29 Apr 2020 02:11:45 -0400
Received: by mail-io1-f65.google.com with SMTP id b12so936845ion.8
        for <linux-mips@vger.kernel.org>; Tue, 28 Apr 2020 23:11:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wMJCVxMerwevHjh/fTxCiQ4ZPPEZOGRWXhtdBXCPrsA=;
        b=T94GyOzJhza2PzerKDVeEt8KY8BS6UaOpW4WajXrDPI2BPSSo+6OVyXka5/GUslWxW
         x7EMF3zisjR3SiRMM/D1igDphYEohTKDnnk+gBkk5vpXXbl33WQThIbDKnhIVjMQEZat
         mTyr0tvWpGdrSuWVq5l1GYdXsTmf5ircdtBMnrcjZuxpFuVTMkocbewW8ayj9O0uqTVz
         FzYNeNG8sp5lmq5feQlJ/Vda9MOoExjdnaZ4pclbTkzmY+KktVnrA1nwxD5RDIq7u6fh
         JAsDKT+zpDAAsPNGG6z2jBzh75m6EeSOCoKamhJvbNn7j8kuruESXjokvFQIAI/WJJem
         vYJw==
X-Gm-Message-State: AGi0PuaJznBTop4hR4FS18p5hqllGPYMemkYrfFbocz56gB7ZYLaETkf
        FCkEdgi9vfboNtx6NVO5+yIf+6kvhlO8/r/6pt8=
X-Google-Smtp-Source: APiQypLS8HgT3lC4mTHZw56vPWLq7jJYeEREhE5lLKfoRWKOPDekezcTYGyeJUhOPj5pjQA593VQzyMrfSVg0TH/XOU=
X-Received: by 2002:a02:966a:: with SMTP id c97mr29140740jai.106.1588140704617;
 Tue, 28 Apr 2020 23:11:44 -0700 (PDT)
MIME-Version: 1.0
References: <1587978040-29624-1-git-send-email-chenhc@lemote.com> <20200428112033.GB11443@alpha.franken.de>
In-Reply-To: <20200428112033.GB11443@alpha.franken.de>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Wed, 29 Apr 2020 14:19:14 +0800
Message-ID: <CAAhV-H649g_S+jFoK3U9ajD=3_3tAEkLhSdL5ou6KS=owRerMg@mail.gmail.com>
Subject: Re: [PATCH] MIPS: perf: Add hardware perf events support for new Loongson-3
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Thomas,

Thanks for your suggestion, I'll send V2.

On Tue, Apr 28, 2020 at 7:34 PM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Mon, Apr 27, 2020 at 05:00:40PM +0800, Huacai Chen wrote:
> > diff --git a/arch/mips/kernel/perf_event_mipsxx.c b/arch/mips/kernel/perf_event_mipsxx.c
> > index 128fc99..c96eb03 100644
> > --- a/arch/mips/kernel/perf_event_mipsxx.c
> > +++ b/arch/mips/kernel/perf_event_mipsxx.c
> > @@ -90,6 +90,7 @@ struct mips_pmu {
> > -     unsigned long cntr_mask = (hwc->event_base >> 8) & 0xffff;
> > +     if (get_loongson3_pmu_type() != LOONGSON_PMU_TYPE2)
> > +             cntr_mask = (hwc->event_base >> 8) & 0xffff;
> > +     else
> > +             cntr_mask = (hwc->event_base >> 10) & 0xffff;
>
> please invert the logic and do
>
>          if (get_loongson3_pmu_type() == LOONGSON_PMU_TYPE2)
>                 cntr_mask = (hwc->event_base >> 10) & 0xffff;
>         else
>                 cntr_mask = (hwc->event_base >> 8) & 0xffff;
>
> > +     if (get_loongson3_pmu_type() != LOONGSON_PMU_TYPE2)
> > +             cpuc->saved_ctrl[idx] = M_PERFCTL_EVENT(evt->event_base & 0xff) |
> > +                     (evt->config_base & M_PERFCTL_CONFIG_MASK) |
> > +                     /* Make sure interrupt enabled. */
> > +                     MIPS_PERFCTRL_IE;
> > +     else
> > +             cpuc->saved_ctrl[idx] = M_PERFCTL_EVENT(evt->event_base & 0x3ff) |
> > +                     (evt->config_base & M_PERFCTL_CONFIG_MASK) |
> > +                     /* Make sure interrupt enabled. */
> > +                     MIPS_PERFCTRL_IE;
>
> same here
>
> >       else
> >  #endif /* CONFIG_MIPS_MT_SMP */
> > -             return ((pev->cntr_mask & 0xffff00) |
> > -                     (pev->event_id & 0xff));
> > +     if (get_loongson3_pmu_type() != LOONGSON_PMU_TYPE2)
> > +             return (pev->cntr_mask & 0xffff00) |
> > +                     (pev->event_id & 0xff);
> > +     else
> > +             return (pev->cntr_mask & 0xfffc00) |
> > +                     (pev->event_id & 0x3ff);
>
> and here.
>
> Thomas.
>
> --
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]
