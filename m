Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBDEB415B2E
	for <lists+linux-mips@lfdr.de>; Thu, 23 Sep 2021 11:42:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240129AbhIWJn5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 23 Sep 2021 05:43:57 -0400
Received: from elvis.franken.de ([193.175.24.41]:39102 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240221AbhIWJn5 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 23 Sep 2021 05:43:57 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1mTLFI-00072a-00; Thu, 23 Sep 2021 11:42:24 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 6B7CCC1279; Thu, 23 Sep 2021 11:35:22 +0200 (CEST)
Date:   Thu, 23 Sep 2021 11:35:22 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jackie Liu <liu.yun@linux.dev>
Cc:     chenhuacai@kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH v4] MIPS: loongson64: make CPU_LOONGSON64 depends on
 MIPS_FP_SUPPORT
Message-ID: <20210923093522.GA7289@alpha.franken.de>
References: <20210913061908.550030-1-liu.yun@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210913061908.550030-1-liu.yun@linux.dev>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Sep 13, 2021 at 02:19:08PM +0800, Jackie Liu wrote:
> From: Jackie Liu <liuyun01@kylinos.cn>
> 
> mach/loongson64 fails to build when the FPU support is disabled:
> 
> arch/mips/loongson64/cop2-ex.c:45:15: error: implicit declaration of function ‘__is_fpu_owner’; did you mean ‘is_fpu_owner’? [-Werror=implicit-function-declaration]
> arch/mips/loongson64/cop2-ex.c:98:30: error: ‘struct thread_struct’ has no member named ‘fpu’
> arch/mips/loongson64/cop2-ex.c:99:30: error: ‘struct thread_struct’ has no member named ‘fpu’
> arch/mips/loongson64/cop2-ex.c:131:43: error: ‘struct thread_struct’ has no member named ‘fpu’
> arch/mips/loongson64/cop2-ex.c:137:38: error: ‘struct thread_struct’ has no member named ‘fpu’
> arch/mips/loongson64/cop2-ex.c:203:30: error: ‘struct thread_struct’ has no member named ‘fpu’
> arch/mips/loongson64/cop2-ex.c:219:30: error: ‘struct thread_struct’ has no member named ‘fpu’
> arch/mips/loongson64/cop2-ex.c:283:38: error: ‘struct thread_struct’ has no member named ‘fpu’
> arch/mips/loongson64/cop2-ex.c:301:38: error: ‘struct thread_struct’ has no member named ‘fpu’
> 
> Fixes: ef2f826c8f2f ("MIPS: Loongson-3: Enable the COP2 usage")
> Suggested-by: Huacai Chen <chenhuacai@kernel.org>
> Reviewed-by: Huacai Chen <chenhuacai@kernel.org>
> Reported-by: k2ci robot <kernel-bot@kylinos.cn>
> Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>
> ---
>  v1->v2:
>  move MIPS_FP_SUPPORT from MACH_LOONGSON64 to CPU_LOONGSON64
> 
>  v2->v3:
>  add Huacai Chen <chenhc@lemote.com>'s suggest label.
> 
>  v3->v4:
>  update Huacai Chen's email address.
> 
>  arch/mips/Kconfig | 1 +
>  1 file changed, 1 insertion(+)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
