Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3B387A98D8
	for <lists+linux-mips@lfdr.de>; Thu, 21 Sep 2023 19:53:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229873AbjIURxz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 21 Sep 2023 13:53:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230149AbjIURxk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 21 Sep 2023 13:53:40 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06C3079618
        for <linux-mips@vger.kernel.org>; Thu, 21 Sep 2023 10:34:55 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-40537481094so7477055e9.0
        for <linux-mips@vger.kernel.org>; Thu, 21 Sep 2023 10:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695317693; x=1695922493; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZiQyBT2Rr44GS62RAnCzFGqwRIpWXpGD1ZEK9WT/Wr8=;
        b=VKc3VosDPPMTFdG4PfvV0CRahNV0Xh7UDdK7F2rf+epxaWIC1mwhq/TE2bG1TbLDZd
         ya+sorKrU6GAJMuoZEyoUjGCw7fXwbUA5gtZTKja/0nlD0PiHFolac5x9JArPMlsT4Us
         lzOThFBf7D454ZrIU8uQ8o0Ck6PKs4kB57K7r6wuvgtHL5PP9Keli2pRywAxkEQQnDMg
         yupbKmX1G1L/1ZaPvkff/I+FromCFLGSSzgUBJmtHXYCMUArI/7XR2I7I9XjzijoHMkf
         oZDX2zZjvNxJXMf7vYshWkps3usqTkrnVkAjwRh5QHWMEk0w/Ab56dPFWQ65zM4R0M0j
         o2QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695317693; x=1695922493;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZiQyBT2Rr44GS62RAnCzFGqwRIpWXpGD1ZEK9WT/Wr8=;
        b=QjAGkTVIuh+v0usBciNIQiMP+qfaVdhLWKwhgirfu4CdttcUfsS98PFUn8sqnP/avH
         z8AzKjcKXvyqj6TPGsLUj7jl0ahTdUi/177AdWe3s86MwMgjVHWPuB8P0oLB1Vgka3pj
         JIjiMXgIQDk9tNuOvT0kNHDKi76SFMhFSZqQsjx/ClH5DMYaDckOlo8hqPaMekGKO9zI
         jNT66MIHYH+iWtbWWsFzvF6SkQc8EkI0i+wofniv+qNEZK4y2YJw8/n4/McE4Rtpu+0R
         kimWA3c0kfSPYOvQhsxGJh2Tuj+fRySyeCXcQyzNP1OYwWOvLs8VH+KO+pCQrdNxRHZq
         7m9w==
X-Gm-Message-State: AOJu0Yzfa9sJ6sxgg22ky3Bicq38Yo81dwzI5rxgjd8RtWtK7zi+ibVe
        qeto1ot6H6Aunknn4qtUMMc327o+ba5+DkGutUc=
X-Google-Smtp-Source: AGHT+IHJU6MhImw2uW/qQJuMk0u6QNr8wV2CMNdC0tH3BYevlLkqIhiFmeB/HWKBkw5V+J8mdkbgSA==
X-Received: by 2002:a17:906:cc10:b0:9ae:4776:5a3a with SMTP id ml16-20020a170906cc1000b009ae47765a3amr3927167ejb.39.1695292678437;
        Thu, 21 Sep 2023 03:37:58 -0700 (PDT)
Received: from [172.20.41.70] (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id z27-20020a1709060adb00b00993cc1242d4sm840623ejf.151.2023.09.21.03.37.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Sep 2023 03:37:57 -0700 (PDT)
Message-ID: <30279c62-c80b-330f-260f-0c64a7893555@linaro.org>
Date:   Thu, 21 Sep 2023 12:37:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 3/6] vlynq: remove bus driver
Content-Language: en-US
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mips@vger.kernel.org
Cc:     Jonas Gorski <jonas.gorski@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
References: <20230920201035.3445-1-wsa+renesas@sang-engineering.com>
 <20230920201035.3445-4-wsa+renesas@sang-engineering.com>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230920201035.3445-4-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 20/9/23 22:10, Wolfram Sang wrote:
> There are no users with a vlynq_driver in the Kernel tree. Also, only
> the AR7 platform ever initialized a VLYNQ bus, but AR7 is going to be
> removed from the Kernel. OpenWRT had some out-of-tree drivers which they
> probably intended to upport, but AR7 devices are even there not

Typo "support".

> supported anymore because they are "stuck with Kernel
> 3.18" [1]. This code can go.
> 
> [1] https://openwrt.org/docs/techref/targets/ar7
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>   MAINTAINERS            |   7 -
>   drivers/Kconfig        |   2 -
>   drivers/Makefile       |   1 -
>   drivers/vlynq/Kconfig  |  21 --
>   drivers/vlynq/Makefile |   6 -
>   drivers/vlynq/vlynq.c  | 799 -----------------------------------------
>   include/linux/vlynq.h  | 149 --------
>   7 files changed, 985 deletions(-)
>   delete mode 100644 drivers/vlynq/Kconfig
>   delete mode 100644 drivers/vlynq/Makefile
>   delete mode 100644 drivers/vlynq/vlynq.c
>   delete mode 100644 include/linux/vlynq.h

