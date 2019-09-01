Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52049A4CA4
	for <lists+linux-mips@lfdr.de>; Mon,  2 Sep 2019 01:01:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729198AbfIAXBI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 19:01:08 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42784 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729106AbfIAXBI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 19:01:08 -0400
Received: by mail-wr1-f67.google.com with SMTP id b16so12076060wrq.9
        for <linux-mips@vger.kernel.org>; Sun, 01 Sep 2019 16:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lxNCiywjjoTNLRKBVtsP+f4Xo5pKflJlumSAMNtuCPM=;
        b=h6Gs+MXaJu5nRLeU1U2mJ1hTx7qb1C/Uo+Ql5e/hDJKBXdw8uob8frbr9Tpke27Vgi
         Mx/7dp5s1T24JYYwalkqepMEmaypBajVd0ZnL1mVJfxsInWbeXnkwJvlT9slLinE6ML7
         VhpPLiJK80G4K2+Iiafj/c9b+GeB99L/h2JzKfTeQsSBRd/9frp13Xm2m+4LJYQq34Ti
         JO3SLVxiBVyxNmsER8oSwDbw0LO0fmlbq6yXRVswwCiWNXczeKY/fr4TxaaYsuYP8qbo
         yXgT8DzgGVNF0bpsUIMorii699hanMQCMg+X/dOXCYpi8eJ+Atsrwpt7lrUDwRFsaAr8
         pCEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=lxNCiywjjoTNLRKBVtsP+f4Xo5pKflJlumSAMNtuCPM=;
        b=ZrzBjtkzVIRaQDNAYORlFpqY7FXvmwFREgUMfZsDocwQP6ioTMu/1i26t0m89e1L/H
         UJLE3FCbsSHUDYUY5NdnhB7+5FWXJlpQizdRn/ikigaHR5KXNfNBuo3QMWX2mYFuVXT8
         J3kTNIGIEbyctYxWhsULl8bxCRJRjxrObY007TWhTOnmxGljRzD+BHAatu9SUOQ1Q7Mi
         ADbE5GSKJpiVamp8DHJ0yAW86JTJf6E1OFH6XHoFA4fTlKD8HIKCW2htA6TA7U02SvCf
         YKM8om7X4MrWNwXQoEPdV2T91VpJSawQcm6YInThV/baOqyrcjoz5WXbBds4H029jHQq
         MaFg==
X-Gm-Message-State: APjAAAU9xUCDU8zitvzfCMpaO/ZVv1lnIBCXUL3q9rYb3m4qFMwzZMY2
        87NjF3XvBoktGJUAaz57xCzwhB/P
X-Google-Smtp-Source: APXvYqzyiBI7xapuqJrsAjwmzOxaVh3QTyPyBXEB1rGMfF3qzM8uT2eJuRKz8eimWXTk+bnTKyh3Cw==
X-Received: by 2002:adf:e7c4:: with SMTP id e4mr28927227wrn.62.1567378865979;
        Sun, 01 Sep 2019 16:01:05 -0700 (PDT)
Received: from [192.168.1.41] (251.red-88-10-102.dynamicip.rima-tde.net. [88.10.102.251])
        by smtp.gmail.com with ESMTPSA id b26sm14125102wmj.14.2019.09.01.16.01.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Sep 2019 16:01:05 -0700 (PDT)
Subject: Re: [PATCH 010/120] MIPS: R5900: Workaround exception NOP execution
 bug (FLX05)
To:     Fredrik Noring <noring@nocrew.org>, linux-mips@vger.kernel.org
References: <cover.1567326213.git.noring@nocrew.org>
 <9b8beb1e11159a3a42233c64ea86607a5954d558.1567326213.git.noring@nocrew.org>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <433263a7-3eee-827c-c6e2-fd2b75e8fb94@amsat.org>
Date:   Mon, 2 Sep 2019 01:01:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <9b8beb1e11159a3a42233c64ea86607a5954d558.1567326213.git.noring@nocrew.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 9/1/19 5:39 PM, Fredrik Noring wrote:
> For the R5900, there are cases in which the first two instructions
> in an exception handler are executed as NOP instructions, when
> certain exceptions occur and then a bus error occurs immediately
> before jumping to the exception handler (FLX05)[1].
> 
> The corrective measure is to place NOP in the first two instruction
> locations in all exception handlers.
> 
> References:
> 
> [1] "TX System RISC TX79 Core Architecture" manual, revision 2.0,
>     Toshiba Corporation, p. 1-11, https://wiki.qemu.org/File:C790.pdf
> 
> Signed-off-by: Fredrik Noring <noring@nocrew.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  arch/mips/kernel/genex.S | 5 +++++
>  arch/mips/kernel/traps.c | 6 ++++++
>  arch/mips/mm/tlbex.c     | 6 ++++++
>  3 files changed, 17 insertions(+)
> 
> diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
> index 6eaf057e5d95..f57842b785b2 100644
> --- a/arch/mips/kernel/genex.S
> +++ b/arch/mips/kernel/genex.S
> @@ -32,6 +32,11 @@
>  NESTED(except_vec3_generic, 0, sp)
>  	.set	push
>  	.set	noat
> +#ifdef CONFIG_CPU_R5900
> +	/* Workaround for R5900 exception execution bug (FLX05). */
> +	nop
> +	nop
> +#endif
>  #if R5432_CP0_INTERRUPT_WAR
>  #ifdef CONFIG_CPU_R5900
>  	sync.p
> diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
> index 9423b9a2eb67..9c98475c7dc6 100644
> --- a/arch/mips/kernel/traps.c
> +++ b/arch/mips/kernel/traps.c
> @@ -1953,6 +1953,12 @@ void __init *set_except_vector(int n, void *addr)
>  #endif
>  		u32 *buf = (u32 *)(ebase + 0x200);
>  		unsigned int k0 = 26;
> +
> +#ifdef CONFIG_CPU_R5900
> +		/* Workaround for R5900 exception execution bug (FLX05). */
> +		uasm_i_nop(&buf);
> +		uasm_i_nop(&buf);
> +#endif
>  		if ((handler & jump_mask) == ((ebase + 0x200) & jump_mask)) {
>  			uasm_i_j(&buf, handler & ~jump_mask);
>  			uasm_i_nop(&buf);
> diff --git a/arch/mips/mm/tlbex.c b/arch/mips/mm/tlbex.c
> index 543ddb22b0d9..82136c346885 100644
> --- a/arch/mips/mm/tlbex.c
> +++ b/arch/mips/mm/tlbex.c
> @@ -1313,6 +1313,12 @@ static void build_r4000_tlb_refill_handler(void)
>  	memset(relocs, 0, sizeof(relocs));
>  	memset(final_handler, 0, sizeof(final_handler));
>  
> +#ifdef CONFIG_CPU_R5900
> +	/* Workaround for R5900 exception execution bug (FLX05). */
> +	uasm_i_nop(&p);
> +	uasm_i_nop(&p);
> +#endif
> +
>  	if (IS_ENABLED(CONFIG_64BIT) && (scratch_reg >= 0 || scratchpad_available()) && use_bbit_insns()) {
>  		htlb_info = build_fast_tlb_refill_handler(&p, &l, &r, K0, K1,
>  							  scratch_reg);
> 
