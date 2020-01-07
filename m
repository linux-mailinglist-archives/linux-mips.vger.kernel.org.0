Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3ED66132105
	for <lists+linux-mips@lfdr.de>; Tue,  7 Jan 2020 09:08:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727298AbgAGIIx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 7 Jan 2020 03:08:53 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:55497 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725987AbgAGIIw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 7 Jan 2020 03:08:52 -0500
Received: from mail-qt1-f175.google.com ([209.85.160.175]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1N6sWd-1jm0Pl0TMt-018JGf; Tue, 07 Jan 2020 09:08:50 +0100
Received: by mail-qt1-f175.google.com with SMTP id e5so44660877qtm.6;
        Tue, 07 Jan 2020 00:08:49 -0800 (PST)
X-Gm-Message-State: APjAAAXZVLKoIgieSnbamSeHMGHIeVRIQFB3wX+QUJETQz+lyMHHRpyC
        nUf0/zXFuFC0t5NlcR2Ro60hkBjs1I53HxYATtQ=
X-Google-Smtp-Source: APXvYqwKEIiKCB0yEFWoleSSKNKnD8FxkV92VMH6CsqWOD/uB6nKGXweURlmBCLGX81V2orjzTiBfhUxphLe4QjQbqc=
X-Received: by 2002:ac8:709a:: with SMTP id y26mr78377768qto.304.1578384528657;
 Tue, 07 Jan 2020 00:08:48 -0800 (PST)
MIME-Version: 1.0
References: <20200102145552.1853992-1-arnd@arndb.de> <20200102145552.1853992-3-arnd@arndb.de>
 <87woa410nx.fsf@mpe.ellerman.id.au>
In-Reply-To: <87woa410nx.fsf@mpe.ellerman.id.au>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 7 Jan 2020 09:08:31 +0100
X-Gmail-Original-Message-ID: <CAK8P3a17GshP1KmCpvCkWGDGJLC_JrGUFQZTLbfe5+sSwTjyxw@mail.gmail.com>
Message-ID: <CAK8P3a17GshP1KmCpvCkWGDGJLC_JrGUFQZTLbfe5+sSwTjyxw@mail.gmail.com>
Subject: Re: [PATCH v3 02/22] compat: provide compat_ptr() on all architectures
To:     Michael Ellerman <mpe@ellerman.id.au>
Cc:     "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Robert Richter <rric@kernel.org>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Parisc List <linux-parisc@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        oprofile-list@lists.sf.net,
        linux-s390 <linux-s390@vger.kernel.org>,
        sparclinux <sparclinux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:u23tS7WXorWpVLZKGkb7wugjrH1eotKatfDmqpeBl6DRIJJ7iUP
 nq7sblEIf6wgOdnV9kEk/0s0PpDAlTXPsPIDWUt3vJX7VL0N4G5lnnm6/oAqr6M5uybdriY
 hZavjT+r7xsftIZsikilYIa7XtS5hp/HvR8AEMn6HO+TPBoq5+lzpfwXmdG/Z7oHcyc8V4x
 idDM1/uyjPQZKR/M0qCZg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:gOlwlytu5DE=:WL7dOW6AXXvH35CqloA4bv
 QGlptwqJMJvCrD8JlpA6oQTcVGb4gyg+XE65d++c6tv2gEK2xdcTZuS7MyxD9e6ppV0Mp7Y6A
 E8C+IB3/TJUJNGYsKOKj//zs10JHmhYiTdsqjKKww0AWT0TyN+dVwQjDJr3/GWiGjPxQeQlL8
 ZJpRyTua64cMiFMMWtvxqOHN2432G5SY8veyvQIiUmHEyZFue69wfZEVgkRQIdZBj6NchzqFD
 bIrZJwEqncm0h2zZ+gpx0GOzttKWeyob1mUkxrHCVyrudsElDIT9YI6D9OYWTs9h2dThBBVdC
 Cr9NNfCjlWVRBP48RPDO9VeJG3FpHkssJAR44N0kLAU5VPxYDZ9g1HPEuLTHv+eXURSu4DGPQ
 fqPgxdLxmO+RLmqN7iJeAPxaWxAO3HogkN3eDt2Fe11raPb9n8p2/StRXIq083NnmK9qiYv2J
 sq2vXgBtxNLjmziGQPvzgbJS5ukkiMRn8yxYdX297780aNpPLxvHgGoSoT5TSj9zh7waYHaed
 /aFFMUFZucoexUJ0pRszUbRACphrfvN/c69/KVSIphfgnfixUts48LexMk7lC51Pxi8OELkaY
 pJknxct4qAofB25UGi3fXxF62a9atRXgi1tKnzxWAAjGV/WLTU6qM4QyYXgEwHsIkLnOaLxXs
 KuofWrlvbUHXwKsrbbn7enIttBfLkkOy+WtWfs/PiMRl8QxwSZ5cXhwvqb004jOiA3qjO+G4w
 0TFoMJlRuUl7IENTQwglNKJba0gBwPMZ+j3Z2/87eJQccjJrBId22m8u8ExcLGNR5CMQ0WaVu
 3iz1fk5cYqv61OfBqFNLdNjmn/jc6fGaCX3HUr2n7EkPlld5iLjiKXakHy9taDGuNzoeHw019
 wiREIyL7qOXxrk6MAqcg==
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Jan 7, 2020 at 3:05 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
> Arnd Bergmann <arnd@arndb.de> writes:
> > +
> > +static inline compat_uptr_t ptr_to_compat(void __user *uptr)
> > +{
> > +     return (u32)(unsigned long)uptr;
> > +}
>
> Is there a reason we cast to u32 directly instead of using compat_uptr_t?

Probably Al found this to be more explicit at the time when he introduced
it on all the architectures in 2005. I just moved it here and kept the
definition.

       Arnd
