Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7F221DC45A
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2020 02:54:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727819AbgEUAyt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 20 May 2020 20:54:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:40210 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727063AbgEUAys (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 20 May 2020 20:54:48 -0400
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net [73.231.172.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 56C0E20756;
        Thu, 21 May 2020 00:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590022488;
        bh=nUC6IS5B+HO4x1xRb90GxHXMHv01xodZ56chdUvxpR4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=dpHKgFJ9WM3DHwB8NU0iO7BVqjA8bVDD3gzbTkCQSA7m1X3gZUioDgTvR4I2hAVCw
         qVNIo3rEDD9eMNWYQrhXT60ZDlDUUJVidIvr8MDzhgcuss+dmx1b1dCC29i+xBAAhM
         BaEuTTJYbLoLx6aYIYOwGE3VJz6Wm2BQHABSju10=
Date:   Wed, 20 May 2020 17:54:46 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     maobibo <maobibo@loongson.cn>
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
Message-Id: <20200520175446.11068e9e81da493a8e120601@linux-foundation.org>
In-Reply-To: <e9cd1d61-c475-9b13-fd48-3ff886c74797@loongson.cn>
References: <1589882610-7291-1-git-send-email-maobibo@loongson.cn>
        <1589882610-7291-2-git-send-email-maobibo@loongson.cn>
        <20200519182619.2c5e76d3f6b25d71702abbe0@linux-foundation.org>
        <e9cd1d61-c475-9b13-fd48-3ff886c74797@loongson.cn>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 20 May 2020 14:39:13 +0800 maobibo <maobibo@loongson.cn> wrote:

> > I'm still worried about the impact on other architectures.  The
> > additional update_mmu_cache() calls won't occur only when multiple
> > threads are racing against the same page, I think?  For example,
> > insert_pfn() will do this when making a read-only page a writable one.
> How about defining ptep_set_access_flags function like this on mips system?
> which is the same on riscv platform.
> 
> static inline int ptep_set_access_flags(struct vm_area_struct *vma,
> 					unsigned long address, pte_t *ptep,
> 					pte_t entry, int dirty)
> {
> 	if (!pte_same(*ptep, entry))
> 		set_pte_at(vma->vm_mm, address, ptep, entry);
> 	/*
> 	 * update_mmu_cache will unconditionally execute, handling both
> 	 * the case that the PTE changed and the spurious fault case.
> 	 */
> 	return true;
> }
> 

hm, it seems a bit abusive - ptep_set_access_flags() is supposed to
return true if the pte changed, and that isn't the case here.

I suppose we could run update_mmu_cache() directly from
ptep_set_access_flags() if we're about to return false, but that
doesn't seem a lot nicer?

> > Would you have time to add some instrumentation into update_mmu_cache()
> > (maybe a tracepoint) and see what effect this change has upon the
> > frequency at which update_mmu_cache() is called for a selection of
> > workloads?  And add this info to the changelog to set minds at ease?
>
> OK, I will add some instrumentation data in the changelog.

Well, if this testing shows no effect as you expect, perhaps we can
leave the code as-is.
