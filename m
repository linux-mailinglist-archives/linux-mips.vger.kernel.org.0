Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D197174DFE
	for <lists+linux-mips@lfdr.de>; Sun,  1 Mar 2020 16:19:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726146AbgCAPTv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Mar 2020 10:19:51 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:35422 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725874AbgCAPTv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Mar 2020 10:19:51 -0500
Received: by mail-ed1-f68.google.com with SMTP id c7so9930478edu.2
        for <linux-mips@vger.kernel.org>; Sun, 01 Mar 2020 07:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=wudcwOkgIdtLzVbawYouHRAPRgWmBfWBhvL3hCeWhQY=;
        b=rVGSs3IpQYzFgsYAUTQXdjbNc0qwxgbmyH7chD+EFkV0k1EfTgrJriaPJ5kbnAliMY
         OnlZfjNUNhvUKwOw59euxEbNADUOnS0duq0rHDYquU7pZJPOtkHQZgarzP/kWPrQBJZ4
         HqhDWlv4nzSNwRvuexKSUNuxfva09yqIvYGxqMXRLQOg31ggVpsImKQfy2rZQoeGCi2p
         csfhVhBEIUBL/VScbUJ1c9T0KnT3RD7aZdkTy7KjE2L45+1UMDs7IbJZz/k75ebtbvwX
         I7KqbpC0SmqISDxChF+k46OQBdNe5oQ705lyBovzCRZ2mzJEy17pOdDBikb0jMCrtOLp
         dYOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wudcwOkgIdtLzVbawYouHRAPRgWmBfWBhvL3hCeWhQY=;
        b=YIHaEMAYUBg8gFMOeNmGrv0n4xnLHjGRmNIsiVIzgjSnAs79eL+H6EhWQ5u7mROqhS
         sbeaomttc05VzNwjGoaipQOsYyPJ45uFBZ0dX9YTOJgiUqW/S2e3abQ2vSHpWiz4NKvD
         jyK+/5j8uIRAaqAdFaYj7UH/a+pb7mJIafcNG8IT0aCLZIQReaiaoQ62b40MN0wgSNoy
         4/TRwoi9Li+rYlrhi5D3qS9xto+7PS3y49cBMACc/4Dbeo2T0rrrIkHNvOR5EVNCz99v
         D4qZ3jG1+iTQ+NRetoxThm4UUBKrMgHc3ymjykZ+E3rE4kNTFk/T4lvX/S5uhBDvVoo3
         D0jQ==
X-Gm-Message-State: ANhLgQ0UGejXXALJ6XBhXEAhXsb2oH1c/7eSDgcrcg8TQXpckPSbaMjR
        Og5Kkx5n106f1T7blGMkHovBJQ37i11ZjvWoSjDGzQ==
X-Google-Smtp-Source: ADFU+vslWcMA7fNQilSpCJtP9CEt7Z2EuZcYg4atj1SzaOXfyP9FFfA+vZ24m6w8ur2zOcK5tKyyAdutzYcg5PES4cA=
X-Received: by 2002:aa7:d2c9:: with SMTP id k9mr2597269edr.132.1583075989834;
 Sun, 01 Mar 2020 07:19:49 -0800 (PST)
MIME-Version: 1.0
References: <20200227144910.GA25011@alpha.franken.de> <20200301063905.GA8727@ld50.lan>
In-Reply-To: <20200301063905.GA8727@ld50.lan>
From:   Cye Borg <cyborgyn@gmail.com>
Date:   Sun, 1 Mar 2020 16:19:40 +0100
Message-ID: <CAD4NMuaQcpe_gZdN6hpSsU++RbzK4yVv+Gyfdax++N1v+c2GJA@mail.gmail.com>
Subject: Re: MIPS Hardware support
To:     WANG Xuerui <git@xen0n.name>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Thomas,

I have
- SGI Indigo2 Impact 10000 (IP28), on which I booted 4.19.79
successfully recently (after some patchwork), I am about to try out
current kernel to ask help on it (if needed)
- SGI Octane (IP30), with R12000, on which I have not tried Linux yet,
but planning to
- SGI Challange S (IP22), the same

Best regards,
Barnab=C3=A1s Vir=C3=A1gh

On Sun, Mar 1, 2020 at 7:39 AM WANG Xuerui <git@xen0n.name> wrote:
>
> Hi Thomas,
>
> I'm doing the occasional Linux/MIPS tinkering in my spare time, mainly
> with Loongson machines. I have the following MIPS hardware:
>
> Hardware I own and regularly boot current kernels:
>
> - Loongson 3A3000 + RS780E development board (MACH_LOONGSON64)
>
> This is the box I regularly rebase and test my patches with.
>
> Hardware I own but not booted for a while:
>
> - Lemote Yeeloong 8089D netbook (Loongson 2F, MACH_LOONGSON2EF)
> - Loongson 3A2000 + RS780E development board (MACH_LOONGSON64)
>
> These two have mainline support.
>
> Hardware I own but not running up-to-date mainline kernels:
>
> - OpenLoongson development board (Loongson 1C, MACH_LOONGSON32)
> - Loongson Pi 2 (Loongson 2K1000 SoC, MACH_LOONGSON64)
> - Loongson 3A3000 + 7A1000 development board (MACH_LOONGSON64)
> - Loongson 3A4000 + 7A1000 development board (MACH_LOONGSON64)
>
> These boards all lack mainline support. Some are in progress, like the
> Modernize Loongson Machine patchset by Jiaxun that eventually leads to
> mainline 7A support.
>
> Both of my two routers happen to be MIPS-based too, with QCA9558 (ATH79)
> and MT7621 (RALINK) inside respectively, but I'm unlikely to mess with
> them at the moment.
>
> --
> WANG Xuerui
