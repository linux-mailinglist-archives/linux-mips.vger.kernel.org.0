Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A10DA4B2F5C
	for <lists+linux-mips@lfdr.de>; Fri, 11 Feb 2022 22:29:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353644AbiBKV3m (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 11 Feb 2022 16:29:42 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:48856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229945AbiBKV3m (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 11 Feb 2022 16:29:42 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AE53C57
        for <linux-mips@vger.kernel.org>; Fri, 11 Feb 2022 13:29:40 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id p24so25478571ejo.1
        for <linux-mips@vger.kernel.org>; Fri, 11 Feb 2022 13:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XFzCG6U+gQcN35bNR5ygZp7My/pmsXpJOFlN4wA8faE=;
        b=Op5mHfi4lkpgsAXFUIEvOb892Ki9UfRvx6Wny8c8GnjgwctkidFgQ18OXWJf376jCc
         BL/WKzyG/HlMvQ5Fg9rMrnYrcCvA8WOcTMUhjWAiGuoPntTEWvfcefuEHsgqJwwQX7cW
         NOiWSj++f2uRrGtaz3ZiLzt4iZqukzsD9VZjY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XFzCG6U+gQcN35bNR5ygZp7My/pmsXpJOFlN4wA8faE=;
        b=H/2nx+YDvgmNe89cZY7tAI2AnBfIkUp3sQcEpLYM+4zlehwVJ38ZTjP3cl/pYANqnb
         0cfqm2sm6BH5c1FOxuIMRomCSkZIkN6BynYMSUWk0kF/SsuhcAJBBPICQfmajPKk6mRn
         kKg6xlGiWLgZLllD+6PfZE6F311YUeJBB7qhlFPHcWDAEv9cfH7XM9RXi8uU1GkbC6jE
         7b6UcLXvi/i9t5rFkCkSgOlp7e8ihNTs611T5O4jGqk+g4P1v/Nit18b9CzGMtjt3mfl
         ahXpXibqdKMwa0e24LPlySanNG5jrAaYn48JxS2kar08dqmuw1uiACPeaqrIQMxz5wXg
         CR0g==
X-Gm-Message-State: AOAM5334E7PCqkgF2bpiqo9HLQ5NeuPtZ+0RtftV6RItWix1hkWi502n
        Nn4TUL62zymp5FaMQJxPrlOrH9y3nLXxMxlSJGg=
X-Google-Smtp-Source: ABdhPJxu327k1V8xAufzItkG0UnonwM2ZBqFkVYcfiThWWJWQqt4TOfRjZwj3vJ5Ua91IKaBPwcWJQ==
X-Received: by 2002:a17:907:6284:: with SMTP id nd4mr2813125ejc.477.1644614978658;
        Fri, 11 Feb 2022 13:29:38 -0800 (PST)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com. [209.85.221.48])
        by smtp.gmail.com with ESMTPSA id kw5sm8433206ejc.140.2022.02.11.13.29.37
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Feb 2022 13:29:37 -0800 (PST)
Received: by mail-wr1-f48.google.com with SMTP id i14so17230298wrc.10
        for <linux-mips@vger.kernel.org>; Fri, 11 Feb 2022 13:29:37 -0800 (PST)
X-Received: by 2002:a05:6000:1885:: with SMTP id a5mr2667962wri.193.1644614977325;
 Fri, 11 Feb 2022 13:29:37 -0800 (PST)
MIME-Version: 1.0
References: <20220211210757.612595-1-Jason@zx2c4.com>
In-Reply-To: <20220211210757.612595-1-Jason@zx2c4.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 11 Feb 2022 13:29:21 -0800
X-Gmail-Original-Message-ID: <CAHk-=wh+2jokbr4tpHA=ExebWKr=qp9RJ_uFrG2gYG4ChAjitg@mail.gmail.com>
Message-ID: <CAHk-=wh+2jokbr4tpHA=ExebWKr=qp9RJ_uFrG2gYG4ChAjitg@mail.gmail.com>
Subject: Re: [PATCH RFC v0] random: block in /dev/urandom
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        Eric Biggers <ebiggers@google.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Andy Lutomirski <luto@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Lennart Poettering <mzxreary@0pointer.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Theodore Ts'o" <tytso@mit.edu>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Feb 11, 2022 at 1:08 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Maybe. And this is why this is a request for grumbles patch: the Linus
> Jitter Dance relies on random_get_entropy() returning a cycle counter
> value.

Yeah.

I think this patch is fine for architectures that do have that cycle
counter value.

Considering that the jitter thing has been there for 2.5 years by now,
and nobody has really complained about it (*), I think we can call
that thing a success. And on those architectures where
try_to_generate_entropy() works, removing the code that then does that
GRND_INSECURE makes sense. We just don't have any such case any more.

BUT.

When try_to_generate_entropy() doesn't work, I think you now removed
the possible fallback for user space to say "yeah, just give me best
effort". And you might re-introduce a deadlock as a result.

Those systems are arguably broken from a randomness standpoint - what
the h*ll are you supposed to do if there's nothing generating entropy
- but broken or not, I suspect they still exists. Those horrendous
MIPS things were quite common in embedded networking (routers, access
points - places that *should* care)

Do I have a constructive suggestion for those broken platforms? No, I
don't. That arguably is the reason for GRND_INSECURE existing, and the
reason to keep it around.

Long story short: I like your patch, but I worry that it would cause
problems on broken platforms.

And almost nobody tests those broken platforms: even people who build
new kernels for those embedded networking things probably end up using
said kernels with an existing user space setup - where people have
some existing saved source of pseudo-entropy. So they might not ever
even trigger the "first boot problem" that tends to be the worst case.

I'd be willing to apply such a thing anyway - at some point "worry
about broken platforms" ends up being too weak an excuse not to just
apply it - but I'd like to hear more of a reason for this
simplification. If it's just "slight cleanup", maybe we should just
keep the stupid stuff around as a "doesn't hurt good platforms, might
help broken ones".

               Linus

(*) Honestly, I think all the complaints would have been from the
theoretical posers that don't have any practical suggestions anyway
