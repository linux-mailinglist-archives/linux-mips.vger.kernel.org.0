Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE22C1C0FE8
	for <lists+linux-mips@lfdr.de>; Fri,  1 May 2020 10:47:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728412AbgEAIrX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 1 May 2020 04:47:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728345AbgEAIrV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 1 May 2020 04:47:21 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C02FC035494;
        Fri,  1 May 2020 01:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=pl089AT0ingT7NoKfjMk2J6mfuf4x1buxYuGh93+4eA=; b=Tjmkb8JWDj15XDwTFA+49sOOFe
        +xIEZLVwtaG2fhAS7lfgUS1cDVrbfh6BWR6OskXvwFM+j0REgZOektNNhsNs25HoNHERhIYCC6sD/
        NepT4veACPa0st8H/CrlU+rSbUSJyh7CjcXIRKKEH0du9SPqrcFEK41Oc/Qae7uYbs+DG9WJw967c
        94wTkO8+pjv6VuVZk4wyu18qdQJNr9o5MEkZQGSm26kWu4XtGOtBaz/RRy7mzHfQcvTFdgBSmFgXk
        7KkVyJwp54GaMzvy+SqCAPnXqYRNEvj/QW6g0TheC7v3AhO5n8tEKuQwgxTgqNjlOwCr1PQSz2kOP
        N4Kd4XtA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jURKJ-00035y-Uv; Fri, 01 May 2020 08:47:19 +0000
Date:   Fri, 1 May 2020 01:47:19 -0700
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
Subject: Re: [PATCH V1 08/10] arch/kmap: Don't hard code kmap_prot values
Message-ID: <20200501084719.GI27858@infradead.org>
References: <20200430203845.582900-1-ira.weiny@intel.com>
 <20200430203845.582900-9-ira.weiny@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200430203845.582900-9-ira.weiny@intel.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Apr 30, 2020 at 01:38:43PM -0700, ira.weiny@intel.com wrote:
> From: Ira Weiny <ira.weiny@intel.com>
> 
> To support kmap_atomic_prot() on all architectures each arch must
> support protections passed in to them.
> 
> Change csky, mips, nds32 and xtensa to use their global kmap_prot value
> rather than a hard coded value which was equal.

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
