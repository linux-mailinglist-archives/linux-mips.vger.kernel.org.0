Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE0FB1B9476
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2020 00:23:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726316AbgDZWXg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 26 Apr 2020 18:23:36 -0400
Received: from mga18.intel.com ([134.134.136.126]:57089 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726199AbgDZWXf (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 26 Apr 2020 18:23:35 -0400
IronPort-SDR: /EeYe0Az8a6pxrdjFFSn4HxU/VVcAl/f756mT7VWsPy2UN4gu2g1UHYhqClo4iSpsH3GJop/uV
 dH0qQnBPkHjw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2020 15:23:35 -0700
IronPort-SDR: 8yV2Y6IG5lNoT1jn6/HH2CElcZY0fcyD0N/RoyhP0ObnAngZTUc4uRHLGC5CCH89hOtD39Sa16
 WtvX0Mtzph+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,321,1583222400"; 
   d="scan'208";a="458601785"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.147])
  by fmsmga006.fm.intel.com with ESMTP; 26 Apr 2020 15:23:34 -0700
Date:   Sun, 26 Apr 2020 15:23:34 -0700
From:   Ira Weiny <ira.weiny@intel.com>
To:     Christoph Hellwig <hch@infradead.org>
Cc:     linux-kernel@vger.kernel.org,
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
Subject: Re: [PATCH 2/5] arch/kmap: Remove redundant arch specific kmaps
Message-ID: <20200426222333.GA135929@iweiny-DESK2.sc.intel.com>
References: <20200426055406.134198-1-ira.weiny@intel.com>
 <20200426055406.134198-3-ira.weiny@intel.com>
 <20200426071715.GA22024@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200426071715.GA22024@infradead.org>
User-Agent: Mutt/1.11.1 (2018-12-01)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Apr 26, 2020 at 12:17:15AM -0700, Christoph Hellwig wrote:
> On Sat, Apr 25, 2020 at 10:54:03PM -0700, ira.weiny@intel.com wrote:
> > From: Ira Weiny <ira.weiny@intel.com>
> > 
> > The kmap code for all the architectures is almost 100% identical.
> > 
> > Lift the common code to the core.  Use ARCH_HAS_KMAP to indicate if an
> > arch needs a special kmap.
> 
> Can you add a kmap_flush_tlb hook that csky and mips define, and the
> just entirely consolidate the code instead?

Sure that seems to work.

Ira
