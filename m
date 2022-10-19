Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B0D0603B19
	for <lists+linux-mips@lfdr.de>; Wed, 19 Oct 2022 10:04:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230064AbiJSIEQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 19 Oct 2022 04:04:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229717AbiJSIEO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 19 Oct 2022 04:04:14 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6523C7B788
        for <linux-mips@vger.kernel.org>; Wed, 19 Oct 2022 01:04:13 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id l14-20020a05600c1d0e00b003c6ecc94285so337613wms.1
        for <linux-mips@vger.kernel.org>; Wed, 19 Oct 2022 01:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mD8mi2JszaH1k33/UBfhukYZCATUxC9PacHcwmGKqNc=;
        b=ZrTqVkqVhFY4DL/Q15eyshVUWDd/XM5Z3ihENePjEPRfOuGyyYvXapCYD9o+EIf4lq
         P+TmmFUKcu9hYx+rY3pQrIS8i6YwPTJTvqdjRSsOtZNaDYTNu4DbWnOzq7rkb9MsxQpj
         SmErrUDdc/8sat+hM/0bUBhoGS6z/mUaYdD5uy0RYNo7MiGIqe+i56GRHMwDY/d06jlj
         o2sdD1IMei0gY9cwGvlkTJANRy862e4JgUjBK8b/r5SKN8rnydTxYXKAi93N21QiUpFq
         7mPtc6wplHmbxijqcDU1rf+M2dUNoQ+NXJckz6srLMJqVVSBTQelCTMUI8lERNR6Tnxc
         I+YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mD8mi2JszaH1k33/UBfhukYZCATUxC9PacHcwmGKqNc=;
        b=Gw8fPDgDLBtSPYwkOGDsaeoB7wahiojMNyzjEUTvvdUp9Ce89LE68Zy0NgpSR2N76X
         a9sl0kukW394IDZlnI2oswIJOZ39clNloiyKJjYwhd8IEzpFT/7CiOFRhi0nioV5DSDy
         7kmjme9k/DjOklYcXeysBbBA6w4t7ecj3z4UhKGIKQKSQx4FtN/1NfEnK3Ejr81qHMBH
         2ygsgNoicYBJJvPJaEASY6N5b9a4IkHF/QRQEq5SsVgAX78eWrt5m5UARbnoohi6ktGa
         u/8FWKYkRLEetzmPLmMPy4Jd0yvf7IG3BzCXA6h+um/yRngiCTcGHozyzuJJ8uBrKEh/
         77zg==
X-Gm-Message-State: ACrzQf2ZvlF0sbU8d1BWjG8KGxzh5TtelroLU/YE5bwa9TUVpFUolpt0
        yFVG3MdKf5eTQ51VRQDHrDgZOQ==
X-Google-Smtp-Source: AMsMyM54GYff3yCiXQvFC+AHAJzd3YnisbrSiEZIoubPBlylWsDjFtWcR3Lbj5qC5P1aK0srzw9oGw==
X-Received: by 2002:a7b:c00d:0:b0:3b4:6331:2fc5 with SMTP id c13-20020a7bc00d000000b003b463312fc5mr24864643wmb.11.1666166651714;
        Wed, 19 Oct 2022 01:04:11 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id n4-20020adf8b04000000b00231893bfdc7sm14030545wra.2.2022.10.19.01.04.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Oct 2022 01:04:11 -0700 (PDT)
Message-ID: <ae6c7966-2838-2e43-0455-30c69ad303b7@linaro.org>
Date:   Wed, 19 Oct 2022 10:04:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH][next][V2] ASoC: codecs: jz4725b: Fix spelling mistake
 "Sourc" -> "Source", "Routee" -> "Route"
To:     Colin Ian King <colin.i.king@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-mips@vger.kernel.org,
        alsa-devel@alsa-project.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221019071639.1003730-1-colin.i.king@gmail.com>
Content-Language: en-US
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221019071639.1003730-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 19/10/22 09:16, Colin Ian King wrote:
> There are two spelling mistakes in codec routing description. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
> V2: Fix "Routee" -> "Route" too
> ---
>   sound/soc/codecs/jz4725b.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


