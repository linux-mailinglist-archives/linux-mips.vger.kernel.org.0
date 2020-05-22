Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18EC11DDCA4
	for <lists+linux-mips@lfdr.de>; Fri, 22 May 2020 03:30:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726835AbgEVBaI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 21 May 2020 21:30:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726693AbgEVBaI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 21 May 2020 21:30:08 -0400
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [IPv6:2002:c35c:fd02::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79676C061A0E;
        Thu, 21 May 2020 18:30:06 -0700 (PDT)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.93 #3 (Red Hat Linux))
        id 1jbwVS-00DFOA-8Y; Fri, 22 May 2020 01:29:50 +0000
Date:   Fri, 22 May 2020 02:29:50 +0100
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
Message-ID: <20200522012950.GN23230@ZenIV.linux.org.uk>
References: <20200507150004.1423069-8-ira.weiny@intel.com>
 <20200518184843.3029640-1-ira.weiny@intel.com>
 <20200519165422.GA5838@roeck-us.net>
 <20200521172704.GF23230@ZenIV.linux.org.uk>
 <bdc8dc64-622c-3b0d-1ae1-48222cf34358@roeck-us.net>
 <20200521224612.GJ23230@ZenIV.linux.org.uk>
 <20200522004618.GA3151350@ZenIV.linux.org.uk>
 <970857bd-bb56-7b2e-833e-ca74a82fa9b5@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <970857bd-bb56-7b2e-833e-ca74a82fa9b5@roeck-us.net>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, May 21, 2020 at 06:11:08PM -0700, Guenter Roeck wrote:

> Mainline, with:
> 
> qemu-system-sparc -M SS-4 -kernel arch/sparc/boot/zImage -no-reboot \
> 	-snapshot -drive file=rootfs.ext2,format=raw,if=scsi \
> 	-append "panic=-1 slub_debug=FZPUA root=/dev/sda console=ttyS0"
> 	-nographic -monitor none
> 
> The machine doesn't really matter, though.

It does, unfortunately - try that with SS-10 and watch what happens ;-/
