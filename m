Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09EA83986AE
	for <lists+linux-mips@lfdr.de>; Wed,  2 Jun 2021 12:39:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231877AbhFBKkw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 2 Jun 2021 06:40:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:35210 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229541AbhFBKkw (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 2 Jun 2021 06:40:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4E25F613BE;
        Wed,  2 Jun 2021 10:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622630349;
        bh=xscBNGdgmKGqvdZAiQKuvfYAUc7B9BbcxRBT59+5ZOY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Hz/A98NJ/xcvhZd9ZNyMVQi6zUvnUC0/7LUrDDbXTguMX84mAQdH6yhT2gck95c2a
         N/i3Hma2f2kRJOdtkvmq6jZ6zf1ZUha43C3lZjmkQnwSD4JTGzuOpHjr67lUnryRbg
         p8QtEHupGkLdwAclzswPZgcIeG3BJsU533I0k6Op+iufhQ3qe09HiF7gX8bydjda8w
         Wzfi4UDXUSyhQUHxDnHDoQ9suKhhi5OieKFlNFShWzmNkSKEBP3VfZbOmLNb39wr6y
         2DA+ggnsYCNFipkC3tc4vF5gZrBcCp+sf9K/HPIm8GAsIoX3mR770sjC9fpG5ctNnp
         3raIywYDT2VjQ==
Received: by mail-wr1-f53.google.com with SMTP id c5so1757646wrq.9;
        Wed, 02 Jun 2021 03:39:09 -0700 (PDT)
X-Gm-Message-State: AOAM531nca26DQxZJRiEURKRRduLfUYCH59B/JzkN4bHNr/uy1bBVnvq
        rV6IuZkbXRz3eGl/5v89YqtQzBFO/Nmt4zjvMHw=
X-Google-Smtp-Source: ABdhPJw1yDtR1g+RhxgV73exD8GZ7Zlc3UlK2QOxfUHJQ0YgqPNiNyVgdN0aBIvksGMnFyNkUFE9lTL3NcJjxiDkPBk=
X-Received: by 2002:adf:a28c:: with SMTP id s12mr34315203wra.105.1622630347892;
 Wed, 02 Jun 2021 03:39:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210531184749.2475868-1-arnd@kernel.org> <20210601095129.GF6961@alpha.franken.de>
 <CAK8P3a2Ueg0UFZisrzrrL_MkBLnu6TbMtVGx4_wO0d6rj48weg@mail.gmail.com> <162258513314.4130789.12039373985147120919@swboyd.mtv.corp.google.com>
In-Reply-To: <162258513314.4130789.12039373985147120919@swboyd.mtv.corp.google.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Wed, 2 Jun 2021 12:37:29 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3VtsTfkJKuVzMP30qPSEUE+W4MJ0aUg=-v5n+cafn0Ag@mail.gmail.com>
Message-ID: <CAK8P3a3VtsTfkJKuVzMP30qPSEUE+W4MJ0aUg=-v5n+cafn0Ag@mail.gmail.com>
Subject: Re: [PATCH 0/7] clk: clean up legacy clock interfaces
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-clk <linux-clk@vger.kernel.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        Florian Fainelli <florian@openwrt.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Ungerer <gerg@linux-m68k.org>,
        John Crispin <john@phrozen.org>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Russell King <linux@armlinux.org.uk>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        BROADCOM NVRAM DRIVER <linux-mips@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Jun 2, 2021 at 12:05 AM Stephen Boyd <sboyd@kernel.org> wrote:
> Quoting Arnd Bergmann (2021-06-01 05:24:59)
> > On Tue, Jun 1, 2021 at 11:51 AM Thomas Bogendoerfer
> > <tsbogend@alpha.franken.de> wrote:
> > >
> > > On Mon, May 31, 2021 at 08:47:42PM +0200, Arnd Bergmann wrote:
> > > > As I noticed that the ar7 clock implementation and the ralink version
> > > > are rather trivial, I ended up converting those to use the common-clk
> > > > interfaces as well, though this is unrelated to the other changes.
> > >
> > > excellent, how is your plan for merging the series ?
> >
> > I have not decided yet. I think it would be best to keep the series together
> > and merge it through the clk maintainer tree, or possibly my asm-generic
> > tree, but as there is no rush, we could also do the mips and m68k bits
> > through the architecture trees, and defer the rest for 5.15.
> >
>
> I'm happy to take the series through clk tree if that helps.

Ok, great. I've addressed all the issues that were pointed out, but it
would be good to get an Acked-by or some testing for the MIPS
(ar7 and ralink) bits. Thomas and John, let me know if you find
something that needs to be addressed first, or if you are happy
me to send the latest version for merging.

       Arnd
