Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 440544F159
	for <lists+linux-mips@lfdr.de>; Sat, 22 Jun 2019 01:55:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726206AbfFUXz0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 21 Jun 2019 19:55:26 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:35890 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726045AbfFUXz0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 21 Jun 2019 19:55:26 -0400
Received: by mail-pg1-f193.google.com with SMTP id f21so4102596pgi.3;
        Fri, 21 Jun 2019 16:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:subject:to:cc:references:in-reply-to:mime-version
         :user-agent:message-id:content-transfer-encoding;
        bh=x9bZV3T0S6eNYo6IXHrd+kECvmTbbAucaYzxDYrbdeI=;
        b=ZpPFzcp36+Hh5jye0ZKjtgJ550NYI096FfX2rcFyQ99LOi8SMis6xF/dheI3yxj7vn
         TBGcbHMLdJQh068I90oszy1lxCnmI5g4KVT7DQMh+oL+mOljJTN2ljZWYTmOt23yVg2h
         LdyqXTNKqxAmKaI+JKi19peuQtNFJ/A6jfkfKGStmgPKTkapA12DT/MDePfRHMwpeCd2
         tgrx+S6ckAPgkEN6TA/783NZNMh/U4UZX0873+4sMF+NwUUbApR86gBQBtLXNIwieoaL
         GIkk0MteisbTCO2dsnPaZ8Qv7rsQ8XF4reLwhY4yUxl1spYYF0SWL0LStYP/hWINYrnP
         HtFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
         :mime-version:user-agent:message-id:content-transfer-encoding;
        bh=x9bZV3T0S6eNYo6IXHrd+kECvmTbbAucaYzxDYrbdeI=;
        b=GGNoFY7IxmNq7LxYvUPVz0h2o4fpA+vbxa7Nj05rw1/Pn6zib9rJdu2FsnenFXDHgb
         BFnh/oNW0lMkL2ROFBxYynlVkFS96Zvj8YoizUWm4sJwQIyBh8IKkTdaSSJrSvfH+Ob/
         NwhMJfCGpiflg06z4gCpXJKK7HWXVei0BJE9GVtrQphnXWO+vliensRk+pCANegDv6c1
         5TRna33KE10BgrrHBVxw3anYDQjd9VoCJ6DWpj3CVHXcLZ5isULeuGTjiuvsMjkJSHf3
         /MGEhvRTbuxXZK4FNNB5RWQcU58wpZc+9taJlo6U2eR9kuiYZqv0NcWX9PEFAML9Et3o
         DCUA==
X-Gm-Message-State: APjAAAXlD9qYDxECqZ+vzdNqlJD2477W1qJqG3LGubbrsbcngxR8bHDP
        nRPHfQJgxIhPvhDUbJunwWE=
X-Google-Smtp-Source: APXvYqyqRRpjMOtRudskKnzHE+bVq170qVap7+EY5kc6j/qI6uUR3V4Zstw2KCShBoXYwoTuoCwbAg==
X-Received: by 2002:a63:545c:: with SMTP id e28mr4210785pgm.374.1561161325219;
        Fri, 21 Jun 2019 16:55:25 -0700 (PDT)
Received: from localhost ([1.144.144.251])
        by smtp.gmail.com with ESMTPSA id 85sm4623425pfv.130.2019.06.21.16.55.23
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 21 Jun 2019 16:55:24 -0700 (PDT)
Date:   Sat, 22 Jun 2019 09:55:09 +1000
From:   Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 16/16] mm: pass get_user_pages_fast iterator arguments in
 a structure
To:     Christoph Hellwig <hch@lst.de>,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andrey Konovalov <andreyknvl@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        James Hogan <jhogan@kernel.org>,
        Khalid Aziz <khalid.aziz@oracle.com>,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
        linux-mips@vger.kernel.org, Linux-MM <linux-mm@kvack.org>,
        linuxppc-dev@lists.ozlabs.org,
        Linux-sh list <linux-sh@vger.kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Burton <paul.burton@mips.com>,
        Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
        the arch/x86 maintainers <x86@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>
References: <20190611144102.8848-1-hch@lst.de>
        <20190611144102.8848-17-hch@lst.de>
        <1560300464.nijubslu3h.astroid@bobo.none>
        <CAHk-=wjSo+TzkvYnAqrp=eFgzzc058DhSMTPr4-2quZTbGLfnw@mail.gmail.com>
        <1561032202.0qfct43s2c.astroid@bobo.none>
        <CAHk-=wh46y3x5O0HkR=R4ETh6e5pDCrEsJ94CtC0fyQiYYAf6A@mail.gmail.com>
        <20190621081501.GA17718@lst.de>
In-Reply-To: <20190621081501.GA17718@lst.de>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1561160786.mradw6fg2v.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Christoph Hellwig's on June 21, 2019 6:15 pm:
> On Thu, Jun 20, 2019 at 10:21:46AM -0700, Linus Torvalds wrote:
>> Hmm. Honestly, I've never seen anything like that in any kernel profiles=
.
>>=20
>> Compared to the problems I _do_ see (which is usually the obvious
>> cache misses, and locking), it must either be in the noise or it's
>> some problem specific to whatever CPU you are doing performance work
>> on?
>>=20
>> I've occasionally seen pipeline hiccups in profiles, but it's usually
>> been either some serious glass jaw of the core, or it's been something
>> really stupid we did (or occasionally that the compiler did: one in
>> particular I remember was how there was a time when gcc would narrow
>> stores when it could, so if you set a bit in a word, it would do it
>> with a byte store, and then when you read the whole word afterwards
>> you'd get a major pipeline stall and it happened to show up in some
>> really hot paths).
>=20
> I've not seen any difference in the GUP bench output here ar all.
>=20
> But I'm fine with skipping this patch for now, I have a potential
> series I'm looking into that would benefit a lot from it, but we
> can discusss it in that context and make sure all the other works gets in
> in time.
>=20

If you can, that would be good. I don't like to object based on
handwaving so I'll see if I can find any benchmarks that will give
better confidence. Those old TPC-C tests were good, and there was
some DB2 workload that was the reason I added gup fast in the first
place. I'll do some digging.

Thanks,
Nick
=
