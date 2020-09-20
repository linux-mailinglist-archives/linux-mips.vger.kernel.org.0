Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52962271672
	for <lists+linux-mips@lfdr.de>; Sun, 20 Sep 2020 19:50:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726037AbgITRu4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 20 Sep 2020 13:50:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725858AbgITRu4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 20 Sep 2020 13:50:56 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A411C061755
        for <linux-mips@vger.kernel.org>; Sun, 20 Sep 2020 10:50:56 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id l17so10619008edq.12
        for <linux-mips@vger.kernel.org>; Sun, 20 Sep 2020 10:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ejz/GOVvBNgiciatH4EjBRwlfy2MnL1tDSObr2BrKeg=;
        b=cBDZkiv4uiqeUChUbmqRPD8tkvllq4angLGjbI6fcWbyt0pYNQ1SGMQdEdmcewXaXT
         IE5S9J/GFuNXr/rpY1dC/0Yf7uyzIPTs0u+8f3gLaQ3BI+ak5trluGhkQvuTa+ZLZ3HS
         UcueGtftJ4Q3p1fqvR6MgwdAfAMUTTFhAr56U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ejz/GOVvBNgiciatH4EjBRwlfy2MnL1tDSObr2BrKeg=;
        b=TCfmp6cMrg+NbxiHUjrLpQv1ESQrKdbEYs80QhZO2C4HUJ03XPM/9TwVZlnyu8nbzp
         5PxMECk+dgXoX15F9yLkN+1vxPdfqXAhaukxg3z9vslessAKBapuabd2kb9fff3qw+P6
         30IBOZN3ZDQC4yMPAQSwdn5E8pFoRSiZqzzzSIlzN5tmBVgRvlu4iPla1fbNOV6c1ycD
         UvpMkydIcKRZdgxj94P197FeePRIdVFC5G+a672KgqkZlkDMfFOb8AjUROi81zcrQM5/
         4QpPhAHlbyw8lZ47PhLipefrUVfr7q8ENotWOClZ1LhjUIXvkf38YL20jgeOBpylxsqq
         PWDQ==
X-Gm-Message-State: AOAM5308zTF4N/KETjjVHiauNTIwnCtnLZOnVtMvM7G8QIOt1DyLrb1O
        IDODKw0cBW9UtippVy7EqbmVJNSSSSyTpA==
X-Google-Smtp-Source: ABdhPJznoxpRFzUfgPAK07lAp6K5lcIiJK9GHjnHFRlt+Y1z8+pZpwDBuCYz30ei1z8nqz6h7RQMEw==
X-Received: by 2002:a50:ab1d:: with SMTP id s29mr50518617edc.246.1600624254462;
        Sun, 20 Sep 2020 10:50:54 -0700 (PDT)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com. [209.85.221.41])
        by smtp.gmail.com with ESMTPSA id k13sm6913317edj.92.2020.09.20.10.50.54
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2020 10:50:54 -0700 (PDT)
Received: by mail-wr1-f41.google.com with SMTP id w5so10421236wrp.8
        for <linux-mips@vger.kernel.org>; Sun, 20 Sep 2020 10:50:54 -0700 (PDT)
X-Received: by 2002:a2e:84d6:: with SMTP id q22mr13708479ljh.70.1600623791519;
 Sun, 20 Sep 2020 10:43:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200919091751.011116649@linutronix.de> <CAHk-=wiYGyrFRbA1cc71D2-nc5U9LM9jUJesXGqpPnB7E4X1YQ@mail.gmail.com>
 <87mu1lc5mp.fsf@nanos.tec.linutronix.de> <87k0wode9a.fsf@nanos.tec.linutronix.de>
 <CAHk-=wgbmwsTOKs23Z=71EBTrULoeaH2U3TNqT2atHEWvkBKdw@mail.gmail.com> <87eemwcpnq.fsf@nanos.tec.linutronix.de>
In-Reply-To: <87eemwcpnq.fsf@nanos.tec.linutronix.de>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 20 Sep 2020 10:42:55 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgF-upZVpqJWK=TK7MS9H-Rp1ZxGfOG+dDW=JThtxAzVQ@mail.gmail.com>
Message-ID: <CAHk-=wgF-upZVpqJWK=TK7MS9H-Rp1ZxGfOG+dDW=JThtxAzVQ@mail.gmail.com>
Subject: Re: [patch RFC 00/15] mm/highmem: Provide a preemptible variant of
 kmap_atomic & friends
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Paul McKenney <paulmck@kernel.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        Will Deacon <will@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux-MM <linux-mm@kvack.org>,
        Russell King <linux@armlinux.org.uk>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        linux-xtensa@linux-xtensa.org,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Vineet Gupta <vgupta@synopsys.com>,
        "open list:SYNOPSYS ARC ARCHITECTURE" 
        <linux-snps-arc@lists.infradead.org>,
        Arnd Bergmann <arnd@arndb.de>, Guo Ren <guoren@kernel.org>,
        linux-csky@vger.kernel.org, Michal Simek <monstr@monstr.eu>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Nick Hu <nickhu@andestech.com>,
        Greentime Hu <green.hu@gmail.com>,
        Vincent Chen <deanbo422@gmail.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        "David S. Miller" <davem@davemloft.net>,
        linux-sparc <sparclinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Sep 20, 2020 at 10:40 AM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> I think the more obvious solution is to split the whole exercise:
>
>   schedule()
>      prepare_switch()
>         unmap()
>
>     switch_to()
>
>     finish_switch()
>         map()

Yeah, that looks much easier to explain. Ack.

               Linus
