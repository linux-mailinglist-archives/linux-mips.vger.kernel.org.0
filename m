Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83322337294
	for <lists+linux-mips@lfdr.de>; Thu, 11 Mar 2021 13:30:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232937AbhCKMaC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 11 Mar 2021 07:30:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232850AbhCKM3a (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 11 Mar 2021 07:29:30 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED314C061574;
        Thu, 11 Mar 2021 04:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=Fw9Oe2NoViifBKrF8ZRFWH2mNOhfvyMxIi7quHv4ySw=; b=ZUsRH+ICX4De04o7mGT3YC59jz
        h4+GBZl+8QAWL3vOkAOnoGsujndsYZuSCC/8Nqe5jYpFWR8+D3STwgqCSY56+dVR0oMwLIDnh0InR
        wEKAcTAGjN4+xtijAduqy89PqK1QM7226ybshs1SS+/BpGtyY0ZunLY39bvh57Yy7pq7oZWF0BLiq
        Kzdm8knOW6DaAJ+yK7tl0OEkEHrYoheUVwSAfxEYeUH4eVAC8j3xUWYFgHcXHixGqa1lDyvk+Pxny
        w5MufRFNm2o/rOzg1+9o9DSXOfOnPHLXmIf31ZNXLhrLJe/wyBmslmxJX/9tq0hf8lxnBIcsIJYS8
        g1sbMh+w==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1lKKQo-007Iqu-9i; Thu, 11 Mar 2021 12:29:01 +0000
Date:   Thu, 11 Mar 2021 12:28:46 +0000
From:   Christoph Hellwig <hch@infradead.org>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sam Ravnborg <sam@ravnborg.org>, od@zcrc.me,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH v2 4/5] drm: Add and export function drm_gem_cma_sync_data
Message-ID: <20210311122846.GC1739082@infradead.org>
References: <20210307202835.253907-1-paul@crapouillou.net>
 <20210307202835.253907-5-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210307202835.253907-5-paul@crapouillou.net>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Mar 07, 2021 at 08:28:34PM +0000, Paul Cercueil wrote:
> +	drm_atomic_for_each_plane_damage(&iter, &clip) {
> +		for (i = 0; i < finfo->num_planes; i++) {
> +			daddr = drm_fb_cma_get_gem_addr(state->fb, state, i);
> +
> +			/* Ignore x1/x2 values, invalidate complete lines */
> +			offset = clip.y1 * state->fb->pitches[i];
> +
> +			dma_sync_single_for_device(dev, daddr + offset,
> +				       (clip.y2 - clip.y1) * state->fb->pitches[i],
> +				       DMA_TO_DEVICE);

Are these helpers only ever used to transfer data to the device and
never from it?  If so please clearly document that.
