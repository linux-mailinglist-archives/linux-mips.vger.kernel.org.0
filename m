Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 630CF25BD38
	for <lists+linux-mips@lfdr.de>; Thu,  3 Sep 2020 10:27:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728222AbgICI1R (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 3 Sep 2020 04:27:17 -0400
Received: from elvis.franken.de ([193.175.24.41]:50525 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725984AbgICI1O (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 3 Sep 2020 04:27:14 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kDkaL-0000I1-04; Thu, 03 Sep 2020 10:27:09 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 3FDDBC0E86; Thu,  3 Sep 2020 10:22:10 +0200 (CEST)
Date:   Thu, 3 Sep 2020 10:22:10 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH] MIPS: perf: Fix wrong check condition of Loongson event
 IDs
Message-ID: <20200903082210.GE6220@alpha.franken.de>
References: <1598515388-3604-1-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1598515388-3604-1-git-send-email-yangtiezhu@loongson.cn>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Aug 27, 2020 at 04:03:08PM +0800, Tiezhu Yang wrote:
> According to the user's manual chapter 8.2.1 of Loongson 3A2000 CPU [1]
> and 3A3000 CPU [2], we should take some event IDs such as 274, 358, 359
> and 360 as valid in the check condition, otherwise they are recognized
> as "not supported", fix it.
> 
> [1] http://www.loongson.cn/uploadfile/cpu/3A2000/Loongson3A2000_user2.pdf
> [2] http://www.loongson.cn/uploadfile/cpu/3A3000/Loongson3A3000_3B3000user2.pdf
> 
> Fixes: e9dfbaaeef1c ("MIPS: perf: Add hardware perf events support for new Loongson-3")
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/mips/kernel/perf_event_mipsxx.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

applied to mips-fixes.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
