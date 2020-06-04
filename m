Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C27BD1EDD70
	for <lists+linux-mips@lfdr.de>; Thu,  4 Jun 2020 08:44:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727783AbgFDGos (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 4 Jun 2020 02:44:48 -0400
Received: from mga09.intel.com ([134.134.136.24]:30581 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727774AbgFDGoq (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 4 Jun 2020 02:44:46 -0400
IronPort-SDR: V6OsyqcfcyOBgZQlHSsptKANTSuPSl6zBXklPJyl2I4yhhXIS53l9C+c2oH+ZlsHow0c8Sny6k
 1rEBEMBBocsg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2020 23:44:45 -0700
IronPort-SDR: Hi+ARyh48YSb32/Pt8vOy4p7zx/cFnMDyZyMrnGYxWixi6a4PkX1oDrgQ4wPYlujYL2xH3fTes
 IcRlwA5YSB6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,471,1583222400"; 
   d="scan'208";a="445398016"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.147])
  by orsmga005.jf.intel.com with ESMTP; 03 Jun 2020 23:44:44 -0700
Date:   Wed, 3 Jun 2020 23:44:44 -0700
From:   Ira Weiny <ira.weiny@intel.com>
To:     Mike Rapoport <rppt@kernel.org>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org,
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
        Al Viro <viro@zeniv.linux.org.uk>,
        Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] arch/{mips,sparc,microblaze,powerpc}: Don't enable
 pagefault/preempt twice
Message-ID: <20200604064444.GD1740285@iweiny-DESK2.sc.intel.com>
References: <20200519184031.GB3356843@iweiny-DESK2.sc.intel.com>
 <20200519194215.GA71941@roeck-us.net>
 <20200520051315.GA3660833@iweiny-DESK2.sc.intel.com>
 <d86dba19-4f4b-061e-a2c7-4f037e9e2de2@roeck-us.net>
 <20200521174250.GB176262@iweiny-DESK2.sc.intel.com>
 <20200603135736.e7b5ded0082a81ae6d9067a0@linux-foundation.org>
 <20200603211416.GA1740285@iweiny-DESK2.sc.intel.com>
 <3538c8ad-674e-d310-d870-4ef6888092ed@roeck-us.net>
 <20200604062226.GA1740345@iweiny-DESK2.sc.intel.com>
 <20200604063745.GB202650@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200604063745.GB202650@kernel.org>
User-Agent: Mutt/1.11.1 (2018-12-01)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jun 04, 2020 at 09:37:45AM +0300, Mike Rapoport wrote:
> On Wed, Jun 03, 2020 at 11:22:26PM -0700, Ira Weiny wrote:
> > On Wed, Jun 03, 2020 at 04:44:17PM -0700, Guenter Roeck wrote:
> > 
> > With linux-next on sparc I too see the spinlock issue; something like:
> > 
> > ...
> > Starting syslogd: BUG: spinlock recursion on CPU#0, S01syslogd/139
> >  lock: 0xf53ef350, .magic: dead4ead, .owner: S01syslogd/139, .owner_cpu: 0
> > CPU: 0 PID: 139 Comm: S01syslogd Not tainted 5.7.0-next-20200603 #1
> > [f0067d00 : 
> > do_raw_spin_lock+0xa8/0xd8 ] 
> > [f00d598c : 
> > copy_page_range+0x328/0x804 ] 
> > [f0025c34 : 
> > dup_mm+0x334/0x434 ] 
> > [f0027198 : 
> > copy_process+0x1248/0x12d4 ] 
> > [f00273b8 : 
> > _do_fork+0x54/0x30c ] 
> > [f00276e4 : 
> > do_fork+0x5c/0x6c ] 
> > [f000de44 : 
> > sparc_do_fork+0x18/0x38 ] 
> > [f000b7f4 : 
> > do_syscall+0x34/0x40 ] 
> > [5010cd4c : 
> > 0x5010cd4c ] 
> > 
> > 
> > I'm going to bisect between there and HEAD.
> 
> The sparc issue should be fixed by 
> 
> https://lore.kernel.org/lkml/20200526173302.377-1-will@kernel.org

Saw your other email.  And yes they are!

Thanks!
Ira

>  
> > Ira
> 
> -- 
> Sincerely yours,
> Mike.
