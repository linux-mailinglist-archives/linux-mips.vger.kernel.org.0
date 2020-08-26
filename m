Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92420252F79
	for <lists+linux-mips@lfdr.de>; Wed, 26 Aug 2020 15:19:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730209AbgHZNRt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 26 Aug 2020 09:17:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729177AbgHZNRs (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 26 Aug 2020 09:17:48 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5B95C061574
        for <linux-mips@vger.kernel.org>; Wed, 26 Aug 2020 06:17:47 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id j15so960538lfg.7
        for <linux-mips@vger.kernel.org>; Wed, 26 Aug 2020 06:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=05vLOnzlD86DIl3ohasIKpv7Jy8X0lsYQpErjAX0LQg=;
        b=YEDThhb+P6FGKaGx+4o88GoERqYpIHpxaTeCPddUIFqufkNnnbN+siVdKDCpmGHYaM
         gKOA1LBONTeQW+xJ7ybFsqi9jnQE/HcOEiwETjAwLamhWI7O3odrms9qjwzQOIEq55H5
         5InetjI0g4GSzlLoxLP5aE8JIDBgomBfYgiwSIrZdAyjjoKteoIDrttoctC3HQjRl6gN
         c0yhOEzmFheS2K2ZwZkvRuFDGMl4zGenYldooc6ORNBTKj7U67WMhLKEmPK78Hsw/ET6
         bPu83ZltEUsmmP/4a6mfWSV3xqohs/KzO97/pAPYRLLDArVztACdmBVPtbsis7vuzLit
         G3hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=05vLOnzlD86DIl3ohasIKpv7Jy8X0lsYQpErjAX0LQg=;
        b=cu8gTigpars+WoJPvP58H4Q6XN1MzMxwSut/L7ciVRAcHSypwhN6cGIMHkf58du5h+
         EfmFi5uhg9QEHSJMKtmBCCi0ZRegQ1Z7dDR7MDE/LzKcFlNzBVpVUD6ATK3ffNWcT3GW
         ySoS1upfai7X+Bf1pnHAUvJTt8ATa5u7+Un9qSryEvcBGd76DvMt794GIXBmzOPdlRG+
         AVWuH+r/boHZ0kjqV8/vLa7d3/CD8/b65W48RV3RAyvpmLr9NW9kqizCdLpkLfb6d23W
         Y3tCFw0gmQCeoPJEJ0HU4n/NejsBWOM5CtN4gjCm8BqB3DpKbVGZHCeaBZAi5FSzcQZl
         8c1A==
X-Gm-Message-State: AOAM533suMhtHaU8KLynBzUprSNvycmv5gcZbXRVMg+XXm1B/9pILprc
        y+uaK6w0sAQ3xNTuIgBjQM4s9yI7/AM=
X-Google-Smtp-Source: ABdhPJyk5TtZqSIanmBpyF8fLCJETum8BIZ+eLMlczScJ9OBWAPvEBhQr7Y6PTjFbUJtqpUfDaLGyg==
X-Received: by 2002:a05:6512:3af:: with SMTP id v15mr7300859lfp.79.1598447865432;
        Wed, 26 Aug 2020 06:17:45 -0700 (PDT)
Received: from wasted.omprussia.ru ([2a00:1fa0:487e:dc41:71fc:79e9:7575:22c2])
        by smtp.gmail.com with ESMTPSA id e14sm564062lfd.19.2020.08.26.06.17.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2020 06:17:44 -0700 (PDT)
Subject: Re: [PATCH] MIPS: add missing MSACSR and upper MSA initialization
To:     Huang Pei <huangpei@loongson.cn>
Cc:     linux-mips@vger.kernel.org
References: <20200825043807.5741-1-huangpei@loongson.cn>
 <20200825043807.5741-2-huangpei@loongson.cn>
 <0d88a29f-035b-2c91-c802-3a405d8f69d8@gmail.com>
 <20200826101037.5aam5rhuiais3yrc@ambrosehua-HP-xw6600-Workstation>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <893e5ba3-1f2b-d439-1294-d4860a2bf672@gmail.com>
Date:   Wed, 26 Aug 2020 16:17:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200826101037.5aam5rhuiais3yrc@ambrosehua-HP-xw6600-Workstation>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 8/26/20 1:10 PM, Huang Pei wrote:

> From 0f4003eb418737df75cb8be79d4da34b1500f3d7 Mon Sep 17 00:00:00 2001
> From: Huang Pei <huangpei@loongson.cn>
> Date: Fri, 21 Aug 2020 10:48:40 +0800
> Subject: [PATCH] MIPS: add missing MSACSR and upper MSA initialization
> 
> init_fp_ctx just initialize the fp/msa context, and own_fp_inatomic
> just restore FCSR and 64bit FP regs from it, but miss MSACSR and upper
> MSA regs for MSA, so MSACSR and MSA upper regs's value from previous
> task on current cpu can leak into current task and cause unpredictable
> behavior when MSA context not initialized.
> 
> Signed-off-by: Huang Pei <huangpei@loongson.cn>
> ---
>  arch/mips/kernel/traps.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
> index 38aa07ccdbcc..e843b38486b8 100644
> --- a/arch/mips/kernel/traps.c
> +++ b/arch/mips/kernel/traps.c
> @@ -1287,6 +1287,16 @@ static int enable_restore_fp_context(int msa)
>  		err = own_fpu_inatomic(1);
>  		if (msa && !err) {
>  			enable_msa();
> +			/* with MSA enabled, userspace can see MSACSR 
> +			 * and MSA regs, but the values in them are from
> +			 * other task before current task, restore them
> +			 * from saved fp/msa context
> +			 */
> +			write_msa_csr(current->thread.fpu.msacsr);
> +			/* own_fpu_inatomic(1) just restore low 64bit,
> +			 * fix the high 64bit
> +			 */

   This comment style is acceptable only for the networking code, all the other code
should have the 1st comment line empty.

[...]

MBR, Sergei
