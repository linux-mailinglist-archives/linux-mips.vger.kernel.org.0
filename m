Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C7811C67FF
	for <lists+linux-mips@lfdr.de>; Wed,  6 May 2020 08:12:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726736AbgEFGMd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 6 May 2020 02:12:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726712AbgEFGMc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 6 May 2020 02:12:32 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2103C061A0F;
        Tue,  5 May 2020 23:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=Oc7HruaqMyMr9pTlVN1ulKYPOvpUsDEw+vO89pPdjyA=; b=j952TzFrbpHbH5dTGsB49rrCV2
        t1BowzsK1PnLyvg0lTCicbOUDm6PEyLVlvMpcMMUHbXceEhf1kp8HDLBVXrHgganuuymqfj54ljrR
        z1m4PJ0Ro+S0bDyz/mC1OhV65GLm8CfEzbnzVsP+K8pxAH+oPcWn5Ywc+/caniRYXzanTAFtxoHDb
        n9eHKd095iiiXu0QHpCuPklZcAM5tTh1mCzabpDTQYzBHrWPayhql6HbCDZF9Yy60RJ+G6gyIoRyH
        2C4b3K1foDBtZf0HqP4Lrr3tpOPiecFX4lz/sxjRu/SwSYdF4Wog1oFq8RQDe0W/3J3JLRBDJnwR3
        AZMrrU1g==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jWDIF-0004bp-TW; Wed, 06 May 2020 06:12:31 +0000
Date:   Tue, 5 May 2020 23:12:31 -0700
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
Subject: Re: [PATCH V2 07/11] arch/kunmap_atomic: Consolidate duplicate code
Message-ID: <20200506061231.GC5192@infradead.org>
References: <20200504010912.982044-1-ira.weiny@intel.com>
 <20200504010912.982044-8-ira.weiny@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200504010912.982044-8-ira.weiny@intel.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, May 03, 2020 at 06:09:08PM -0700, ira.weiny@intel.com wrote:
> From: Ira Weiny <ira.weiny@intel.com>
> 
> Every single architecture (including !CONFIG_HIGHMEM) calls...
> 
> 	pagefault_enable();
> 	preempt_enable();
> 
> ... before returning from __kunmap_atomic().  Lift this code into the
> kunmap_atomic() macro.
> 
> While we are at it rename __kunmap_atomic() to kunmap_atomic_high() to
> be consistent.
> 
> Signed-off-by: Ira Weiny <ira.weiny@intel.com>

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
