Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E7FE2C3B3
	for <lists+linux-mips@lfdr.de>; Tue, 28 May 2019 11:58:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726628AbfE1J6K (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 May 2019 05:58:10 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:34499 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726697AbfE1J6J (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 28 May 2019 05:58:09 -0400
Received: by mail-ot1-f67.google.com with SMTP id l17so17207466otq.1
        for <linux-mips@vger.kernel.org>; Tue, 28 May 2019 02:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brauner.io; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=n8mEOfFlOrFfQ5ADoq5IltTLDgmtoxRa6B+153SpHAE=;
        b=cpeK2sktn7NMSf704YRsePZcwMV5rEfvSYWLdkbE0oo7SEPsGyf2Sg/RoHTcSoQfPd
         wKUtklR660LzAKMlYxgcivpoPmw+LSf5RppXvWNS6o1G0soFTMAvZUcbgBxvK2BECrI0
         Rle3mXgyvD783k6/0SbYAStUQCihPJGyFt818iQ5hLWys0KtqDqC6rX9cnEeWCbwKNG0
         tdk47Ttoh8A9F1CCaGanOIYDEl/ZdHErWc8Wv5KldYhEb6ofWf7dsBtFYzjTibWrsdhA
         MZ+zwyNHz+uR8reJwzBhLz8RLg8uhrkcEzyfZuKsJUXFqTqSWw3bOPqffMHHTUaHwhxW
         1OcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=n8mEOfFlOrFfQ5ADoq5IltTLDgmtoxRa6B+153SpHAE=;
        b=OEWCzyO3HYw4jcZqwP4NbinPyuLVfaiAyhp79Nr/yQCOtXFxPcqNZbl//3C10Cb7ql
         QqldXRbCsKyYir5Ss1tA8HZOo9zJWfyndY/NRaRYPvLNbtjuTuZp5fpCbkrNbIlLqFDe
         ni6QRIqX+Ry//19GYw210jcuGM1laWTnGh6yq+huvl6thV58thlTnrL2z8sSBg+d4NSw
         3T2bKVtrChDPrqt8m4z3xLQJUTD8AHcyahvgFX+t/mMg247vDuzznhfMaVOGPfIoZer+
         aT0/fD0vyiQKRfIBMYHRjAKoEPX24AVetAy/wF778Ggp12o4J/Ln9B82XiOSdfPn0YC6
         lWSg==
X-Gm-Message-State: APjAAAWx8l1V9D9FYk7GVcJeBVp4zkHZvfCDpaO3FZdaStpyZbFETeMq
        VA+4Nmqj6n0cRzbFylnq4gsvvg==
X-Google-Smtp-Source: APXvYqwNLIyMiw7dADjTCxSmg48ETPJlltLpV+f/5L0odOCbBrMF/Z9t2SkD+zCcao739KqAxW23xA==
X-Received: by 2002:a05:6830:214f:: with SMTP id r15mr4126904otd.143.1559037489020;
        Tue, 28 May 2019 02:58:09 -0700 (PDT)
Received: from brauner.io ([172.56.7.242])
        by smtp.gmail.com with ESMTPSA id n187sm2440013oif.25.2019.05.28.02.57.59
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 28 May 2019 02:58:08 -0700 (PDT)
Date:   Tue, 28 May 2019 11:57:56 +0200
From:   Christian Brauner <christian@brauner.io>
To:     Michael Ellerman <mpe@ellerman.id.au>
Cc:     viro@zeniv.linux.org.uk, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-api@vger.kernel.org,
        torvalds@linux-foundation.org, fweimer@redhat.com,
        jannh@google.com, oleg@redhat.com, tglx@linutronix.de,
        arnd@arndb.de, shuah@kernel.org, dhowells@redhat.com,
        tkjos@android.com, ldv@altlinux.org, miklos@szeredi.hu,
        linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-xtensa@linux-xtensa.org, linux-arch@vger.kernel.org,
        linux-kselftest@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v2 2/2] tests: add close_range() tests
Message-ID: <20190528095754.peumcgjysw2nq24y@brauner.io>
References: <20190523154747.15162-1-christian@brauner.io>
 <20190523154747.15162-3-christian@brauner.io>
 <8736kzqpdm.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8736kzqpdm.fsf@concordia.ellerman.id.au>
User-Agent: NeoMutt/20180716
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, May 28, 2019 at 12:33:41PM +1000, Michael Ellerman wrote:
> Christian Brauner <christian@brauner.io> writes:
> > This adds basic tests for the new close_range() syscall.
> > - test that no invalid flags can be passed
> > - test that a range of file descriptors is correctly closed
> > - test that a range of file descriptors is correctly closed if there there
> >   are already closed file descriptors in the range
> > - test that max_fd is correctly capped to the current fdtable maximum
> >
> > Signed-off-by: Christian Brauner <christian@brauner.io>
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Cc: Jann Horn <jannh@google.com>
> > Cc: David Howells <dhowells@redhat.com>
> > Cc: Dmitry V. Levin <ldv@altlinux.org>
> > Cc: Oleg Nesterov <oleg@redhat.com>
> > Cc: Linus Torvalds <torvalds@linux-foundation.org>
> > Cc: Florian Weimer <fweimer@redhat.com>
> > Cc: linux-api@vger.kernel.org
> > ---
> > v1: unchanged
> > v2:
> > - Christian Brauner <christian@brauner.io>:
> >   - verify that close_range() correctly closes a single file descriptor
> > ---
> >  tools/testing/selftests/Makefile              |   1 +
> >  tools/testing/selftests/core/.gitignore       |   1 +
> >  tools/testing/selftests/core/Makefile         |   6 +
> >  .../testing/selftests/core/close_range_test.c | 142 ++++++++++++++++++
> >  4 files changed, 150 insertions(+)
> >  create mode 100644 tools/testing/selftests/core/.gitignore
> >  create mode 100644 tools/testing/selftests/core/Makefile
> >  create mode 100644 tools/testing/selftests/core/close_range_test.c
> >
> > diff --git a/tools/testing/selftests/core/.gitignore b/tools/testing/selftests/core/.gitignore
> > new file mode 100644
> > index 000000000000..6e6712ce5817
> > --- /dev/null
> > +++ b/tools/testing/selftests/core/.gitignore
> > @@ -0,0 +1 @@
> > +close_range_test
> > diff --git a/tools/testing/selftests/core/Makefile b/tools/testing/selftests/core/Makefile
> > new file mode 100644
> > index 000000000000..de3ae68aa345
> > --- /dev/null
> > +++ b/tools/testing/selftests/core/Makefile
> > @@ -0,0 +1,6 @@
> > +CFLAGS += -g -I../../../../usr/include/ -I../../../../include
> 
> Your second -I pulls the unexported kernel headers in, userspace
> programs shouldn't include unexported kernel headers.
> 
> It breaks the build on powerpc with eg:
> 
>   powerpc64le-linux-gnu-gcc -g -I../../../../usr/include/ -I../../../../include    close_range_test.c  -o /output/kselftest/core/close_range_test
>   In file included from /usr/powerpc64le-linux-gnu/include/bits/fcntl-linux.h:346,
>                    from /usr/powerpc64le-linux-gnu/include/bits/fcntl.h:62,
>                    from /usr/powerpc64le-linux-gnu/include/fcntl.h:35,
>                    from close_range_test.c:5:
>   ../../../../include/linux/falloc.h:13:2: error: unknown type name '__s16'
>     __s16  l_type;
>     ^~~~~
> 
> 
> Did you do that on purpose or just copy it from one of the other
> Makefiles? :)

I originally did that on purpose because checkpatch was yammering on
about me not having used ARRAY_SIZE(). But that include can go, you are
right.

Christian
