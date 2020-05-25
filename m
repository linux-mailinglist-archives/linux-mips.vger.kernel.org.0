Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A92D1E1744
	for <lists+linux-mips@lfdr.de>; Mon, 25 May 2020 23:43:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731448AbgEYVnX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 25 May 2020 17:43:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:46862 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726393AbgEYVnX (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 25 May 2020 17:43:23 -0400
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net [73.231.172.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B574A206C3;
        Mon, 25 May 2020 21:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590443003;
        bh=Hrjrcub2LZUtAfAr5bsCiaDvlFDWt5f1aQvYeodha6k=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Tyf6dE9v8rlpMSBJ5h+w0wCeuFkLaWHlFsSLV7R4XyUJRwO+C4zACybLMrLLu+dDx
         wGQ76vZxcLgZ0eZRZ2m+sekKWM7YlsyWxE0hgFIdwcrRc8yrM1vpri01KGYmPrCeg8
         8C5n+84p32cprqFn1AoSpG1ID1Dh9nIIC875rZ70=
Date:   Mon, 25 May 2020 14:43:22 -0700
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
Subject: Re: [PATCH v6 2/4] mm/memory.c: Update local TLB if PTE entry
 exists
Message-Id: <20200525144322.1a23fa4610f71d46008d8372@linux-foundation.org>
In-Reply-To: <1590375160-6997-2-git-send-email-maobibo@loongson.cn>
References: <1590375160-6997-1-git-send-email-maobibo@loongson.cn>
        <1590375160-6997-2-git-send-email-maobibo@loongson.cn>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 25 May 2020 10:52:38 +0800 Bibo Mao <maobibo@loongson.cn> wrote:

> If two threads concurrently fault at the same page, the thread that
> won the race updates the PTE and its local TLB. For now, the other
> thread gives up, simply does nothing, and continues.
> 
> It could happen that this second thread triggers another fault, whereby
> it only updates its local TLB while handling the fault. Instead of
> triggering another fault, let's directly update the local TLB of the
> second thread. Function update_mmu_tlb is used here to update local
> TLB on the second thread, and it is defined as empty on other arches.

Acked-by: Andrew Morton <akpm@linux-foundation.org>

Thanks for persisting with these.
