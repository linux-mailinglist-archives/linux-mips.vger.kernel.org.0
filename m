Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D90B514DBFC
	for <lists+linux-mips@lfdr.de>; Thu, 30 Jan 2020 14:32:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727304AbgA3Nci (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 30 Jan 2020 08:32:38 -0500
Received: from foss.arm.com ([217.140.110.172]:53060 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726948AbgA3Nci (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 30 Jan 2020 08:32:38 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 146671FB;
        Thu, 30 Jan 2020 05:32:35 -0800 (PST)
Received: from [192.168.0.129] (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0AE453F68E;
        Thu, 30 Jan 2020 05:32:21 -0800 (PST)
Subject: Re: [PATCH V12] mm/debug: Add tests validating architecture page
 table helpers
To:     Mike Rapoport <rppt@linux.ibm.com>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>
Cc:     Qian Cai <cai@lca.pw>, Linux-MM <linux-mm@kvack.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Dan Williams <dan.j.williams@intel.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Michal Hocko <mhocko@kernel.org>,
        Mark Rutland <Mark.Rutland@arm.com>,
        Mark Brown <broonie@kernel.org>,
        Steven Price <Steven.Price@arm.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Kees Cook <keescook@chromium.org>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Matthew Wilcox <willy@infradead.org>,
        Sri Krishna chowdary <schowdary@nvidia.com>,
        Dave Hansen <dave.hansen@intel.com>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Mackerras <paulus@samba.org>,
        Martin Schwidefsky <schwidefsky@de.ibm.com>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Vineet Gupta <vgupta@synopsys.com>,
        James Hogan <jhogan@kernel.org>,
        Paul Burton <paul.burton@mips.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        "Kirill A . Shutemov" <kirill@shutemov.name>,
        Christophe Leroy <christophe.leroy@c-s.fr>,
        Ingo Molnar <mingo@kernel.org>,
        linux-snps-arc@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        x86@kernel.org, linux-kernel@vger.kernel.org
References: <1580174873-18117-1-git-send-email-anshuman.khandual@arm.com>
 <14882A91-17DE-4ABD-ABF2-08E7CCEDF660@lca.pw>
 <214c0d53-eb34-9b0c-2e4e-1aa005146331@arm.com>
 <016A776F-EFD9-4D2B-A3A9-788008617D95@lca.pw>
 <20200129232044.2d133d98@thinkpad> <20200130072741.GA23707@linux.ibm.com>
From:   Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <d1668930-d9cf-0490-a100-d1c49b49b19f@arm.com>
Date:   Thu, 30 Jan 2020 19:02:18 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200130072741.GA23707@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 01/30/2020 12:57 PM, Mike Rapoport wrote:
> On Wed, Jan 29, 2020 at 11:20:44PM +0100, Gerald Schaefer wrote:
>> On Mon, 27 Jan 2020 22:33:08 -0500
>>
>> For example, who would have thought that pXd_bad() is supposed to
>> report large entries as bad? It's not really documented anywhere,
> 
> A bit off-topic,
> 
> @Anshuman, maybe you could start a Documentation/ patch that describes at
> least some of the pXd_whaterver()?
> Or that would be too much to ask? ;-)

No, it would not be :) I have been documenting the expected semantics for
the helpers in the test itself. The idea is to collate them all (have been
working on some additional tests but waiting for this one to get merged
first) here and once most of the test gets settled, will move semantics
documentation from here into Documentation/ directory in a proper format.

/*
 * Basic operations
 *
 * mkold(entry)			= An old and not a young entry
 * mkyoung(entry)		= A young and not an old entry
 * mkdirty(entry)		= A dirty and not a clean entry
 * mkclean(entry)		= A clean and not a dirty entry
 * mkwrite(entry)		= A write and not a write protected entry
 * wrprotect(entry)		= A write protected and not a write entry
 * pxx_bad(entry)		= A mapped and non-table entry
 * pxx_same(entry1, entry2)	= Both entries hold the exact same value
 */ 



> 
>> so we just checked them for sanity like normal entries, which
>> apparently worked fine so far, but for how long?
> 
