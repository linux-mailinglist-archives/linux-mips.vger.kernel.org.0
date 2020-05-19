Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2931C1DA11D
	for <lists+linux-mips@lfdr.de>; Tue, 19 May 2020 21:42:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726333AbgESTmT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 19 May 2020 15:42:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726059AbgESTmT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 19 May 2020 15:42:19 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C72EC08C5C0;
        Tue, 19 May 2020 12:42:18 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id t7so322568plr.0;
        Tue, 19 May 2020 12:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1PbPu9MDpsX7CWlzIANvDidpxlS/QMPqApRlwiiHNw8=;
        b=Azzo19mxTglIY2DWsdeqvJCJvbRFWfMvCqe910K+bLoZcz9A0rEclUKyMtzUQpeHzC
         onlWdkJh3IcWILK4c2hRtOtl7mRzAbiyLlEcJdxmOebPU1v944BfCUyeskdH4MaSANGB
         mG1De8kuL8xqrOY6I9z2/irGnDdt+dXuW+nblD5+Bi7nB5W52s0/6ICGfZDepT9Noian
         auesxCt7/j2cCzmSLOIHL82Wa50HphpyDMpe82o3c9PeVBitNH+3VinlNYT9yXfWiYMK
         CoPZr98AYh6qGXAhrwf3fwANeJXKXy93GRy48lcmGQT0TIdmPLv0mxuhYKT+dVSO6mfx
         T51Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=1PbPu9MDpsX7CWlzIANvDidpxlS/QMPqApRlwiiHNw8=;
        b=muQgYRs8PWFmw+0Q6zo9YE+N4fpk8xc2fojL7wA7X1hgYOeeIAvhVdb/eT8P9Xyci+
         mAib5D42bW08+zF3cWsU5GvG/9kkf0BiU3ouZQQuv5GS5/TZmncYnEAorXo0LMmNxw1+
         GG7kmDGE9fEABTWzI6Ljo38Z6yO2JFmGNn6scls6fjCEH35Md/UI7Vv1Bx5YId7or8bc
         Rj7x+cHMooknGwvjX78/eAaIPlWzg9RBhvIIBf+BxIHfDMNKlidplTsWg5o+gHqxA5n7
         YsfvIcw8yYAJzn/EH3JWW411lPQfeWxK9CS8gpMEZMIV8Wm11cfOG/q46At9t5Sbq5nU
         OLqA==
X-Gm-Message-State: AOAM531JoJhSFEwRJv9NnJz741pbTd/XZMK6SmJlVeDjt0YlN/iFxY3L
        p9GlTG79r8itb6mg0+LQvPU=
X-Google-Smtp-Source: ABdhPJyHaPx1l/c1P1VXN2zRGyOacWb0vDLgVVmiFhoO/p9Se1Yt0uzr0GEQ80rPSqJdr43xSsWcZA==
X-Received: by 2002:a17:90a:4811:: with SMTP id a17mr1198137pjh.130.1589917337613;
        Tue, 19 May 2020 12:42:17 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x5sm234038pfq.196.2020.05.19.12.42.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 May 2020 12:42:16 -0700 (PDT)
Date:   Tue, 19 May 2020 12:42:15 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Ira Weiny <ira.weiny@intel.com>
Cc:     linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
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
        Al Viro <viro@zeniv.linux.org.uk>,
        Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] arch/{mips,sparc,microblaze,powerpc}: Don't enable
 pagefault/preempt twice
Message-ID: <20200519194215.GA71941@roeck-us.net>
References: <20200507150004.1423069-8-ira.weiny@intel.com>
 <20200518184843.3029640-1-ira.weiny@intel.com>
 <20200519165422.GA5838@roeck-us.net>
 <20200519184031.GB3356843@iweiny-DESK2.sc.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200519184031.GB3356843@iweiny-DESK2.sc.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, May 19, 2020 at 11:40:32AM -0700, Ira Weiny wrote:
> On Tue, May 19, 2020 at 09:54:22AM -0700, Guenter Roeck wrote:
> > On Mon, May 18, 2020 at 11:48:43AM -0700, ira.weiny@intel.com wrote:
> > > From: Ira Weiny <ira.weiny@intel.com>
> > > 
> > > The kunmap_atomic clean up failed to remove one set of pagefault/preempt
> > > enables when vaddr is not in the fixmap.
> > > 
> > > Fixes: bee2128a09e6 ("arch/kunmap_atomic: consolidate duplicate code")
> > > Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> > 
> > microblazeel works with this patch,
> 
> Awesome...  Andrew in my rush yesterday I should have put a reported by on the
> patch for Guenter as well.
> 
> Sorry about that Guenter,

No worries.

> Ira
> 
> > as do the nosmp sparc32 boot tests,
> > but sparc32 boot tests with SMP enabled still fail with lots of messages
> > such as:
> > 
> > BUG: Bad page state in process swapper/0  pfn:006a1
> > page:f0933420 refcount:0 mapcount:1 mapping:(ptrval) index:0x1
> > flags: 0x0()
> > raw: 00000000 00000100 00000122 00000000 00000001 00000000 00000000 00000000
> > page dumped because: nonzero mapcount
> > Modules linked in:
> > CPU: 0 PID: 1 Comm: swapper/0 Tainted: G    B             5.7.0-rc6-next-20200518-00002-gb178d2d56f29 #1
> > [f00e7ab8 :
> > bad_page+0xa8/0x108 ]
> > [f00e8b54 :
> > free_pcppages_bulk+0x154/0x52c ]
> > [f00ea024 :
> > free_unref_page+0x54/0x6c ]
> > [f00ed864 :
> > free_reserved_area+0x58/0xec ]
> > [f0527104 :
> > kernel_init+0x14/0x110 ]
> > [f000b77c :
> > ret_from_kernel_thread+0xc/0x38 ]
> > [00000000 :
> > 0x0 ]
> > 
> > Code path leading to that message is different but always the same
> > from free_unref_page().
> > 
> > Still testing ppc images.
> > 

ppc image tests are passing with this patch.

Guenter
