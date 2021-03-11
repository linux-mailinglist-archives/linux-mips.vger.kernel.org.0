Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF77033727E
	for <lists+linux-mips@lfdr.de>; Thu, 11 Mar 2021 13:25:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232956AbhCKMYl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 11 Mar 2021 07:24:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232934AbhCKMYf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 11 Mar 2021 07:24:35 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08BCEC061574;
        Thu, 11 Mar 2021 04:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=RsFuGyEkzwAoZphUext4AJ+F1INX3NjlZ1TxLFyNWdM=; b=Bl71HVjG8xP+t/qZujgY1JZ0p3
        iN4eqkpSji1YVmHC4dUg6NrFvvLQDYI/sMWzjH/JMEi9vidpW7yHv8LoUnWWSlMVdxaph7xE2wAGO
        b3XFqnelri6uDQ0fWGAy2e2mTmA0UUgwHNdWELcOFz7XrlXrIdG3egxovH2KiUkoPfxfhxVmm1/hs
        uTAWqSsc7vSFHdxVATymG7WLR2RILNnOwZ1v+2PrY174fk7lC9umn0nTbnIb8STv+MS8T9EcwDo9X
        aDqxMiO99BRSdizi3kZZVMl6oMMk4reXRcXjFAChA9/I/ln4+Qo4B6O0tMyd89Z5xoujELvf6gXLs
        zdcts47A==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1lKKLi-007IbM-Ac; Thu, 11 Mar 2021 12:23:36 +0000
Date:   Thu, 11 Mar 2021 12:23:30 +0000
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
Subject: Re: [PATCH v2 1/5] drm: Add and export function
 drm_gem_cma_create_noncoherent
Message-ID: <20210311122330.GA1739082@infradead.org>
References: <20210307202835.253907-1-paul@crapouillou.net>
 <20210307202835.253907-2-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210307202835.253907-2-paul@crapouillou.net>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

> +static struct drm_gem_cma_object *
> +drm_gem_cma_create_with_cache_param(struct drm_device *drm,
> +				    size_t size,
> +				    bool noncoherent)

Does this helper really make much sense?  You basically have two
function calls in it, out of which one is dependend on the parameter.
