Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2BBC26149A
	for <lists+linux-mips@lfdr.de>; Tue,  8 Sep 2020 18:28:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731934AbgIHQ2X (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Sep 2020 12:28:23 -0400
Received: from mail-ej1-f67.google.com ([209.85.218.67]:40968 "EHLO
        mail-ej1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731677AbgIHQ1i (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 8 Sep 2020 12:27:38 -0400
Received: by mail-ej1-f67.google.com with SMTP id lo4so23433764ejb.8;
        Tue, 08 Sep 2020 09:27:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gY7Q3pRnf8yKWrwhsguEVhiFV56SISncaL/KGXTFU2c=;
        b=EeLjgINSE7wJIUZaXwUjo8TH0FhnpAFktsXkUl1pu+t/+9fjSIZDvEh1YMkm99OZuy
         aiUj4BVWKfBkRGxuWp85Ssc+USMkU+jpvqL4CDoDPEb8V4eh7YOOMDC1BdCSw+fnYRvl
         yUBBh3izI2rTdL4DQSOqQpq9ZSkyr2raS/sfv6LVg+9wO4z9jPZF2iDe2r+LLWk/5jP1
         ss3OfXzBZ0y2hhIj3NtMXaCygkiFwI3os1DOzTwAyGJLyw1jazSungvdq6rAQyDI04nW
         Bp3sjB8pIAYeU7oDpuntnRRL9ob9H+7QCeVeuL8e2hPQzu3/a4/YE2rdWJZ7DWdH91RP
         NC9g==
X-Gm-Message-State: AOAM533Xh0Q6hvorMS36J/2GUuISC3vQ/+imnzUD7L2TMLzfZJv3hdlm
        EwPm5z7j05yjRWG0Sg9CEaOVJlk6PVb6DdU4GDU=
X-Google-Smtp-Source: ABdhPJyPV79BQ2uCKj76HlR0TVeqnv1xQY7tTPobo4YQa4vlL0N9qfMSsm12mGPd5V4mCSTtJXDyex63ftbLsCRq/2E=
X-Received: by 2002:a17:906:cb94:: with SMTP id mf20mr27925380ejb.8.1599582456391;
 Tue, 08 Sep 2020 09:27:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200906192935.107086-1-paul@crapouillou.net> <20200906192935.107086-7-paul@crapouillou.net>
In-Reply-To: <20200906192935.107086-7-paul@crapouillou.net>
From:   =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date:   Tue, 8 Sep 2020 18:27:25 +0200
Message-ID: <CAAdtpL4TLbjtMZojKhQ3mkYHusdnp_05fLhm44bGuEv0icP+Nw@mail.gmail.com>
Subject: Re: [PATCH v3 06/15] MIPS: generic: Allow boards to set system type
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "Maciej W . Rozycki" <macro@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Zhou Yanjie <zhouyanjie@wanyeetech.com>, od@zcrc.me,
        open list <linux-kernel@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Sep 6, 2020 at 9:31 PM Paul Cercueil <paul@crapouillou.net> wrote:
>
> Check for the (already existing) "system_type" variable in the
> get_system_type() function. If non-NULL, return it as the system type.

Nitpick: It is not already "existing", simply declared in asm/bootinfo.h.

>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>
> Notes:
>     v2: Instead of adding a .get_system_type callback to the mips_machine
>         struct, the boards now simply override the "system_type" variable
>         when they want to set a custom one.
>
>     v3: No change
>
>  arch/mips/generic/proc.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/mips/generic/proc.c b/arch/mips/generic/proc.c
> index 4c992809cc3f..cce2fde219a3 100644
> --- a/arch/mips/generic/proc.c
> +++ b/arch/mips/generic/proc.c
> @@ -8,11 +8,16 @@
>
>  #include <asm/bootinfo.h>
>
> +char *system_type;
> +
>  const char *get_system_type(void)
>  {
>         const char *str;
>         int err;
>
> +       if (system_type)
> +               return system_type;
> +
>         err = of_property_read_string(of_root, "model", &str);
>         if (!err)
>                 return str;
> --
> 2.28.0
>
