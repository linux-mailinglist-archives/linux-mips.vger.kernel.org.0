Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11EA014BEDD
	for <lists+linux-mips@lfdr.de>; Tue, 28 Jan 2020 18:47:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726233AbgA1RrR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Jan 2020 12:47:17 -0500
Received: from foss.arm.com ([217.140.110.172]:32994 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726111AbgA1RrR (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 28 Jan 2020 12:47:17 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5C6C9328;
        Tue, 28 Jan 2020 09:47:16 -0800 (PST)
Received: from arrakis.emea.arm.com (arrakis.cambridge.arm.com [10.1.196.47])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1F3B43F52E;
        Tue, 28 Jan 2020 09:47:11 -0800 (PST)
Date:   Tue, 28 Jan 2020 17:47:09 +0000
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Qian Cai <cai@lca.pw>
Cc:     Anshuman Khandual <Anshuman.Khandual@arm.com>,
        Mark Rutland <Mark.Rutland@arm.com>,
        linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        James Hogan <jhogan@kernel.org>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
        Dave Hansen <dave.hansen@intel.com>,
        Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-s390@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
        x86@kernel.org, Russell King - ARM Linux <linux@armlinux.org.uk>,
        Matthew Wilcox <willy@infradead.org>,
        Steven Price <Steven.Price@arm.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Ingo Molnar <mingo@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Mark Brown <broonie@kernel.org>,
        "Kirill A . Shutemov" <kirill@shutemov.name>,
        Dan Williams <dan.j.williams@intel.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Christophe Leroy <christophe.leroy@c-s.fr>,
        Sri Krishna chowdary <schowdary@nvidia.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-mips@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
        linux-kernel@vger.kernel.org, Paul Burton <paul.burton@mips.com>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        Vineet Gupta <vgupta@synopsys.com>,
        Martin Schwidefsky <schwidefsky@de.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linuxppc-dev@lists.ozlabs.org,
        "David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH V12] mm/debug: Add tests validating architecture page
 table helpers
Message-ID: <20200128174709.GK655507@arrakis.emea.arm.com>
References: <1580174873-18117-1-git-send-email-anshuman.khandual@arm.com>
 <14882A91-17DE-4ABD-ABF2-08E7CCEDF660@lca.pw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <14882A91-17DE-4ABD-ABF2-08E7CCEDF660@lca.pw>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Jan 27, 2020 at 09:11:53PM -0500, Qian Cai wrote:
> On Jan 27, 2020, at 8:28 PM, Anshuman Khandual <Anshuman.Khandual@arm.com> wrote:
> > This adds tests which will validate architecture page table helpers and
> > other accessors in their compliance with expected generic MM semantics.
> > This will help various architectures in validating changes to existing
> > page table helpers or addition of new ones.
[...]
> What’s the value of this block of new code? It only supports x86 and
> arm64 which are supposed to be good now. Did those tests ever find any
> regression or this is almost only useful for new architectures which
> only happened once in a few years?

The primary goal here is not finding regressions but having clearly
defined semantics of the page table accessors across architectures. x86
and arm64 are a good starting point and other architectures will be
enabled as they are aligned to the same semantics.

See for example this past discussion:

https://lore.kernel.org/linux-mm/20190628102003.GA56463@arrakis.emea.arm.com/

These tests should act as the 'contract' between the generic mm code and
the architecture port. Without clear semantics, some bugs may be a lot
subtler than a boot failure.

FTR, I fully support this patch (and I should get around to review it
properly; thanks for the reminder ;)).

-- 
Catalin
