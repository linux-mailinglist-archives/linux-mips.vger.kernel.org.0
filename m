Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 178F66A6951
	for <lists+linux-mips@lfdr.de>; Wed,  1 Mar 2023 10:02:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229553AbjCAJC2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 1 Mar 2023 04:02:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229769AbjCAJC1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 1 Mar 2023 04:02:27 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75BE82B29C
        for <linux-mips@vger.kernel.org>; Wed,  1 Mar 2023 01:02:26 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id t15so12422018wrz.7
        for <linux-mips@vger.kernel.org>; Wed, 01 Mar 2023 01:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677661345;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ekZ4DgBz/58XVt2GqkwjhmN0aRNTOhzU+bBWwyMlb+U=;
        b=c1OWNeMO84VA6eVvCvNVbpXjP6fzotm0PAwX14XvWBKtB8g4wkaOcsPZOrvjO4JxwZ
         lUUoCvQM0Cc3yHwsZk0Hra3f2p7KxFtxsj6R24OQ/13UTrYg7pJP0/i+bx9FQbWDmFSB
         RHY2dRtPQBugNAIuHeJt46/msPZZ4t+GqGFqzIwXXLpNtfteIIcKosMy5102QCm/QBv2
         O0WxUsv3NvNx5mAUBAhFAh1WfHe5y8SS3lw1rzaRyxxqD5rUvFp5eCyj18upgwjGbRkP
         4wDTckzz9WSvg+T94CRo20T74jiGkZaGTN2hX0BJaItILIfpEu7pXqYU605nNX5yFuLD
         2pEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677661345;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ekZ4DgBz/58XVt2GqkwjhmN0aRNTOhzU+bBWwyMlb+U=;
        b=R/gnM3HYrMhSwd2i7WPeUfO67V7frjK/wktlrH4sJel5G5GgGVV1CLDqwmg/1h8Ssg
         4BOrZ3E315bfGmRC9JQh4RJ27NDwaHGouPO2p0254gtwFJ4qZ+qaH/6VO+bgctdXx1N+
         0fqu+QkqWsV0aaq9yOR4ipUUwOfZaq9oT72IeeHmW7ou8Lavx0ijrOa1z6WL+vY8Nz46
         4i6afpZA+OfS0pSC02vU+jsGAg7F26qaADnsBQalQ1G45PIw1HVdAbaDJ99oROs2ECQ2
         rOCxAjzpxd7uTUAqj5zDp7Xoqwoeq4RAXy4JIaCjQxPaCsbnVFZbvH43Z+Ea4zlKw0WF
         DYvg==
X-Gm-Message-State: AO0yUKXiQsvL3WIRvS6/LjUdzUaErsLMKgyd6uyucv6eEbBVQAGchoHp
        yC5KvovM6YcvH+5RIkoQ6Z1Kaw==
X-Google-Smtp-Source: AK7set+NsBzCNYKPvWP7ij2i03S5Y3cTBtF/dYzRY0sFngDo55yw34iZwfYt8/GBdtP6Au6jnsondA==
X-Received: by 2002:a5d:5967:0:b0:2c7:17db:bf5c with SMTP id e39-20020a5d5967000000b002c717dbbf5cmr4109821wri.25.1677661344971;
        Wed, 01 Mar 2023 01:02:24 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id ja13-20020a05600c556d00b003eb596cbc54sm1168581wmb.0.2023.03.01.01.02.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Mar 2023 01:02:24 -0800 (PST)
Message-ID: <af50f94a-467e-5367-584c-62a3241ae060@linaro.org>
Date:   Wed, 1 Mar 2023 10:02:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3] MIPS: Workaround clang inline compat branch issue
Content-Language: en-US
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, nathan@kernel.org, llvm@lists.linux.dev
References: <20230228193459.15365-1-jiaxun.yang@flygoat.com>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230228193459.15365-1-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 28/2/23 20:34, Jiaxun Yang wrote:
> Clang is unable to handle the situation that a chunk of inline
> assembly ends with a compat branch instruction and then compiler
> generates another control transfer instruction immediately after
> this compat branch. The later instruction will end up in forbidden
> slot and cause exception.
> 
> Workaround by add a option to control the use of compact branch.
> Currently it's selected by CC_IS_CLANG and hopefully we can change
> it to a version check in future if clang manages to fix it.
> 
> Fix boot on boston board.
> 
> Link: https://github.com/llvm/llvm-project/issues/61045
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Acked-by: Nathan Chancellor <nathan@kernel.org>
> ---
> v2: Add Link tag to LLVM bug
> v3: Docuement issue link in Kconfig as well
> ---
>   arch/mips/Kconfig           | 4 ++++
>   arch/mips/include/asm/asm.h | 2 +-
>   2 files changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

