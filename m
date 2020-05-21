Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03F921DDA72
	for <lists+linux-mips@lfdr.de>; Fri, 22 May 2020 00:46:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730690AbgEUWqh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 21 May 2020 18:46:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730329AbgEUWqh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 21 May 2020 18:46:37 -0400
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [IPv6:2002:c35c:fd02::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7896C061A0E;
        Thu, 21 May 2020 15:46:36 -0700 (PDT)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.93 #3 (Red Hat Linux))
        id 1jbtx6-00DBBY-7g; Thu, 21 May 2020 22:46:12 +0000
Date:   Thu, 21 May 2020 23:46:12 +0100
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     ira.weiny@intel.com, linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
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
        linux-xtensa@linux-xtensa.org, dri-devel@lists.freedesktop.org,
        Christian Koenig <christian.koenig@amd.com>,
        Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] arch/{mips,sparc,microblaze,powerpc}: Don't enable
 pagefault/preempt twice
Message-ID: <20200521224612.GJ23230@ZenIV.linux.org.uk>
References: <20200507150004.1423069-8-ira.weiny@intel.com>
 <20200518184843.3029640-1-ira.weiny@intel.com>
 <20200519165422.GA5838@roeck-us.net>
 <20200521172704.GF23230@ZenIV.linux.org.uk>
 <bdc8dc64-622c-3b0d-1ae1-48222cf34358@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bdc8dc64-622c-3b0d-1ae1-48222cf34358@roeck-us.net>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, May 21, 2020 at 03:20:46PM -0700, Guenter Roeck wrote:
> On 5/21/20 10:27 AM, Al Viro wrote:
> > On Tue, May 19, 2020 at 09:54:22AM -0700, Guenter Roeck wrote:
> >> On Mon, May 18, 2020 at 11:48:43AM -0700, ira.weiny@intel.com wrote:
> >>> From: Ira Weiny <ira.weiny@intel.com>
> >>>
> >>> The kunmap_atomic clean up failed to remove one set of pagefault/preempt
> >>> enables when vaddr is not in the fixmap.
> >>>
> >>> Fixes: bee2128a09e6 ("arch/kunmap_atomic: consolidate duplicate code")
> >>> Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> >>
> >> microblazeel works with this patch, as do the nosmp sparc32 boot tests,
> >> but sparc32 boot tests with SMP enabled still fail with lots of messages
> >> such as:
> > 
> > BTW, what's your setup for sparc32 boot tests?  IOW, how do you manage to
> > shrink the damn thing enough to have the loader cope with it?  I hadn't
> > been able to do that for the current mainline ;-/
> > 
> 
> defconfig seems to work just fine, even after enabling various debug
> and file system options.

The hell?  How do you manage to get the kernel in?  sparc32_defconfig
ends up with 5316876 bytes unpacked...
