Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF2EE12D159
	for <lists+linux-mips@lfdr.de>; Mon, 30 Dec 2019 16:10:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727528AbfL3PKQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Dec 2019 10:10:16 -0500
Received: from frisell.zx2c4.com ([192.95.5.64]:45103 "EHLO frisell.zx2c4.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727513AbfL3PKQ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Dec 2019 10:10:16 -0500
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a11596d6;
        Mon, 30 Dec 2019 14:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
        :references:in-reply-to:from:date:message-id:subject:to:cc
        :content-type; s=mail; bh=LEOHCAqGMYtyfoC88TiUUIaxdBc=; b=BwTGOd
        aUp8aF1h/4gIeTpE38AUfjzhvqxoqLYrFFlgzHe/G6UILZbOiJjHoDVdos2Uaj9R
        0zF+ueKqPyCmIZEPADjw4yVy8iZS4/MyQAOIsOovUnh7RHx7cVkKn3yirt9cfA1s
        4zKpyjm6epbqX74yRoL2vHAY4w/Cf8lUbMVQ+rjb8elwPG0SuX7qxPKcsQ8CJTcU
        xNMrQkCFyFwlDCPXKGUyAVT04qZTUCBMuUap6/I/9inm2UbPjxu4NzjQk0urJYCv
        /ofEP3RgVIpIM22OgeEhr17SNSVY0cdvpFF1EeUYICxGXRdRTI5lOp05VQIlF64P
        I8cBF3EHm345r7zA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3a4084c2 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO);
        Mon, 30 Dec 2019 14:12:07 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id l136so10999015oig.1;
        Mon, 30 Dec 2019 07:10:14 -0800 (PST)
X-Gm-Message-State: APjAAAVmkcGQVghNlXI2xsujYC6/6xFL8Bfl7oAOk6BrtUPuKaAkvvtL
        CQ1thrNswJpnuHBvjB0PV29jXhe2KGuL112lpaA=
X-Google-Smtp-Source: APXvYqzAALMU1FWEK0zuJkybUMDBKgaL0N6b61Yjqwry1GVT/ydK/ZJ+EJ1KIk/o5RbEzk37u2HYtPtFv0X7sg2VnrY=
X-Received: by 2002:a05:6808:a8a:: with SMTP id q10mr5074270oij.66.1577718613559;
 Mon, 30 Dec 2019 07:10:13 -0800 (PST)
MIME-Version: 1.0
References: <20191223130834.GA102399@zx2c4.com> <20191224135404.389039-1-Jason@zx2c4.com>
 <CAK8P3a1fVFDkHe=gLy55rHxwfZ8YKcUSYvnhSoMbcAgWy6Nm9w@mail.gmail.com>
 <CAHmME9o07dQV_MmWmtBFCKp=sdsO-scC6-UbXNi=dpU6umCoPg@mail.gmail.com>
 <CAK8P3a0sWObusG3xO_JE9CXCyNfFN0p6OgPjUyU2CHLBBZNpZw@mail.gmail.com> <CAHmME9o==nBONywVgSjsmjs2H_A8itgmwibqzPmvivcSocKWRQ@mail.gmail.com>
In-Reply-To: <CAHmME9o==nBONywVgSjsmjs2H_A8itgmwibqzPmvivcSocKWRQ@mail.gmail.com>
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
Date:   Mon, 30 Dec 2019 16:10:02 +0100
X-Gmail-Original-Message-ID: <CAHmME9q7ZG83Odh1-NkRcKp836tCRaVj1R9TGp_L_nr0Rh9r5A@mail.gmail.com>
Message-ID: <CAHmME9q7ZG83Odh1-NkRcKp836tCRaVj1R9TGp_L_nr0Rh9r5A@mail.gmail.com>
Subject: Re: [PATCH] mips: vdso: conditionalize 32-bit time functions on COMPAT_32BIT_TIME
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Christian Brauner <christian.brauner@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Dec 30, 2019 at 3:37 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> On Mon, Dec 30, 2019 at 1:34 PM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > - Why does it crash in the first place rather than returning -ENOSYS?
>
> There's a bit of speculation about this in the original thread that
> prompted this patch (you're CC'd).

The following will provoke the crash:

__attribute__((noinline)) void somefunc(void) { }

int __clock_gettime(clockid_t clk, struct timespec *ts)
{
       ((int (*)(clockid_t, struct timespec *))vdso_func)(clk, ts);
       somefunc();
       return 88;
}

It seems like the VDSO is doing something to the stack.
