Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A36C025137C
	for <lists+linux-mips@lfdr.de>; Tue, 25 Aug 2020 09:41:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729415AbgHYHlI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 25 Aug 2020 03:41:08 -0400
Received: from mail-il1-f196.google.com ([209.85.166.196]:37475 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726024AbgHYHlH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 25 Aug 2020 03:41:07 -0400
Received: by mail-il1-f196.google.com with SMTP id v2so9615019ilq.4
        for <linux-mips@vger.kernel.org>; Tue, 25 Aug 2020 00:41:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TZDQREi5+gg7j4RwpG2xImOPIgVbdXcd66FLjr7EZk0=;
        b=hB360sItVJPXARUcF05Yiv/Y5BlxUKlxka1Uhbv7fQjQmB0oIoW7d8bhXlazZk/t9E
         Yn0RUoSZtox9sF4fe5LHbPMP8NacC5T4Ccx2L699mCYzuDphT0Rj/31beV6ZZvgIxiyb
         jm6AsQaFhRPvVd4+BME42Z+NyK3u8VU21HcOgvZB2a6WlgDh4b/qMdfl42cKCuqpa5tg
         O/JVJktJTdW/uszGNNPfR1S0ylWKsbACWHinDc2u23yMwnQ5BQwbPc02yxY1o0/4dyq3
         6nipDEpOyQ5HiFXw9ZP6q8S3DaSLjU5FTFRJqmXeeergDfGkCXX5cakZEgmkAQnjsu92
         67Xg==
X-Gm-Message-State: AOAM533PGSDF1JugTEe5zvafVA9SWEzERJ3yD1yjIYTClp/1QUwsRdJG
        fpU9/UV50ynpUXvFIDP7EGXJtROD9csk/glBj75OL7qJNFkDTsdW
X-Google-Smtp-Source: ABdhPJzzTzYqJrn5/v5Jpi9EoCEGkIZiczAUWj0lyqbnGhAwQcYXEeTwHsCSnHAEQNLjofZelJ5YFxlhcNWHA8OtjzI=
X-Received: by 2002:a05:6e02:cb0:: with SMTP id 16mr7900197ilg.147.1598341266577;
 Tue, 25 Aug 2020 00:41:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200821072329.18006-1-huangpei@loongson.cn> <CAAhV-H5Yu5V=NHosssCjT6B3a0+TdQNCJZ_1dxruNDwAftrsyA@mail.gmail.com>
In-Reply-To: <CAAhV-H5Yu5V=NHosssCjT6B3a0+TdQNCJZ_1dxruNDwAftrsyA@mail.gmail.com>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Tue, 25 Aug 2020 15:40:55 +0800
Message-ID: <CAAhV-H5w4Ks3F-URJuQATPEi66cfgr9USat-B3rw5nwTfauMMg@mail.gmail.com>
Subject: Re: [PATCH 1/3] MIPS: add missing MSACSR and upper MSA initialization
To:     Huang Pei <huangpei@loongson.cn>,
        Paul Burton <paulburton@kernel.org>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Ambrose <ambrosehua@gmail.com>,
        Li Xuefeng <lixuefeng@loongson.cn>,
        Yang Tiezhu <yangtiezhu@loongson.cn>,
        Gao Juxin <gaojuxin@loongson.cn>,
        Fuxin Zhang <zhangfx@lemote.com>,
        "open list:MIPS" <linux-mips@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Paul Burton,

On Mon, Aug 24, 2020 at 3:19 PM Huacai Chen <chenhc@lemote.com> wrote:
>
> Hi, Pei,
>
> On Fri, Aug 21, 2020 at 3:26 PM Huang Pei <huangpei@loongson.cn> wrote:
> >
> > own_fp_inatomic() does not restore/initialize MSACSR and upper MSA regs, so
> > MSACSR and MSA upper regs's value from previous task on current cpu can leak
> > into current task and cause unpredictable behavior when MSA context not
> > initialized.
> >
> > Signed-off-by: Huang Pei <huangpei@loongson.cn>
> > ---
> >  arch/mips/kernel/traps.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
> > index 38aa07ccdbcc..99a8f1b7b522 100644
> > --- a/arch/mips/kernel/traps.c
> > +++ b/arch/mips/kernel/traps.c
> > @@ -1287,6 +1287,8 @@ static int enable_restore_fp_context(int msa)
> >                 err = own_fpu_inatomic(1);
> >                 if (msa && !err) {
> >                         enable_msa();
> > +                       write_msa_csr(current->thread.fpu.msacsr);
> > +                       init_msa_upper();
> I think write_msa_csr(current->thread.fpu.msacsr) is needed here, but
> I don't know whether init_msa_upper() is also needed. Maybe you should
> investegate cc97ab235f3fe32401ca198cebe6f42642e9 ("MIPS: Simplify FP
> context initialization") which removes init_msa_upper().
I think I need you to explain why removing init_msa_upper() here.

Huacai

>
> Huacai
> >                         set_thread_flag(TIF_USEDMSA);
> >                         set_thread_flag(TIF_MSA_CTX_LIVE);
> >                 }
> > --
> > 2.17.1
> >
