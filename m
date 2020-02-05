Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBFD815372B
	for <lists+linux-mips@lfdr.de>; Wed,  5 Feb 2020 19:02:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727149AbgBESCY convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Wed, 5 Feb 2020 13:02:24 -0500
Received: from mail-yw1-f68.google.com ([209.85.161.68]:37980 "EHLO
        mail-yw1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726957AbgBESCY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 5 Feb 2020 13:02:24 -0500
Received: by mail-yw1-f68.google.com with SMTP id 10so3220455ywv.5;
        Wed, 05 Feb 2020 10:02:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=D8m3zpziTMf/1DK49oOTnKVovL2jn4pQ/YQP25fOkNM=;
        b=Ypjh5SB/RW49YJWn7G7gMd7QmGSzXdi7rMgkcIyhZuNdSKX4F5NsmAttgjN09erHGw
         rrHjbKnPupz5TDJIfhDMoKKJA4x3gnz4Ut/YeAx0V3wjCAOYZI/TGgpgsJJzem7SUINg
         xbuUIG6PT22aCz447r2g8S+Myl2qmBHUoR3r3jeiwimPNi0ruuwDu8HhpsrLysKf6Qz3
         SsGe3wu7VJk6HxUKGvYcAaAh6YVcPe4lBY+hVkEOJrNvVMcWfSof4AYH+MwIeRamWnnx
         shfamKVQ78pF61lIQQq2rp6IbwV0533wdOnJbFqCD0jwx/qIgDU/9/oms043LAmX710n
         BLxA==
X-Gm-Message-State: APjAAAWrwml6sjqR0CQe6uRjbajZYg5MJcw2SjCuV+nNY71+htNl6KQr
        Fz/zpONHMSjnJUPU50VBd/Vzh6H2I5i3+P4QndE=
X-Google-Smtp-Source: APXvYqy1c38uBLDGGJ341PM5j5TAAE218gACbT2CX03aRP9JBZDvgjxAa+vHL8pEHWA2sJuLGbVLFN8YC44c7Jnxe0Q=
X-Received: by 2002:a25:8804:: with SMTP id c4mr7889151ybl.387.1580925742108;
 Wed, 05 Feb 2020 10:02:22 -0800 (PST)
MIME-Version: 1.0
References: <cover.1580610812.git.fthain@telegraphics.com.au> <d8f19ebc00a7688da739d41d584d081d1559f0d2.1580610812.git.fthain@telegraphics.com.au>
In-Reply-To: <d8f19ebc00a7688da739d41d584d081d1559f0d2.1580610812.git.fthain@telegraphics.com.au>
From:   =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date:   Wed, 5 Feb 2020 19:02:10 +0100
Message-ID: <CAAdtpL7SpzfqSmEcuVszNyXfrRegC20txoS5j7Ss3WkCmyRH+g@mail.gmail.com>
Subject: Re: [PATCH 1/3] fbdev/g364fb: Fix build failure
To:     Finn Thain <fthain@telegraphics.com.au>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        Laurent Vivier <laurent@vivier.eu>,
        Thomas Bogendoerfer <tbogendoerfer@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Feb 2, 2020 at 3:41 AM Finn Thain <fthain@telegraphics.com.au> wrote:
>
> This patch resolves these compiler errors and warnings --
>
>   CC      drivers/video/fbdev/g364fb.o
> drivers/video/fbdev/g364fb.c: In function 'g364fb_cursor':
> drivers/video/fbdev/g364fb.c:137:9: error: 'x' undeclared (first use in this function)
> drivers/video/fbdev/g364fb.c:137:9: note: each undeclared identifier is reported only once for each function it appears in
> drivers/video/fbdev/g364fb.c:137:7: error: implicit declaration of function 'fontwidth' [-Werror=implicit-function-declaration]
> drivers/video/fbdev/g364fb.c:137:23: error: 'p' undeclared (first use in this function)
> drivers/video/fbdev/g364fb.c:137:38: error: 'y' undeclared (first use in this function)
> drivers/video/fbdev/g364fb.c:137:7: error: implicit declaration of function 'fontheight' [-Werror=implicit-function-declaration]
> drivers/video/fbdev/g364fb.c: In function 'g364fb_init':
> drivers/video/fbdev/g364fb.c:233:24: error: 'fbvar' undeclared (first use in this function)
> drivers/video/fbdev/g364fb.c:234:24: error: 'xres' undeclared (first use in this function)

18 years unnoticed...

> drivers/video/fbdev/g364fb.c:201:14: warning: unused variable 'j' [-Wunused-variable]
> drivers/video/fbdev/g364fb.c:197:25: warning: unused variable 'pal_ptr' [-Wunused-variable]
>
> The MIPS Magnum framebuffer console now works when tested in QEMU.
>
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")

This commit is the kernel 'git origin' import, not the proper reference.

The actual change is between v2.5.17/2.5.19:
https://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git/diff/drivers/video/g364fb.c?id=b30e6e183a728923267
Date: 2002-05-22 07:52:33...

The same commit introduced the changes in g364fb_cursor(), which was
implemented previous to v2.4.0 so it is hard to follow from there.

Nobody complains during 18 years so I doubt anyone care that
g364fb_cursor() is removed.
And by removing it, you improve the kernel quality, so:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
(Maybe remove the unhelpful 'Fixes' tag).

> Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
> ---
>  drivers/video/fbdev/g364fb.c | 29 +++--------------------------
>  1 file changed, 3 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/video/fbdev/g364fb.c b/drivers/video/fbdev/g364fb.c
> index 223896cc5f7d..fb26230a3c7b 100644
> --- a/drivers/video/fbdev/g364fb.c
> +++ b/drivers/video/fbdev/g364fb.c
> @@ -108,7 +108,6 @@ static int g364fb_pan_display(struct fb_var_screeninfo *var,
>  static int g364fb_setcolreg(u_int regno, u_int red, u_int green,
>                             u_int blue, u_int transp,
>                             struct fb_info *info);
> -static int g364fb_cursor(struct fb_info *info, struct fb_cursor *cursor);
>  static int g364fb_blank(int blank, struct fb_info *info);
>
>  static struct fb_ops g364fb_ops = {
> @@ -119,28 +118,8 @@ static struct fb_ops g364fb_ops = {
>         .fb_fillrect    = cfb_fillrect,
>         .fb_copyarea    = cfb_copyarea,
>         .fb_imageblit   = cfb_imageblit,
> -       .fb_cursor      = g364fb_cursor,
>  };
>
> -int g364fb_cursor(struct fb_info *info, struct fb_cursor *cursor)
> -{
> -
> -       switch (cursor->enable) {
> -       case CM_ERASE:
> -               *(unsigned int *) CTLA_REG |= CURS_TOGGLE;
> -               break;
> -
> -       case CM_MOVE:
> -       case CM_DRAW:
> -               *(unsigned int *) CTLA_REG &= ~CURS_TOGGLE;
> -               *(unsigned int *) CURS_POS_REG =
> -                   ((x * fontwidth(p)) << 12) | ((y * fontheight(p)) -
> -                                                 info->var.yoffset);
> -               break;
> -       }
> -       return 0;
> -}
> -
>  /*
>   *  Pan or Wrap the Display
>   *
> @@ -194,11 +173,9 @@ static int g364fb_setcolreg(u_int regno, u_int red, u_int green,
>   */
>  int __init g364fb_init(void)
>  {
> -       volatile unsigned int *pal_ptr =
> -           (volatile unsigned int *) CLR_PAL_REG;
>         volatile unsigned int *curs_pal_ptr =
>             (volatile unsigned int *) CURS_PAL_REG;
> -       int mem, i, j;
> +       int mem, i;
>
>         if (fb_get_options("g364fb", NULL))
>                 return -ENODEV;
> @@ -230,8 +207,8 @@ int __init g364fb_init(void)
>          */
>         *(unsigned short *) (CURS_PAT_REG + 14 * 64) = 0xffff;
>         *(unsigned short *) (CURS_PAT_REG + 15 * 64) = 0xffff;
> -       fb_var.xres_virtual = fbvar.xres;
> -       fb_fix.line_length = (xres / 8) * fb_var.bits_per_pixel;
> +       fb_var.xres_virtual = fb_var.xres;
> +       fb_fix.line_length = fb_var.xres_virtual * fb_var.bits_per_pixel / 8;
>         fb_fix.smem_start = 0x40000000; /* physical address */
>         /* get size of video memory; this is special for the JAZZ hardware */
>         mem = (r4030_read_reg32(JAZZ_R4030_CONFIG) >> 8) & 3;
> --
> 2.24.1
>
