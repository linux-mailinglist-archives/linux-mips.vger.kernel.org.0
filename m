Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E5C01E6AA7
	for <lists+linux-mips@lfdr.de>; Thu, 28 May 2020 21:24:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406435AbgE1TXr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 May 2020 15:23:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:51762 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2406300AbgE1TXo (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 28 May 2020 15:23:44 -0400
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net [73.231.172.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2B275207BC;
        Thu, 28 May 2020 19:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590693823;
        bh=KWIzbnUdC0/WL0P4Z1bjwKBGnAgV6PACPp1qBqkmfOE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=IW/bkGhIbncJGc2idclnVVmK54Dm09dZ8pvN2ZYPXRa9osghjVdrkr5zdOQNP4yPk
         h4mf680CpeabAzzXMzZBnMQVROL1MW1W9oIPunSyKYRkxNqBDhI/isso0zFpMeBjdS
         NbY+A39KRCp8HPTEvyg7cFxsfQjFlQTVpee8GO60=
Date:   Thu, 28 May 2020 12:23:42 -0700
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
Subject: Re: [PATCH v7 2/4] mm/memory.c: Update local TLB if PTE entry
 exists
Message-Id: <20200528122342.11e51dd9c7698d68632f2a81@linux-foundation.org>
In-Reply-To: <1590546320-21814-3-git-send-email-maobibo@loongson.cn>
References: <1590546320-21814-1-git-send-email-maobibo@loongson.cn>
        <1590546320-21814-3-git-send-email-maobibo@loongson.cn>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 27 May 2020 10:25:18 +0800 Bibo Mao <maobibo@loongson.cn> wrote:

> If two threads concurrently fault at the same page, the thread that
> won the race updates the PTE and its local TLB. For now, the other
> thread gives up, simply does nothing, and continues.
> 
> It could happen that this second thread triggers another fault, whereby
> it only updates its local TLB while handling the fault. Instead of
> triggering another fault, let's directly update the local TLB of the
> second thread. Function update_mmu_tlb is used here to update local
> TLB on the second thread, and it is defined as empty on other arches.
> 
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -2752,6 +2752,7 @@ static vm_fault_t wp_page_copy(struct vm_fault *vmf)
>  		new_page = old_page;
>  		page_copied = 1;
>  	} else {
> +		update_mmu_tlb(vma, vmf->address, vmf->pte);
>  		mem_cgroup_cancel_charge(new_page, memcg, false);
>  	}
>  

When applying your patches on top of the -mm tree's changes, the above
hunk didn't apply.  The entire `else' block was removed by
https://ozlabs.org/~akpm/mmotm/broken-out/mm-memcontrol-convert-anon-and-file-thp-to-new-mem_cgroup_charge-api.patch

I assumed that dropping this hunk was appropriate.  Please check?
