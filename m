Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E11D1387F0
	for <lists+linux-mips@lfdr.de>; Sun, 12 Jan 2020 20:34:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733180AbgALTe3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 12 Jan 2020 14:34:29 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:44480 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733146AbgALTe3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 12 Jan 2020 14:34:29 -0500
Received: by mail-io1-f67.google.com with SMTP id b10so7287495iof.11
        for <linux-mips@vger.kernel.org>; Sun, 12 Jan 2020 11:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=junsun-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dNLvF53eRAEOs2k32FUqelvA2sli/giB/SRJEmSbqEw=;
        b=YPnoFHiUUsVkFKkFWbrHPHEIYMtPlAtcIqvz9PPFO/RgbtmxT04nMRKtjBGPJWNzYd
         VfM+9etXWX5kSMU8uNVrHek0o6HPuk5md4ilEBEiCEYlqApdkPey/ZODqJdpCp6lKGkB
         rBD+CAh2/1uIlyjNjA/FjfGwenjt4YAOj6Lu0IYXV/qMLuGNRln+upuM9IeJsBo838Ir
         Dk6kN39a1S4RyjalWZLuKQDTYU8+uyVJUhJUNZrRu8zq/1wqD353TZLCHxwirX1T96uI
         UxNrwdbL8TsklWjzXiluqbu5iVl7QQQJSIWO0bYD7Vnka72VYGWRk03FK6tRM40jauFI
         Jn5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dNLvF53eRAEOs2k32FUqelvA2sli/giB/SRJEmSbqEw=;
        b=k4BOadLwfpo6esvex5jvwpEwrFNJj2XF5LznL/+e3fkr/sbJbN9OmcXZLjJhCJPQti
         F7qDZgBFRM8Oevm3hTAvGf8dgwj0/w/pe9+XnTf8f6cEmg6WeNAr+X3UhtZV3+tO1V9n
         XUIS6LPCedycPfeaSS3069L4TYVBgT0FsZwN+erSigpyZoo3U0TaLeT79NKfBlvGtgHJ
         6qUk4isu1XwdQ1iKxnl5yP1mUGmopYyLdE1uJx13NQl4McOhnmU8YMx0lESI7siKj0FY
         WOEgCjMRPTeKDiJDrFcsvcVDk44nVWFj5Du0sfqnw/ebh6BkHRFanHx+X+hWVUKRDWWa
         mczw==
X-Gm-Message-State: APjAAAV7pCPPK5Jf/9oqSsA1bhKYurLkHxZ+Wfa5MgvdSIOUUneexhqw
        evhVR8EX9BGgidJXqYhTgWwELizDvKIwcfZ40Pk0uzDb6Dc=
X-Google-Smtp-Source: APXvYqxW5NIaP5IDJ1U8LPyNlmwlPF7cWvTkNlPFbNakSMthWOvuX+PdfBGFKFN3V9Ev1X6VvMr+zf7BttIOR7X1rm0=
X-Received: by 2002:a6b:6b06:: with SMTP id g6mr4558403ioc.270.1578857668751;
 Sun, 12 Jan 2020 11:34:28 -0800 (PST)
MIME-Version: 1.0
References: <CAP5Nno5CPjV2mcf2ny8AtcC2ziqDkv6Kc7f4hCq1TF4DvKvJkw@mail.gmail.com>
 <CAP5Nno466s9M_7E0keMP3s=rDuZ48hrAb9-xAv52SsADr910XA@mail.gmail.com> <20200109212404.GA1750666@aurel32.net>
In-Reply-To: <20200109212404.GA1750666@aurel32.net>
From:   Jun Sun <jsun@junsun.net>
Date:   Sun, 12 Jan 2020 11:34:18 -0800
Message-ID: <CAP5Nno4d4r+yaARLGYd==5wznOMXf1Ufc2P-DjsVc-FavxLvUw@mail.gmail.com>
Subject: Re: debian bootup hangs on qemu-system-mips64el
To:     Jun Sun <jsun@junsun.net>, qemu-discuss@nongnu.org,
        debian-mips@lists.debian.org, linux-mips@vger.kernel.org
Cc:     lixing <13699171092@139.com>, Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Are you sure QEMU/MIPS does not support SMP?  Below link written in
2016 clearly shows something was working then.

https://www.mips.com/blog/how-to-run-smp-linux-in-qemu-on-a-mips64-release-6-cpu/

Also, as Lixing mentioned in our private exchange, there is SMP
support for loongson.  Lixing, I assume loongson SMP support is
already merged in QEMU repo, right?  Can you point out the relevant
source code directories?

Would love to get more pointers here!  Thanks!

Jun

On Thu, Jan 9, 2020 at 1:24 PM Aurelien Jarno <aurelien@aurel32.net> wrote:
>
> On 2020-01-04 20:46, Jun Sun wrote:
> > On Wed, Jan 1, 2020 at 6:50 PM Jun Sun <jsun@junsun.net> wrote:
> > >
> > > Hi, all,
> > >
> > > Debian/mips64el runs well on qemu-system-mips64el until I turned on smp option with a number of 2 or higher.  See the error message below.  It usually hangs pretty early on.
> > >
>
> QEMU/mips doesn't really support SMP. The -smp option used to be for
> SMT, but I am not even sure it really worked.
>
> All that said, it's still a bug in QEMU to accept this option.
>
> --
> Aurelien Jarno                          GPG: 4096R/1DDD8C9B
> aurelien@aurel32.net                 http://www.aurel32.net
