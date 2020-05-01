Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC2931C1012
	for <lists+linux-mips@lfdr.de>; Fri,  1 May 2020 10:54:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728217AbgEAIy7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 1 May 2020 04:54:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728371AbgEAIy6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 1 May 2020 04:54:58 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F14DC035495;
        Fri,  1 May 2020 01:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=uWvJuIwmG8i3wQO62yF1brXrFbwf5wKrq2JLj+a3sMk=; b=AqPa33Fsw9Y3rKhPmms+1fV9JS
        jmr/agWlYTZgYOVeoHYa4Ly+XO4JC/t6jDBANLRGmHFS0R1TYLeqqu2eOKzj8CaHQ1Ka3Bk6WR8Vj
        tuLDsCIFrS0YeSKpUvZ3GI3C/58pZycLXMfzK11IemkycTgv2D8VAddPRhOk4cMa+thg+A1txwTyq
        usYC8fmtqJj5y9lhVoy8Cqd9H6n9JjjKWtcP99kULdC+zbSRZhV1ElYhHM67gJEN5F6ZWIYX+yU8i
        X8KJlIGxpwlx8Eelgq1sd/YS2+Sigds2pdvY+xhwhTFuROwRegHBf6ub1IgkngdMS0YeakRlLP61c
        lwUXM5sQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jURRg-0007jI-Hu; Fri, 01 May 2020 08:54:56 +0000
Date:   Fri, 1 May 2020 01:54:56 -0700
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
Subject: Re: [PATCH V1 00/10] Remove duplicated kmap code
Message-ID: <20200501085456.GL27858@infradead.org>
References: <20200430203845.582900-1-ira.weiny@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200430203845.582900-1-ira.weiny@intel.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

In addition to the work already it the series, it seems like
LAST_PKMAP_MASK, PKMAP_ADDR and PKMAP_NR can also be consolidated
to common code.

Also kmap_atomic_high_prot / kmap_atomic_pfn could move into common
code, maybe keyed off a symbol selected by the actual users that
need it.  It also seems like it doesn't actually ever need to be
exported.

This in turn would lead to being able to allow io_mapping_map_atomic_wc
on all architectures, which might make nouveau and qxl happy, but maybe
that can be left for another series.
