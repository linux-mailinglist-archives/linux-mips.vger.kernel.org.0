Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB1691C0FBF
	for <lists+linux-mips@lfdr.de>; Fri,  1 May 2020 10:38:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728426AbgEAIid (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 1 May 2020 04:38:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728325AbgEAIid (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 1 May 2020 04:38:33 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7369CC035494;
        Fri,  1 May 2020 01:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=ivAc0pr0eeBU4LFi2n7IskmFCnoDA5E7SPMDero85g0=; b=Klz9DZlz8E1SHv8vZTRD5G5yKU
        2koBYs8LdXWlZqi3eHIAgRSPjtmRn86vJbPmmL76whHFL7HtOCwZ8NRbN9WmKvZ6ss18VsBjaEBk+
        v4/Meb9+spfjpn3l1MAWguZ/V81zOZbgvrLpn02ZfM1BySvXJ2ufH+6cifcju1Yg94axXD0G04qw+
        YtxLXqDOy10KT6TrKFgV34ZW1Zpkgn9yl/rF498MMc5WiDeobIUynSijdWgVI/JjUqtHII4gVb653
        wuLotWqbKtES/7ftneQBY9DWqvfXLsbCsmktQNSTKXN1Gw/1PNWmln9ocIjhpi6Xppu9pWH1YbgCF
        Gt9X6UXA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jURBn-0004Yp-69; Fri, 01 May 2020 08:38:31 +0000
Date:   Fri, 1 May 2020 01:38:31 -0700
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
Subject: Re: [PATCH V1 04/10] arch/kunmap: Remove duplicate kunmap
 implementations
Message-ID: <20200501083831.GD27858@infradead.org>
References: <20200430203845.582900-1-ira.weiny@intel.com>
 <20200430203845.582900-5-ira.weiny@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200430203845.582900-5-ira.weiny@intel.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Apr 30, 2020 at 01:38:39PM -0700, ira.weiny@intel.com wrote:
> From: Ira Weiny <ira.weiny@intel.com>
> 
> All architectures do exactly the same thing for kunmap(); remove all the
> duplicate definitions and lift the call to the core.
> 
> This also has the benefit of changing kmap_unmap() on a number of
> architectures to be an inline call rather than an actual function.
> 
> Signed-off-by: Ira Weiny <ira.weiny@intel.com>

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
