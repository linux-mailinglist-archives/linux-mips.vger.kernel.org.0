Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28E3333ED76
	for <lists+linux-mips@lfdr.de>; Wed, 17 Mar 2021 10:53:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229712AbhCQJwn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 17 Mar 2021 05:52:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbhCQJwX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 17 Mar 2021 05:52:23 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CBF1C06174A;
        Wed, 17 Mar 2021 02:52:22 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id v9so2047013lfa.1;
        Wed, 17 Mar 2021 02:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ni2BVUyOVxy8Q5T7Y2ORvrYM9+lertlhmJx4LiUX5Ig=;
        b=OfORvD0YNsxiec2uVYSZpqhI5sIKgx3jah+I6llqsJ9VvUeTxUa+o07fCHtVHDao8s
         v0/JBXn+b9yTYgw6/MDB2xD7yguSuPAkbStwTUDMCPNgLAaInvdviwuh7mkQve4uwr2i
         kMQtCvPuwsdWVix1Tn4idaxztPg2bPdASPvvb2qO0B+OtU2JciCJw8ILk7aidlwY0MFW
         H/qd5KttUBi0shOUn8Qt3oMb2dxJ19N0wZf6zLqHA2Euc2I5dsmcqX2bID8ZZqOr3Wjc
         lcDRWzXiSEonp4VM/lI1dtLjZRBI5L/fxmXjAjgspg76Qq8lbeAl/7Yf6URVVsSTMk2C
         +GuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Ni2BVUyOVxy8Q5T7Y2ORvrYM9+lertlhmJx4LiUX5Ig=;
        b=NMNjKmCqwATy0MZJld7NUEfwhvDnrY4YixRVoTs52m87FkxoFWh1WAN+EPF59tXCV8
         vWB+Gi4nSCUmcLRCIOzHi0mPQqRnlFOw0+tjJPth0nJiBmvQSlaueYtihddkYPogPgtp
         QJdavDmL94CA6Y1g1HEX/LG+AI6PPloB8uENkV05GrDDicrqdIp6isdkJ7AYGOeYXikK
         MA/QhaT/2a82Jx/t/1UsI6QVOs9Iw2SiCq/YPG/ZpK5JEJ5JqhMo++SO/2gGQvt2FLXi
         /TlxK3bh83WN59OqbqaTLb4WUPUf01nZty0QwNuasD5iXRkbO4ttVPiS1B+W61cviP0B
         TP6Q==
X-Gm-Message-State: AOAM53142EhDHMtm/b+e/yB/0DP1hVZsPHbQnJDxdod5TL26xQTNSjaq
        Mm1CfA4So7VhDbQxJkUbyiI=
X-Google-Smtp-Source: ABdhPJxTvEJk2/JJSa9u+SMudEYTNx2T39WOwc8CfNReaMKv/b5D+AsWUYXEYKpU6WbK0wASLmd6Xw==
X-Received: by 2002:ac2:5b9b:: with SMTP id o27mr1910136lfn.143.1615974741096;
        Wed, 17 Mar 2021 02:52:21 -0700 (PDT)
Received: from [192.168.1.100] ([178.176.79.25])
        by smtp.gmail.com with ESMTPSA id e20sm3380324lfc.20.2021.03.17.02.52.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Mar 2021 02:52:20 -0700 (PDT)
Subject: Re: [PATCH] MIPS: ralink: define stubs for clk_set_parent to fix
 compile testing
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        John Crispin <john@phrozen.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     thierry.reding@gmail.com, linux-tegra@vger.kernel.org,
        balbi@kernel.org, linux-usb@vger.kernel.org, digetx@gmail.com,
        kernel test robot <lkp@intel.com>
References: <20210316175725.79981-1-krzysztof.kozlowski@canonical.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <880d5e61-fec5-e7d6-7403-b1823c77b3c1@gmail.com>
Date:   Wed, 17 Mar 2021 12:52:14 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210316175725.79981-1-krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello!

On 16.03.2021 20:57, Krzysztof Kozlowski wrote:

> The Ralink MIPS platform does not use Common Clock Framework and does
> not define certain clock operations leading to compile test failures:
> 
>      /usr/bin/mips-linux-gnu-ld: drivers/usb/phy/phy-tegra-usb.o: in function `tegra_usb_phy_init':
>      phy-tegra-usb.c:(.text+0x1dd4): undefined reference to `clk_get_parent'
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>   arch/mips/ralink/clk.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/arch/mips/ralink/clk.c b/arch/mips/ralink/clk.c
> index 2f9d5acb38ea..8387177a47ef 100644
> --- a/arch/mips/ralink/clk.c
> +++ b/arch/mips/ralink/clk.c
> @@ -70,6 +70,20 @@ long clk_round_rate(struct clk *clk, unsigned long rate)
>   }
>   EXPORT_SYMBOL_GPL(clk_round_rate);
>   
> +int clk_set_parent(struct clk *clk, struct clk *parent)
> +{
> +	WARN_ON(clk);
> +	return -1;

    Shouldn't this be a proepr error code (-1 corresponds to -EPRERM)?

> +}
> +EXPORT_SYMBOL(clk_set_parent);
> +
> +struct clk *clk_get_parent(struct clk *clk)
> +{
> +	WARN_ON(clk);
> +	return NULL;
> +}
> +EXPORT_SYMBOL(clk_get_parent);
> +
>   void __init plat_time_init(void)
>   {
>   	struct clk *clk;

MBR, Sergei
