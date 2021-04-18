Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80ACF3634D3
	for <lists+linux-mips@lfdr.de>; Sun, 18 Apr 2021 13:22:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231339AbhDRLV5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 18 Apr 2021 07:21:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230431AbhDRLV4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 18 Apr 2021 07:21:56 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10555C061761
        for <linux-mips@vger.kernel.org>; Sun, 18 Apr 2021 04:21:27 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id x7so31018539wrw.10
        for <linux-mips@vger.kernel.org>; Sun, 18 Apr 2021 04:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yHuFjlT5rtKQaeRAFhvfUQECvltMrb+hYlCuEQGxGSA=;
        b=n705a9a7qdxMFuWE1zX7H+Gwn7R1Ph/HxlJsBZM2OwmgI8on3YCAfTIJ9VILLpPGVN
         U6Ei9bgVBs4WU0tgRYPLY73PulXN7X8T9DnS/lfiOp0hi2PY7rBteW4MAz4+5uRDWIzC
         tVQA+Ijyf20lSUQ31OC6X057HKNOPi+pz6Nzkf8RmSCB7uub+bAFeTOPAvt2BEhTUPA9
         e95vVEysgGXjcAyKsinTriFeM9DFcYVac9rU5mO+CY2n1SfMhFTrdb724lZinw5eig/R
         DWL2UVgqLZFgwGhAmloMkMPTn1qsrnfB8ZvGBiW/SI8QnW3O/4TL6LEClDzNGo9C+X4Y
         G8Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yHuFjlT5rtKQaeRAFhvfUQECvltMrb+hYlCuEQGxGSA=;
        b=IYv1ukdvoVd557/sVdXOJOxUpl4Y2OHN5pXXUFwzbfuP506d1uR29nI8sYWQMX/A1a
         j70B4XyOoA1Fz4s/ZJ4TCuGU4uebw6KL36+a5+L2RFZPUMlGeM78+Mte2HDza58kEopB
         T+mvrRWp/FEhAN0AuJ+L41uunKrW27WS8o1xamqGG61TLu4kjCBjUqxtbT9NqsuK2+5L
         jdTJBh0BeoYxOu0DDmdoH9tuZpcbOnPbBiSnJYfT0M5Nlb9kKPwM2+edK+aydfCOkntv
         3p7hq5L1XeFhxhXY6I1OhPSeRScd/uRl4AdfkwpqA5mRj0lwtDPMJ9vxqN4mB9iFmlPD
         31kA==
X-Gm-Message-State: AOAM532NFoQbkcxNw5icTy2tPsq8T3lKOqNSBy6YDo+pvEXmpcRX4ubt
        hUeY2ug3alzur10X2ORiRC9vBA==
X-Google-Smtp-Source: ABdhPJy/WC+K/XtmqLOKo5IrEBVbL+R26kxzPf1pRpKWFGvT15zr5cY0imTHGxHtMkaaPLJEz/z5Qw==
X-Received: by 2002:a5d:5146:: with SMTP id u6mr8768015wrt.408.1618744885216;
        Sun, 18 Apr 2021 04:21:25 -0700 (PDT)
Received: from apalos.home (ppp-94-65-92-88.home.otenet.gr. [94.65.92.88])
        by smtp.gmail.com with ESMTPSA id i12sm17113748wrm.77.2021.04.18.04.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Apr 2021 04:21:24 -0700 (PDT)
Date:   Sun, 18 Apr 2021 14:21:21 +0300
From:   Ilias Apalodimas <ilias.apalodimas@linaro.org>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     brouer@redhat.com, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, netdev@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        mcroce@linux.microsoft.com, grygorii.strashko@ti.com,
        arnd@kernel.org, hch@lst.de, linux-snps-arc@lists.infradead.org,
        mhocko@kernel.org, mgorman@suse.de
Subject: Re: [PATCH 1/2] mm: Fix struct page layout on 32-bit systems
Message-ID: <YHwWMfgqiRaKS2y6@apalos.home>
References: <20210416230724.2519198-1-willy@infradead.org>
 <20210416230724.2519198-2-willy@infradead.org>
 <20210417024522.GP2531743@casper.infradead.org>
 <YHspptFx+T588KcG@apalos.home>
 <20210417202240.GS2531743@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210417202240.GS2531743@casper.infradead.org>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Apr 17, 2021 at 09:22:40PM +0100, Matthew Wilcox wrote:
> On Sat, Apr 17, 2021 at 09:32:06PM +0300, Ilias Apalodimas wrote:
> > > +static inline void page_pool_set_dma_addr(struct page *page, dma_addr_t addr)
> > > +{
> > > +	page->dma_addr[0] = addr;
> > > +	if (sizeof(dma_addr_t) > sizeof(unsigned long))
> > > +		page->dma_addr[1] = addr >> 16 >> 16;
> > 
> > The 'error' that was reported will never trigger right?
> > I assume this was compiled with dma_addr_t as 32bits (so it triggered the
> > compilation error), but the if check will never allow this codepath to run.
> > If so can we add a comment explaining this, since none of us will remember why
> > in 6 months from now?
> 
> That's right.  I compiled it all three ways -- 32-bit, 64-bit dma, 32-bit long
> and 64-bit.  The 32/64 bit case turn into:
> 
> 	if (0)
> 		page->dma_addr[1] = addr >> 16 >> 16;
> 
> which gets elided.  So the only case that has to work is 64-bit dma and
> 32-bit long.
> 
> I can replace this with upper_32_bits().
> 

Ok up to you, I don't mind either way and thanks for solving this!

Acked-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
