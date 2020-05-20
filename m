Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2CC31DA728
	for <lists+linux-mips@lfdr.de>; Wed, 20 May 2020 03:26:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726595AbgETB0V (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 19 May 2020 21:26:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:36922 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726348AbgETB0U (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 19 May 2020 21:26:20 -0400
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net [73.231.172.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8FE0220756;
        Wed, 20 May 2020 01:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589937980;
        bh=6AZyfxeStk9BMps7zFSgzaqvLw2zumjttdsiUTuiNgA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=lF50fRFZsZz5wrn3GA/OeEY8bbfIUAnbQyNmLNbxrFG6roWJNjnlhClJqc3yRCYzu
         aBJXOWiExX3Hiv9Lzymb5Ce57FdtfFoIiZSXhl2hKmLs1TuYEgptgZ2iLpTTOFzhWm
         JbuegdY50rdNUA/VlY5RaoJ1srHk3yVjtI2NOkEE=
Date:   Tue, 19 May 2020 18:26:19 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Bibo Mao <maobibo@loongson.cn>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>,
        Paul Burton <paulburton@kernel.org>,
        Dmitry Korotin <dkorotin@wavecomp.com>,
        Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
        Stafford Horne <shorne@gmail.com>,
        Steven Price <steven.price@arm.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Rapoport <rppt@linux.ibm.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "Maciej W. Rozycki" <macro@wdc.com>, linux-mm@kvack.org,
        David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v4 2/4] mm/memory.c: Update local TLB if PTE entry
 exists
Message-Id: <20200519182619.2c5e76d3f6b25d71702abbe0@linux-foundation.org>
In-Reply-To: <1589882610-7291-2-git-send-email-maobibo@loongson.cn>
References: <1589882610-7291-1-git-send-email-maobibo@loongson.cn>
        <1589882610-7291-2-git-send-email-maobibo@loongson.cn>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 19 May 2020 18:03:28 +0800 Bibo Mao <maobibo@loongson.cn> wrote:

> If two threads concurrently fault at the same address, the thread that
> won the race updates the PTE and its local TLB. For now, the other
> thread gives up, simply does nothing, and continues.
> 
> It could happen that this second thread triggers another fault, whereby
> it only updates its local TLB while handling the fault. Instead of
> triggering another fault, let's directly update the local TLB of the
> second thread.
> 
> It is only useful to architectures where software can update TLB, it may
> bring out some negative effect if update_mmu_cache is used for other
> purpose also. It seldom happens where multiple threads access the same
> page at the same time, so the negative effect is limited on other arches.

I'm still worried about the impact on other architectures.  The
additional update_mmu_cache() calls won't occur only when multiple
threads are racing against the same page, I think?  For example,
insert_pfn() will do this when making a read-only page a writable one.

Would you have time to add some instrumentation into update_mmu_cache()
(maybe a tracepoint) and see what effect this change has upon the
frequency at which update_mmu_cache() is called for a selection of
workloads?  And add this info to the changelog to set minds at ease?

