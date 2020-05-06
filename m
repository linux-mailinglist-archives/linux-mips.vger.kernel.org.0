Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4CB11C6820
	for <lists+linux-mips@lfdr.de>; Wed,  6 May 2020 08:13:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727804AbgEFGN1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 6 May 2020 02:13:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726558AbgEFGN1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 6 May 2020 02:13:27 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DF52C061A0F;
        Tue,  5 May 2020 23:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=bhX6YQjPJn6UvjIEP58QtY6wMlMp81noJ+wGjt8TO9U=; b=b9jznJ3E/WgGPYeqfC2WEjrMpO
        nmdb+rtEx+uy6x0tfp/uriT6KZZ04y2H79aMig7JOklWeHqDkVDq7dXBUGRZ82jdi0Nk8x59QopDs
        WhWLtlaP8l/ZTEvfn9GdTBZjvGGdCiLBQ/46tWFxw2kxfwtuqoRJKei9iwZ7Mwyif+bOV2n1u0Xjy
        ek1eIkSBwnRCIlw0PvgchhJAYPfIBcHDmGRLoudR8Zz0mtqy2tIQUB9pc43ptqXK7XEYElk9uLfF9
        u5zTorp7X8hzIaoj008hmuuq0rnmoYaemrTP3fgSSVFnnxn5oHA5X1b27YtGH/e0n5iEALX9NvXq6
        RMCLcpkw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jWDJ8-0005JQ-4V; Wed, 06 May 2020 06:13:26 +0000
Date:   Tue, 5 May 2020 23:13:26 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     ira.weiny@intel.com
Cc:     linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Christian Koenig <christian.koenig@amd.com>,
        Huang Rui <ray.huang@amd.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        "David S. Miller" <davem@davemloft.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Dan Williams <dan.j.williams@intel.com>,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
        linux-xtensa@linux-xtensa.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH V2 08/11] arch/kmap: Ensure kmap_prot visibility
Message-ID: <20200506061326.GD5192@infradead.org>
References: <20200504010912.982044-1-ira.weiny@intel.com>
 <20200504010912.982044-9-ira.weiny@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200504010912.982044-9-ira.weiny@intel.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, May 03, 2020 at 06:09:09PM -0700, ira.weiny@intel.com wrote:
> From: Ira Weiny <ira.weiny@intel.com>
> 
> We want to support kmap_atomic_prot() on all architectures and it makes
> sense to define kmap_atomic() to use the default kmap_prot.
> 
> So we ensure all arch's have a globally available kmap_prot either as a
> define or exported symbol.

FYI, I still think a

#ifndef kmap_prot
#define kmap_prot PAGE_KERNEL
#endif

in linux/highmem.h would be nicer.  Then only xtensa and sparc need
to override it and clearly stand out.
