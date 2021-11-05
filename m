Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6746A44668B
	for <lists+linux-mips@lfdr.de>; Fri,  5 Nov 2021 16:56:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233700AbhKEP72 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 5 Nov 2021 11:59:28 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:44653 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232537AbhKEP72 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 5 Nov 2021 11:59:28 -0400
Received: from mail-wm1-f51.google.com ([209.85.128.51]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MWAay-1nGX1I0Boo-00XbVP; Fri, 05 Nov 2021 16:56:46 +0100
Received: by mail-wm1-f51.google.com with SMTP id 71so7419296wma.4;
        Fri, 05 Nov 2021 08:56:45 -0700 (PDT)
X-Gm-Message-State: AOAM531XExDFhY6RTcGaC/MKKOKGa/Gny3QO9MrCT+XLqbZzfr+1ICK4
        yMBGaa4yunUBky/9TmO+rskc4YPZsnGMflcnIEE=
X-Google-Smtp-Source: ABdhPJxk4OCRMtLkil/Eyj8Bt7IiEC6cv8x2wWvEo25EBDjZmSRZavU4Cmw8YwQkdpld9oVGpzqUDybBNFF63jz+S4E=
X-Received: by 2002:a1c:2382:: with SMTP id j124mr20339339wmj.35.1636127805532;
 Fri, 05 Nov 2021 08:56:45 -0700 (PDT)
MIME-Version: 1.0
References: <20211105154334.1841927-1-alexandre.ghiti@canonical.com>
In-Reply-To: <20211105154334.1841927-1-alexandre.ghiti@canonical.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 5 Nov 2021 16:56:29 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2AnLJgGNBFvjUQqXd-Az9vjgE7yJQXGDwCav5E0btSsg@mail.gmail.com>
Message-ID: <CAK8P3a2AnLJgGNBFvjUQqXd-Az9vjgE7yJQXGDwCav5E0btSsg@mail.gmail.com>
Subject: Re: [PATCH 0/7] Cleanup after removal of configs
To:     Alexandre Ghiti <alexandre.ghiti@canonical.com>
Cc:     Steve French <sfrench@samba.org>, Jonathan Corbet <corbet@lwn.net>,
        David Howells <dhowells@redhat.com>,
        Russell King <linux@armlinux.org.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Lee Jones <lee.jones@linaro.org>,
        Jeff Layton <jlayton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Ronnie Sahlberg <lsahlber@redhat.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Kalle Valo <kvalo@codeaurora.org>, linux-cifs@vger.kernel.org,
        samba-technical@lists.samba.org,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-cachefs@redhat.com,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        linux-power@fi.rohmeurope.com
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:fij7/SER06A7KMmIZKvkypGSwg7HLiJRVpIgzg3ljOcForLoY4w
 eLeHFD4J3aPVbVpMxQqrFolisrBLDve8zXu9zbYPBWe0DqmVdQJ2GRUbLAa3QP4Q4PJfppB
 IQBF7W46Nsw5ZgzeQGqNxXf4LrA8I6QOUo463lz43vj830XDMc9iCv7qz0euuKQT02Y/YQF
 +NrWAPP67WWtEOObyVYcA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Tcftb7RxW8U=:g4x23/n7TJpuGHj4VT1NBC
 tdng1U2+X8GaDbsa+ZW2Q8NGO7dEvp3gwP3jnFQP0z+2zkUc5XD637G6U78VuDfNJAZ2SEFP6
 vVRQHWTNcF1DshmXofpZ1yJDarZNNuHlwfy4pHGwhTh4CmNAvcbgOdTyaXVxTvFESF1Ij4y3b
 +wbSvADNg1IuZPq6mjE060be7QYJmnlOb5qqL/x+lo3Yj9g6vjXDkH0kJaybnJvkUNnltKwPs
 Ftig0sjiUdhgNmwmjuf8hVWG5/fH/koaR/oKlrTHMsigW14PtfoPjezc7Bg3pm7txgqSiBDBb
 HYZiko9VjqLiXFFDYH4sUw5TXALC38SRGCVB35cA5Wn0M1ZsbgRx0e9CraatzivP+ZXUrJbR5
 wThS3TncapvrTx/eNFkJOj0cPh6afow2KO3kIed9Fm1JFooD5jIkyUFqQMrd5Th8PHKs3lNO3
 +MCGCJqz4JAuGZcEada06YAAt1BA117+xKwfaffWhdTvNGw6/jE9Dy4CkUWbprJIwGb8HtTjT
 XPnTn1KvGj84825pt10Iy7XLAabCbaZf9K/469rcMfRpGxebMy7A4BInYyL2OH2MlLwu0VR8b
 GR17ZN3M2DuQTE/NeJqgb4bujWYuigq5DyVNZ28gC8cxQifE77OM9GikvQjIPXDlW9UPGbYPB
 UPv3nbs4oBTLD4l1FHDy3m3+dzOf+bW8czR5tS39wx4t1ONhnNRQqeKfeQP4N+k5R7Gm29e7q
 kgXHdVoBtn33vmNTTZTCiImeUosp2Z18ET0GkfPICUatb4kIrZMv7ts9dt2VL+GVrZuxmMzlX
 FtAWC/r0ges0zc2MCfn3SCafQ1qeFlI+TyTArk08W9Yy0vTlBk=
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Nov 5, 2021 at 4:43 PM Alexandre Ghiti
<alexandre.ghiti@canonical.com> wrote:
>
> While bumping from 5.13 to 5.15, I found that a few deleted configs had
> left some pieces here and there: this patchset cleans that.
>
> Alexandre Ghiti (7):
>   Documentation, arch: Remove leftovers from fscache/cachefiles
>     histograms
>   Documentation, arch: Remove leftovers from raw device
>   Documentation, arch: Remove leftovers from CIFS_WEAK_PW_HASH
>   arch: Remove leftovers from mandatory file locking
>   Documentation, arch, fs: Remove leftovers from fscache object list
>   include: mfd: Remove leftovers from bd70528 watchdog
>   arch: Remove leftovers from prism54 wireless driver

Looks all good to me, thanks a lot for the cleanup!

For arch/arm/configs:

Acked-by: Arnd Bergmann <arnd@arndb.de>

assuming this goes through someone else's tree. Let me know if you need me
to pick up the patches in the asm-generic tree for cross-architecture work.

         Arnd
