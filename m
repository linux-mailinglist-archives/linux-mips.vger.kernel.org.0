Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B96531B17ED
	for <lists+linux-mips@lfdr.de>; Mon, 20 Apr 2020 23:04:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727090AbgDTVEC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 20 Apr 2020 17:04:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:37876 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726387AbgDTVEC (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 20 Apr 2020 17:04:02 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5C73920724;
        Mon, 20 Apr 2020 21:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587416641;
        bh=B6tu4PQYxSMIHwT8IIW2BqLBbquTlTHzD+k7VKRWKiY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KLGeSVsaKscXEomFaxLVk4/08pxBFxLmWwvvp/xVS1rq81o2K8P2Bnl1v4kjl/sb2
         XFU86f/Aa7FwnQNCuJpc1uYdan2zLkqza8h9twbemUXWVnnZf6ZvW2IinHp4Lp24AC
         ML8bBjhsBDp85WIi7Pe/U+i6OaK7Z5IAiZJu87jg=
Date:   Mon, 20 Apr 2020 22:03:55 +0100
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
Message-ID: <20200420210354.GD29998@willie-the-truck>
References: <1584680057-13753-1-git-send-email-anshuman.khandual@arm.com>
 <1584680057-13753-3-git-send-email-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1584680057-13753-3-git-send-email-anshuman.khandual@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Mar 20, 2020 at 10:24:17AM +0530, Anshuman Khandual wrote:
> pmd_present() is expected to test positive after pmdp_mknotpresent() as the
> PMD entry still points to a valid huge page in memory. pmdp_mknotpresent()
> implies that given PMD entry is just invalidated from MMU perspective while
> still holding on to pmd_page() referred valid huge page thus also clearing
> pmd_present() test. This creates the following situation which is counter
> intuitive.
> 
> [pmd_present(pmd_mknotpresent(pmd)) = true]
> 
> This renames pmd_mknotpresent() as pmd_mknotvalid() reflecting the helper's
> functionality more accurately while changing the above mentioned situation
> as follows. This does not create any functional change.
> 
> [pmd_present(pmd_mknotvalid(pmd)) = true]
> 
> This is not applicable for platforms that define own pmdp_invalidate() via
> __HAVE_ARCH_PMDP_INVALIDATE. Suggestion for renaming came during a previous
> discussion here.

Bikeshed alert: maybe pmd_mkinvalid() would be better, given that this is
a one-trick pony for pmdp_invalidate()?

Will
