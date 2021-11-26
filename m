Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7345945EDC3
	for <lists+linux-mips@lfdr.de>; Fri, 26 Nov 2021 13:18:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350484AbhKZMVt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 26 Nov 2021 07:21:49 -0500
Received: from mail-ua1-f54.google.com ([209.85.222.54]:43930 "EHLO
        mail-ua1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229847AbhKZMTs (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 26 Nov 2021 07:19:48 -0500
Received: by mail-ua1-f54.google.com with SMTP id j14so18108425uan.10;
        Fri, 26 Nov 2021 04:16:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fVY0B9BtMXaBtpILjROtuDjtr53gY8EF4uMezskcBFc=;
        b=KFcUFcpREb5qpOXxAlLlV20urryq1sSs6d5yG2RH81c2ESmXoVzrgv7G0XNdT9ICWF
         FJNdZNYtx5q2Nbwol7Nty26ZQGRHw8Dtp2Nn0N1FBAHIYA3EvohljchI9Mf5l5c9Rwqc
         SLZ2IoaXe7cmChsUdiimVypfx9/YxLE7a9M6GF/H4JZOvgGRt+nLgVYm27NdWtBhMysd
         U3coF35CTlLlVD5t8Ph7WgO5OlwLVMos0tfVp062Tj7iWx5skscd6qdkSUWC50T66NEc
         MMWPo3fMSDRiLb0yID5gVPBZRZ2r1yzoQ6tltO41HbGApXDPOJYYKgWFMLnHoxstfavO
         R1MQ==
X-Gm-Message-State: AOAM5321XlT8kVNz7M0t8mnlYz6S385TVoaXQVZucXj69hzcBJA+iu2o
        fpjJlcMBU6zwO4RWY2fEDamWIlngahN+4Q==
X-Google-Smtp-Source: ABdhPJyNavhsQ1vEtLz86/P5+gdmerMjW863K94ykYlv2wZd3+sa9P1iezt68OcNHZrwCB+PC5iVVQ==
X-Received: by 2002:a05:6102:304a:: with SMTP id w10mr15825011vsa.32.1637928994579;
        Fri, 26 Nov 2021 04:16:34 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id l24sm3362505vkk.37.2021.11.26.04.16.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Nov 2021 04:16:34 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id l24so18242520uak.2;
        Fri, 26 Nov 2021 04:16:34 -0800 (PST)
X-Received: by 2002:a05:6102:3232:: with SMTP id x18mr16372830vsf.38.1637928993786;
 Fri, 26 Nov 2021 04:16:33 -0800 (PST)
MIME-Version: 1.0
References: <20211126102339.28908-1-andriy.shevchenko@linux.intel.com> <CAK8P3a3GuGgdp7Gq5N9XKTGhKbBUym9BiEb94RWyL1CDxS0ffw@mail.gmail.com>
In-Reply-To: <CAK8P3a3GuGgdp7Gq5N9XKTGhKbBUym9BiEb94RWyL1CDxS0ffw@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 26 Nov 2021 13:16:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV4HVn+GcCBNQ+1-Kva2XiHQ03L5y9JLXH7qONtBvkV+w@mail.gmail.com>
Message-ID: <CAMuHMdV4HVn+GcCBNQ+1-Kva2XiHQ03L5y9JLXH7qONtBvkV+w@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] MIPS: TXx9: Convert SPI platform data to software nodes
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Arnd,

On Fri, Nov 26, 2021 at 11:58 AM Arnd Bergmann <arnd@arndb.de> wrote:
> On Fri, Nov 26, 2021 at 11:23 AM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > In order to get rid of legacy platform data in AT25 driver,
> > convert its users to use software nodes.
> >
> > Suggested-by: Arnd Bergmann <arnd@arndb.de>
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> This looks good to me, thanks for cleaning this up! I think Geert has this
> hardware, adding him to Cc in case he wants to give it a spin.

The SPI controller is only present on TX4938, not on TX4927, so it is
unused on my rbtx4927 board.

> >  arch/mips/include/asm/txx9/spi.h    |  4 ++--
> >  arch/mips/txx9/generic/spi_eeprom.c | 32 +++++++++++++++++------------
> >  arch/mips/txx9/rbtx4938/setup.c     |  6 +++---
> >  3 files changed, 24 insertions(+), 18 deletions(-)

Probably all of this can be removed, given the SPI controller driver
itself was removed in commit 74523a5dae0c96d6 ("spi: txx9: Remove
driver")?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
