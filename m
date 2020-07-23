Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF5D522AC06
	for <lists+linux-mips@lfdr.de>; Thu, 23 Jul 2020 12:00:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728268AbgGWKA3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 23 Jul 2020 06:00:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728244AbgGWKA2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 23 Jul 2020 06:00:28 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DE6AC0619E2
        for <linux-mips@vger.kernel.org>; Thu, 23 Jul 2020 03:00:28 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id b25so5689864ljp.6
        for <linux-mips@vger.kernel.org>; Thu, 23 Jul 2020 03:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HrbYk4F6BiU7qem6PjGJVBGaHMs1d/veVa02py3tg7c=;
        b=B9o9qaJuicQJ2qsQkihdmy34rpXY1VeRtcFr+plwnR7HpNQMr6HSNrw+g7yamjxfNQ
         gZA9bp4Z9v4qrITsTl9OVZ9H0KTCP1FeyBK5YRuUE/1fa1rfC1DX+4+h0GtwKPPXOdXl
         6miY+01Vh8r5WmHot+riaztuwm77sTCPjxhOqoRkc4YrxNtV0ShA5fmocyFOlUeEUM79
         z+HoRlj3IzjM0HmBkgfgzslA4bGyyaJCrq7FjfrlYRPQRKo4bRTua9giUB5ABsysB5w8
         xZ+bwOS7VBS0kOjp/tVT137CID4wkm83mtBAkRrtLvLmxER3bJjaOxYhblQ5ScESeXDP
         IAbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HrbYk4F6BiU7qem6PjGJVBGaHMs1d/veVa02py3tg7c=;
        b=OqSE3A3b8MLFGlvyDfMkkDnh3EnezHEliokpc4godaxDjfm/of4NssiCyaKoUZnuJB
         2d6kyPu47vDsgzKcg8kLqMkrfABPiLtpvNX1hUQw+Yb3qxmn7nAzZHkSWWpPd/2MWtp6
         872dzV9uOzXt+B8O5441nfScnuPqqyySD9JNfCbzh+1L/6lOjfYFJ569ilL+UAZmoYh6
         Zp9vaXj7I2FXoKfVsilH3iRmoXV85gaN0nEymoCyO3NaT3QPy5us6bvDhb3ngBGLZ304
         LSXzmdWJj4wfzgAAF+UqjxgEucYqtwFtoAJrHDr4+AauEyMAl/H2ZHsYHyQkeoh/3Zr9
         BTDw==
X-Gm-Message-State: AOAM533DvUSboizyRzYu7i8+0gG5c0xcGV/nktnX+iBTjtvAh33uWBjp
        CSfR4N+4GvxnH4rcmzDZTfHN1BimvG4=
X-Google-Smtp-Source: ABdhPJw/oMsAA+OlV/VLPwHyjW2JxV3TAlZQg+zmuCePnVD68oRkQgXVu2xZ9VZvASbD/2RTobFLFA==
X-Received: by 2002:a2e:8758:: with SMTP id q24mr1503960ljj.109.1595498426684;
        Thu, 23 Jul 2020 03:00:26 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:42af:e693:70ac:4b21:9cec:e4c7? ([2a00:1fa0:42af:e693:70ac:4b21:9cec:e4c7])
        by smtp.gmail.com with ESMTPSA id q3sm2316049ljm.22.2020.07.23.03.00.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2020 03:00:25 -0700 (PDT)
Subject: Re: [PATCH] mips: traps, add __init to parity_protection_init
To:     Jiri Slaby <jslaby@suse.cz>, tsbogend@alpha.franken.de
Cc:     linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
References: <20200723094235.12706-1-jslaby@suse.cz>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <252bf1ae-6c1d-463e-a035-debb119fa83d@cogentembedded.com>
Date:   Thu, 23 Jul 2020 13:00:14 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200723094235.12706-1-jslaby@suse.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello!

On 23.07.2020 12:42, Jiri Slaby wrote:

> It references __initdata and is called only from an __init function:
> trap_init. This avoids section mismatches (which I am seeing with gcc
> 10).
> 
> Signed-off-by: Jiri Slaby <jslaby@suse.cz>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: linux-mips@vger.kernel.org
> ---
>   arch/mips/kernel/traps.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
> index f655af68176c..702143ad7b47 100644
> --- a/arch/mips/kernel/traps.c
> +++ b/arch/mips/kernel/traps.c
> @@ -1680,7 +1680,7 @@ __setup("nol2par", nol2parity);
>    * Some MIPS CPUs can enable/disable for cache parity detection, but do
>    * it different ways.
>    */
> -static inline void parity_protection_init(void)
> +static inline __init void parity_protection_init(void)

    *inline* in a .c file? Perhaps gcc-10 has it out-of-line?

[...]

MBR, Sergei
