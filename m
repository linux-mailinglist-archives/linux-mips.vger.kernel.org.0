Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C159B3554D0
	for <lists+linux-mips@lfdr.de>; Tue,  6 Apr 2021 15:18:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243602AbhDFNSt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 6 Apr 2021 09:18:49 -0400
Received: from elvis.franken.de ([193.175.24.41]:59079 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242515AbhDFNSr (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 6 Apr 2021 09:18:47 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lTlbK-0006qP-04; Tue, 06 Apr 2021 15:18:38 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 94ED5C24D9; Tue,  6 Apr 2021 15:09:12 +0200 (CEST)
Date:   Tue, 6 Apr 2021 15:09:12 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH RFC] MIPS: Loongson64: Use _CACHE_UNCACHED instead of
 _CACHE_UNCACHED_ACCELERATED
Message-ID: <20210406130912.GF9505@alpha.franken.de>
References: <1617701112-14007-1-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1617701112-14007-1-git-send-email-yangtiezhu@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Apr 06, 2021 at 05:25:12PM +0800, Tiezhu Yang wrote:
> Loongson64 processors have a writecombine issue that maybe failed to
> write back framebuffer used with ATI Radeon or AMD GPU at times, after
> commit 8a08e50cee66 ("drm: Permit video-buffers writecombine mapping
> for MIPS"), there exists some errors such as blurred screen and lockup,
> and so on.
> 
> [   60.958721] radeon 0000:03:00.0: ring 0 stalled for more than 10079msec
> [   60.965315] radeon 0000:03:00.0: GPU lockup (current fence id 0x0000000000000112 last fence id 0x000000000000011d on ring 0)
> [   60.976525] radeon 0000:03:00.0: ring 3 stalled for more than 10086msec
> [   60.983156] radeon 0000:03:00.0: GPU lockup (current fence id 0x0000000000000374 last fence id 0x00000000000003a8 on ring 3)
> 
> As discussed earlier [1], it might be better to disable writecombine
> on the CPU detection side because the root cause is unknown now.
> 
> Actually, this patch is a temporary solution to just make it work well,
> it is not a proper and final solution, I hope someone will have a better
> solution to fix this issue in the future.
> 
> [1] https://lore.kernel.org/patchwork/patch/1285542/
> 
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
> 
> Hi Thomas,
> 
> If you are OK with this change, could you please apply it
> to mips-next? Then, no need to do this change manually every
> time when update the mainline kernel.

looks good to me, applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
