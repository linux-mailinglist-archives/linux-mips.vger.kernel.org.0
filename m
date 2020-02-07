Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 427821559D6
	for <lists+linux-mips@lfdr.de>; Fri,  7 Feb 2020 15:41:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726899AbgBGOl0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 7 Feb 2020 09:41:26 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:36000 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726867AbgBGOl0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 7 Feb 2020 09:41:26 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200207144123euoutp0110ecdb2563411cdaaf1699c1ab637a5a~xJcetLfg53256332563euoutp010
        for <linux-mips@vger.kernel.org>; Fri,  7 Feb 2020 14:41:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200207144123euoutp0110ecdb2563411cdaaf1699c1ab637a5a~xJcetLfg53256332563euoutp010
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1581086483;
        bh=8TLOKNSerZfjKBmTt/PKQZPovrdv2lAMi8TdJvkstMU=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=s9MIKDhYUQy5t8NVRpZlQouCLeZNW2caY5rlpK6fxLiipWvSMILJXZME0C5dFuzol
         LZFT6zC8j2/iWQ4wrYN6XYI+fSihNvPgbwhsZ9EniY9cIDRmTHVa6DHhBPaJLO9toB
         yQewUG6r71Bb05M2fn5Rou6eM+yG59OTxj6Onzag=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200207144123eucas1p1070d7c153d2c73cbfd6ecd82e2f127d7~xJced3RrG0069300693eucas1p1y;
        Fri,  7 Feb 2020 14:41:23 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 23.8A.60698.3177D3E5; Fri,  7
        Feb 2020 14:41:23 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200207144123eucas1p2181412871e88ab4c1e8f9354ebc15e7d~xJceDNgGA0332003320eucas1p2-;
        Fri,  7 Feb 2020 14:41:23 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200207144123eusmtrp29763e58a4a94015a30c9db19214a1da6~xJceCkCps1887118871eusmtrp2f;
        Fri,  7 Feb 2020 14:41:23 +0000 (GMT)
X-AuditID: cbfec7f5-a29ff7000001ed1a-8e-5e3d77132a80
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 0F.3B.08375.2177D3E5; Fri,  7
        Feb 2020 14:41:22 +0000 (GMT)
Received: from [106.120.51.71] (unknown [106.120.51.71]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200207144122eusmtip2e7a7dba388c3c9692b307e7a9f3695ea~xJcdec-2r0561805618eusmtip2H;
        Fri,  7 Feb 2020 14:41:22 +0000 (GMT)
Subject: Re: [PATCH v2 1/3] fbdev/g364fb: Fix build failure
To:     Finn Thain <fthain@telegraphics.com.au>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
From:   Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Message-ID: <43030f2c-d60e-0ae8-dff2-b5cb4e576f70@samsung.com>
Date:   Fri, 7 Feb 2020 15:41:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5504c0c416525ed8c7b8440e5f9971f2a7b59f28.1581030073.git.fthain@telegraphics.com.au>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMKsWRmVeSWpSXmKPExsWy7djP87rC5bZxBlOuC1lc+fqezeLEpoPM
        FhN7l7JYTDzxicXiRN8HVovLu+awWXRu2spo0fFtLovFpT0qFoebDjI7cHm0XlrO4nHgxUJ2
        j02rOtk8jq5cy+Rxv/s4k8ezgw9ZPT5vkgtgj+KySUnNySxLLdK3S+DKONE3j71gumJF063P
        rA2MS6S7GDk5JARMJBbPmcPaxcjFISSwglHiafM/FpCEkMAXRonmt+IQic+MErtXP2aB6Xhy
        czM7RGI5UGLdVqiOt4wS7UfqQGxhAWuJP/NvM4PYIgLaEhPf7GADaWAWuMEk8XviQyaQBJuA
        lcTE9lWMIDavgJ3EgnVXwQaxCKhIfL32CqxGVCBC4tODw6wQNYISJ2c+AavhFEiUaGlcC1bD
        LCAucevJfChbXqJ562xmkGUSAtfYJVrv74A620XixqytzBC2sMSr41vYIWwZif87QZpBGtYx
        SvzteAHVvZ1RYvnkf2wQVdYSd879ArI5gFZoSqzfpQ8RdpRonXOEGSQsIcAnceOtIMQRfBKT
        tk2HCvNKdLQJQVSrSWxYtoENZm3XzpXMExiVZiF5bRaSd2YheWcWwt4FjCyrGMVTS4tz01OL
        jfNSy/WKE3OLS/PS9ZLzczcxApPW6X/Hv+5g3Pcn6RCjAAejEg9vgqNNnBBrYllxZe4hRgkO
        ZiUR3j5V2zgh3pTEyqrUovz4otKc1OJDjNIcLErivMaLXsYKCaQnlqRmp6YWpBbBZJk4OKUa
        GG8wHasV3Zw3z/PvK6f/03+fft7RZ205tXt715OdUwzbVFY1qTreeJ5/d0vHuqu9xsv088R/
        /JHkWf5huxrnfu2XdxecuHN+nf+c8JsLnN5tf17PJh31L2Xl3BsvX5oHcEgFXivZp2dzuvcW
        z43js+w/83DsEz2WUWicryqr/3d57FydE9xZL0yVWIozEg21mIuKEwG5qApFVgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRmVeSWpSXmKPExsVy+t/xe7pC5bZxBjf3Wlpc+fqezeLEpoPM
        FhN7l7JYTDzxicXiRN8HVovLu+awWXRu2spo0fFtLovFpT0qFoebDjI7cHm0XlrO4nHgxUJ2
        j02rOtk8jq5cy+Rxv/s4k8ezgw9ZPT5vkgtgj9KzKcovLUlVyMgvLrFVija0MNIztLTQMzKx
        1DM0No+1MjJV0rezSUnNySxLLdK3S9DLONE3j71gumJF063PrA2MS6S7GDk5JARMJJ7c3Mze
        xcjFISSwlFHi0+JG1i5GDqCEjMTx9WUQNcISf651sUHUvGaUOHTjISNIQljAWuLP/NvMILaI
        gLbExDc7wIqYBW4xSbz80wY19QWjROPB2ywgVWwCVhIT21eBdfMK2EksWHcVLM4ioCLx9dor
        JhBbVCBC4vCOWVA1ghInZz4Bq+EUSJRoaVwLVsMsoC7xZ94lZghbXOLWk/lQcXmJ5q2zmScw
        Cs1C0j4LScssJC2zkLQsYGRZxSiSWlqcm55bbKhXnJhbXJqXrpecn7uJERin24793LyD8dLG
        4EOMAhyMSjy8CY42cUKsiWXFlbmHGCU4mJVEePtUbeOEeFMSK6tSi/Lji0pzUosPMZoCPTeR
        WUo0OR+YQvJK4g1NDc0tLA3Njc2NzSyUxHk7BA7GCAmkJ5akZqemFqQWwfQxcXBKNTBqND84
        5TafIabBXWJGafZUXgfLU/qb9/CUrRb1SkjmmVSwtF24X1Ngxv4CqfKeRVp73Xx4vQwePrav
        3uqRJ2ZYO/PLzqWdlqnzvhR5Ld73finnjO5IiW9rv0VfED9vZyMZeWde5TfV2ISQkMzPH7te
        zhALz39tIWJ6o1X67P9XVlfZ7kck5yixFGckGmoxFxUnAgB5EIU36QIAAA==
X-CMS-MailID: 20200207144123eucas1p2181412871e88ab4c1e8f9354ebc15e7d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200206230657eucas1p23fc9345866fb3f489534e0c0640b129f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200206230657eucas1p23fc9345866fb3f489534e0c0640b129f
References: <cover.1581030073.git.fthain@telegraphics.com.au>
        <CGME20200206230657eucas1p23fc9345866fb3f489534e0c0640b129f@eucas1p2.samsung.com>
        <5504c0c416525ed8c7b8440e5f9971f2a7b59f28.1581030073.git.fthain@telegraphics.com.au>
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

Acked-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

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
