Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C38FA9DA90
	for <lists+linux-mips@lfdr.de>; Tue, 27 Aug 2019 02:20:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727778AbfH0AT4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 26 Aug 2019 20:19:56 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:36941 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727563AbfH0ATz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 26 Aug 2019 20:19:55 -0400
Received: by mail-pg1-f194.google.com with SMTP id d1so11579833pgp.4
        for <linux-mips@vger.kernel.org>; Mon, 26 Aug 2019 17:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hEEzzkdeRsczZgOxP6fZZQbk+BsAjtf5i89GMJdNvlE=;
        b=rlLf2ah1lkpxv0U4sCKox8teYypFOsXhPw8Tiz+SNCVDdyx4vxv9LfOgcNYsNS+y83
         Yg8HzPGc8JUgeBKk3Y2PX+C6aGW6qoUtel5U5CIfMXnlcd+S/IBtU0XpZ+qJ/JOjxarD
         j/OE/JjfpvfD8gTDgShCI4D93Zslm+cAAMdMy5AuO8bY0ovqd1N4Eeqw/ZZsB+cV9KZk
         E95+VcgDt12U1PKk6YwfKBE5UyiBXuEZffnmHhZNAIc1BMj+PhulPKqKi9XAS5AhiLce
         gMt9DGZc8pfbPA6NP32hvvW4qr5XdG4+KzQDbnE6bP2somHVDqq+XLFb24EFtCnMTeMn
         gJaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hEEzzkdeRsczZgOxP6fZZQbk+BsAjtf5i89GMJdNvlE=;
        b=eSRfAc9NTbw4Wb0Kb0KsIfGTZjkjAnFZs7BlmuFeCH7SX5IJGPhh1hKevm/hg2Y9lG
         rtRYzClsSng21SaAmeWnhCEVRg22kiDLkkZXNtBqkLR7miul/jzfMlZBugVyXxwV7N7D
         km+f0SAeoIVtnIBwrku50zt9ukmPG7IJ5govY6uBoV8HI2D3bUGu+V1bfeKywwlcwtbq
         KCxRaPAMjtH/VUUVFMyzn0n0WccT9k1gLNOXYgbAQq8aO4owzeb7vOH5eTwz/YnuC5DO
         dJxK/vNrM2UbA5BTjUN9Uqmhy6kxT8Tk5rDaQUgGeKDISlnEDC3FSOVQtFca1uPbtqq0
         jiCw==
X-Gm-Message-State: APjAAAV1dNsTWYmXgB5Fq6Qme/MyStD3+4nXNhNebO6kPACnAG1Cswpq
        0VaZv/oCRr0Lw3cjlmdLjB5AMS6sMFh4y0t3bqQHiw==
X-Google-Smtp-Source: APXvYqxHnCdlzUczP/jzH7EyDlrfTM8SgWVtE5IiAWt81GfWcFP3LsN64bL6ZIOrHbsimWRUCdvbNDymaO/b10v3kbg=
X-Received: by 2002:aa7:8085:: with SMTP id v5mr21870548pff.165.1566865194432;
 Mon, 26 Aug 2019 17:19:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190812215052.71840-1-ndesaulniers@google.com>
 <20190812215052.71840-8-ndesaulniers@google.com> <20190815093848.tremcmaftzspuzzj@pburton-laptop>
In-Reply-To: <20190815093848.tremcmaftzspuzzj@pburton-laptop>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 26 Aug 2019 17:19:43 -0700
Message-ID: <CAKwvOdm4PgZten24afX5yiccYPjperVaW24bDms4ocf6ROdPjg@mail.gmail.com>
Subject: Re: [PATCH 08/16] mips: prefer __section from compiler_attributes.h
To:     Paul Burton <paul.burton@mips.com>
Cc:     "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
        "sedat.dilek@gmail.com" <sedat.dilek@gmail.com>,
        "jpoimboe@redhat.com" <jpoimboe@redhat.com>,
        "yhs@fb.com" <yhs@fb.com>,
        "miguel.ojeda.sandonis@gmail.com" <miguel.ojeda.sandonis@gmail.com>,
        "clang-built-linux@googlegroups.com" 
        <clang-built-linux@googlegroups.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Martin KaFai Lau <kafai@fb.com>,
        Song Liu <songliubraving@fb.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "bpf@vger.kernel.org" <bpf@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Aug 15, 2019 at 2:38 AM Paul Burton <paul.burton@mips.com> wrote:
>
> Hi Nick,
>
> On Mon, Aug 12, 2019 at 02:50:41PM -0700, Nick Desaulniers wrote:
> > Reported-by: Sedat Dilek <sedat.dilek@gmail.com>
> > Suggested-by: Josh Poimboeuf <jpoimboe@redhat.com>
> > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
>
> It would be good to add a commit message, even if it's just a line
> repeating the subject & preferably describing the motivation.
>
> > ---
> >  arch/mips/include/asm/cache.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/mips/include/asm/cache.h b/arch/mips/include/asm/cache.h
> > index 8b14c2706aa5..af2d943580ee 100644
> > --- a/arch/mips/include/asm/cache.h
> > +++ b/arch/mips/include/asm/cache.h
> > @@ -14,6 +14,6 @@
> >  #define L1_CACHE_SHIFT               CONFIG_MIPS_L1_CACHE_SHIFT
> >  #define L1_CACHE_BYTES               (1 << L1_CACHE_SHIFT)
> >
> > -#define __read_mostly __attribute__((__section__(".data..read_mostly")))
> > +#define __read_mostly __section(.data..read_mostly)
> >
> >  #endif /* _ASM_CACHE_H */
> > --
> > 2.23.0.rc1.153.gdeed80330f-goog
>
> I'm not copied on the rest of the series so I'm not sure what your
> expectations are about where this should be applied. Let me know if
> you'd prefer this to go through mips-next, otherwise:
>
>     Acked-by: Paul Burton <paul.burton@mips.com>

Thanks Paul, going to send this up via Miguel's tree, if you don't
mind.  Updating my series now.  (Will probably avoid running
get_maintainer.pl on every patch...too hard to cc everyone on the
whole series).
-- 
Thanks,
~Nick Desaulniers
