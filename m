Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BB0F154F2A
	for <lists+linux-mips@lfdr.de>; Fri,  7 Feb 2020 00:01:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726597AbgBFXAz convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Thu, 6 Feb 2020 18:00:55 -0500
Received: from mail-yb1-f195.google.com ([209.85.219.195]:47061 "EHLO
        mail-yb1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726502AbgBFXAz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 6 Feb 2020 18:00:55 -0500
Received: by mail-yb1-f195.google.com with SMTP id p129so283451ybc.13;
        Thu, 06 Feb 2020 15:00:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=VQYnEkzdsx6FcrPlo/D/oQKv9dN+G7wSduoN4f5PK8M=;
        b=ug5LAawbJXxGhu9pqVPQRZlGLuXTRaUxcms89eTohEXyh8dNUBk6rrIqcloMMhCxvF
         28BX8wKn6tLa9a4Vc8doUkcLc7M9R7mHnPFraHtmyt4nnFrdhv/EYWhxGtacn5TqOtp/
         /vkHSYq62rtzDWEFILR5iO/SuDlzL7/9K9b9Q0QVItnJip9PjxMrJxWQispwRNx9lbA4
         IuLsj82sUrLA5EWaq9Xnbf1ulUDcgg25mRsVrXKCtY6gAccmn/Gvr0lYcHIGvHPk/EXo
         vZiPu4X6RFIoyqRzv496La3zva7P/HotY2dSu0DYnTeMJbbkPAJLoMe7euNRyWdHMsXM
         vNuQ==
X-Gm-Message-State: APjAAAXAmyPcmhhXyxmxY3UgvQLdyq/quoI7LCLKVMV3aiw5uYk+Dd4T
        KFopE8ccXJXtMQyjz0OG/cYrzT2l8ED8NnF+/2c=
X-Google-Smtp-Source: APXvYqyOB0JukSiXvpxti6fIGil3NzpwdBO3vGFGVcPJKWqMTSvfKT3wEmNZMFtDMAByjGMe2TA9r8AsZw8mPtb6prE=
X-Received: by 2002:a25:ccc6:: with SMTP id l189mr5166473ybf.312.1581030052579;
 Thu, 06 Feb 2020 15:00:52 -0800 (PST)
MIME-Version: 1.0
References: <cover.1580610812.git.fthain@telegraphics.com.au>
 <d8f19ebc00a7688da739d41d584d081d1559f0d2.1580610812.git.fthain@telegraphics.com.au>
 <CAAdtpL7SpzfqSmEcuVszNyXfrRegC20txoS5j7Ss3WkCmyRH+g@mail.gmail.com> <alpine.LNX.2.22.394.2002060829410.8@nippy.intranet>
In-Reply-To: <alpine.LNX.2.22.394.2002060829410.8@nippy.intranet>
From:   =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date:   Fri, 7 Feb 2020 00:00:41 +0100
Message-ID: <CAAdtpL5Cz5YGKZVfbA=X8qMtP7jDc0G7igSj3EB=PfazM5JoDg@mail.gmail.com>
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

On Wed, Feb 5, 2020 at 11:18 PM Finn Thain <fthain@telegraphics.com.au> wrote:
> On Wed, 5 Feb 2020, Philippe Mathieu-Daudé wrote:
> > On Sun, Feb 2, 2020 at 3:41 AM Finn Thain <fthain@telegraphics.com.au> wrote:
> > >
> > > This patch resolves these compiler errors and warnings --
> > >
> > >   CC      drivers/video/fbdev/g364fb.o
> > > drivers/video/fbdev/g364fb.c: In function 'g364fb_cursor':
> > > drivers/video/fbdev/g364fb.c:137:9: error: 'x' undeclared (first use in this function)
> > > drivers/video/fbdev/g364fb.c:137:9: note: each undeclared identifier is reported only once for each function it appears in
> > > drivers/video/fbdev/g364fb.c:137:7: error: implicit declaration of function 'fontwidth' [-Werror=implicit-function-declaration]
> > > drivers/video/fbdev/g364fb.c:137:23: error: 'p' undeclared (first use in this function)
> > > drivers/video/fbdev/g364fb.c:137:38: error: 'y' undeclared (first use in this function)
> > > drivers/video/fbdev/g364fb.c:137:7: error: implicit declaration of function 'fontheight' [-Werror=implicit-function-declaration]
> > > drivers/video/fbdev/g364fb.c: In function 'g364fb_init':
> > > drivers/video/fbdev/g364fb.c:233:24: error: 'fbvar' undeclared (first use in this function)
> > > drivers/video/fbdev/g364fb.c:234:24: error: 'xres' undeclared (first use in this function)
> >
> > 18 years unnoticed...
> >
>
> More likely, it was noticed by those without the skills or time to get it
> fixed upstream.
>
> Those with the hardware skills and platform knowledge to be affected by an
> obscure bug aren't necessarily also capable of fixing a kernel bug,
> sending a patch upstream and getting it past code review.
>
> Getting a patch into the Linux kernel is itself a lot of work, unless
> you've had years of experience with that constantly changing process
> (which varies significantly between subsystems).

I see, I'm not custom to kernel workflow.

> Kernel developers are only human and do accidentally introduce breakage in
> their work (as contributors) while ironically (as reviewers) they raise
> the bar for random fixes from users not versed in the 10000+ lines of
> Documentation/process/*.rst
>
> Broken code does not mean zero potential users or zero frustrated users
> yet I often hear kernel developers disingenuously claim that it does.
> They have an incentive to make that claim and often there's no-one reading
> the mailing lists to push back.

But broken code is also bad example of code. The removed code is still
buried in the git tree.

> > > drivers/video/fbdev/g364fb.c:201:14: warning: unused variable 'j' [-Wunused-variable]
> > > drivers/video/fbdev/g364fb.c:197:25: warning: unused variable 'pal_ptr' [-Wunused-variable]
> > >
> > > The MIPS Magnum framebuffer console now works when tested in QEMU.
> > >
> > > Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> > > Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> >
> > This commit is the kernel 'git origin' import, not the proper reference.
> >
> > The actual change is between v2.5.17/2.5.19:
> > https://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git/diff/drivers/video/g364fb.c?id=b30e6e183a728923267
> > Date: 2002-05-22 07:52:33...
> >
>
> I think the driver was broken before that point. I didn't compile it, but
> it seems that "xres" still has no declaration.
>
> BTW, is it wise to cite a sha-1 that doesn't exist in mainline?

I didn't want to suggest referencing an external sha1, but rather the full link.
Anyway I later figured out your reference isn't incorrect, this code
was really added in commit 1da177e4c3f4.

Maybe you can use:
Fixes: 1da177e4c3f4 (code modified earlier during v2.5.17-v2.5.19)

Anyway I'm bike-shedding, whichever reference you choose will be fine, even
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")

>
> $ git show b30e6e183a728923267
> fatal: ambiguous argument 'b30e6e183a728923267': unknown revision or path
> not in the working tree.
>
> I'd prefer to use a tag like this,
> References: https://git.kernel.org/tglx/history/c/b30e6e183a728923267
>
> FWIW, if you search for "tglx.history" in git log, you can find other
> stuff, like "Histroy Tree:" [sic] and "History-tree:". I don't know what
> the canonical form is.
>
> > The same commit introduced the changes in g364fb_cursor(), which was
> > implemented previous to v2.4.0 so it is hard to follow from there.
> >
> > Nobody complains during 18 years so I doubt anyone care that
> > g364fb_cursor() is removed.
>
> Right. The .fb_cursor method is optional (not all framebuffers have a
> hardware cursor).
>
> > And by removing it, you improve the kernel quality, so:
> > Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> > (Maybe remove the unhelpful 'Fixes' tag).
> >
>
> In the past I've seen other reviewers of other patches say the same thing
> ("Please remove Fixes: Linux 2.6.12-rc2"). I don't know why.
>
> I used that tag because it indicates that the patch can be backported at
> least as far as the stated commit. Certainly the bug exists in Linux
> 2.6.12-rc2, so the "Fixes" tag is meaningful in that sense.

Yes, agreed.

>
> > > Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
> > > ---
> > >  drivers/video/fbdev/g364fb.c | 29 +++--------------------------
> > >  1 file changed, 3 insertions(+), 26 deletions(-)
> > >
> > > diff --git a/drivers/video/fbdev/g364fb.c b/drivers/video/fbdev/g364fb.c
> > > index 223896cc5f7d..fb26230a3c7b 100644
> > > --- a/drivers/video/fbdev/g364fb.c
> > > +++ b/drivers/video/fbdev/g364fb.c
> > > @@ -108,7 +108,6 @@ static int g364fb_pan_display(struct fb_var_screeninfo *var,
> > >  static int g364fb_setcolreg(u_int regno, u_int red, u_int green,
> > >                             u_int blue, u_int transp,
> > >                             struct fb_info *info);
> > > -static int g364fb_cursor(struct fb_info *info, struct fb_cursor *cursor);
> > >  static int g364fb_blank(int blank, struct fb_info *info);
> > >
> > >  static struct fb_ops g364fb_ops = {
> > > @@ -119,28 +118,8 @@ static struct fb_ops g364fb_ops = {
> > >         .fb_fillrect    = cfb_fillrect,
> > >         .fb_copyarea    = cfb_copyarea,
> > >         .fb_imageblit   = cfb_imageblit,
> > > -       .fb_cursor      = g364fb_cursor,
> > >  };
> > >
> > > -int g364fb_cursor(struct fb_info *info, struct fb_cursor *cursor)
> > > -{
> > > -
> > > -       switch (cursor->enable) {
> > > -       case CM_ERASE:
> > > -               *(unsigned int *) CTLA_REG |= CURS_TOGGLE;
> > > -               break;
> > > -
> > > -       case CM_MOVE:
> > > -       case CM_DRAW:
> > > -               *(unsigned int *) CTLA_REG &= ~CURS_TOGGLE;
> > > -               *(unsigned int *) CURS_POS_REG =
> > > -                   ((x * fontwidth(p)) << 12) | ((y * fontheight(p)) -
> > > -                                                 info->var.yoffset);
> > > -               break;
> > > -       }
> > > -       return 0;
> > > -}
> > > -
> > >  /*
> > >   *  Pan or Wrap the Display
> > >   *
> > > @@ -194,11 +173,9 @@ static int g364fb_setcolreg(u_int regno, u_int red, u_int green,
> > >   */
> > >  int __init g364fb_init(void)
> > >  {
> > > -       volatile unsigned int *pal_ptr =
> > > -           (volatile unsigned int *) CLR_PAL_REG;
> > >         volatile unsigned int *curs_pal_ptr =
> > >             (volatile unsigned int *) CURS_PAL_REG;
> > > -       int mem, i, j;
> > > +       int mem, i;
> > >
> > >         if (fb_get_options("g364fb", NULL))
> > >                 return -ENODEV;
> > > @@ -230,8 +207,8 @@ int __init g364fb_init(void)
> > >          */
> > >         *(unsigned short *) (CURS_PAT_REG + 14 * 64) = 0xffff;
> > >         *(unsigned short *) (CURS_PAT_REG + 15 * 64) = 0xffff;
> > > -       fb_var.xres_virtual = fbvar.xres;
> > > -       fb_fix.line_length = (xres / 8) * fb_var.bits_per_pixel;
> > > +       fb_var.xres_virtual = fb_var.xres;
> > > +       fb_fix.line_length = fb_var.xres_virtual * fb_var.bits_per_pixel / 8;
> > >         fb_fix.smem_start = 0x40000000; /* physical address */
> > >         /* get size of video memory; this is special for the JAZZ hardware */
> > >         mem = (r4030_read_reg32(JAZZ_R4030_CONFIG) >> 8) & 3;
> > > --
> > > 2.24.1
> > >
> >
