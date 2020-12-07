Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF2EF2D0E13
	for <lists+linux-mips@lfdr.de>; Mon,  7 Dec 2020 11:34:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726716AbgLGKeA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 7 Dec 2020 05:34:00 -0500
Received: from elvis.franken.de ([193.175.24.41]:54217 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726567AbgLGKeA (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 7 Dec 2020 05:34:00 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kmDpT-00058D-01; Mon, 07 Dec 2020 11:33:15 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 93FFDC031F; Mon,  7 Dec 2020 11:32:51 +0100 (CET)
Date:   Mon, 7 Dec 2020 11:32:51 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jinyang He <hejinyang@loongson.cn>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] MIPS: KASLR: Avoid endless loop in sync_icache when
 synci_step is zero
Message-ID: <20201207103251.GA15719@alpha.franken.de>
References: <1607044306-4800-1-git-send-email-hejinyang@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1607044306-4800-1-git-send-email-hejinyang@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Dec 04, 2020 at 09:11:46AM +0800, Jinyang He wrote:
> Avoid endless loop if synci_step was zero read by rdhwr instruction.
> 
> Most platforms do not need to do synci instruction operations when
> synci_step is 0. But for example, the synci implementation on Loongson64
> platform has some changes. On the one hand, it ensures that the memory
> access instructions have been completed. On the other hand, it guarantees
> that all prefetch instructions need to be fetched again. And its address
> information is useless. Thus, only one synci operation is required when
> synci_step is 0 on Loongson64 platform. I guess that some other platforms
> have similar implementations on synci, so add judgment conditions in
> `while` to ensure that at least all platforms perform synci operations
> once. For those platforms that do not need synci, they just do one more
> operation similar to nop.
> 
> Signed-off-by: Jinyang He <hejinyang@loongson.cn>
> ---
>  arch/mips/kernel/relocate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
