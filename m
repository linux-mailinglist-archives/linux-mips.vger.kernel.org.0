Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACF3B37B040
	for <lists+linux-mips@lfdr.de>; Tue, 11 May 2021 22:48:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229934AbhEKUtW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 11 May 2021 16:49:22 -0400
Received: from elvis.franken.de ([193.175.24.41]:50416 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229917AbhEKUtV (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 11 May 2021 16:49:21 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lgZIb-0003nj-02; Tue, 11 May 2021 22:48:13 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 6B500C0E42; Tue, 11 May 2021 22:42:41 +0200 (CEST)
Date:   Tue, 11 May 2021 22:42:41 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Youling Tang <tangyouling@loongson.cn>
Cc:     Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Loongson64: Fix build error 'secondary_kexec_args'
 undeclared under !SMP
Message-ID: <20210511204241.GC18185@alpha.franken.de>
References: <1620266570-21585-1-git-send-email-tangyouling@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1620266570-21585-1-git-send-email-tangyouling@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, May 06, 2021 at 10:02:50AM +0800, Youling Tang wrote:
> On the Loongson64 platform, if CONFIG_SMP is not set, the following build
> error will occur:
> arch/mips/loongson64/reset.c:133:2: error:'secondary_kexec_args' undeclared
> 
> Because the definition and declaration of secondary_kexec_args are in the
> CONFIG_SMP, the secondary_kexec_args variable should be used in CONFIG_SMP.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Youling Tang <tangyouling@loongson.cn>
> ---
>  arch/mips/loongson64/reset.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
