Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3E9A271696
	for <lists+linux-mips@lfdr.de>; Sun, 20 Sep 2020 20:05:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726135AbgITSFe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 20 Sep 2020 14:05:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726043AbgITSFe (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 20 Sep 2020 14:05:34 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EC82C061755
        for <linux-mips@vger.kernel.org>; Sun, 20 Sep 2020 11:05:34 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id o8so14654752ejb.10
        for <linux-mips@vger.kernel.org>; Sun, 20 Sep 2020 11:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=10vFh59zX+qrXR+btNd9keaZllR85H50W0pZVqW9mvg=;
        b=aTcZkpnkgiAVVoqRXBCAnYw8B8YS7QD0nmh7mtbe8Dtb85AdAYIiPcbXVjdrb/fbX9
         3yTs920flMKnlnbAGz7q1CYoJs0994Dvfor1DakKOqSDUOemiqgeakXoqfK/+swxI5fB
         0DUfGVYXrHTR7XO61iz2Eybc+W0Ekg5v+dkh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=10vFh59zX+qrXR+btNd9keaZllR85H50W0pZVqW9mvg=;
        b=qm7tzPl0RSel4lGT2fQtShz/rellqi3gBf2ZDip2GXjPdwvaJPYuWjhh3CLwEYRf7g
         KIv/j5s+mKCQFX6B/ysFD+iU8l4NGNOZeB4wpQNAZj5Gd03a6d+c1bVOBROAs/JvCr/L
         zjM9ttyWqX2WvIUHNtruHUMKv2wii7FmXYHNc6mii4rhiLRWjwIcdZnibFLi6Smxel6v
         CMW0QwHtHavqIW5DRy9RNeHtC1uWmir917Hc/x+0VC/AzHh3rs+CRwsM+mrr1qvdbizX
         JG7WOFgvyk0akZdG6WQLqNDDaLc8Y70BebLayB4RhSiE9jPNoQmM1uKLTqj64afr1Rr5
         Zi9g==
X-Gm-Message-State: AOAM531xJsx9MINTXyBaLKNLkFUcIr0arKj0Vxn7SaBxoBSVdFXcs5Nb
        weYc4Qh0Q5PcLeWOnfz2Ga28AEx0eneq9g==
X-Google-Smtp-Source: ABdhPJzc3DOtnv4K5vDFr9slBxBWeUAWV5dh4hBzKAE20nHPcjKmpP52qIeCD4utB2dTjv4pSbmZ+Q==
X-Received: by 2002:a17:906:4e54:: with SMTP id g20mr47863467ejw.252.1600625132419;
        Sun, 20 Sep 2020 11:05:32 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id i17sm6971943ejy.79.2020.09.20.11.05.32
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2020 11:05:32 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id z23so14598904ejr.13
        for <linux-mips@vger.kernel.org>; Sun, 20 Sep 2020 11:05:32 -0700 (PDT)
X-Received: by 2002:ac2:4ec7:: with SMTP id p7mr12591149lfr.352.1600624746105;
 Sun, 20 Sep 2020 10:59:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200919091751.011116649@linutronix.de> <CAHk-=wiYGyrFRbA1cc71D2-nc5U9LM9jUJesXGqpPnB7E4X1YQ@mail.gmail.com>
 <87mu1lc5mp.fsf@nanos.tec.linutronix.de> <87k0wode9a.fsf@nanos.tec.linutronix.de>
 <CAHk-=wgbmwsTOKs23Z=71EBTrULoeaH2U3TNqT2atHEWvkBKdw@mail.gmail.com>
 <87eemwcpnq.fsf@nanos.tec.linutronix.de> <CAHk-=wgF-upZVpqJWK=TK7MS9H-Rp1ZxGfOG+dDW=JThtxAzVQ@mail.gmail.com>
In-Reply-To: <CAHk-=wgF-upZVpqJWK=TK7MS9H-Rp1ZxGfOG+dDW=JThtxAzVQ@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 20 Sep 2020 10:58:50 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh_iVgA3H7CVvAzDoYC1gC1AKbLmv_mCeUnVxg79_9y8A@mail.gmail.com>
Message-ID: <CAHk-=wh_iVgA3H7CVvAzDoYC1gC1AKbLmv_mCeUnVxg79_9y8A@mail.gmail.com>
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

On Sun, Sep 20, 2020 at 10:42 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Yeah, that looks much easier to explain. Ack.

Btw, one thing that might be a good idea at least initially is to add
a check for p->kmap_ctrl.idx being zero at fork, exit and maybe
syscall return time (but that last one may be too cumbersome to really
worry about).

The kmap_atomic() interface basically has a lot of coverage for leaked
as part of all the "might_sleep()" checks sprinkled around,  The new
kmap_temporary/local/whatever wouldn't have that kind of incidental
debug checking, and any leaked kmap indexes would be rather hard to
debug (much) later when they cause index overflows or whatever.

                Linus
