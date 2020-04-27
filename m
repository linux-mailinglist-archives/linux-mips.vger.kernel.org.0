Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35FD01B9756
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2020 08:25:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726246AbgD0GZG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Apr 2020 02:25:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726237AbgD0GZG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 27 Apr 2020 02:25:06 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 666FBC061A0F;
        Sun, 26 Apr 2020 23:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=LwzmOb3btwZWep3+YPjYnUvOGv3+Nq/y2Sezku7tCA8=; b=VSN75IUfBcmUoJDShroRnfsCmj
        9zPPKvdLIyfNn1pdI+RzUQxG8Drz1gZp5nqdTSc0D5fqRO+yCabSDOBOntXar0dD+lYu8fs1ACg8f
        0PnAZzp0GqPm20YCs+nf7dOB8ClpAmgYiXVBuRQxM1ooXIGx77Ly1HrKkiQSPZpe1mw3aUMNW/6i/
        hoNa9z+yotMJGgOs3ZcK+OTOEEbPsm91mKaubaVzJWhjVn5C18X4VfBLhZEmpdTsFbcBzxv/Yg9/v
        pDLiEBurSlh3nFqhA5R6COQ9NZp1LZbBu/KG11sxPgc3hNMNgYmsCCyRAR6yJyccSCPflTGJHEfvK
        enZPX1lA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jSxCO-0000ML-4s; Mon, 27 Apr 2020 06:25:00 +0000
Date:   Sun, 26 Apr 2020 23:25:00 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     Ira Weiny <ira.weiny@intel.com>
Cc:     Christoph Hellwig <hch@infradead.org>,
        linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Dan Williams <dan.j.williams@intel.com>,
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
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
        linux-xtensa@linux-xtensa.org
Subject: Re: [PATCH 4/5] arch/kmap_atomic: Consolidate duplicate code
Message-ID: <20200427062500.GA32152@infradead.org>
References: <20200426055406.134198-1-ira.weiny@intel.com>
 <20200426055406.134198-5-ira.weiny@intel.com>
 <20200426072642.GB22024@infradead.org>
 <20200427011630.GC135929@iweiny-DESK2.sc.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200427011630.GC135929@iweiny-DESK2.sc.intel.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Apr 26, 2020 at 06:16:30PM -0700, Ira Weiny wrote:
> > That might require to support
> > kmap_atomic_prot everywhere first, which sounds like a really good
> > idea anyway, and would avoid the need for strange workaround in drm.
> 
> Having a kmap_atomic_prot() seems like a good idea.  But I'm not exactly sure
> why CONFIG_x86 is being called out specifically in the DRM code?

Probably because it only existed on x86 back then.  And drm has a
tendency of working around core problems with hacks instead of doing
the fairly easy fixups.
