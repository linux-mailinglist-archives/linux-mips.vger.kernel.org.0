Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7B181C8139
	for <lists+linux-mips@lfdr.de>; Thu,  7 May 2020 06:56:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725985AbgEGE4m (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 7 May 2020 00:56:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725763AbgEGE4l (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 7 May 2020 00:56:41 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3F38C061A0F;
        Wed,  6 May 2020 21:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=e6F2FSy+90a4CBJo4OFpHQu5UPPeprM5/VV6nvsaHNM=; b=IlQ1KLt/gfQCNp/2YYACfzUAvM
        X/D5zrnZbBJxt4fTTkPRbO0abBcL5UXSvP84F3pPiIKxAGFEcl0xmqfpM7SKTkfFhy+zfxZO3G62A
        uZthWGV2OnNDMsi0cfOMM+An4MO1GRWhWTkz1lsyuUFOkgyogfeK3xhYK3nVrNJFK4P9k2YApbYLS
        xaT/yyR80cCXHfwpXgNAv58HSFjqMIUPIpU0BCSBWczC4w2kz827bDjcqGkFfFvM6T7zRK1d2rlLh
        YklmG0qnLg1nMAomIrEjNIjAlS1kupgS9seSUIxmvcLlYnLCQ3TeufhT7atUo69S5WcDWW83nplQQ
        mAh83sVw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jWYaE-0001Ho-Mm; Thu, 07 May 2020 04:56:30 +0000
Date:   Wed, 6 May 2020 21:56:30 -0700
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
Message-ID: <20200507045630.GA22061@infradead.org>
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
> 
> Signed-off-by: Ira Weiny <ira.weiny@intel.com>

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
