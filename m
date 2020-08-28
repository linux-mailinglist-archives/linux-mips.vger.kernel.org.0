Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86950255DC9
	for <lists+linux-mips@lfdr.de>; Fri, 28 Aug 2020 17:26:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728037AbgH1P0i (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 28 Aug 2020 11:26:38 -0400
Received: from [115.28.160.31] ([115.28.160.31]:37048 "EHLO
        mailbox.box.xen0n.name" rhost-flags-FAIL-FAIL-OK-OK)
        by vger.kernel.org with ESMTP id S1727843AbgH1P0Y (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Fri, 28 Aug 2020 11:26:24 -0400
Received: from [192.168.9.172] (unknown [101.224.81.0])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 5D9D060092;
        Fri, 28 Aug 2020 23:26:20 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
        t=1598628380; bh=PNJeVnJSJLVcFuFOjNg6VsVDyT5qP/ZB6usv8VPz0KE=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=R4KFnk9XwVSsOb8WubafwZrG4vTCGfmX/YpqqxzQVrpcZKGAjKWMhTTCM9cGYwDa9
         InXABseyMe83/p7QOLEU5G4KAt5EyYKOGjknqbknEkZGJEl6TEeqbKFF+Txbw0Rhaj
         KXnOSBTAoWVlUnpY8SZFvrSCf4fxCpCi1UZNAoD0=
Subject: Re: [PATCH Fixes] MIPS: add missing MSACSR and upper MSA
 initialization
To:     Huang Pei <huangpei@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        ambrosehua@gmail.com
Cc:     Li Xuefeng <lixuefeng@loongson.cn>,
        Yang Tiezhu <yangtiezhu@loongson.cn>,
        Gao Juxin <gaojuxin@loongson.cn>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhc@lemote.com>, linux-mips@vger.kernel.org
References: <20200828085706.29190-1-huangpei@loongson.cn>
From:   WANG Xuerui <kernel@xen0n.name>
Message-ID: <28ec8eab-065b-3bc5-986a-883211c2b522@xen0n.name>
Date:   Fri, 28 Aug 2020 23:26:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:81.0) Gecko/20100101
 Thunderbird/81.0a1
MIME-Version: 1.0
In-Reply-To: <20200828085706.29190-1-huangpei@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Pei,

On 8/28/20 4:57 PM, Huang Pei wrote:
> init_fp_ctx just initialize the fp/msa context, and own_fp_inatomic
> just restore FCSR and 64bit FP regs from it, but miss MSACSR and upper
> MSA regs for MSA, so MSACSR and MSA upper regs's value from previous
> task on current cpu can leak into current task and cause unpredictable
> behavior when MSA context not initialized.
>
> Signed-off-by: Huang Pei <huangpei@loongson.cn>
Actually I think what Thomas meant by saying "add a Fixes tag" in the 
previous thread was "to add a Fixes: tag to refer to the broken commit" 
. So perhaps send a v3?
> ---
>   arch/mips/kernel/traps.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>
> diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
> index 38aa07ccdbcc..cf788591f091 100644
> --- a/arch/mips/kernel/traps.c
> +++ b/arch/mips/kernel/traps.c
> @@ -1287,6 +1287,18 @@ static int enable_restore_fp_context(int msa)
>   		err = own_fpu_inatomic(1);
>   		if (msa && !err) {
>   			enable_msa();
> +			/*
> +			 * with MSA enabled, userspace can see MSACSR
> +			 * and MSA regs, but the values in them are from
> +			 * other task before current task, restore them
> +			 * from saved fp/msa context
> +			 */
> +			write_msa_csr(current->thread.fpu.msacsr);
> +			/*
> +			 * own_fpu_inatomic(1) just restore low 64bit,
> +			 * fix the high 64bit
> +			 */
> +			init_msa_upper();
>   			set_thread_flag(TIF_USEDMSA);
>   			set_thread_flag(TIF_MSA_CTX_LIVE);
>   		}
