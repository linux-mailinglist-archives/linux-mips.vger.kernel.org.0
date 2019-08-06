Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6C5183877
	for <lists+linux-mips@lfdr.de>; Tue,  6 Aug 2019 20:16:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730373AbfHFSQD convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Tue, 6 Aug 2019 14:16:03 -0400
Received: from mail-yb1-f195.google.com ([209.85.219.195]:41897 "EHLO
        mail-yb1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726373AbfHFSQC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 6 Aug 2019 14:16:02 -0400
Received: by mail-yb1-f195.google.com with SMTP id x188so8802492yba.8;
        Tue, 06 Aug 2019 11:16:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=uRafBTDMBjTvHKV2v0W2ocmyW8oxhcyjl8OuCW8KKpk=;
        b=V6766grtOTciLDI60ThaFYVhEvL9guKmIvzYoVESyUSBEvAZQ85PasiJ7sXBa7givy
         WUvcEaWOeAxBGhMhSKqP70MZS1n8uXBa06JSQZVZyJEM7NfyxzR/DfHx/MPVvZnYbeFH
         HabZZGSGnFIFGFl3WwVXxJmPg3MSoxcgcEK/kcPrakLa0+bwXL4VdjQHBt//FLLB776D
         quCt8xrR+DDUY+CUFqzHo21LtjV3DeRu0EXKaCq1Z+feB9EDUy+iF5np0S42VSYM7ynP
         hfOgGe8aghCLisBI5P+AfuWUlNf63cSzJaBdjF8OqIvq9frmer/W6MZRYDakM7QnYn5x
         NKeA==
X-Gm-Message-State: APjAAAUHoud7YysAyMWt9u0c6j8R+Sgl6yFcOqiypmPBh+Y91bWvu1p5
        2/hMKBPk7k3/dOpaTehz2J9CyXIMbLcZxeNvutw=
X-Google-Smtp-Source: APXvYqz0ie1VExybZGhZgDfu505MGE+a+39mqnOYkI3V/mDbdlmTbKQDByXcVDmU1YGQZWUYuxZ/qsZyNwMnHAZjYVg=
X-Received: by 2002:a25:aa85:: with SMTP id t5mr3779024ybi.376.1565115362068;
 Tue, 06 Aug 2019 11:16:02 -0700 (PDT)
MIME-Version: 1.0
References: <1565001715-22966-1-git-send-email-linux@roeck-us.net>
In-Reply-To: <1565001715-22966-1-git-send-email-linux@roeck-us.net>
From:   =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date:   Tue, 6 Aug 2019 20:15:51 +0200
Message-ID: <CAAdtpL634spP0friWLstK9Ehy5BaHxS3u+GhrEGKsF-1_uCENQ@mail.gmail.com>
Subject: Re: [PATCH] MIPS: OCTEON: octeon-usb: Mark expected switch fall-through
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "Gustavo A . R . Silva" <gustavo@embeddedor.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Aug 5, 2019 at 12:42 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> Since commit a035d552a93b ("Makefile: Globally enable fall-through
> warning"), cavium_octeon_defconfig builds fail with
>
> In file included from
> arch/mips/cavium-octeon/octeon-usb.c:12:
> arch/mips/cavium-octeon/octeon-usb.c: In function 'dwc3_octeon_clocks_start':
> include/linux/device.h:1499:2: error: this statement may fall through
>   _dev_err(dev, dev_fmt(fmt), ##__VA_ARGS__)
>   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> arch/mips/cavium-octeon/octeon-usb.c:399:3: note:
>                         in expansion of macro 'dev_err'
>   dev_err(dev, "Invalid ref_clk %u, using 100000000 instead\n",
>   ^~~~~~~
> arch/mips/cavium-octeon/octeon-usb.c:401:2: note: here
>   case 100000000:
>   ^~~~~~~
>
> Mark the switch case to expect fall through.
>
> Cc: Gustavo A. R. Silva <gustavo@embeddedor.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  arch/mips/cavium-octeon/octeon-usb.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/mips/cavium-octeon/octeon-usb.c b/arch/mips/cavium-octeon/octeon-usb.c
> index 1f730ded5224..8a16ab37aa11 100644
> --- a/arch/mips/cavium-octeon/octeon-usb.c
> +++ b/arch/mips/cavium-octeon/octeon-usb.c
> @@ -398,6 +398,7 @@ static int dwc3_octeon_clocks_start(struct device *dev, u64 base)
>         default:
>                 dev_err(dev, "Invalid ref_clk %u, using 100000000 instead\n",
>                         clock_rate);
> +               /* Fall through */
>         case 100000000:
>                 mpll_mul = 0x19;
>                 if (ref_clk_sel < 2)
> --
> 2.7.4
>
