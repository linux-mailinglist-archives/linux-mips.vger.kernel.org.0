Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C919F6416CF
	for <lists+linux-mips@lfdr.de>; Sat,  3 Dec 2022 14:11:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229680AbiLCNLe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 3 Dec 2022 08:11:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229636AbiLCNLd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 3 Dec 2022 08:11:33 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF3702CCAA
        for <linux-mips@vger.kernel.org>; Sat,  3 Dec 2022 05:11:32 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id m19so5429603wms.5
        for <linux-mips@vger.kernel.org>; Sat, 03 Dec 2022 05:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=npJnN6h9Q1vkDWhzJn+eWtMO9lMJ3i+il671VPKzft8=;
        b=kkyhtYOkb8JJ9PTlhEl3vswFzXtG8qi7dbwyb9d0fyeJNUC+hCgjqUZZF6tGqB2+cA
         1oXJ+IUpnp4v9t+3Lp7g4bNU5x+XdXUP371EygIbxWoLBRY/Dz91RrYADymCxQPsB6M/
         mYILVcHCQUYdg4IFxve1XvvOrl0KwpEqxgQ3NaAjMz1yz1MHh7+q62x717XUpW2/p0Bj
         BlyAF0l7bUMsrBV/tl/riY4hdNc2ED/jvDjO22EMuvndKr101algb2o9zMKo+63TPCsH
         SlzldirVLVoLIgmOHthXc5HAYxN6ycMUE6llK8IYWg8Dclg8nRXOBdCs4o6ULprrKNme
         +buQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=npJnN6h9Q1vkDWhzJn+eWtMO9lMJ3i+il671VPKzft8=;
        b=FcgyJyceeQZIRLp6y4XrvXWYbcTavQbCR/GEpAkdrcP+/Xhon80taNM6LVGu8arCdd
         EGKCV4JQkH/yrUoeDwDNyex9RWvHQSrk3h1YhXVWHeZUnh6z9lfDC9g1dte3+ZDjZRRd
         8QyE01klLZQg7hY74x+lFYevQj0SkIC5ZyOxviDtt4TfRo8PbabiiYMWlhkppewPZDoi
         ZUsruQoeRT5MdZVfk5i9IA7oM6vFOYzYH5nd6t9emPlnXbiDzZSU/CzMGaWjtgU/rmML
         mcRHREUhxofoETPk/9B5ao/KRImx4GHPSwhXhcjbwptgHSXJye9vzD397B13qytBDKv0
         pTig==
X-Gm-Message-State: ANoB5pnXdeQvRpnPtZtBzzmwjx2JKFePqWe9Jj6hCoBhMP8b8X3yW+dI
        lZ9mOQIDB5Pwgse2s32sV/2IOg==
X-Google-Smtp-Source: AA0mqf4SwLUdwBkT7R6VcWBwZXnTuUyLGfcW9SuFCRA3hcEBz2wgzyQAl0WtUX5XWCZx148vV2MJgg==
X-Received: by 2002:a05:600c:3c95:b0:3cf:92cc:9e5f with SMTP id bg21-20020a05600c3c9500b003cf92cc9e5fmr54559878wmb.181.1670073091300;
        Sat, 03 Dec 2022 05:11:31 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id az23-20020adfe197000000b002425504ae7dsm1269413wrb.80.2022.12.03.05.11.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Dec 2022 05:11:30 -0800 (PST)
Message-ID: <0ec82628-4eb8-239c-9bee-d55525a65535@linaro.org>
Date:   Sat, 3 Dec 2022 14:11:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH linux-next] MIPS: OCTEON: cvmx-bootmem: use strscpy() to
 instead of strncpy()
Content-Language: en-US
To:     yang.yang29@zte.com.cn, tsbogend@alpha.franken.de
Cc:     julia.lawall@inria.fr, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, xu.panda@zte.com.cn
References: <202212031417162803709@zte.com.cn>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <202212031417162803709@zte.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 3/12/22 07:17, yang.yang29@zte.com.cn wrote:
> From: Xu Panda <xu.panda@zte.com.cn>
> 
> The implementation of strscpy() is more robust and safer.
> 
> Signed-off-by: Xu Panda <xu.panda@zte.com.cn>
> Signed-off-by: Yang Yang <yang.yang29@zte.com>
> ---
>   arch/mips/cavium-octeon/executive/cvmx-bootmem.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

