Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 849CA48466
	for <lists+linux-mips@lfdr.de>; Mon, 17 Jun 2019 15:47:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726065AbfFQNrf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 17 Jun 2019 09:47:35 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:38479 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725983AbfFQNrf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 17 Jun 2019 09:47:35 -0400
Received: by mail-lf1-f67.google.com with SMTP id b11so6559654lfa.5;
        Mon, 17 Jun 2019 06:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=O9iaokS7chRIdty8YXJ6Ys/2JY44g91hT9zsHpjPuBg=;
        b=ESL7h+x6npOVGuO1kDUltOllyumhp7aW8zxRpnbwR0R2IlDD38Dae7N2KYdDOJImep
         K/sS0rRKbpjTMcUW79gCdah0eMKQWlb8Mis1BA/PaWyeE+bOwvh2JWeUvq+5JwtC3wPA
         Kq7fTe2eZuukZ4CDSgVrVbuIjAk9Yx6Eh57AmxYWdY8MQkMRaJURdDS5VWQHuQ4x8vvK
         HSVyzSWOrko7q/YJarrvddjHG/6eVXDCF4whEpkr9xXo1bmQ/YBvO01t1JiWAsOVrabS
         Nzoz/QthCrZF56BH3bSZ9jNfdfFEF+6F63VnFr3rDxSi0EJx4VJ3o8nZ6Lt+4s91jq4B
         kWcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=O9iaokS7chRIdty8YXJ6Ys/2JY44g91hT9zsHpjPuBg=;
        b=kYuCvUWjRGR8kEgUAu8b6U1YPw803Tn16mdyuq3l3Si/1l/b9G9kjvKizCShQjs9hF
         9YBZzEBMET5vjgNmGdLYDH/Q57U9TuYGrFwVFCrGx5q4rYb4UybsI5/EylxLrdlYCC2A
         sCDRciSmrC87PFxBiCLdaNBD3ejdfghztXgStTe6Tk+iuaV4wsvjz2USyj13AeVkZHzP
         cuKwAGc/05oCG5RiujlfmImZbrbua3dXJj98Al1BN15qFx8KPs8qgAOzdQ2QMy1IFHnD
         uG75vPfHEi1FZ6igpJvnCG53ZqXW7h2n9WtE3r86YlJskuLr4Lha9MolbXHq73LcWFLl
         Ur3A==
X-Gm-Message-State: APjAAAWJc3LsmaS11jaNuoXXNTyfSqesJy82XG6Q3NjBrN5fN55WeXwA
        WKC050SHH+qufThn7Jlxs4wpHAPYwVM=
X-Google-Smtp-Source: APXvYqzAO3WcughOQWS36ZmjwboEnCZX7eu0ToKYcUhEpInYmxfUni6YOBAbjr+vbOs3ie2xT0neQg==
X-Received: by 2002:ac2:4d17:: with SMTP id r23mr6757lfi.130.1560779253032;
        Mon, 17 Jun 2019 06:47:33 -0700 (PDT)
Received: from mobilestation ([5.164.217.122])
        by smtp.gmail.com with ESMTPSA id 16sm1770779lfy.21.2019.06.17.06.47.31
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 17 Jun 2019 06:47:32 -0700 (PDT)
Date:   Mon, 17 Jun 2019 16:47:30 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Christian Koenig <christian.koenig@amd.com>,
        Huang Rui <ray.huang@amd.com>,
        Junwei Zhang <Jerry.Zhang@amd.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        "Vadim V . Vlasov" <vadim.vlasov@t-platforms.ru>
Subject: Re: [PATCH] drm: Permit video-buffers writecombine mapping for MIPS
Message-ID: <20190617134729.pd24boyqe2viyihm@mobilestation>
References: <20190423123122.32573-1-fancer.lancer@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190423123122.32573-1-fancer.lancer@gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello folks,

Any updates of this patch status? It has been here for about two months.

Regards,
-Sergey

On Tue, Apr 23, 2019 at 03:31:22PM +0300, Serge Semin wrote:
> Since commit 4b050ba7a66c ("MIPS: pgtable.h: Implement the
> pgprot_writecombine function for MIPS") and commit c4687b15a848 ("MIPS: Fix
> definition of pgprot_writecombine()") write-combine vma mapping is
> available to be used by kernel subsystems for MIPS. In particular the
> uncached accelerated attribute is requested to be set by ioremap_wc()
> method and by generic PCI memory pages/ranges mapping methods. The same
> is done by the drm_io_prot()/ttm_io_prot() functions in case if
> write-combine flag is set for vma's passed for mapping. But for some
> reason the pgprot_writecombine() method calling is ifdefed to be a
> platform-specific with MIPS system being marked as lacking of one. At the
> very least it doesn't reflect the current MIPS platform implementation.
> So in order to improve the DRM subsystem performance on MIPS with UCA
> mapping enabled, we need to have pgprot_writecombine() called for buffers,
> which need store operations being combined. In case if particular MIPS
> chip doesn't support the UCA attribute, the mapping will fall back to
> noncached.
> 
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Paul Burton <paul.burton@mips.com>
> Cc: James Hogan <jhogan@kernel.org>
> Signed-off-by: Vadim V. Vlasov <vadim.vlasov@t-platforms.ru>
> Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
> ---
>  drivers/gpu/drm/drm_vm.c          | 5 +++--
>  drivers/gpu/drm/ttm/ttm_bo_util.c | 4 ++--
>  2 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_vm.c b/drivers/gpu/drm/drm_vm.c
> index c3301046dfaa..50178dc64060 100644
> --- a/drivers/gpu/drm/drm_vm.c
> +++ b/drivers/gpu/drm/drm_vm.c
> @@ -62,7 +62,8 @@ static pgprot_t drm_io_prot(struct drm_local_map *map,
>  	/* We don't want graphics memory to be mapped encrypted */
>  	tmp = pgprot_decrypted(tmp);
>  
> -#if defined(__i386__) || defined(__x86_64__) || defined(__powerpc__)
> +#if defined(__i386__) || defined(__x86_64__) || defined(__powerpc__) || \
> +    defined(__mips__)
>  	if (map->type == _DRM_REGISTERS && !(map->flags & _DRM_WRITE_COMBINING))
>  		tmp = pgprot_noncached(tmp);
>  	else
> @@ -73,7 +74,7 @@ static pgprot_t drm_io_prot(struct drm_local_map *map,
>  		tmp = pgprot_writecombine(tmp);
>  	else
>  		tmp = pgprot_noncached(tmp);
> -#elif defined(__sparc__) || defined(__arm__) || defined(__mips__)
> +#elif defined(__sparc__) || defined(__arm__)
>  	tmp = pgprot_noncached(tmp);
>  #endif
>  	return tmp;
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index 895d77d799e4..9f918b992f7e 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -539,13 +539,13 @@ pgprot_t ttm_io_prot(uint32_t caching_flags, pgprot_t tmp)
>  		tmp = pgprot_noncached(tmp);
>  #endif
>  #if defined(__ia64__) || defined(__arm__) || defined(__aarch64__) || \
> -    defined(__powerpc__)
> +    defined(__powerpc__) || defined(__mips__)
>  	if (caching_flags & TTM_PL_FLAG_WC)
>  		tmp = pgprot_writecombine(tmp);
>  	else
>  		tmp = pgprot_noncached(tmp);
>  #endif
> -#if defined(__sparc__) || defined(__mips__)
> +#if defined(__sparc__)
>  	tmp = pgprot_noncached(tmp);
>  #endif
>  	return tmp;
> -- 
> 2.21.0
> 
