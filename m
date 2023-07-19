Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE294759438
	for <lists+linux-mips@lfdr.de>; Wed, 19 Jul 2023 13:34:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230035AbjGSLee (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 19 Jul 2023 07:34:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229809AbjGSLed (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 19 Jul 2023 07:34:33 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 525A7E69
        for <linux-mips@vger.kernel.org>; Wed, 19 Jul 2023 04:34:32 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3fbc1218262so67993505e9.3
        for <linux-mips@vger.kernel.org>; Wed, 19 Jul 2023 04:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689766471; x=1692358471;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DkSb46L9JJ9JbLMRGXNDVE5blg2kNug92H5SiFKvMj8=;
        b=IhaNJSQjO0DdSeOeHzS+7ZRxMVZ2gXCaLfOSyHJSa0DDAyYBEeaBpI1I5FjOb0sW9V
         B46gVdXa/X9+jLYLg7LScFi3WqhRJWLdSZrnVPGlfUw6SlSVHGwysLNDI6GEcukwBlZs
         rj/rvZNZWP4AWFZrFIW5ZbH8RueKXOBeb5tBbSpuaHrSSbKWQZrE8xSHTvYxqoDxW/Kb
         pkCwIjy+zfYamypnwvSnH9wI6POrdtfxY+PgI19a8x3Yqtq8p4tnYkQHTdDTp1xXE0MT
         d3Ew7IwppxmvOlsyCd1XzhNCE8z5dLp7njogxX1GgsuL/IESDk6n1FJSRfjLOcwwOdN4
         3wYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689766471; x=1692358471;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DkSb46L9JJ9JbLMRGXNDVE5blg2kNug92H5SiFKvMj8=;
        b=XVROo5FYcOAso5dvjtrywgcDw5PndlyoPCDOWR1Jvrscl2Pp/7A1fvs+PfWoj0mknu
         r6AOeOzkfsjU9/snP6Jgk67emcg+6taStEIW5kFd2NKqZVeok2+TTw0Z4xwq+35MbpOe
         ULfoeVeotAxIbSrvVGN9P8QtfLUMLPdSJmduJLcc88FeEymKegSun7H7eTBGN9D3Yoxe
         Xp89ClJJC0MIdls0n53jAVmJVac3sXGLevrvfB7pD5KNIqA1Lz9tnj56eipd4ftWr6Vm
         7/2u0Uoseu6xVgALtspXK5ogEjC0jVQnb21PSu1ez3Ucorz4Qazw3FrUJrXGIkH6pW3T
         g3Mw==
X-Gm-Message-State: ABy/qLbc4DE5aSjnkNdYrQLrSaNzeIj4ZaCck1v+J71sDz/HUNpYmJGR
        +B1nexOJML3+baR8en3tttKHxg==
X-Google-Smtp-Source: APBJJlHIdF/3T/gQQ+bd6W2XbSL8uQbLS/LxLdzC4zFfYgiW9mqnExdmmcDKrtSNj4mIgsI/TUMtVQ==
X-Received: by 2002:a1c:ed11:0:b0:3fa:9939:47c with SMTP id l17-20020a1ced11000000b003fa9939047cmr4215009wmh.37.1689766470758;
        Wed, 19 Jul 2023 04:34:30 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.201.220])
        by smtp.gmail.com with ESMTPSA id l14-20020a1c790e000000b003fbd04ecdc6sm1485607wme.5.2023.07.19.04.34.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jul 2023 04:34:30 -0700 (PDT)
Message-ID: <f05a7376-6a88-e502-28fe-353db59f61f7@linaro.org>
Date:   Wed, 19 Jul 2023 13:34:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH 1/3] MIPS: Fix CONFIG_CPU_DADDI_WORKAROUNDS
 `modules_install' regression
Content-Language: en-US
To:     "Maciej W. Rozycki" <macro@orcam.me.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Jan-Benedict Glaw <jbglaw@lug-owl.de>,
        Guillaume Tucker <guillaume.tucker@collabora.com>,
        Huacai Chen <chenhuacai@loongson.cn>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
References: <alpine.DEB.2.21.2307180025120.62448@angie.orcam.me.uk>
 <alpine.DEB.2.21.2307181353110.61566@angie.orcam.me.uk>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <alpine.DEB.2.21.2307181353110.61566@angie.orcam.me.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 18/7/23 16:37, Maciej W. Rozycki wrote:
> Remove a build-time check for the presence of the GCC `-msym32' option.
> This option has been there since GCC 4.1.0, which is below the minimum
> required as at commit 805b2e1d427a ("kbuild: include Makefile.compiler
> only when compiler is needed"), when an error message:
> 
> arch/mips/Makefile:306: *** CONFIG_CPU_DADDI_WORKAROUNDS unsupported without -msym32.  Stop.
> 
> started to trigger for the `modules_install' target with configurations
> such as `decstation_64_defconfig' that set CONFIG_CPU_DADDI_WORKAROUNDS,
> because said commit has made `cc-option-yn' an undefined function for
> non-build targets.
> 
> Reported-by: Jan-Benedict Glaw <jbglaw@lug-owl.de>
> Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
> Fixes: 805b2e1d427a ("kbuild: include Makefile.compiler only when compiler is needed")
> Cc: stable@vger.kernel.org # v5.13+
> ---
>   arch/mips/Makefile |    4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

