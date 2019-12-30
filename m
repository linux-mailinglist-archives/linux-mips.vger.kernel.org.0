Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 112F312CFF1
	for <lists+linux-mips@lfdr.de>; Mon, 30 Dec 2019 13:27:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727419AbfL3M1E (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Dec 2019 07:27:04 -0500
Received: from frisell.zx2c4.com ([192.95.5.64]:43711 "EHLO frisell.zx2c4.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727376AbfL3M1E (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Dec 2019 07:27:04 -0500
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3275af36;
        Mon, 30 Dec 2019 11:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
        :references:in-reply-to:from:date:message-id:subject:to:cc
        :content-type; s=mail; bh=djyQlJomKtz8hsUKZjZcwqxWC2Y=; b=T8+n9J
        1ewE5Sx5TgkA8tcacSDu3WghMugRaT2fqS4EuMrxb+OQJSc4sS29/VvhH4TdGG2R
        up3k77N342yV9FFpmJvMTadwInlk6jBZiE3Adrj5r4NFr0QqC2GYsGOFrXJjIcB7
        +VHkOeqmS2yoQkBw7X4UptzwCegiI0mPCwyqoOmjYV4R+W1BpQh+TbEmmHg3Z06c
        /vJH7voncbiu2wlHZBFCy5qqsVla3Dsb9vz/LPZA8TzzWtFiO8Z/D91nhDemFpyX
        cWRwSykVUg6vd98FMX84N+J6dAOQ7ohGTwC4kuuzWV0YW6b8wm6Dj6NBYk3THMue
        V4NN0p2q4e5c8T+w==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 1396dfe4 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO);
        Mon, 30 Dec 2019 11:28:54 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id k14so46117389otn.4;
        Mon, 30 Dec 2019 04:27:01 -0800 (PST)
X-Gm-Message-State: APjAAAUyFSjwCKlmkOh6NgoXYX2f9xfLyOWl2pUPASj1gMJWs5A1V0Ed
        I1QKlY2zdLbHUUB61rmihxfIywAcw0xmG2pvXCc=
X-Google-Smtp-Source: APXvYqzP/4tauBVRZSDfjENBH0itgeRj9FXo214+2rOnn2l41nL85Ubp7jiO8V60YicnCTOYxe2dvXW+L592O3squpk=
X-Received: by 2002:a05:6830:1141:: with SMTP id x1mr75280853otq.120.1577708820676;
 Mon, 30 Dec 2019 04:27:00 -0800 (PST)
MIME-Version: 1.0
References: <20191223130834.GA102399@zx2c4.com> <20191224135404.389039-1-Jason@zx2c4.com>
 <CAK8P3a1fVFDkHe=gLy55rHxwfZ8YKcUSYvnhSoMbcAgWy6Nm9w@mail.gmail.com>
In-Reply-To: <CAK8P3a1fVFDkHe=gLy55rHxwfZ8YKcUSYvnhSoMbcAgWy6Nm9w@mail.gmail.com>
From:   "Jason A. Donenfeld" <Jason@zx2c4.com>
Date:   Mon, 30 Dec 2019 13:26:49 +0100
X-Gmail-Original-Message-ID: <CAHmME9o07dQV_MmWmtBFCKp=sdsO-scC6-UbXNi=dpU6umCoPg@mail.gmail.com>
Message-ID: <CAHmME9o07dQV_MmWmtBFCKp=sdsO-scC6-UbXNi=dpU6umCoPg@mail.gmail.com>
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

On Mon, Dec 30, 2019 at 12:58 PM Arnd Bergmann <arnd@arndb.de> wrote:
> Thanks for the bug report! I'm not completely sure why this fails in
> this particular
> way though. I assume you are using musl-1.1.20, not a musl-1.2.0 snapshot

Yes, that's the one, sorry.

> diff --git a/arch/mips/vdso/vdso.lds.S b/arch/mips/vdso/vdso.lds.S
> index da4627430aba..0bdc6a026be8 100644
> --- a/arch/mips/vdso/vdso.lds.S
> +++ b/arch/mips/vdso/vdso.lds.S
> @@ -93,9 +93,11 @@ VERSION
>         LINUX_2.6 {
>  #ifndef DISABLE_MIPS_VDSO
>         global:
> +#if (_MIPS_SIM == _MIPS_SIM_ABI64) || defined(CONFIG_COMPAT_32BIT_TIME)
>                 __vdso_clock_gettime;
>                 __vdso_gettimeofday;
>                 __vdso_clock_getres;
> +#endif
>  #if _MIPS_SIM != _MIPS_SIM_ABI64
>                 __vdso_clock_gettime64;
>  #endif
>
> That should ensure that no user space can call the old vdso
> functions on a kernel that intentionally breaks the actual
> syscalls.

I can confirm that patch fixes things. Thanks.

Jason
