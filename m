Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5F1D1C0FAC
	for <lists+linux-mips@lfdr.de>; Fri,  1 May 2020 10:36:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728408AbgEAIgG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 1 May 2020 04:36:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728347AbgEAIgG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 1 May 2020 04:36:06 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21C2FC035494;
        Fri,  1 May 2020 01:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=u1ObID4mc4ZiJfuKFiuN5Y7VZkzmljpfFqi38VXW+Co=; b=BA8v0KsKc58imObwbrtZ9U77iZ
        mn2sZiXz9I/QjOyTeo5GxMds5vHJBpPPKFxbobHkI+IzMeZo4nFxYF9mIZaWBPcpwlthjPLjETQoz
        yuYxIKOxrAAwGvkmfcsYv+N5kRtLQiQlvskYXY82cwMNYhac993Bdrz1gbyMENbgDhmhOTxGBtN0p
        vwNo6dmPH+Nl5HvR2m6Rm9o9PBeTxGuojze+CvunWn3zutBxoR7hT/8WtW8EvmIkX//epj0+OxXdK
        +So7hCqPNlUv5x1X7RmlnLXTM50/2rhhvwa7UmhV3Xe6IcEAazHas8ItVL37HN0e891N+DeBvZXA6
        DQIUh2Lw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jUR9L-0003Wc-7M; Fri, 01 May 2020 08:35:59 +0000
Date:   Fri, 1 May 2020 01:35:59 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     ira.weiny@intel.com
Cc:     linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Christian Koenig <christian.koenig@amd.com>,
        Huang Rui <ray.huang@amd.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        dri-devel@lists.freedesktop.org,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Paul Mackerras <paulus@samba.org>,
        "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
        Dan Williams <dan.j.williams@intel.com>,
        Helge Deller <deller@gmx.de>, x86@kernel.org,
        linux-csky@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
        linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
        Borislav Petkov <bp@alien8.de>,
        Andy Lutomirski <luto@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-arm-kernel@lists.infradead.org,
        Chris Zankel <chris@zankel.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org,
        "David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH V1 01/10] arch/kmap: Remove BUG_ON()
Message-ID: <20200501083559.GA27858@infradead.org>
References: <20200430203845.582900-1-ira.weiny@intel.com>
 <20200430203845.582900-2-ira.weiny@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200430203845.582900-2-ira.weiny@intel.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Apr 30, 2020 at 01:38:36PM -0700, ira.weiny@intel.com wrote:
> From: Ira Weiny <ira.weiny@intel.com>
> 
> Replace the use of BUG_ON(in_interrupt()) in the kmap() and kunmap()
> in favor of might_sleep().
> 
> Besides the benefits of might_sleep(), this normalizes the
> implementations such that they can be made generic in subsequent
> patches.
> 
> Reviewed-by: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: Ira Weiny <ira.weiny@intel.com>

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
