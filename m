Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74E63372833
	for <lists+linux-mips@lfdr.de>; Tue,  4 May 2021 11:46:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230033AbhEDJrA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 4 May 2021 05:47:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229953AbhEDJrA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 4 May 2021 05:47:00 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67112C061574;
        Tue,  4 May 2021 02:46:04 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id e7so9652923edu.10;
        Tue, 04 May 2021 02:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FMMoB0knpTuesmL7S80gUZGP0uEA+wOrx5OG5Ck4KtQ=;
        b=scnrBqC8w7CnFcQ5v3N0jKjMhFpIsia5XbpW2lEbIwi9mDBavP7Qr1J/E5dbLPwGGi
         kfxu44i6CBIUFoJmRGqPshBv9v9r95jElB52yp+1cfiKLnhwlzLLBvJ24shBXg1NIf4I
         TW09zi2ApCi7K0O8RmTHqDzya6qCTJBn9OBhagrT5amzbHwhXeTtHylqRPQlXujIQ5m7
         d7POAwGN1dXtD187vi4ncI1maUhyl/odexxCfUhec2AoIuVpeXNTAfA4gIk5BvFakFcx
         K989Jnpv0H72ayBFIwrONvUd3iG98IGx2L0MC4CUYyRTmUHvtvr5lFP+sLNjYy67+/go
         hsgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FMMoB0knpTuesmL7S80gUZGP0uEA+wOrx5OG5Ck4KtQ=;
        b=rdIz5J9eIHIXcNf2Yv207HhwLM1MNO/fjZdiZEopc+zsRSqL9CM8x5v1Yd5uz2eU3E
         wVrzoBIGnEAGOj2qUy2mXjF/1W6TL8dptNxdmBXTKfYM9m0390aatd1PlMsibcuCCGPv
         NDXnSr9Q3lxW8jmHOfZFc4kW5iUqtxE7xdC5ADXCX+WiM3egnKZcKH7rzKHfl9dB3UVV
         Uh3EV35IJxur18JSRLyRAZEorI1P4zkhX+dL/85Tgssk0AiLXulgz61aClK/BHrEijNG
         ml/dEjHuPqD2vapNsP77YHoVdGsZ97AqiUg8r0tQ7IaSybT8BHqOMz1FvtmmI1gNsk9A
         xRIg==
X-Gm-Message-State: AOAM531I09aLv9obgceBE7pXaQ8Rg33KSXJKAEo2OS5WTjc+uKfDa6zp
        D0+E1pxLXhBU2KA8G/fftlilMSSa4fXYfKE+Yzg/5wrQ
X-Google-Smtp-Source: ABdhPJytIlqBg1GSjAvtrTGNIBv6aKqTmnMnu2e5kZW0EfBKg8Xh0c84yVVu4/JqV9YTkecrWRL3P/XHYROlWQerQAk=
X-Received: by 2002:a05:6402:34c5:: with SMTP id w5mr3386137edc.237.1620121563132;
 Tue, 04 May 2021 02:46:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210501172437.156926-1-masahiroy@kernel.org> <20210501172437.156926-2-masahiroy@kernel.org>
In-Reply-To: <20210501172437.156926-2-masahiroy@kernel.org>
From:   Max Filippov <jcmvbkbc@gmail.com>
Date:   Tue, 4 May 2021 02:45:51 -0700
Message-ID: <CAMo8BfJgNgNKRi9XsPUFKPzH0GvtFcRxx75+swXaofcMN7kg8Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] arch: use cross_compiling to check whether it is a
 cross build or not
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild <linux-kbuild@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Chris Zankel <chris@zankel.net>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Helge Deller <deller@gmx.de>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Rich Felker <dalias@libc.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:M68K ARCHITECTURE" <linux-m68k@lists.linux-m68k.org>,
        linux-mips@vger.kernel.org,
        "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>,
        "open list:SUPERH" <linux-sh@vger.kernel.org>,
        "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, May 1, 2021 at 10:25 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> 'cross_compiling' is defined by the top Makefile and available for
> arch Makefiles to check whether it is a cross build or not. A good
> thing is the variable name 'cross_compiling' is self-documenting.
>
> This is a simple replacement for m68k, mips, sh, for which $(ARCH)
> and $(SRCARCH) always match.
>
> No functional change is intended for xtensa, either.
>
> This is rather a fix for parisc because arch/parisc/Makefile defines
> UTS_MATCHINE depending on CONFIG_64BIT, therefore cc-cross-prefix
> is not working in Kconfig time.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  arch/m68k/Makefile   | 2 +-
>  arch/mips/Makefile   | 2 +-
>  arch/parisc/Makefile | 2 +-
>  arch/sh/Makefile     | 2 +-
>  arch/xtensa/Makefile | 6 +-----
>  5 files changed, 5 insertions(+), 9 deletions(-)

Acked-by: Max Filippov <jcmvbkbc@gmail.com> # xtensa

-- 
Thanks.
-- Max
