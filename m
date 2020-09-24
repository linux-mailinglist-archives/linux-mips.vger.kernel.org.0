Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBABB276B95
	for <lists+linux-mips@lfdr.de>; Thu, 24 Sep 2020 10:16:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727180AbgIXIQx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 24 Sep 2020 04:16:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727089AbgIXIQx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 24 Sep 2020 04:16:53 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6612C0613CE;
        Thu, 24 Sep 2020 01:16:52 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id m5so2888630lfp.7;
        Thu, 24 Sep 2020 01:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rMqAMciGIaVKFsQmbbgyhHPDfrXrVXzSGxoaIl6aI+E=;
        b=kbzLcPoqT/OshWG1EfWbsDgl1eiOy5tptHj0NRaxhUTaEadzvxoVd/S/FGXr6adVaD
         yC4VsSVGtyW70fPWWcoecHw+Z8FbfLMlJsEmIsULAlraDsl5FZ8AIE4xaVaBaEiepRYh
         0uTAbHbTtIy7D0xE9Quo7ietkgEh1jS17QoGYnMPb9IwX6ouukV2eASKuS9tltjx2lq1
         Q4Zytccn16R1O8Nfa3C3y1EdkQpZfF3mAqt1ydhNtaUHNNh9MkTMeK3d77heMJLQnZcd
         bOxNi8fMKZryJIVWM4S8nqV/1nDKcKmVXjbrLfk7OknOXcpNfrCFnPgNAbMpygR/+ug3
         cPBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=rMqAMciGIaVKFsQmbbgyhHPDfrXrVXzSGxoaIl6aI+E=;
        b=A1W9GuwcELE5jiuJVUIeYV/ZTH3RMhHiXprGR2u/vN8mb5BtvcTIn9uoXcbgOzFVoN
         lVMENSmQinG1q44P7z4z4bLWMVUiY4PSfCBBof9/yLsKT5U3E20mvGim+YaU6+XkYQad
         9nEWHzBGssuMcwEbus+Nl4zgT1ARSE0+a9+qLkLanMiA9fgIoObxo/pFrSHEZkFyQsBc
         C18/uOUT9MmsnmLD/792sU279GxZDx5guRVY0IiUrH9BYK8VQxOqi470GSdHHSgbWXTK
         GgO0TLP3jfAbupe/6nHyFsI/IkCqGpUO0MizBkHg57mn/Vy+nBokmedNpFtptC7T6kcZ
         zxbg==
X-Gm-Message-State: AOAM530GFzH3o7wmYSICnBFm4G6YjhJzC6LFtjWz5v3N9amN2RoUeU8e
        hdJLMtU06Se3mMxK7Jiva/MXoIrFRGs=
X-Google-Smtp-Source: ABdhPJzJt+eS43rDClp/AtgDKukb99W1vQJ85ucF5/Z5hhVilAnT5DMwwtZFpockH5V6DnqJlR8ffg==
X-Received: by 2002:a05:6512:49a:: with SMTP id v26mr1130620lfq.490.1600935410957;
        Thu, 24 Sep 2020 01:16:50 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:4206:13f7:a4a9:537f:61c8:7dc4? ([2a00:1fa0:4206:13f7:a4a9:537f:61c8:7dc4])
        by smtp.gmail.com with ESMTPSA id 73sm1386727lff.118.2020.09.24.01.16.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2020 01:16:50 -0700 (PDT)
Subject: Re: [PATCH -next] MIPS: OCTEON: fix error - use 'ret' after remove it
To:     Qinglang Miao <miaoqinglang@huawei.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200924064142.90491-1-miaoqinglang@huawei.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <95b3e25b-b501-d2f3-421d-d06558bddf8f@gmail.com>
Date:   Thu, 24 Sep 2020 11:16:38 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200924064142.90491-1-miaoqinglang@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello!

On 24.09.2020 9:41, Qinglang Miao wrote:

> Variable ret was removed in commit 0ee69c589ec("MIPS: OCTEON:

    I'm only seeing the variable 'res' below...

> use devm_platform_ioremap_resource") but still being used in
> devm_release_mem_region which is unneeded. So remove this
> line to fix error.
> 
> Fixes: 0ee69c589ec("MIPS: OCTEON: use devm_platform_ioremap_resource")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
> ---
>   arch/mips/cavium-octeon/octeon-usb.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/arch/mips/cavium-octeon/octeon-usb.c b/arch/mips/cavium-octeon/octeon-usb.c
> index 97f6dc31e1b4..987a94cbf3d0 100644
> --- a/arch/mips/cavium-octeon/octeon-usb.c
> +++ b/arch/mips/cavium-octeon/octeon-usb.c
> @@ -534,8 +534,6 @@ static int __init dwc3_octeon_device_init(void)
>   			dev_info(&pdev->dev, "clocks initialized.\n");
>   			mutex_unlock(&dwc3_octeon_clocks_mutex);
>   			devm_iounmap(&pdev->dev, base);
> -			devm_release_mem_region(&pdev->dev, res->start,
> -						resource_size(res));
>   		}
>   	} while (node != NULL);
>   

MBR, Sergei
