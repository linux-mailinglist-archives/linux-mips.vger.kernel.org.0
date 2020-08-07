Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE63623EE25
	for <lists+linux-mips@lfdr.de>; Fri,  7 Aug 2020 15:25:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725936AbgHGNZ7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 7 Aug 2020 09:25:59 -0400
Received: from relay3.mymailcheap.com ([217.182.119.155]:39308 "EHLO
        relay3.mymailcheap.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725893AbgHGNZ7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 7 Aug 2020 09:25:59 -0400
Received: from filter1.mymailcheap.com (filter1.mymailcheap.com [149.56.130.247])
        by relay3.mymailcheap.com (Postfix) with ESMTPS id 91D7E3F1CC;
        Fri,  7 Aug 2020 15:25:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by filter1.mymailcheap.com (Postfix) with ESMTP id C42822A3BC;
        Fri,  7 Aug 2020 09:25:54 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mymailcheap.com;
        s=default; t=1596806754;
        bh=XfrD3CWWFnVEW2rWMOyI6dxR8hMqcjfEnhLHEp6qURk=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=ZO4kKgaL2/TAzn+HSVmaHDVqj+ep4KWPWVNNJpBUFZJAODHw/EtG6i4a3DF9wQj1r
         Jq1kTAMwTOfqCPnmZQNs2N/auxfK2c/nnvQeTk7cQ/IWsybeW8ycpkwdDlxh662NEt
         Ekh7r4JgFCZDhyURH2kftSqmmnSQyzMosUKU98WY=
X-Virus-Scanned: Debian amavisd-new at filter1.mymailcheap.com
Received: from filter1.mymailcheap.com ([127.0.0.1])
        by localhost (filter1.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id c4d39l01lJc0; Fri,  7 Aug 2020 09:25:53 -0400 (EDT)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by filter1.mymailcheap.com (Postfix) with ESMTPS;
        Fri,  7 Aug 2020 09:25:53 -0400 (EDT)
Received: from [213.133.102.83] (ml.mymailcheap.com [213.133.102.83])
        by mail20.mymailcheap.com (Postfix) with ESMTP id BD8AD425AB;
        Fri,  7 Aug 2020 13:25:50 +0000 (UTC)
Authentication-Results: mail20.mymailcheap.com;
        dkim=pass (1024-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.b="SsBwpMHH";
        dkim-atps=neutral
AI-Spam-Status: Not processed
Received: from [0.0.0.0] (li988-228.members.linode.com [45.33.38.228])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail20.mymailcheap.com (Postfix) with ESMTPSA id 63957425AB;
        Fri,  7 Aug 2020 13:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com;
        s=default; t=1596806733;
        bh=XfrD3CWWFnVEW2rWMOyI6dxR8hMqcjfEnhLHEp6qURk=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=SsBwpMHH3xr3zOmBKGCTkt3rncY+ySUuqNR42i2JBk6IJfabn0l895zpOCaMpUgEJ
         syzDx+kgHb5XXzUALvc+QoN/IpVsDoUBufsLtamJsjcse8IPCQUf1rG6hq8qohjB58
         u9Ly2qEHZhXzTitWInNZrejlHC6EoabL/FY8KQjE=
Subject: Re: [PATCH V3 1/2] MIPS: Loongson-3: Enable COP2 usage in kernel
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Huacai Chen <chenhc@lemote.com>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>
References: <1588395344-5400-1-git-send-email-chenhc@lemote.com>
 <D5AFA61A-5AAC-408C-9B3D-1E0829C9FB13@flygoat.com>
 <CAAhV-H6M-BnBMzFYUom04mdBZhA4+9M3JTUC-dvckTMUeFw9+w@mail.gmail.com>
 <20200805121021.GA12598@alpha.franken.de>
 <1c3cb503-720f-059e-2bac-ae692203c389@flygoat.com>
 <20200807131357.GA11979@alpha.franken.de>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <410cf75c-4cf5-94d8-fbc9-821d38f8a299@flygoat.com>
Date:   Fri, 7 Aug 2020 21:25:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.1.0
MIME-Version: 1.0
In-Reply-To: <20200807131357.GA11979@alpha.franken.de>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: BD8AD425AB
X-Spamd-Result: default: False [-0.10 / 10.00];
         RCVD_VIA_SMTP_AUTH(0.00)[];
         ARC_NA(0.00)[];
         R_DKIM_ALLOW(0.00)[flygoat.com:s=default];
         HFILTER_HELO_BAREIP(3.00)[213.133.102.83,1];
         FROM_HAS_DN(0.00)[];
         FREEMAIL_ENVRCPT(0.00)[gmail.com];
         TO_MATCH_ENVRCPT_ALL(0.00)[];
         MIME_GOOD(-0.10)[text/plain];
         R_SPF_SOFTFAIL(0.00)[~all];
         RCPT_COUNT_FIVE(0.00)[5];
         ML_SERVERS(-3.10)[213.133.102.83];
         TO_DN_ALL(0.00)[];
         DKIM_TRACE(0.00)[flygoat.com:+];
         RCVD_IN_DNSWL_NONE(0.00)[213.133.102.83:from];
         DMARC_POLICY_ALLOW(0.00)[flygoat.com,none];
         DMARC_POLICY_ALLOW_WITH_FAILURES(0.00)[];
         RCVD_NO_TLS_LAST(0.10)[];
         FROM_EQ_ENVFROM(0.00)[];
         MIME_TRACE(0.00)[0:+];
         ASN(0.00)[asn:24940, ipnet:213.133.96.0/19, country:DE];
         FREEMAIL_CC(0.00)[lemote.com,vger.kernel.org,gmail.com];
         MID_RHS_MATCH_FROM(0.00)[];
         RCVD_COUNT_TWO(0.00)[2]
X-Rspamd-Server: mail20.mymailcheap.com
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



ÔÚ 2020/8/7 21:13, Thomas Bogendoerfer Ð´µÀ:
> On Wed, Aug 05, 2020 at 09:51:44PM +0800, Jiaxun Yang wrote:
>>> yes there is. Since this COP2 is a total black box to me, it would be
>>> really helpfull to get some docs for it or at least some information what
>>> it exactly does and how you want to use it in kernel code.
>> FYI:
>> Loongson doesn't have any CU2 register. It just reused LWC2 & LDC2 opcode
>> to define some load & store instructions (e.g. 128bit load to two GPRs).
>>
>> I have a collection of these instructions here[1].
>>
>>  From GS464E (3A2000+), execuating these instruction won't produce COP2
>> unusable
>> exception. But older Loongson cores (GS464) will still produce COP2
>> exception, thus
>> we should have CU2 enabled in kernel. That would allow us use to these
>> instructions
>> to optimize kernel.
> thank you that makes things a little bit clearer.
>
> How will this be used in kernel code ? Special assembler routines or
> by enabling gcc options ?

Via special assembly routines, as -msoft-float will disable generation of
these instructions in GCC.

I knew Huacai have out-of-tree memcpy optimization and Xuerui have
RAID5 optimiztion with these instructions.

>
>>> And finally what I stil don't like is the splittering of more
>>> #ifdef LOONGSON into common code. I'd prefer a more generic way
>>> to enable COPx for in kernel usage. Maybe a more generic config option
>>> or a dynamic solution like the one for user land.
>> Agreed. some Kconfig options or cpuinfo_mips.options can be helpful.
> let's see whether this really is needed.
>
> To me it looks like the COP2 exception support for loongson makes
> thing worse than it helps. How about the patch below ? There is still
> a gap between starting the kernel and COP2 enabled for which I'm not
> sure, if we are hitting COP2 instructions.

Yes, the exception does not really make sense.
What's your opinion Huacai?

For in-kernel usage, we still have to enable it in genex.

Thanks for your advice~

- Jiaxun

>
> Thomas.
>
> diff --git a/arch/mips/include/asm/cop2.h b/arch/mips/include/asm/cop2.h
> index 6b7396a6a115..dfa72e9be64a 100644
> --- a/arch/mips/include/asm/cop2.h
> +++ b/arch/mips/include/asm/cop2.h
> @@ -33,13 +33,6 @@ extern void nlm_cop2_restore(struct nlm_cop2_state *);
>   #define cop2_present		1
>   #define cop2_lazy_restore	0
>   
> -#elif defined(CONFIG_CPU_LOONGSON64)
> -
> -#define cop2_present		1
> -#define cop2_lazy_restore	1
> -#define cop2_save(r)		do { (void)(r); } while (0)
> -#define cop2_restore(r)		do { (void)(r); } while (0)
> -
>   #else
>   
>   #define cop2_present		0
> diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
> index b95ef98fc847..f0a8ef5a8605 100644
> --- a/arch/mips/kernel/traps.c
> +++ b/arch/mips/kernel/traps.c
> @@ -2194,6 +2194,11 @@ static void configure_status(void)
>   #ifdef CONFIG_64BIT
>   	status_set |= ST0_FR|ST0_KX|ST0_SX|ST0_UX;
>   #endif
> +#ifdef CONFIG_CPU_LOONGSON64
> +	/* enable 16-bytes load/store instructions */
> +	status_set |= ST0_CU2;
> +#endif
> +
>   	if (current_cpu_data.isa_level & MIPS_CPU_ISA_IV)
>   		status_set |= ST0_XX;
>   	if (cpu_has_dsp)
>
>
>
