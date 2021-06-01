Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDF59396FC7
	for <lists+linux-mips@lfdr.de>; Tue,  1 Jun 2021 11:02:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233628AbhFAJEV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Jun 2021 05:04:21 -0400
Received: from mail-vs1-f43.google.com ([209.85.217.43]:44784 "EHLO
        mail-vs1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233657AbhFAJEU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 1 Jun 2021 05:04:20 -0400
Received: by mail-vs1-f43.google.com with SMTP id i29so7331909vsr.11;
        Tue, 01 Jun 2021 02:02:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EHcm9jYCYkNsG8BECBdpWu+jr0Tw+FYnyVu5lIqPjG8=;
        b=jqYnaPpVv1GMDd9bVIZdRJxaGUqDfV8IgSmhF6p5ax36SHeLJqM2rQ9MYBjX2sUi6h
         FD9GIICZPP0+XnFRUiLSZGF9tC0bzgJlKhDxzGCVVdApghgmjPBB0JSXzMTplToqoAkq
         QjQJ5k7UgWBQ3wuqahn42I68zHoZvBIkV8r/1m42VafZ6YukwbxSt7FmzVHnZavMT2uB
         G9OIN9X4/5nXpyOzXgM1Oq7Uzm0mU9sLOmcB6yjnmGTbWL44wQFe48ed06tn9bIEaVAC
         EO8O4EfDxU0gqRcQ9KL9xQlB0MUbFFZtEQ9oUt471jS9oszrBdA8rJC7q7dQ4PDi6xhC
         P+Xg==
X-Gm-Message-State: AOAM530KbfWXC2RnbEbFTMHRBOmIAcP4hVMK/xv4/jYeQdTP6hdoN2y6
        JBvqqQaoOnkI4/inmTsqc8mNffqWQ1OXLoFdq48=
X-Google-Smtp-Source: ABdhPJyZ21UVoefNYSXOVpP73WjDYTbPgjKQxsKz3oVlb9cWbWFg4HtkPdIzotLfRBwQmggKZ2rNQzwp99WVojmMtR4=
X-Received: by 2002:a05:6102:392:: with SMTP id m18mr17157052vsq.40.1622538157370;
 Tue, 01 Jun 2021 02:02:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210531184749.2475868-1-arnd@kernel.org> <20210531184749.2475868-5-arnd@kernel.org>
In-Reply-To: <20210531184749.2475868-5-arnd@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 1 Jun 2021 11:02:25 +0200
Message-ID: <CAMuHMdXFcohr2y8oR3VaddmDXjZx97o8jRJvfoppuHMrL=4xEg@mail.gmail.com>
Subject: Re: [PATCH 4/7] m68k: coldfire: use clkdev_lookup on most coldfire
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Dmitry Osipenko <digetx@gmail.com>,
        Florian Fainelli <florian@openwrt.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        John Crispin <john@phrozen.org>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Russell King <linux@armlinux.org.uk>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Arnd,

On Mon, May 31, 2021 at 8:49 PM Arnd Bergmann <arnd@kernel.org> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Coldfire is now the only target that implements the clk_get()/clk_put()
> helpers itself rather than using the common implementation.
>
> Most coldfire variants only have two distinct clocks and use the clk
> code purely for lookup. Change those over to use clkdev_lookup instead
> but leave the custom clk interface for those two clocks.
>
> Also leave the four SoCs that have gated clocks.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Thanks for your patch!

> --- a/arch/m68k/coldfire/m527x.c
> +++ b/arch/m68k/coldfire/m527x.c

> @@ -97,7 +86,7 @@ static void __init m527x_i2c_init(void)
>         /*  set PAR_SCL to SCL and PAR_SDA to SDA */
>         par = readw(MCFGPIO_PAR_FECI2C);
>         par |= 0x0f;
> -       writew(par, MCFGPIO_PAR_FECI2C);
> +       wm527x_clk_lookupritew(par, MCFGPIO_PAR_FECI2C);

As reported by the kernel test robot, this fails to compile.
Should probably just stay "write".

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
