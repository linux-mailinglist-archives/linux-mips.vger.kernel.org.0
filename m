Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75B871C6830
	for <lists+linux-mips@lfdr.de>; Wed,  6 May 2020 08:14:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726796AbgEFGON (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 6 May 2020 02:14:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726495AbgEFGON (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 6 May 2020 02:14:13 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D22AC061A0F;
        Tue,  5 May 2020 23:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=4GHTrlwGxcD7riSfw6FoiiWpv9lgWgy1e6SGI+Jf+lk=; b=YQdcPidwWxUsGPCqlsV5vlo08W
        WE8x+MoDuXM7hVPD+/jHc3dDvfTrn9tM8b6ev+ngbwncTVqcdaxewm6WCDle9njCK90Fa6uDM8pzz
        V1XKGx1+Kpcns1k6UZYJf5Fj5DEan46YXQrVVoWIg1pzlOvy252FRwu+V+Xz4mzIUqpwuO0rHOWQ3
        44n+12vujyorLPu546uL9Jr9Rjc2cs3Px+jF8MGMUozOLUVhKI7jXCci3SoqI+7OPayG3rYjHx9QF
        3xqDiBy6CDrTege8f3bj4NtjfsI9xry8OurnktjyDACV315FnjWOvzsuEqTT6dzYmPcWVFR+g3F8g
        +dARHVUA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jWDJq-00064d-Uc; Wed, 06 May 2020 06:14:10 +0000
Date:   Tue, 5 May 2020 23:14:10 -0700
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
Subject: Re: [PATCH V2 10/11] arch/kmap: Define kmap_atomic_prot() for all
 arch's
Message-ID: <20200506061410.GE5192@infradead.org>
References: <20200504010912.982044-1-ira.weiny@intel.com>
 <20200504010912.982044-11-ira.weiny@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200504010912.982044-11-ira.weiny@intel.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, May 03, 2020 at 06:09:11PM -0700, ira.weiny@intel.com wrote:
> From: Ira Weiny <ira.weiny@intel.com>
> 
> To support kmap_atomic_prot(), all architectures need to support
> protections passed to their kmap_atomic_high() function.  Pass
> protections into kmap_atomic_high() and change the name to
> kmap_atomic_high_prot() to match.
> 
> Then define kmap_atomic_prot() as a core function which calls
> kmap_atomic_high_prot() when needed.
> 
> Finally, redefine kmap_atomic() as a wrapper of kmap_atomic_prot() with
> the default kmap_prot exported by the architectures.
> 
> Signed-off-by: Ira Weiny <ira.weiny@intel.com>

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
