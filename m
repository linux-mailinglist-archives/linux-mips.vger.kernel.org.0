Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6D744E043
	for <lists+linux-mips@lfdr.de>; Fri, 21 Jun 2019 08:07:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726008AbfFUGHz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 21 Jun 2019 02:07:55 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:46761 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbfFUGHz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 21 Jun 2019 02:07:55 -0400
Received: by mail-lj1-f193.google.com with SMTP id v24so4855352ljg.13;
        Thu, 20 Jun 2019 23:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9yu4HSEFQB/5s0MGFMv/v6edNeSRElBvgtV5j+2Bf54=;
        b=lkdEM7vacGyFN0Z4NzAZmljsOeH3j7T8awktE+e9fFfsgbp2Z8BY8puUgycrbCT6/p
         zk+lIF36ElExZ5YZukqh75W9kxz25S+PIUepwjwrO8eX7iWvNmBznVIDbZtBUMsjld6N
         /n+f5bTzg5R5lKicFa+M4Rlio7uW2kt/RUEiyFgVxSBqIF/BVsZNDrdFDxEykyyQk9CA
         i6uSQ5AuF+VsdiBqBAES3Ck11nNMswESSlpjMXkjADxKr9l5OfKZ4fHwJNEXkFXkPwjj
         lofvGlYQjRdNYFDc1d84OprmyUnUoKYGcmD3cMDn7SMi0AvHYkXUw2jxt0sSfr/zyb47
         gl8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9yu4HSEFQB/5s0MGFMv/v6edNeSRElBvgtV5j+2Bf54=;
        b=R6bPXietUU7AzpNry04tOEgO2L+0Faw4F+/07o8+i+uqRD+SzR1du3txfMpn2pln+c
         dSi0EPo+Wf8Ttctm4ia8Xok1gfNpGcYfWtJjtyF10QK0F82rTsySvpi34pEqsY+T/3/2
         1eSIA7jJU6NG0o41U9t1rNUfn3CraM0/FsoWrRt8g4UsyeE4BgUFWAlwejAPvxSE6XF/
         J6xsUq9qst+ZBMbHeVWLFpQeKz8g5xvFNYfNjwtsNfICBF7/O+T4Ig6UxN8RF3yAeYNa
         T8UjqRxmdb5eo2UOhdjBQkSjP17Avi5gLMI9eLdkuh9mjiLJr/9H/TLGDlQVbVjP51SO
         tH5g==
X-Gm-Message-State: APjAAAUyRWnc+jj21r9YVm5zElbD/cB685XVr3gTaAhWlovTkt5qFnoy
        R2MROIjbX4eP06sWvoKUeu8=
X-Google-Smtp-Source: APXvYqz70rba/60VvzCtKCMldsJa3mPAW8wapGf5E6NQg7x9A3zSqZflWZHAENAARTuGV9unp0ns9A==
X-Received: by 2002:a2e:635d:: with SMTP id x90mr62800460ljb.140.1561097272288;
        Thu, 20 Jun 2019 23:07:52 -0700 (PDT)
Received: from mobilestation ([5.164.217.122])
        by smtp.gmail.com with ESMTPSA id p27sm248692lfh.8.2019.06.20.23.07.51
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 20 Jun 2019 23:07:52 -0700 (PDT)
Date:   Fri, 21 Jun 2019 09:07:49 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Sean Paul <sean@poorly.run>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Christian Koenig <christian.koenig@amd.com>,
        Huang Rui <ray.huang@amd.com>,
        Junwei Zhang <Jerry.Zhang@amd.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        "Vadim V . Vlasov" <vadim.vlasov@t-platforms.ru>
Subject: Re: [PATCH] drm: Permit video-buffers writecombine mapping for MIPS
Message-ID: <20190621060749.chc6fbvlnvghr7c7@mobilestation>
References: <20190423123122.32573-1-fancer.lancer@gmail.com>
 <20190617134729.pd24boyqe2viyihm@mobilestation>
 <20190618195204.GC25413@art_vandelay>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190618195204.GC25413@art_vandelay>
User-Agent: NeoMutt/20180716
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello Sean,

On Tue, Jun 18, 2019 at 03:52:04PM -0400, Sean Paul wrote:
> On Mon, Jun 17, 2019 at 04:47:30PM +0300, Serge Semin wrote:
> > Hello folks,
> > 
> > Any updates of this patch status? It has been here for about two months.
> > 
> 
> Sorry for the mixup, looks like this one just fell through the cracks. I've
> applied it to drm-misc-next with the attached Ack and Review.
> 

Great! Thank you.

Regards,
-Sergey

> Sean
> 
> 
> > Regards,
> > -Sergey
> > 
> > On Tue, Apr 23, 2019 at 03:31:22PM +0300, Serge Semin wrote:
> > > Since commit 4b050ba7a66c ("MIPS: pgtable.h: Implement the
> > > pgprot_writecombine function for MIPS") and commit c4687b15a848 ("MIPS: Fix
> > > definition of pgprot_writecombine()") write-combine vma mapping is
> > > available to be used by kernel subsystems for MIPS. In particular the
> > > uncached accelerated attribute is requested to be set by ioremap_wc()
> > > method and by generic PCI memory pages/ranges mapping methods. The same
> > > is done by the drm_io_prot()/ttm_io_prot() functions in case if
> > > write-combine flag is set for vma's passed for mapping. But for some
> > > reason the pgprot_writecombine() method calling is ifdefed to be a
> > > platform-specific with MIPS system being marked as lacking of one. At the
> > > very least it doesn't reflect the current MIPS platform implementation.
> > > So in order to improve the DRM subsystem performance on MIPS with UCA
> > > mapping enabled, we need to have pgprot_writecombine() called for buffers,
> > > which need store operations being combined. In case if particular MIPS
> > > chip doesn't support the UCA attribute, the mapping will fall back to
> > > noncached.
> > > 
> > > Cc: Ralf Baechle <ralf@linux-mips.org>
> > > Cc: Paul Burton <paul.burton@mips.com>
> > > Cc: James Hogan <jhogan@kernel.org>
> > > Signed-off-by: Vadim V. Vlasov <vadim.vlasov@t-platforms.ru>
> > > Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
> > > ---
> > >  drivers/gpu/drm/drm_vm.c          | 5 +++--
> > >  drivers/gpu/drm/ttm/ttm_bo_util.c | 4 ++--
> > >  2 files changed, 5 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_vm.c b/drivers/gpu/drm/drm_vm.c
> > > index c3301046dfaa..50178dc64060 100644
> > > --- a/drivers/gpu/drm/drm_vm.c
> > > +++ b/drivers/gpu/drm/drm_vm.c
> > > @@ -62,7 +62,8 @@ static pgprot_t drm_io_prot(struct drm_local_map *map,
> > >  	/* We don't want graphics memory to be mapped encrypted */
> > >  	tmp = pgprot_decrypted(tmp);
> > >  
> > > -#if defined(__i386__) || defined(__x86_64__) || defined(__powerpc__)
> > > +#if defined(__i386__) || defined(__x86_64__) || defined(__powerpc__) || \
> > > +    defined(__mips__)
> > >  	if (map->type == _DRM_REGISTERS && !(map->flags & _DRM_WRITE_COMBINING))
> > >  		tmp = pgprot_noncached(tmp);
> > >  	else
> > > @@ -73,7 +74,7 @@ static pgprot_t drm_io_prot(struct drm_local_map *map,
> > >  		tmp = pgprot_writecombine(tmp);
> > >  	else
> > >  		tmp = pgprot_noncached(tmp);
> > > -#elif defined(__sparc__) || defined(__arm__) || defined(__mips__)
> > > +#elif defined(__sparc__) || defined(__arm__)
> > >  	tmp = pgprot_noncached(tmp);
> > >  #endif
> > >  	return tmp;
> > > diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> > > index 895d77d799e4..9f918b992f7e 100644
> > > --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> > > +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> > > @@ -539,13 +539,13 @@ pgprot_t ttm_io_prot(uint32_t caching_flags, pgprot_t tmp)
> > >  		tmp = pgprot_noncached(tmp);
> > >  #endif
> > >  #if defined(__ia64__) || defined(__arm__) || defined(__aarch64__) || \
> > > -    defined(__powerpc__)
> > > +    defined(__powerpc__) || defined(__mips__)
> > >  	if (caching_flags & TTM_PL_FLAG_WC)
> > >  		tmp = pgprot_writecombine(tmp);
> > >  	else
> > >  		tmp = pgprot_noncached(tmp);
> > >  #endif
> > > -#if defined(__sparc__) || defined(__mips__)
> > > +#if defined(__sparc__)
> > >  	tmp = pgprot_noncached(tmp);
> > >  #endif
> > >  	return tmp;
> > > -- 
> > > 2.21.0
> > > 
> 
> -- 
> Sean Paul, Software Engineer, Google / Chromium OS
