Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DE9434FC13
	for <lists+linux-mips@lfdr.de>; Wed, 31 Mar 2021 11:03:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231156AbhCaJDG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 31 Mar 2021 05:03:06 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:46244 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234405AbhCaJCx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 31 Mar 2021 05:02:53 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212])
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1lRWkV-0008Fh-Az; Wed, 31 Mar 2021 09:02:51 +0000
Subject: Re: [PATCH -next] mips: remove unused variable 'prev_state'
To:     Xu Jia <xujia39@huawei.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <git@xen0n.name>,
        Dmitry Safonov <0x7f454c46@gmail.com>,
        Liangliang Huang <huanglllzu@gmail.com>,
        Xingxing Su <suxingxing@loongson.cn>,
        Huang Pei <huangpei@loongson.cn>
Cc:     linux-mips@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <1617180898-36838-1-git-send-email-xujia39@huawei.com>
From:   Colin Ian King <colin.king@canonical.com>
Message-ID: <38e7e7e0-117b-87d5-0d54-c637170a286b@canonical.com>
Date:   Wed, 31 Mar 2021 10:02:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1617180898-36838-1-git-send-email-xujia39@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 31/03/2021 09:54, Xu Jia wrote:
> GCC reports the following warning with W=1:
> 
> arch/mips/kernel/traps.c:1593:17: warning:
>  variable 'prev_state' set but not used [-Wunused-but-set-variable]
>  1593 |  enum ctx_state prev_state;
>       |                 ^~~~~~~~~~
> 
> This variable is not used in function , this commit
> remove it to fix the warning.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Xu Jia <xujia39@huawei.com>
> ---
>  arch/mips/kernel/traps.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
> index 808b8b61ded1..d1f23ddf0c8c 100644
> --- a/arch/mips/kernel/traps.c
> +++ b/arch/mips/kernel/traps.c
> @@ -1590,10 +1590,8 @@ asmlinkage void do_watch(struct pt_regs *regs)
>  asmlinkage void do_mcheck(struct pt_regs *regs)
>  {
>  	int multi_match = regs->cp0_status & ST0_TS;
> -	enum ctx_state prev_state;
>  	mm_segment_t old_fs = get_fs();
>  
> -	prev_state = exception_enter();

The call to exception_enter() is required for context tracking, so
removing this call is not the correct solution.


>  	show_regs(regs);
>  
>  	if (multi_match) {
> 

