Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08C5D755DA7
	for <lists+linux-mips@lfdr.de>; Mon, 17 Jul 2023 10:00:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231133AbjGQH77 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 17 Jul 2023 03:59:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231181AbjGQH74 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 17 Jul 2023 03:59:56 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1891710F
        for <linux-mips@vger.kernel.org>; Mon, 17 Jul 2023 00:59:51 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3fbd33a57b6so42672975e9.2
        for <linux-mips@vger.kernel.org>; Mon, 17 Jul 2023 00:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689580789; x=1692172789;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RFTS56H4L7tOsMQJOTDaR3DV9OhcVuv7sFbGwGXDOGY=;
        b=A9BglnEOPrZZRMIUfrqjyNm1o3iK7gkR0g0R16wGyBDQ0KJYeNvZNz5yzhjrsI/00f
         ENOw3ub0dt0mxcCFFHtZ9rBWUNxP+Gw6bU9HCVpuwdCcVE4KRyW0y9S6EFJuFsNItPKl
         kZ+FXW27oKBKaNBV65hsEF20fwLvq1hRlQ/E78TvVc9e8b9XSnnBM0pKJVNEJ3Xhcbze
         uC6/4R8XsEHEV8Zzx1IF1PwOV/AQun39PiH2ADRb0VhzMhElhFAVsa7MEnsz2KRHtvNs
         nsJ1ZbvbI6cqq9XqB/j6KHBuQzPVs5w0QEJRDZM8MTwwg0dtci/7z+RxOWwDKwLkH/X1
         ajIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689580789; x=1692172789;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RFTS56H4L7tOsMQJOTDaR3DV9OhcVuv7sFbGwGXDOGY=;
        b=iOa5XWc01OuiKZ4YxYtiatmgfUH1eqQnWBTU1YrXv2L6YUsmh3K34d4tQ86SddCyoK
         QRMHm02Chgy0o9tHOnHs0zTeLy7hch3Q8OGhp+FESDDLJCN+41oYPHxQ6A5IdLJ4+pWi
         mJ7AUgenZxa4xx0PBH71xn4ENAgw31FM2bIEaVJdxzRMnkgJd0JJ4ElY/I0KU2QehQSh
         thJJdZbxBxf/t41n1MQoSos7NZNr2AzH53g4kYgRWNJ7rqkMk+hx4sal2eJo21wKd9LS
         7tjXd9MHDpe6Qxhif5TxtE9phsosxFO0guLaYw/OCc42r7G3StFLXc7hAPpcjaZ7sKqA
         NeCg==
X-Gm-Message-State: ABy/qLbO8m6SMcDPnc5ZyQ2KWrh/hFcG0CB0g45Gt56r0Dj7V0fV9b78
        Yp27eASz20xZpf6b+oxtQmKxag==
X-Google-Smtp-Source: APBJJlHt/gNZbBWnNGl0pijYwF1lR3yHFivEmpsbf/Ls5SkVgXR0JMOLe0nmuel+2/edFj2tgMpn2Q==
X-Received: by 2002:a05:600c:2901:b0:3fb:df34:1766 with SMTP id i1-20020a05600c290100b003fbdf341766mr11493369wmd.1.1689580789591;
        Mon, 17 Jul 2023 00:59:49 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.144.39])
        by smtp.gmail.com with ESMTPSA id c22-20020a05600c0ad600b003fc01495383sm7304389wmr.6.2023.07.17.00.59.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jul 2023 00:59:49 -0700 (PDT)
Message-ID: <a25e5e55-5421-ff9a-0fe5-e9511020118b@linaro.org>
Date:   Mon, 17 Jul 2023 09:59:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v4 2/6] usb: dwc3: dwc3-octeon: Pass dwc3_octeon to setup
 functions
Content-Language: en-US
To:     Ladislav Michl <oss-lists@triops.cz>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Liang He <windhl@126.com>
Cc:     linux-mips@vger.kernel.org, linux-usb@vger.kernel.org
References: <ZLP7CSUm095ADtdw@lenoch> <ZLP7d65Lc6jC0Tc/@lenoch>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <ZLP7d65Lc6jC0Tc/@lenoch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 16/7/23 16:15, Ladislav Michl wrote:
> From: Ladislav Michl <ladis@linux-mips.org>
> 
> Pass dwc3_octeon instead of just the base. It fits with the
> function names and it requires less change in the future if
> access to dwc3_octeon is needed.
> 
> Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
> ---
>   CHANGES:
>   - v4: new patch
> 
>   drivers/usb/dwc3/dwc3-octeon.c | 23 ++++++++++++-----------
>   1 file changed, 12 insertions(+), 11 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

