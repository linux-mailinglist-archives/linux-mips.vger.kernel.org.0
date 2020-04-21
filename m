Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C107E1B1F7A
	for <lists+linux-mips@lfdr.de>; Tue, 21 Apr 2020 09:07:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725992AbgDUHHN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 21 Apr 2020 03:07:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:59644 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725989AbgDUHHM (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 21 Apr 2020 03:07:12 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E98DB206A5;
        Tue, 21 Apr 2020 07:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587452832;
        bh=nSyfKCbkaVtKHCZaeQ7c7Ek5l6MXuMmFCJQlpVuLZfU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NUGOg1mXOuq/6HjHGlurmlbGhycqsLCFz0LK/ZaeGdY21oV5cjw12MYLtLeAPVFbw
         VfFOlg1Z5rWrrgro1MaB35twX1Nt57OaWBkyZtWSW5gWCA7FSq6FKpOboLcPfpRpUG
         9JxWfHvdPYP99brmwfjsmetxSMPBroBpO5dVQfOY=
Date:   Tue, 21 Apr 2020 08:07:05 +0100
From:   Will Deacon <will@kernel.org>
To:     Anshuman Khandual <anshuman.khandual@arm.com>
Cc:     linux-mm@kvack.org, Vineet Gupta <vgupta@synopsys.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        nouveau@lists.freedesktop.org, linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        x86@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mm/thp: Rename pmd_mknotpresent() as pmd_mknotvalid()
Message-ID: <20200421070703.GC14448@willie-the-truck>
References: <1584680057-13753-1-git-send-email-anshuman.khandual@arm.com>
 <1584680057-13753-3-git-send-email-anshuman.khandual@arm.com>
 <20200420210354.GD29998@willie-the-truck>
 <78fee884-78fc-6102-1a37-12106dc21336@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78fee884-78fc-6102-1a37-12106dc21336@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Apr 21, 2020 at 04:57:26AM +0530, Anshuman Khandual wrote:
> 
> 
> On 04/21/2020 02:33 AM, Will Deacon wrote:
> > On Fri, Mar 20, 2020 at 10:24:17AM +0530, Anshuman Khandual wrote:
> >> pmd_present() is expected to test positive after pmdp_mknotpresent() as the
> >> PMD entry still points to a valid huge page in memory. pmdp_mknotpresent()
> >> implies that given PMD entry is just invalidated from MMU perspective while
> >> still holding on to pmd_page() referred valid huge page thus also clearing
> >> pmd_present() test. This creates the following situation which is counter
> >> intuitive.
> >>
> >> [pmd_present(pmd_mknotpresent(pmd)) = true]
> >>
> >> This renames pmd_mknotpresent() as pmd_mknotvalid() reflecting the helper's
> >> functionality more accurately while changing the above mentioned situation
> >> as follows. This does not create any functional change.
> >>
> >> [pmd_present(pmd_mknotvalid(pmd)) = true]
> >>
> >> This is not applicable for platforms that define own pmdp_invalidate() via
> >> __HAVE_ARCH_PMDP_INVALIDATE. Suggestion for renaming came during a previous
> >> discussion here.
> > 
> > Bikeshed alert: maybe pmd_mkinvalid() would be better, given that this is
> > a one-trick pony for pmdp_invalidate()?
> 
> I had thought about making it pmd_mkinvalid() earlier. But as we were replacing
> pmd_mknotpresent(), hence went with similar pattern pmd_mknotvalid() which was
> originally suggested by Catalin. There is an existing pte_mknotpresent() in arc
> platform as well. I dont have a very strong opinion either way, will be happy
> to rename. But then still wondering if we really need to.

I just think that having pmdp_invalidate() call pmd_mkinvalid() makes a lot
of sense and, since this is a pure renaming patch, then that's worth taking
into consideration.

If you go with pmd_mkinvalid(), then:

Acked-by: Will Deacon <will@kernel.org>

Will
