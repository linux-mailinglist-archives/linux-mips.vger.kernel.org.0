Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AE9D1BE648
	for <lists+linux-mips@lfdr.de>; Wed, 29 Apr 2020 20:33:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726556AbgD2Sdb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 Apr 2020 14:33:31 -0400
Received: from elvis.franken.de ([193.175.24.41]:60653 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726519AbgD2Sdb (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 29 Apr 2020 14:33:31 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jTrWH-000430-01; Wed, 29 Apr 2020 20:33:17 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id CEF21C034E; Wed, 29 Apr 2020 20:25:05 +0200 (CEST)
Date:   Wed, 29 Apr 2020 20:25:05 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, john.garry@huawei.com,
        Huacai Chen <chenhc@lemote.com>,
        Paul Burton <paulburton@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Stephen Kitt <steve@sk2.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
        Daniel Silsby <dansilsby@gmail.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Allison Randal <allison@lohutok.net>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] MIPS: Massage address spaces headers
Message-ID: <20200429182505.GB21158@alpha.franken.de>
References: <20200428021437.2000066-1-jiaxun.yang@flygoat.com>
 <20200428021437.2000066-2-jiaxun.yang@flygoat.com>
 <20200428113326.GD11443@alpha.franken.de>
 <7613695F-5A83-4B57-A2E6-0EE27DCF397F@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7613695F-5A83-4B57-A2E6-0EE27DCF397F@flygoat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Apr 28, 2020 at 07:45:19PM +0800, Jiaxun Yang wrote:
> 
> 
> 于 2020年4月28日 GMT+08:00 下午7:33:26, Thomas Bogendoerfer <tsbogend@alpha.franken.de> 写到:
> >On Tue, Apr 28, 2020 at 10:14:12AM +0800, Jiaxun Yang wrote:
> >> That would allow us modify kernel vm address spaces without
> >> step into the hell of includes.
> >> 
> >> Also use some marcos for address spaces to make spaces.h more
> >> clear.
> >> 
> >> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> >
> >I don't like this patch as I can't see a good reason for shuffling
> >stuff arround. Can you drop this from this series ?
> 
> The problem is without this patch we'll have to include pgtable-32.h and
> pgtable-64.h into asm/io.h, and that will become totally hell.

sure, but this would just mean moving VMALLOC_START, but not the other
stuff in this patch, which is more what I dislike...

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
