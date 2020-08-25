Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2556325163E
	for <lists+linux-mips@lfdr.de>; Tue, 25 Aug 2020 12:05:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729627AbgHYKFk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 25 Aug 2020 06:05:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726000AbgHYKFj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 25 Aug 2020 06:05:39 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10303C061574
        for <linux-mips@vger.kernel.org>; Tue, 25 Aug 2020 03:05:39 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id d2so6102123lfj.1
        for <linux-mips@vger.kernel.org>; Tue, 25 Aug 2020 03:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=R6vroRWerOxXve5FM2pxYWZPN9N8KMUDGiwWYgzLnkA=;
        b=Req7C/IwvrY+UccwfjmH5BKGGJX1UhmPuCQCXFJtqcX3KCGZFHTCdai2dL7JBMUkrw
         oOPzVEAO2UA+RG9K66d8ikPWcdkC9t0Z69/r7+yH57+tK1Q9ZlcUbkQY4CzSuZaZghff
         pGAWiOT1cLXiaRvFd5Q2oCzvnjAZpJueI8X6BvV+nnNv/8kkkCfQWVBV+zzkdJ9c9EdB
         r4kptEXvh6qwzYzf1GuPf+kk0rtcXesl+0QHTlN9l42ePj2Qb1fcHrfHZ6mZTCguGuCl
         4J0Ii/rOR+XPEhoPneyjHJdbA4kV3W5Axssiy2nbJEm6BLvhEYBB1Fj5nunsv/47a7fg
         vfrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=R6vroRWerOxXve5FM2pxYWZPN9N8KMUDGiwWYgzLnkA=;
        b=QsthgVeweXkqZiwWYo2mWk4CYwnjpKI6Qen2w5PrxsQzUKs4FxVR53bkxATXMaLc6L
         oLZpDyKsFS9SdriHjtXoJfenyr22bl5dTf9VXeC+tMSR9b2hhmu55zKsegTyBAUgkuKH
         XzQiIF0O3OyfC4sX2i+TaWJ2/eV/eiLF0Pk8Fg4x8eTj8J3Hx2ktRJGnlecuKO4IXney
         K/nBJPdCd6WmcB5sOi1BFf5MLRtRwMAkMfN37/vfuUGjkGlbIL02HtXA+906HUnqlvON
         FiCaWabS+RSqkdz4V8sXdl7JtrKkZCXPDJCsz6PsV95E1ISo0oW1XOaxZHhgLu0nz1dg
         5Fng==
X-Gm-Message-State: AOAM533qXmSUhnldYMiARZ5AC70+B0kiiLnIQpuTdKCO9r0q5Pbo94pA
        SxZrxut6ih0JSrGyQRUU9nGvTqd5VU6vTw==
X-Google-Smtp-Source: ABdhPJzXvpBzIK1uCtSaIJgVyR72fEPytj609NQoct1fZOkKtqK3aG5jKo/sb4j20t6krBOSW38+DA==
X-Received: by 2002:a19:7e4e:: with SMTP id z75mr4523794lfc.158.1598349937325;
        Tue, 25 Aug 2020 03:05:37 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:4816:68c0:5873:c86a:8573:25bf? ([2a00:1fa0:4816:68c0:5873:c86a:8573:25bf])
        by smtp.gmail.com with ESMTPSA id q5sm1307982lfn.92.2020.08.25.03.05.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2020 03:05:36 -0700 (PDT)
Subject: Re: [PATCH] MIPS: add missing MSACSR and upper MSA initialization
To:     Huang Pei <huangpei@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        ambrosehua@gmail.com
Cc:     Li Xuefeng <lixuefeng@loongson.cn>,
        Yang Tiezhu <yangtiezhu@loongson.cn>,
        Gao Juxin <gaojuxin@loongson.cn>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhc@lemote.com>, linux-mips@vger.kernel.org
References: <20200825043807.5741-1-huangpei@loongson.cn>
 <20200825043807.5741-2-huangpei@loongson.cn>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <0d88a29f-035b-2c91-c802-3a405d8f69d8@gmail.com>
Date:   Tue, 25 Aug 2020 13:05:31 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200825043807.5741-2-huangpei@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello!

On 25.08.2020 7:38, Huang Pei wrote:

> init_fp_ctx just initialize the fp/msa context, and own_fp_inatomic
> just restore FCSR and 64bit FP regs from it, but miss MSACSR and upper
> MSA regs for MSA, so MSACSR and MSA upper regs's value from previous
> task on current cpu can leak into current task and cause unpredictable
> behavior when MSA context not initialized.
> 
> Signed-off-by: Huang Pei <huangpei@loongson.cn>
> ---
>   arch/mips/kernel/traps.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
> index 38aa07ccdbcc..f8334b63e4c8 100644
> --- a/arch/mips/kernel/traps.c
> +++ b/arch/mips/kernel/traps.c
> @@ -1287,6 +1287,14 @@ static int enable_restore_fp_context(int msa)
>   		err = own_fpu_inatomic(1);
>   		if (msa && !err) {
>   			enable_msa();
> +			/* with MSA enabled, userspace can see MSACSR
> +			 * and MSA regs, but the values in them are from
> +			 * other task before current task, restore them
> +			 * from saved fp/msa context */
> +			write_msa_csr(current->thread.fpu.msacsr);
> +			/* own_fpu_inatomic(1) just restore low 64bit,
> +			 * fix the high 64bit */

    The preferred multi-line comment style is:

/*
  * bla
  * bla
  */

> +			init_msa_upper();
>   			set_thread_flag(TIF_USEDMSA);
>   			set_thread_flag(TIF_MSA_CTX_LIVE);
>   		}

MBR, Sergei
