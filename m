Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D54957619E5
	for <lists+linux-mips@lfdr.de>; Tue, 25 Jul 2023 15:26:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230315AbjGYN0t (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 25 Jul 2023 09:26:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230316AbjGYN0r (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 25 Jul 2023 09:26:47 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E3C41BC2
        for <linux-mips@vger.kernel.org>; Tue, 25 Jul 2023 06:26:42 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3fbc59de0e2so46563825e9.3
        for <linux-mips@vger.kernel.org>; Tue, 25 Jul 2023 06:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690291600; x=1690896400;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sohdea9KJoSOqyVVvykUQquJ+txNA8sQVTw6IM0tbbI=;
        b=DjCY8xAxoFhRhfqHJ11qHQwtNTVgYrOIDINAVVv+VZaDGh7HZaLISjLqHtwAFRW7zO
         Jom1E7jqKmBSWIOicBFiVw1axSo7PNnsZh32rQ5s4vOerRt06B/tXXEjJA/YxwKwkzhI
         fTzYbXf0ThLmQqZ+EVT8nbTy6+PC+qKhXTBftZaBQ8/h8upzJQcVaTJF/wXKdePxAsRB
         M9S7FBeJH67eJWdcCNVHONn+FseEFW0jVNRz4XC3MIzBtOl0CNEqlgPO4mbdTfvuqOE9
         +A4gsjn0D1dyZSrsuaZOh8VA5As3DC2rp6O44XpjKQ/IQlotPGY1GhH6FSrg6sJHRx3F
         Jdxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690291600; x=1690896400;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sohdea9KJoSOqyVVvykUQquJ+txNA8sQVTw6IM0tbbI=;
        b=ci1T5RxpkWKaAF4PUQck91SZE0OSAr9zOE9wpg+frJ7NKrWpZauvpLXGdDMED39oBI
         DD7lmU4YGkXTyXMSvkJO4Z87vcXrL7LgnZK69ScIGzhB+QNXI8FI+ayg70yPqeQ2OQbd
         rz05KoTODvKhpQUwDXd3Y9I7diNVs47yLjWA83xvPt97jeXTwwGMGn8OYFlS38WS/J0M
         rZ2jVX1S4wU/Sy90+K7mpY4RjbM5W277Q+dFidLHuoLsTFZc3VHdywfs08Aw94lSxjnt
         XM9saVe5eba0/QgjaVhmgLVPFidY6XT6zLMBfaZZST8bulPpMHf5uHaNBBHwYLr7hogj
         wf7g==
X-Gm-Message-State: ABy/qLZucBQx63CQOCR00PumySZO2kdyTsqiFfFjkB0xCYEO/Zakp/qS
        2zzeKMcxY6q7w6eSYbvucrt6jA==
X-Google-Smtp-Source: APBJJlG8BJSzzIo2Yij5qOtXiOvireLsqonHDc68f7QTB8F6IVYj1NTBtdEmNub316rnS7UO4qY0pg==
X-Received: by 2002:a5d:6051:0:b0:317:6314:96e2 with SMTP id j17-20020a5d6051000000b00317631496e2mr3439624wrt.14.1690291600681;
        Tue, 25 Jul 2023 06:26:40 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.203.142])
        by smtp.gmail.com with ESMTPSA id n8-20020adfe348000000b00315af025098sm16472754wrj.46.2023.07.25.06.26.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jul 2023 06:26:40 -0700 (PDT)
Message-ID: <bc8989c4-fde7-bec4-b255-d54630f54798@linaro.org>
Date:   Tue, 25 Jul 2023 15:26:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v2] MIPS: Loongson64: Fix more __iomem attributes
Content-Language: en-US
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, chenhuacai@kernel.org,
        kernel test robot <lkp@intel.com>
References: <20230725060144.1501195-1-jiaxun.yang@flygoat.com>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230725060144.1501195-1-jiaxun.yang@flygoat.com>
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

On 25/7/23 08:01, Jiaxun Yang wrote:
> There are some __iomem type casting being missed in previous patch.
> Fix them here.
> 
> Fixes: 5bd3990723bd ("MIPS: Loongson64: Prefix ipi register address pointers with __iomem")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202307020639.QCZOKp8B-lkp@intel.com/
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
> v2: Drop invalid attribute for play_dead pointers
> ---
>   arch/mips/loongson64/smp.c | 160 ++++++++++++++++++-------------------
>   1 file changed, 80 insertions(+), 80 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

