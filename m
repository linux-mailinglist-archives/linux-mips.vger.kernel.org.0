Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C866F1565B3
	for <lists+linux-mips@lfdr.de>; Sat,  8 Feb 2020 18:17:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727392AbgBHRRE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 8 Feb 2020 12:17:04 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:39706 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727341AbgBHRRD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 8 Feb 2020 12:17:03 -0500
Received: by mail-wm1-f67.google.com with SMTP id c84so6050253wme.4;
        Sat, 08 Feb 2020 09:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tlJ/vckZeI91VzkDgxtSb4e3JuionnABQlaSnybK7BM=;
        b=X+85D0vwhKbejNfGqazNfql0+7igwTNm40FiKu8te2gKExwu87WTQehulNKLHDhkrM
         rH/dy56qJhQNmxl3KtZv2s+2dIkKYp4oUnciZpKvGfjko2tZaVj3fzd/VvcXlaYYaI5V
         P6J9bdKhuRWhpEdFRnTnuHEr4pdH1Xwxx7TNdk07QfwcaeZZISUqPnNPuBzVpPxBaYCV
         onCOPWuZtxsseCaHM2nKBGMcXQoBt4c+39w20kQUmFOYZUhfoyOt2+E4CxZ7gnTypJIL
         TZhgg0ho8PXdjh5X7QtrCD400IMfNR6PDQ2j0xaO7NX0X6kocOp6KDoLDxGyvAIOAFKC
         Lbag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=tlJ/vckZeI91VzkDgxtSb4e3JuionnABQlaSnybK7BM=;
        b=t4clssszuFT/V78kqK3KNZf4M1cUXWYDjjknXZN/09z9hefdqNDeJzG779W1qE/cly
         20ZDkbD5a0p+I8F+o4sCEh39qLbVxiflUi3Ii9SrtoujXzYxISoWaB+KEm8eoDI+kr+s
         Ll6CYyosj4mPkC/q/mH+fLySY3SGa2dVYgYxrd2jxZ8FLX169mTbL+ctUxT20hZkXD4L
         ffU22+i5O9LYigvtTyh219V2RbvHQlqaeJiwHbtMGBgXSZ0zEt+BvjMBw8OroVDQKZqV
         CdW5HeO0tQ43ev86Ei1PINtTEXY4xy72hKGMvGIpgB9gbYQinvQ4IkQNKJiSgPvx2TL2
         K1Bg==
X-Gm-Message-State: APjAAAW6XNFNHRS7riv2hAx70q39ZBB5bpwEFv0rJW2etuwgatmbkAkC
        0abmg2UIvMQrRw9/arhjp2gHYKWl
X-Google-Smtp-Source: APXvYqx+d48ubAFBGX5Uw/lQDSK93Q8wRHqwB3BmhCdqWWIE6x2xPOPFq7PeUn6xHddhNGEg2nzVJA==
X-Received: by 2002:a1c:a1c3:: with SMTP id k186mr2156509wme.179.1581182220222;
        Sat, 08 Feb 2020 09:17:00 -0800 (PST)
Received: from [192.168.1.35] (78.red-88-21-202.staticip.rima-tde.net. [88.21.202.78])
        by smtp.gmail.com with ESMTPSA id b18sm8405621wru.50.2020.02.08.09.16.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Feb 2020 09:16:59 -0800 (PST)
Subject: Re: [PATCH v2 1/3] fbdev/g364fb: Fix build failure
To:     Finn Thain <fthain@telegraphics.com.au>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <cover.1581030073.git.fthain@telegraphics.com.au>
 <5504c0c416525ed8c7b8440e5f9971f2a7b59f28.1581030073.git.fthain@telegraphics.com.au>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Autocrypt: addr=f4bug@amsat.org; keydata=
 mQINBDU8rLoBEADb5b5dyglKgWF9uDbIjFXU4gDtcwiga9wJ/wX6xdhBqU8tlQ4BroH7AeRl
 u4zXP0QnBDAG7EetxlQzcfYbPmxFISWjckDBFvDbFsojrZmwF2/LkFSzlvKiN5KLghzzJhLO
 HhjGlF8deEZz/d/G8qzO9mIw8GIBS8uuWh6SIcG/qq7+y+2+aifaj92EdwU79apZepT/U3vN
 YrfcAuo1Ycy7/u0hJ7rlaFUn2Fu5KIgV2O++hHYtCCQfdPBg/+ujTL+U+sCDawCyq+9M5+LJ
 ojCzP9rViLZDd/gS6jX8T48hhidtbtsFRj/e9QpdZgDZfowRMVsRx+TB9yzjFdMO0YaYybXp
 dg/wCUepX5xmDBrle6cZ8VEe00+UQCAU1TY5Hs7QFfBbjgR3k9pgJzVXNUKcJ9DYQP0OBH9P
 ZbZvM0Ut2Bk6bLBO5iCVDOco0alrPkX7iJul2QWBy3Iy9j02GnA5jZ1Xtjr9kpCqQT+sRXso
 Vpm5TPGWaWljIeLWy/qL8drX1eyJzwTB3A36Ck4r3YmjMjfmvltSZB1uAdo1elHTlFEULpU/
 HiwvvqXQ9koB15U154VCuguvx/Qnboz8GFb9Uw8VyawzVxYVNME7xw7CQF8FYxzj6eI7rBf2
 Dj/II6wxWPgDEy3oUzuNOxTB7sT3b/Ym76yOJzWX5BylXQIJ5wARAQABtDFQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoRjRCVUcpIDxmNGJ1Z0BhbXNhdC5vcmc+iQJVBBMBCAA/AhsPBgsJ
 CAcDAgYVCAIJCgsEFgIDAQIeAQIXgBYhBPqr514SkXIh3P1rsuPjLCzercDeBQJd660aBQks
 klzgAAoJEOPjLCzercDe2iMP+gMG2dUf+qHz2uG8nTBGMjgK0aEJrKVPodFA+iedQ5Kp3BMo
 jrTg3/DG1HMYdcvQu/NFLYwamUfUasyor1k+3dB23hY09O4xOsYJBWdilkBGsJTKErUmkUO2
 3J/kawosvYtJJSHUpw3N6mwz/iWnjkT8BPp7fFXSujV63aZWZINueTbK7Y8skFHI0zpype9s
 loU8xc4JBrieGccy3n4E/kogGrTG5jcMTNHZ106DsQkhFnjhWETp6g9xOKrzZQbETeRBOe4P
 sRsY9YSG2Sj+ZqmZePvO8LyzGRjYU7T6Z80S1xV0lH6KTMvq7vvz5rd92f3pL4YrXq+e//HZ
 JsiLen8LH/FRhTsWRgBtNYkOsd5F9NvfJtSM0qbX32cSXMAStDVnS4U+H2vCVCWnfNug2TdY
 7v4NtdpaCi4CBBa3ZtqYVOU05IoLnlx0miKTBMqmI05kpgX98pi2QUPJBYi/+yNu3fjjcuS9
 K5WmpNFTNi6yiBbNjJA5E2qUKbIT/RwQFQvhrxBUcRCuK4x/5uOZrysjFvhtR8YGm08h+8vS
 n0JCnJD5aBhiVdkohEFAz7e5YNrAg6kOA5IVRHB44lTBOatLqz7ntwdGD0rteKuHaUuXpTYy
 CRqCVAKqFJtxhvJvaX0vLS1Z2dwtDwhjfIdgPiKEGOgCNGH7R8l+aaM4OPOd
Message-ID: <22d69fb6-ef2c-e4db-43e0-bf34a8fc17dc@amsat.org>
Date:   Sat, 8 Feb 2020 18:16:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <5504c0c416525ed8c7b8440e5f9971f2a7b59f28.1581030073.git.fthain@telegraphics.com.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2/7/20 12:01 AM, Finn Thain wrote:
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
> drivers/video/fbdev/g364fb.c:201:14: warning: unused variable 'j' [-Wunused-variable]
> drivers/video/fbdev/g364fb.c:197:25: warning: unused variable 'pal_ptr' [-Wunused-variable]
> 
> The MIPS Magnum framebuffer console now works when tested in QEMU.
> 
> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
> ---
>  drivers/video/fbdev/g364fb.c | 29 +++--------------------------
>  1 file changed, 3 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/video/fbdev/g364fb.c b/drivers/video/fbdev/g364fb.c
> index 845b79da2a7c..05837a3b985c 100644
> --- a/drivers/video/fbdev/g364fb.c
> +++ b/drivers/video/fbdev/g364fb.c
> @@ -108,7 +108,6 @@ static int g364fb_pan_display(struct fb_var_screeninfo *var,
>  static int g364fb_setcolreg(u_int regno, u_int red, u_int green,
>  			    u_int blue, u_int transp,
>  			    struct fb_info *info);
> -static int g364fb_cursor(struct fb_info *info, struct fb_cursor *cursor);
>  static int g364fb_blank(int blank, struct fb_info *info);
>  
>  static const struct fb_ops g364fb_ops = {
> @@ -119,28 +118,8 @@ static const struct fb_ops g364fb_ops = {
>  	.fb_fillrect	= cfb_fillrect,
>  	.fb_copyarea	= cfb_copyarea,
>  	.fb_imageblit	= cfb_imageblit,
> -	.fb_cursor	= g364fb_cursor,
>  };
>  
> -int g364fb_cursor(struct fb_info *info, struct fb_cursor *cursor)
> -{
> -	
> -	switch (cursor->enable) {
> -	case CM_ERASE:
> -		*(unsigned int *) CTLA_REG |= CURS_TOGGLE;
> -		break;
> -
> -	case CM_MOVE:
> -	case CM_DRAW:
> -		*(unsigned int *) CTLA_REG &= ~CURS_TOGGLE;
> -		*(unsigned int *) CURS_POS_REG =
> -		    ((x * fontwidth(p)) << 12) | ((y * fontheight(p)) -
> -						  info->var.yoffset);
> -		break;
> -	}
> -	return 0;
> -}
> -
>  /*
>   *  Pan or Wrap the Display
>   *
> @@ -194,11 +173,9 @@ static int g364fb_setcolreg(u_int regno, u_int red, u_int green,
>   */
>  int __init g364fb_init(void)
>  {
> -	volatile unsigned int *pal_ptr =
> -	    (volatile unsigned int *) CLR_PAL_REG;
>  	volatile unsigned int *curs_pal_ptr =
>  	    (volatile unsigned int *) CURS_PAL_REG;
> -	int mem, i, j;
> +	int mem, i;
>  
>  	if (fb_get_options("g364fb", NULL))
>  		return -ENODEV;
> @@ -230,8 +207,8 @@ int __init g364fb_init(void)
>  	 */
>  	*(unsigned short *) (CURS_PAT_REG + 14 * 64) = 0xffff;
>  	*(unsigned short *) (CURS_PAT_REG + 15 * 64) = 0xffff;
> -	fb_var.xres_virtual = fbvar.xres;
> -	fb_fix.line_length = (xres / 8) * fb_var.bits_per_pixel;
> +	fb_var.xres_virtual = fb_var.xres;
> +	fb_fix.line_length = fb_var.xres_virtual * fb_var.bits_per_pixel / 8;
>  	fb_fix.smem_start = 0x40000000;	/* physical address */
>  	/* get size of video memory; this is special for the JAZZ hardware */
>  	mem = (r4030_read_reg32(JAZZ_R4030_CONFIG) >> 8) & 3;
> 

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
