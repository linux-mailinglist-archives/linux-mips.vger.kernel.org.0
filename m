Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2D053A4777
	for <lists+linux-mips@lfdr.de>; Fri, 11 Jun 2021 19:07:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229705AbhFKRJ3 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Fri, 11 Jun 2021 13:09:29 -0400
Received: from mail-oi1-f169.google.com ([209.85.167.169]:36413 "EHLO
        mail-oi1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbhFKRJ2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 11 Jun 2021 13:09:28 -0400
Received: by mail-oi1-f169.google.com with SMTP id r16so6142911oiw.3;
        Fri, 11 Jun 2021 10:07:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Ck7OEi24f4uKBhqmibeOSwG79LbyJPaTcVVNYApKKj0=;
        b=Qc/fUFGkFkNo9zvU+0gaXxQsnS1w4bd5rmcnIshUEVIjtzSPp1Nh4F83EGew8ebrki
         45QRX7Bqx0lDu0m4zADIs2kZdRlmf9DBS5r24aPIL2gHuYa6siz7ZwlCXS0adw6OGT0C
         jvCba+33Wj8D+yjUWmYlbwaptZtC3q7M2/6Qmd0mL5kFnBKwaiOnfcqSnnbtM8Bgghey
         kt4uS1w8NfqpH1q/uJ5Sw9o9YGtpC6vNtsL0uIeElBos7An1A8eR5DHpFiFqSBHDfbZe
         7jsm3azq8fL9d5gXHa861AJCMypCeQ1mMYbEXwYeWEVdzuajtLyPInvgJGD0y5+oedE3
         KHJg==
X-Gm-Message-State: AOAM532QMjOIKVu1jgQeDbSPp40zhnb0UcmTOJ/pIqPJ9P0iV7rdxGt4
        Tvmw7R9IDTXCsQlR/st7RYWK6GuS5vRV/q6UFZ8=
X-Google-Smtp-Source: ABdhPJwBIl48kQYiCuMbEQW0bhmYz+JgXv8s+YXBspjKbMq8PWRubBBksZFntvhrAXUqZsVnijGBtLfBJZ7iJryFWgE=
X-Received: by 2002:aca:fd44:: with SMTP id b65mr14536778oii.175.1623431240917;
 Fri, 11 Jun 2021 10:07:20 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.21.2105161721220.3032@angie.orcam.me.uk> <alpine.DEB.2.21.2105181508460.3032@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2105181508460.3032@angie.orcam.me.uk>
From:   =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date:   Fri, 11 Jun 2021 19:07:09 +0200
Message-ID: <CAAdtpL7C2UEJT87V3vTqoyLUFQWSLo=+Fa5rHVTnc2gBf+n4Dw@mail.gmail.com>
Subject: Re: [PATCH 1/2] serial: 8250: Mask out floating 16/32-bit bus bits
To:     "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jun 10, 2021 at 8:39 PM Maciej W. Rozycki <macro@orcam.me.uk> wrote:
>
> Make sure only actual 8 bits of the IIR register are used in determining
> the port type in `autoconfig'.
>
> The `serial_in' port accessor returns the `unsigned int' type, meaning
> that with UPIO_AU, UPIO_MEM16, UPIO_MEM32, and UPIO_MEM32BE access types
> more than 8 bits of data are returned, of which the high order bits will
> often come from bus lines that are left floating in the data phase.  For
> example with the MIPS Malta board's CBUS UART, where the registers are
> aligned on 8-byte boundaries and which uses 32-bit accesses, data as
> follows is returned:
>
> YAMON> dump -32 0xbf000900 0x40
>
> BF000900: 1F000942 1F000942 1F000900 1F000900  ...B...B........
> BF000910: 1F000901 1F000901 1F000900 1F000900  ................
> BF000920: 1F000900 1F000900 1F000960 1F000960  ...........`...`
> BF000930: 1F000900 1F000900 1F0009FF 1F0009FF  ................
>
> YAMON>
>
> Evidently high-order 24 bits return values previously driven in the
> address phase (the 3 highest order address bits used with the command
> above are masked out in the simple virtual address mapping used here and
> come out at zeros on the external bus), a common scenario with bus lines
> left floating, due to bus capacitance.
>
> Consequently when the value of IIR, mapped at 0x1f000910, is retrieved
> in `autoconfig', it comes out at 0x1f0009c1 and when it is right-shifted
> by 6 and then assigned to 8-bit `scratch' variable, the value calculated
> is 0x27, not one of 0, 1, 2, 3 expected in port type determination.
>
> Fix the issue then, by assigning the value returned from `serial_in' to
> `scratch' first, which masks out 24 high-order bits retrieved, and only
> then right-shift the resulting 8-bit data quantity, producing the value
> of 3 in this case, as expected.  Fix the same issue in `serial_dl_read'.
>
> The problem first appeared with Linux 2.6.9-rc3 which predates our repo
> history, but the origin could be identified with the old MIPS/Linux repo
> also at: <git://git.kernel.org/pub/scm/linux/kernel/git/ralf/linux.git>
> as commit e0d2356c0777 ("Merge with Linux 2.6.9-rc3."), where code in
> `serial_in' was updated with this case:
>
> +       case UPIO_MEM32:
> +               return readl(up->port.membase + offset);
> +
>
> which made it produce results outside the unsigned 8-bit range for the
> first time, though obviously it is system dependent what actual values
> appear in the high order bits retrieved and it may well have been zeros
> in the relevant positions with the system the change originally was
> intended for.  It is at that point that code in `autoconf' should have
> been updated accordingly, but clearly it was overlooked.
>
> Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> ---
>  drivers/tty/serial/8250/8250_port.c |    9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
