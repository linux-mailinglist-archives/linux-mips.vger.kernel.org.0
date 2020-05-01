Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA5CD1C1B79
	for <lists+linux-mips@lfdr.de>; Fri,  1 May 2020 19:18:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729069AbgEARSa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 1 May 2020 13:18:30 -0400
Received: from mga03.intel.com ([134.134.136.65]:19945 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729202AbgEARSa (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 1 May 2020 13:18:30 -0400
IronPort-SDR: ShSxVb1kpZgQ2bq7gzOdeZ6IhUReEnIjdgcM1Wj5MQ1RfeGgtXVsamZQNuboQpwKctyBI7Q3gk
 mqtOU/6lLtcg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2020 10:18:29 -0700
IronPort-SDR: R2OHZlJ5m4ujiSXIVvaGSStL0azGkDVM04Moca/qctbpNzEmR/lPEzkfc2x5+KowINCeguMIHy
 4dEJuDVXUKuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,340,1583222400"; 
   d="scan'208";a="405797056"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.147])
  by orsmga004.jf.intel.com with ESMTP; 01 May 2020 10:18:28 -0700
Date:   Fri, 1 May 2020 10:18:28 -0700
From:   Ira Weiny <ira.weiny@intel.com>
To:     Christoph Hellwig <hch@infradead.org>
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
Message-ID: <20200501171828.GA673260@iweiny-DESK2.sc.intel.com>
References: <20200430203845.582900-1-ira.weiny@intel.com>
 <20200501085456.GL27858@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200501085456.GL27858@infradead.org>
User-Agent: Mutt/1.11.1 (2018-12-01)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, May 01, 2020 at 01:54:56AM -0700, Christoph Hellwig wrote:
> In addition to the work already it the series, it seems like
> LAST_PKMAP_MASK, PKMAP_ADDR and PKMAP_NR can also be consolidated
> to common code.

Agreed, I mentioned in the cover letter there are similarities...

> 
> Also kmap_atomic_high_prot / kmap_atomic_pfn could move into common
> code, maybe keyed off a symbol selected by the actual users that
> need it.  It also seems like it doesn't actually ever need to be
> exported.

...  but these are not as readily obvious, at least to me.  I do see a pattern
but the differences seemed subtle enough that it would take a while to ensure
correctness.  So I'd like to see this series go in and build on it.

> 
> This in turn would lead to being able to allow io_mapping_map_atomic_wc
> on all architectures, which might make nouveau and qxl happy, but maybe
> that can be left for another series.

I agree, that this should be follow on patches.  I still need to fix the
bisect-ability and I don't want to bog down 0-day with a longer series.

Thanks for the review!
Ira

