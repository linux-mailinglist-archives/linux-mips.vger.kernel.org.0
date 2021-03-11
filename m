Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A2183372CC
	for <lists+linux-mips@lfdr.de>; Thu, 11 Mar 2021 13:38:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233254AbhCKMh3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 11 Mar 2021 07:37:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233226AbhCKMhY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 11 Mar 2021 07:37:24 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79FE6C061574;
        Thu, 11 Mar 2021 04:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=vJSr/GMFzS2IPyn11BIby5mlM7bzUpTd/5u2QdjX24c=; b=LASDnO6q08S6flHgSsiq/NgLoc
        WMh3mPClSKCdYGCN1uG60ilkiCplcvrphwvmYkS1Ityfs4vVhZePIp+cJ8rdqNqWBuJnfxPm7NdTz
        kQvx5QqDg47ZxUvcDHii6bzPHleHomTd6kuICU4oNXihW1G+GjppTR6T1kdzIIIsfjseZxt5YEleJ
        G7hdVlO8xgzBnFWgzjAm3wAUyF2p9BUaHYy3bVDGdVgcqDHyH/eG2fM6+pk1kSzM9Xv2wSOok7CNb
        6iG+sEWL8B8aU34S9UfR3lwLU/jl3dhgIwNLGRY9QS7SENly3ysT+C2jM0nNjWhQbXkhOXogGjaBe
        e5Hgnz7g==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1lKKYU-007JMi-2f; Thu, 11 Mar 2021 12:36:48 +0000
Date:   Thu, 11 Mar 2021 12:36:42 +0000
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
Message-ID: <20210311123642.GA1741910@infradead.org>
References: <20210307202835.253907-1-paul@crapouillou.net>
 <20210307202835.253907-4-paul@crapouillou.net>
 <20210311122642.GB1739082@infradead.org>
 <3I1TPQ.E55GRWWDYVRG@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3I1TPQ.E55GRWWDYVRG@crapouillou.net>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Mar 11, 2021 at 12:32:27PM +0000, Paul Cercueil wrote:
> > dma_to_phys must not be used by drivers.
> > 
> > I have a proper helper for this waiting for users:
> > 
> > http://git.infradead.org/users/hch/misc.git/commitdiff/96a546e7229ec53aadbdb7936d1e5e6cb5958952
> > 
> > If you can confirm the helpers works for you I can try to still sneak
> > it to Linus for 5.12 to ease the merge pain.
> 
> I can try. How do I get a page pointer from a dma_addr_t?

You don't - you get it from using virt_to_page on the pointer returned
from dma_alloc_noncoherent.  That beind said to keep the API sane I
should probably add a wrapper that does that for you.
