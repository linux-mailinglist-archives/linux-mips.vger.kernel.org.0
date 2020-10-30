Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E81872A0F88
	for <lists+linux-mips@lfdr.de>; Fri, 30 Oct 2020 21:34:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726917AbgJ3Uec (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 30 Oct 2020 16:34:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727389AbgJ3UeM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 30 Oct 2020 16:34:12 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4DFFC0613CF
        for <linux-mips@vger.kernel.org>; Fri, 30 Oct 2020 13:34:10 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id i2so8296095ljg.4
        for <linux-mips@vger.kernel.org>; Fri, 30 Oct 2020 13:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kjos0+S2Gon+fH3b26doFlCP2cxrfT62BjLoezK4rG4=;
        b=J8d/YD59wQ/au5l1BQ7ue2vwfU1yPmEzaWIbs72/a3aDX73KGLSsh/e6e4T2ilr+m6
         v7YctKloyJWKSYk1q7y81pi983c4f8E7/f/kLdP0CFwMkO7uyjtkdfJgwTbIAUd3yTgV
         b5YrSxtLonkg9fnewHN7YslOk1fl6e5oIhge0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kjos0+S2Gon+fH3b26doFlCP2cxrfT62BjLoezK4rG4=;
        b=l5je0i4An8jYG1wqH2NasgT2VWUXFu9k6a7KFJhVY1CxEXiuWTxAExyohOReuf9Bzd
         locISH/XrGigcTKe68nuuveRCqHwhMqdGXqTPPRFANUw+ZerL2OJHNjs68glBXesO3fN
         hWidpdMIi5WqBNIN8Fo5ggZeVeRAbU37p6Qj7UpMvP6ChdqVrwFq4QpAw2tJQ2oXJjQz
         XdA9D7H6LADCz/iX5IlQblmBfRYed1rFyOjBbSAfYr2iTogVTdgzS0Weky5WUYWwo9sA
         TpFYA1zGjuDO6gz9b/hcr0hKLw8jzBLgL1J3der5PSIBww0M3IXXdSyzipv2exKP0i8Z
         S7dg==
X-Gm-Message-State: AOAM533KWkLIXTmD3LaPu/PM7Ar2malj0P8m8xnhku/aJYW4zVZScIdO
        SOAk6PPTcid2Y1JXF6QwTqdJrdmj08iCWA==
X-Google-Smtp-Source: ABdhPJx6tGgV9LEFQpiPVmpRb6KBoMt9qcHhhKzCuIxYVZCoCRkSwIZ3bTsB3PTqN8rQ8Tg4ZVoopQ==
X-Received: by 2002:a2e:91c9:: with SMTP id u9mr1940714ljg.172.1604090049102;
        Fri, 30 Oct 2020 13:34:09 -0700 (PDT)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id a16sm694701lfi.187.2020.10.30.13.34.08
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2020 13:34:08 -0700 (PDT)
Received: by mail-lf1-f49.google.com with SMTP id y184so7541169lfa.12
        for <linux-mips@vger.kernel.org>; Fri, 30 Oct 2020 13:34:08 -0700 (PDT)
X-Received: by 2002:a2e:760a:: with SMTP id r10mr1661953ljc.421.1604089720167;
 Fri, 30 Oct 2020 13:28:40 -0700 (PDT)
MIME-Version: 1.0
References: <20201029221806.189523375@linutronix.de> <CAHk-=wiFxxGapdOyZHE-7LbFPk+jdfoqdeeJg0zWNQ86WvJGXg@mail.gmail.com>
 <87pn50ob0s.fsf@nanos.tec.linutronix.de> <87blgknjcw.fsf@nanos.tec.linutronix.de>
In-Reply-To: <87blgknjcw.fsf@nanos.tec.linutronix.de>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 30 Oct 2020 13:28:24 -0700
X-Gmail-Original-Message-ID: <CAHk-=whsJv0bwWRVZHsLoSe48ykAea6T7Oi=G+r8ckLrZ0YUpg@mail.gmail.com>
Message-ID: <CAHk-=whsJv0bwWRVZHsLoSe48ykAea6T7Oi=G+r8ckLrZ0YUpg@mail.gmail.com>
Subject: Re: [patch V2 00/18] mm/highmem: Preemptible variant of kmap_atomic & friends
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Paul McKenney <paulmck@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Ard Biesheuvel <ardb@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Christoph Hellwig <hch@lst.de>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Ingo Molnar <mingo@kernel.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux-MM <linux-mm@kvack.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Vineet Gupta <vgupta@synopsys.com>,
        "open list:SYNOPSYS ARC ARCHITECTURE" 
        <linux-snps-arc@lists.infradead.org>,
        Russell King <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org,
        Michal Simek <monstr@monstr.eu>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Nick Hu <nickhu@andestech.com>,
        Greentime Hu <green.hu@gmail.com>,
        Vincent Chen <deanbo422@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        "David S. Miller" <davem@davemloft.net>,
        linux-sparc <sparclinux@vger.kernel.org>,
        Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        linux-xtensa@linux-xtensa.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Oct 30, 2020 at 2:39 AM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> But then we really should not name it kmap_local. 'local' suggests
> locality, think local_irq*, local_bh* ... kmap_task would be more
> accurate then.

So the main reason I'd like to see it is because I think on a
non-highmem machine, the new kmap should be a complete no-op. IOW,
we'd make sure that there are no costs, no need to increment any
"restrict migration" counts etc.

It's been a bit of a pain to have kmap_atomic() have magical side
semantics that people might then depend on.

I think "local" could still work as a name, because it would have to
be thread-local (and maybe we'd want a debug mode where that gets
verified, as actual HIGHMEM machines are getting rare).

I'd avoid "task", because that implies (to me, at least) that it
wouldn't be good for interrupts etc that don't have a task context.

I think the main issue is that it has to be released in the same
context as it was created (ie no passing those things around to other
contexts). I think "local" is fine for that, but I could imagine other
names. The ones that come to mind are somewhat cumbersome, though
("shortterm" or "local_ctx" or something along those lines).

I dunno.

              Linus
