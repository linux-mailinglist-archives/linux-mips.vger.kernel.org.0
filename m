Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B405B37B079
	for <lists+linux-mips@lfdr.de>; Tue, 11 May 2021 23:06:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229848AbhEKVHO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 11 May 2021 17:07:14 -0400
Received: from elvis.franken.de ([193.175.24.41]:50447 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229637AbhEKVHN (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 11 May 2021 17:07:13 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lgZZt-00041V-00; Tue, 11 May 2021 23:06:05 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 3884EC0E42; Tue, 11 May 2021 23:03:49 +0200 (CEST)
Date:   Tue, 11 May 2021 23:03:49 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     bibo mao <maobibo@loongson.cn>
Cc:     Anshuman Khandual <anshuman.khandual@arm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
Subject: Re: [PATCH 1/2] hugetlb: clear huge pte during flush function on
 mips platform
Message-ID: <20210511210349.GA18846@alpha.franken.de>
References: <1593436533-8645-1-git-send-email-maobibo@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1593436533-8645-1-git-send-email-maobibo@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Jun 29, 2020 at 09:15:32PM +0800, bibo mao wrote:
> From: Bibo Mao <maobibo@loongson.cn>
> 
> If multiple threads are accessing the same huge page at the same
> time, hugetlb_cow will be called if one thread write the COW huge
> page. And function huge_ptep_clear_flush is called to notify other
> threads to clear the huge pte tlb entry. The other threads clear
> the huge pte tlb entry and reload it from page table, the reload
> huge pte entry may be old.
> 
> This patch fixes this issue on mips platform, and it clears huge
> pte entry before notifying other threads to flush current huge
> page entry, it is similar with other architectures.
> 
> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
> ---
>  arch/mips/include/asm/hugetlb.h | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
