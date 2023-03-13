Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D9066B7117
	for <lists+linux-mips@lfdr.de>; Mon, 13 Mar 2023 09:25:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229805AbjCMIZV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Mar 2023 04:25:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229977AbjCMIZM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 13 Mar 2023 04:25:12 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E1B8305EB
        for <linux-mips@vger.kernel.org>; Mon, 13 Mar 2023 01:25:10 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id r18so10437022wrx.1
        for <linux-mips@vger.kernel.org>; Mon, 13 Mar 2023 01:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678695909;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KXWUlrD6yDajrusn+FknIcjGiMREjLnN3F9aew8M6f8=;
        b=K8owNnYAcjjK3vsM2oDmyot0/xUNFZwbX/BGgLLGDNBtV2FbapY2wK2fDz8QZv0IlQ
         W/h+1az3u+ohVHmkqkhV0t3umiHo/tvmudlpQTa+dktbQU0aHsmRo1A/4fdPVVGxK+Qz
         cZbugwAQHwboupt+VsayVJRD/QHzTCkErNK7siiEW/6RMtctdn7kskBSa1WcDkiIW/iJ
         qcj5AQPWut32+BfmlPOJPQjAdbTe+lyATd2K6jQlJzJUXLU6dQAuVW8R8Q2O67FHqPIF
         MYvw31O8yYylv4so2bG8WTFP+OzUaJOWXuD1IPjVtyxI1zY/Skicj3z2oEUXbG43wM/u
         tsHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678695909;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KXWUlrD6yDajrusn+FknIcjGiMREjLnN3F9aew8M6f8=;
        b=MN/VKjBRYv/NHy0ZfSzO0F5oGRqgOVeSq1+7snCGktQTqT5d4n+U8N3WPxofQLaU0X
         FQO88EH9XnmtqGnP/eKkPOZCnbz28QNOGc2rJIFQBn+57BDv8c7mecD+OVUTBJKO7xOz
         u0sr7mKAApP/ny+jcEAvoLqeV9BzQDqa8w0SrExcV+4JF6wO/+rDryhygHrBozD2zZV6
         sTTICOsYRi/6oR78vkBYBmVA80WtCNYzz7AAekkn8cHFjDxKMRz5n+zhr7gW7l+og+PZ
         ATsbTG2m/fwdDKENggJlA1U0NR+qKvzGBPG3zqWWNeQyOnH6H9+24yZXZJD/6MyJV8wA
         fMzg==
X-Gm-Message-State: AO0yUKUMr3ABXAQCnX/ecqvNKRCJS1FW/d6ItSQ/KaC3TXCLqnMVTAmr
        AMeZFfGPLoc2LHZzix4PM2TEfqmHo7yvmmWeAsw=
X-Google-Smtp-Source: AK7set9XRql7qDxHGOr6jmCvbc8VF907ir2Lc8TqUt5AtQxWVCygps0tcVPdKJ1QxFoMi2YbWkvf/g==
X-Received: by 2002:adf:e44c:0:b0:2c7:148c:b04f with SMTP id t12-20020adfe44c000000b002c7148cb04fmr21731778wrm.37.1678695908996;
        Mon, 13 Mar 2023 01:25:08 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id a12-20020a056000100c00b002c5a790e959sm7124254wrx.19.2023.03.13.01.25.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Mar 2023 01:25:08 -0700 (PDT)
Message-ID: <c2191745-714c-7cdc-ba2d-a254245bbdac@linaro.org>
Date:   Mon, 13 Mar 2023 09:25:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH] mips: Use of_property_read_bool() for boolean properties
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230310144656.1540950-1-robh@kernel.org>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230310144656.1540950-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Rob,

On 10/3/23 15:46, Rob Herring wrote:
> It is preferred to use typed property access functions (i.e.
> of_property_read_<type> functions) rather than low-level
> of_get_property/of_find_property functions for reading properties.
> Convert reading boolean properties to to of_property_read_bool().
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>   arch/mips/pci/pci-lantiq.c | 2 +-
>   arch/mips/pci/pci-rt3883.c | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/mips/pci/pci-lantiq.c b/arch/mips/pci/pci-lantiq.c
> index d967e4c0cf24..79e29bf42a24 100644
> --- a/arch/mips/pci/pci-lantiq.c
> +++ b/arch/mips/pci/pci-lantiq.c
> @@ -118,7 +118,7 @@ static int ltq_pci_startup(struct platform_device *pdev)
>   
>   	/* and enable the clocks */
>   	clk_enable(clk_pci);
> -	if (of_find_property(node, "lantiq,external-clock", NULL))
> +	if (of_property_read_bool(node, "lantiq,external-clock"))

Just curious, is this property correct? I can't find it and wonder if
this is dead code (always disabling the clock)... I'm probably missing
something obvious :/

>   		clk_enable(clk_external);
>   	else
>   		clk_disable(clk_external);

