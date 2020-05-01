Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 263F41C0FC6
	for <lists+linux-mips@lfdr.de>; Fri,  1 May 2020 10:39:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728461AbgEAIjY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 1 May 2020 04:39:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728401AbgEAIjY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 1 May 2020 04:39:24 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25B44C035494;
        Fri,  1 May 2020 01:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=f6i/xXj+8xtv4i22gfS0ySJPzU3clX0TdMX0edwFM/I=; b=Zyd93s+bm2ePG0jOQHcgxBCEBA
        6b5dOkkiT2pXWdM71f9e6vaLLrQIkrOkBDPfj3evYLbHCDF9EES2sdwX8vKo9fBDLQ9chfKpmBb9V
        iYtVnGSVa9aiEZUq/+IyuYPjewHhYCpSe5+Q1wnCqjiAREX8W2gvp1hCZEUu1pV8+TxvD1e8ZM/50
        3CcOHs3JR4YP/zsefvXKqPeeQl/UyiJlpVuy5zTQgHnF4PtTxM2hhA4pImy/Nvqa9qhWCI+2Nrf8O
        UyXf4jgzjpm5+oUUirgSJDvx4s4zWQqSRpVTVx8jNFRNA1fKitKl1vCJx+V+B0oEFsKxD/Wli57Cu
        iO3no+iA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jURCc-000555-Ra; Fri, 01 May 2020 08:39:22 +0000
Date:   Fri, 1 May 2020 01:39:22 -0700
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
        Thomas Gleixner <tglx@linutronix.de>,
        Helge Deller <deller@gmx.de>, x86@kernel.org,
        linux-csky@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
        linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
        Borislav Petkov <bp@alien8.de>,
        Andy Lutomirski <luto@kernel.org>,
        Dan Williams <dan.j.williams@intel.com>,
        linux-arm-kernel@lists.infradead.org,
        Chris Zankel <chris@zankel.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org,
        "David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH V1 05/10] arch/kmap_atomic: Consolidate duplicate code
Message-ID: <20200501083922.GE27858@infradead.org>
References: <20200430203845.582900-1-ira.weiny@intel.com>
 <20200430203845.582900-6-ira.weiny@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200430203845.582900-6-ira.weiny@intel.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Apr 30, 2020 at 01:38:40PM -0700, ira.weiny@intel.com wrote:
> From: Ira Weiny <ira.weiny@intel.com>
> 
> Every arch has the same code to ensure atomic operations and a check for
> !HIGHMEM page.
> 
> Remove the duplicate code by defining a core kmap_atomic() which only
> calls the arch specific kmap_atomic_high() when the page is high memory.
> 
> Signed-off-by: Ira Weiny <ira.weiny@intel.com>

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
