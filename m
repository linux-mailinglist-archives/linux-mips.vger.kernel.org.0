Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EECC0345A1C
	for <lists+linux-mips@lfdr.de>; Tue, 23 Mar 2021 09:53:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229865AbhCWIxG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 Mar 2021 04:53:06 -0400
Received: from mail-vk1-f181.google.com ([209.85.221.181]:36598 "EHLO
        mail-vk1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbhCWIwo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 23 Mar 2021 04:52:44 -0400
Received: by mail-vk1-f181.google.com with SMTP id d82so4457941vkd.3;
        Tue, 23 Mar 2021 01:52:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q7WRAMIZJoqc2Ec4+x+TiEIRRnKNypz85AMrAXWBw98=;
        b=SXMOHkBxA9FNKaCoso0t5c0sems1m4osg18uY0Bdc2EdJLJ9AaPpjkbAbI2Sr5aDte
         8joXv+q6NpoelcsTR2xP9+b8z/HZ804nuX8FbVwl2x0G6AuNkuAzNkLslRtwDBIlJ+Hx
         hqJ5Ph2GxErTHLSdMVYp4RtUa9cGqRKaaPF5RldrCAf5F1PLmN0zbXq/0QyFkv2dkXFQ
         C4oIkT1KZXdZdbkWYh028nehLdIMCW9xxKSYhhU4ofRSHyfm3vV5OnjGkuDOeLEQFtux
         zXiQUsgfAqvZuKMzdewEYOaQ93l2/40SK1XJ7NYsFuNDTQPsI1JJi4JCePBYDTVZ09/s
         xZdw==
X-Gm-Message-State: AOAM531GFHeggtikEf+xv2j7udiZ3a7cCBO779yf+tnKLQv7sP9umyIv
        G4IZ1hZQrPJPY2TwV1dFgHryAnHkTbbC6UV0JgVF7Gda
X-Google-Smtp-Source: ABdhPJyIToZOKaPAFwE+JvnYaUWffsHieuijU5rVIydjDtw9vurwo7Hz/UQFTNltyHckNnHP0OgbN8w43j085RBLKa0=
X-Received: by 2002:a1f:e543:: with SMTP id c64mr2768887vkh.2.1616489563968;
 Tue, 23 Mar 2021 01:52:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210322144848.1065067-1-geert@linux-m68k.org>
 <20210322144848.1065067-7-geert@linux-m68k.org> <8a5e3e480022990f0889864d0ace56a0@protonic.nl>
In-Reply-To: <8a5e3e480022990f0889864d0ace56a0@protonic.nl>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 23 Mar 2021 09:52:32 +0100
Message-ID: <CAMuHMdVnn3r0XOo-FiTq1YQ1Efy_9Kg72vq5TUOORAv_tkuOUg@mail.gmail.com>
Subject: Re: [PATCH 06/17] auxdisplay: Extract character line display core support
To:     Robin van der Gracht <robin@protonic.nl>
Cc:     Rob Herring <robh+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Robin,

On Tue, Mar 23, 2021 at 9:18 AM robin <robin@protonic.nl> wrote:
> On 2021-03-22 15:48, Geert Uytterhoeven wrote:
> > Extract the character line display core support from the simple ASCII
> > LCD driver for the MIPS Boston, Malta & SEAD3 development boards into
> > its own subdriver, so it can be reused for other displays.
> >
> > Note that this moves the "message" device attribute in sysfs in a
> > "linedisp.N" subdirectory.
> >
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

> > --- a/drivers/auxdisplay/Kconfig
> > +++ b/drivers/auxdisplay/Kconfig
> > @@ -25,6 +25,12 @@ config CHARLCD
> >         This is some character LCD core interface that multiple drivers can
> >         use.
> >
> > +config LINEDISP
> > +     tristate "Character line display core support" if COMPILE_TEST
> > +     help
> > +       This is the core support for single-line character displays, to be
> > +       selected by drivers that use it.
> > +
> >  config HD44780_COMMON
> >       tristate "Common functions for HD44780 (and compatibles) LCD
> > displays" if COMPILE_TEST
> >       select CHARLCD
> > @@ -155,6 +161,7 @@ config IMG_ASCII_LCD
> >       depends on HAS_IOMEM
> >       default y if MIPS_MALTA
> >       select MFD_SYSCON
> > +     select LINEDISP
> >       help
> >         Enable this to support the simple ASCII LCD displays found on
> >         development boards such as the MIPS Boston, MIPS Malta & MIPS SEAD3
> > @@ -169,6 +176,7 @@ config HT16K33
> >       select FB_SYS_IMAGEBLIT
> >       select INPUT_MATRIXKMAP
> >       select FB_BACKLIGHT
> > +     select LINEDISP
>
> At this point in your patch stack it's not used by the ht16k33 driver. I
> think it
> would be nicer to add this dependency when the code actually starts
> depending on it.
> So that when this patch stack gets applied partially or not in one go
> the chunks
> would be independent.

Indeed, I messed up the order. Will fix.
Thanks for spotting!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
