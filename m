Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10A502AAD24
	for <lists+linux-mips@lfdr.de>; Sun,  8 Nov 2020 20:08:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728887AbgKHTIA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 8 Nov 2020 14:08:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:43808 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728874AbgKHTH7 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 8 Nov 2020 14:07:59 -0500
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CB10B22244
        for <linux-mips@vger.kernel.org>; Sun,  8 Nov 2020 19:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604862479;
        bh=xHtls6lXIezqo3MY4JofvqKy4eD3Tg/zP3T1SVhh14M=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=lObxRSHn+WfoWm7Ct2D8cbjG6WeBt/Nu9CeJ9JPSehUkvInSKaflmeAtiW4po+8aG
         OqH7BytpljVeKp4MAmF02wkhF6/HyN9pibKTW7miGiQnhApT15H0TKlQrd1QUa+9qh
         hSLn/eQTEIi7dCs9X3x9364a1AbeLdM3uONTZK8U=
Received: by mail-ed1-f42.google.com with SMTP id t11so6432316edj.13
        for <linux-mips@vger.kernel.org>; Sun, 08 Nov 2020 11:07:58 -0800 (PST)
X-Gm-Message-State: AOAM532jtlC5XzMpDufTJmAMYIpxPhvxxnQEjZBQMofmd/n9SW0YShUn
        u5qEOvB9y2bZn+sEUKNsy65+UwxUpfMiimajkz38Aw==
X-Google-Smtp-Source: ABdhPJzhIeYsh6ImqBo3MO13jFnDXj/3CxHcgilHtBOIs01JZKqESrAhAXBK5n9FiqSo+pApvOkp93Dmq6I76qqKv1w=
X-Received: by 2002:adf:f0c2:: with SMTP id x2mr7511599wro.184.1604862475870;
 Sun, 08 Nov 2020 11:07:55 -0800 (PST)
MIME-Version: 1.0
References: <20201108051730.2042693-1-dima@arista.com>
In-Reply-To: <20201108051730.2042693-1-dima@arista.com>
From:   Andy Lutomirski <luto@kernel.org>
Date:   Sun, 8 Nov 2020 11:07:44 -0800
X-Gmail-Original-Message-ID: <CALCETrW-hHyh3nF3ATmy61PCy1iFqVhVYX+-ptBCMP5Bf7aJ0w@mail.gmail.com>
Message-ID: <CALCETrW-hHyh3nF3ATmy61PCy1iFqVhVYX+-ptBCMP5Bf7aJ0w@mail.gmail.com>
Subject: Re: [PATCH 00/19] Add generic user_landing tracking
To:     Dmitry Safonov <dima@arista.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Dmitry Safonov <0x7f454c46@gmail.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andy Lutomirski <luto@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
        Ingo Molnar <mingo@redhat.com>,
        Oleg Nesterov <oleg@redhat.com>,
        Russell King <linux@armlinux.org.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Will Deacon <will@kernel.org>, X86 ML <x86@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Albert Ou <aou@eecs.berkeley.edu>,
        "David S. Miller" <davem@davemloft.net>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Linux FS Devel <linux-fsdevel@vger.kernel.org>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        linux-s390 <linux-s390@vger.kernel.org>,
        sparclinux <sparclinux@vger.kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Nov 7, 2020 at 9:17 PM Dmitry Safonov <dima@arista.com> wrote:
>
> Started from discussion [1], where was noted that currently a couple of
> architectures support mremap() for vdso/sigpage, but not munmap().
> If an application maps something on the ex-place of vdso/sigpage,
> later after processing signal it will land there (good luck!)
>
> Patches set is based on linux-next (next-20201106) and it depends on
> changes in x86/cleanups (those reclaim TIF_IA32/TIF_X32) and also
> on my changes in akpm (fixing several mremap() issues).
>
> Logically, the patches set divides on:
> - patch       1: cleanup for patches in x86/cleanups
> - patches  2-11: cleanups for arch_setup_additional_pages()

I like these cleanups, although I think you should stop using terms
like "new-born".  A task being exec'd is not newborn at all -- it's in
the middle of a transformation.

--Andy
