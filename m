Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CC0333938C
	for <lists+linux-mips@lfdr.de>; Fri, 12 Mar 2021 17:38:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231519AbhCLQhu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 12 Mar 2021 11:37:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231925AbhCLQhU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 12 Mar 2021 11:37:20 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B274C061574;
        Fri, 12 Mar 2021 08:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=8+yBt1tlguv6Ba21H17woo0c/ker/pZc6AgxTt64QlQ=; b=WKf4DfEgucV/RLoMHAkGK7aHie
        YUp9SDuPPEytESE+4FGx9e6ap27KibBmpCZEAdV88sGr0hYIXoYaFPtC96mRIVrlHaIwq8DP5tslh
        5gm92eGlY4HQLhqLKlpPhy4th/5CiqFLP+47QTqBGec+KUGYhmQ7oTXanTBSMIcDFwytbowD4V3Or
        3CYchrA//fXZsL6sOmyW81tHk3hX0i26fdLUTXzq0LMHxuy8LBKrsj3ae4PHeWccDXe/MuOwEjkHG
        /0eq4riyfv/s+Z1PL84AzDja2E1/SD18EchgTO/ibRmwG7tZnzSPfwx6/gmP9Gm/cDYIqmlvKNqs8
        ayheNZag==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1lKkm2-00B91g-JK; Fri, 12 Mar 2021 16:36:29 +0000
Date:   Fri, 12 Mar 2021 16:36:26 +0000
From:   Christoph Hellwig <hch@infradead.org>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Christoph Hellwig <hch@infradead.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sam Ravnborg <sam@ravnborg.org>, od@zcrc.me,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH v2 3/5] drm: Add and export function
 drm_gem_cma_mmap_noncoherent
Message-ID: <20210312163626.GA2655841@infradead.org>
References: <20210307202835.253907-1-paul@crapouillou.net>
 <20210307202835.253907-4-paul@crapouillou.net>
 <20210311122642.GB1739082@infradead.org>
 <3I1TPQ.E55GRWWDYVRG@crapouillou.net>
 <20210311123642.GA1741910@infradead.org>
 <JPBTPQ.TL10VUKPUBL23@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <JPBTPQ.TL10VUKPUBL23@crapouillou.net>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Mar 11, 2021 at 04:12:55PM +0000, Paul Cercueil wrote:
> ret = dma_mmap_pages(cma_obj->base.dev->dev,
>                     vma, vma->vm_end - vma->vm_start,
>                     virt_to_page(cma_obj->vaddr));
> 
> It works fine.
> 
> I think I can use remap_pfn_range() for now, and switch to your new API once
> it's available in drm-misc-next.

No, drivers must not use dma_to_phys, and they also must not include
dma-direct.h.
