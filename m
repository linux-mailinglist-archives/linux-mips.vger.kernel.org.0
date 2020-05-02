Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FE8C1C2481
	for <lists+linux-mips@lfdr.de>; Sat,  2 May 2020 12:34:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726654AbgEBKec (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 2 May 2020 06:34:32 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:46398 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726574AbgEBKeb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 2 May 2020 06:34:31 -0400
Received: by mail-il1-f194.google.com with SMTP id x2so6654634ilp.13
        for <linux-mips@vger.kernel.org>; Sat, 02 May 2020 03:34:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/z7t4CgoNx+kNMkg0cpmMZOsydNl0J7ylOfW8VQIu50=;
        b=AT1wgZB9zqn4xJ1KKw43QfEO1i5rOzJ3puSnxjBayPSLSTBaLS4wAIcVaNbdW7oF7E
         05xb44KpwmcD6L+DJ+nHSOK6WKYaX2UIKgu+pyTCmNhUBdZLHftLkc3knJLfEIZ5yNOa
         JM7OTjNn3a9yk5AVeadx155dmlioxV2FEOxlaHSfaLmh+1viYn1rN96zGvQLPmm2AAvI
         iTO6PNcMdc35R0qjE+2tTgX8qs3KewFo4RHCoaXXSdqrm3uV0Nqp/oEEBogW42avHo8e
         n1rwJezMBPabw7UxJQp5VAF+SuPhQOZR7+fXx8lOO+gMhDtFtD7+iZe461bNYSHm86Sk
         E+1g==
X-Gm-Message-State: AGi0PuaO6ATtAZZ61PvG6Lk9pq2D/e0RxyJku0czbJMa0EOIlK5rX87V
        zrvmjtNZpLmmw6dpLUI/fvVuq9Ma6Y4JtoqxdjU=
X-Google-Smtp-Source: APiQypLB0jNfOAfF/EBNZT4E2C2cGYLGpYiDQ6UT35+5LKTrhSQ5UlHimOF74Kicsz/14HvRpQu3yZ0dzJpUVNGpbKs=
X-Received: by 2002:a92:dc0d:: with SMTP id t13mr7707180iln.287.1588415670841;
 Sat, 02 May 2020 03:34:30 -0700 (PDT)
MIME-Version: 1.0
References: <1588395326-5351-1-git-send-email-chenhc@lemote.com> <20200502100422.GA3913@alpha.franken.de>
In-Reply-To: <20200502100422.GA3913@alpha.franken.de>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Sat, 2 May 2020 18:42:04 +0800
Message-ID: <CAAhV-H58Lg2V=epdcWJB+TLTzCbwaYLtXY+c3vAQT1i1sde2xQ@mail.gmail.com>
Subject: Re: [PATCH] MIPS: perf: Remove unnecessary "fallthrough" pseudo keywords
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

OK, I will send V2 soon.

On Sat, May 2, 2020 at 6:20 PM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Sat, May 02, 2020 at 12:55:26PM +0800, Huacai Chen wrote:
> > The last branch of switch-case doesn't need a "fallthrough" pseudo
> > keyword, and it will cause errors when building a kernel with -Werror:
> >
> >    arch/mips/kernel/perf_event_mipsxx.c: In function 'reset_counters':
> >    include/linux/compiler_attributes.h:200:41: error: attribute 'fallthrough' not preceding a case label or default label [-Werror]
> >      200 | # define fallthrough                    __attribute__((__fallthrough__))
> >          |                                         ^~~~~~~~~~~~~
> > >> arch/mips/kernel/perf_event_mipsxx.c:932:3: note: in expansion of macro 'fallthrough'
> >      932 |   fallthrough;
> >          |   ^~~~~~~~~~~
> >    arch/mips/kernel/perf_event_mipsxx.c: In function 'loongson3_reset_counters':
> >    include/linux/compiler_attributes.h:200:41: error: attribute 'fallthrough' not preceding a case label or default label [-Werror]
> >      200 | # define fallthrough                    __attribute__((__fallthrough__))
> >          |                                         ^~~~~~~~~~~~~
> >    arch/mips/kernel/perf_event_mipsxx.c:903:3: note: in expansion of macro 'fallthrough'
> >      903 |   fallthrough;
> >          |   ^~~~~~~~~~~
> >    cc1: all warnings being treated as errors
> >
> > Fix it by removing unnecessary "fallthrough" pseudo keywords.
> >
> > Reported-by: kbuild test robot <lkp@intel.com>
> > Signed-off-by: Huacai Chen <chenhc@lemote.com>
> > ---
> >  arch/mips/kernel/perf_event_mipsxx.c | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/arch/mips/kernel/perf_event_mipsxx.c b/arch/mips/kernel/perf_event_mipsxx.c
> > index a14974c..710b2c7 100644
> > --- a/arch/mips/kernel/perf_event_mipsxx.c
> > +++ b/arch/mips/kernel/perf_event_mipsxx.c
> > @@ -900,7 +900,6 @@ static void loongson3_reset_counters(void *arg)
> >               mipspmu.write_counter(0, 0);
> >               mipsxx_pmu_write_control(0, 575<<5);
> >               mipspmu.write_counter(0, 0);
> > -             fallthrough;
> >       }
> >  }
> >
> > @@ -929,7 +928,6 @@ static void reset_counters(void *arg)
> >       case 1:
> >               mipsxx_pmu_write_control(0, 0);
> >               mipspmu.write_counter(0, 0);
> > -             fallthrough;
> >       }
> >  }
>
> please add breaks in both places.
>
> Thomas.
>
> --
> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
> good idea.                                                [ RFC1925, 2.3 ]
