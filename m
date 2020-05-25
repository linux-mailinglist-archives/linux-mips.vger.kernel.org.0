Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4F451E08E0
	for <lists+linux-mips@lfdr.de>; Mon, 25 May 2020 10:34:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388283AbgEYIeu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 25 May 2020 04:34:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388182AbgEYIet (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 25 May 2020 04:34:49 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B34AC05BD43
        for <linux-mips@vger.kernel.org>; Mon, 25 May 2020 01:34:49 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id b6so19867722ljj.1
        for <linux-mips@vger.kernel.org>; Mon, 25 May 2020 01:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=H1BMSVZkWADjrieVFVAXMCwoV1IdaPZXkmLHmjV4How=;
        b=STMrmb/zILaP/upNG1yawI1y2T4i0zG4i9EdgF8IXLjhr7HU9YXW/UR3jFxrVFa1Tn
         SHCZwWaGqSL8QbwMcYsy7IrlAfTzW/QBlSB5oPfjsV/h8gi7RGIlNgyy8GaEtL1tr6Gy
         kSyudst1CEFDQsbv2HCRu44+/B5GFXkdP48pEXF7J2ZxHSABBGs35KM81OU7kpF0PmKn
         CagFAXyZTTAtawkncJ1OlE9yMMi9r9Tv6CsjkiZCoSdGdeDxDF8O3/bCHNhAbPFulnXk
         ktTOR29Q0jYAK7h2gP7IMiOqUqw0sUcq5BepQ12h+N8d10JmhdmN4wcU8/fQ6lugo02w
         HH3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=H1BMSVZkWADjrieVFVAXMCwoV1IdaPZXkmLHmjV4How=;
        b=BONhQ1kHS20/j/Oz0lebffSB7v6saRR3zPtc9pjO1GMpnYsr5TbaO4krhCwQLWzKmw
         jvALQ9owc1dGxMegAObja4sP8EuGiRZKahPKlfVkfj9VQysm0OBDlkrcpMK78Xu6H5iA
         OR9EdBzuFWmCvhMguPZwhnQDbpqH27JKfcUaHV7ENprg5mbTGMsfWvh3QFrusJZ76TDE
         1GnwGWxQLizTuJZiIPyQ8B5kayHFoLhrn9to7j1iDNcfTX6TdrexAcSDYnsBGMouVInV
         1Ydyq33xE6LTIGC23ZNb3dFpR8b+KyGps27zNwpWWiz+abmjeMgmLrZ+6zt/AGs0aKmV
         XAXA==
X-Gm-Message-State: AOAM530pMBC2xAR0EYI/p+Q21MWzx7vFTOLebiaVNZuAtprCVj9gjDHB
        NsQAXYNdEvcGlcaSfFE57jX4Pw==
X-Google-Smtp-Source: ABdhPJxOUjDrGfmc17Z/uBTbuo5ouGtNFEhqXL9XB1W+W5/nb10s8/j6F4fq+37EgBeLQvpQGeTAyw==
X-Received: by 2002:a05:651c:33c:: with SMTP id b28mr1858300ljp.219.1590395687723;
        Mon, 25 May 2020 01:34:47 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:425b:15e7:251c:5b3:d625:2d43? ([2a00:1fa0:425b:15e7:251c:5b3:d625:2d43])
        by smtp.gmail.com with ESMTPSA id o4sm4639825lff.78.2020.05.25.01.34.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2020 01:34:46 -0700 (PDT)
Subject: Re: [PATCH] MIPS: Fix IRQ tracing when call handle_fpe()
To:     YuanJunQing <yuanjunqing66@163.com>, tsbogend@alpha.franken.de
Cc:     paulburton@kernel.org, chenhc@lemote.com,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        liulichao@loongson.cn
References: <20200525033123.13114-1-yuanjunqing66@163.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <0cb09824-73c3-d0d0-3bfe-b94e382536d9@cogentembedded.com>
Date:   Mon, 25 May 2020 11:34:40 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200525033123.13114-1-yuanjunqing66@163.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello!

On 25.05.2020 6:31, YuanJunQing wrote:

>   Register "a1" is unsaved in this function,
>   when CONFIG_TRACE_IRQFLAGS is enabled,
>   the TRACE_IRQS_OFF macro will call trace_hardirqs_off(),
>   and this may change register "a1".
>   The variment of register "a1" may send SIGFPE signal

    Variment?

>   to task when call do_fpe(),and this may kill the task.

    Need space after comma.

> Signed-off-by: YuanJunQing <yuanjunqing66@163.com>
> ---
>   arch/mips/kernel/genex.S | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
> index 8236fb291e3f..956a76429773 100644
> --- a/arch/mips/kernel/genex.S
> +++ b/arch/mips/kernel/genex.S
> @@ -480,16 +480,18 @@ NESTED(nmi_handler, PT_SIZE, sp)
>   	/* gas fails to assemble cfc1 for some archs (octeon).*/ \
>   	.set	mips1
>   	SET_HARDFLOAT
> -	cfc1	a1, fcr31
> +	cfc1	s0, fcr31
>   	.set	pop
>   	CLI
>   	TRACE_IRQS_OFF
> +	move    a1,s0

    Need space after comma.

>   	.endm
>   
>   	.macro	__build_clear_msa_fpe
> -	_cfcmsa	a1, MSA_CSR
> +	_cfcmsa	s0, MSA_CSR
>   	CLI
>   	TRACE_IRQS_OFF
> +	move    a1,s0

    Ditto.

[...]

MBR, Sergei
