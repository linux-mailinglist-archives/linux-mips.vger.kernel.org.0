Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE0F361358F
	for <lists+linux-mips@lfdr.de>; Mon, 31 Oct 2022 13:15:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231247AbiJaMPu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 31 Oct 2022 08:15:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231330AbiJaMPd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 31 Oct 2022 08:15:33 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71B45F039
        for <linux-mips@vger.kernel.org>; Mon, 31 Oct 2022 05:15:26 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id k8so15723239wrh.1
        for <linux-mips@vger.kernel.org>; Mon, 31 Oct 2022 05:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z/xC60NFpQ8YiUuB73hd07wpqDOiKDqftBq/Nx+H0pc=;
        b=fLMYr0IzN+j5ZLN9mtXN9uJJUIP49EtbGy0L7BzxzxfAv7ClE9S7ZiGhCYhG6RPvYS
         htxa6rB78K9oCKyQTQNcRoEXElyZ1cZOPhd/2o13OoQ0/mnCcnz86/FhIpNG15qn/nQg
         UFa/4+D/jb/CriyhNedgnsEdC/fOQD67VnQrAE4J5NKGxyt8CIHVeh0WzZMmnLOTmJjX
         9nU/9K0FjtdkXyBVRfDoxHtHylhk0a0MBFLPW61c/GtbYz0TgvxNBuuuKIWdF9Sge3qd
         sb10Re26rBwv0wbHI34qqn85oGxXjHJCTZldYN0hfAauukeSWGW5g5/bU4I7XiX5MbvD
         ktlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z/xC60NFpQ8YiUuB73hd07wpqDOiKDqftBq/Nx+H0pc=;
        b=6MP5budBNML8LTzO3M3AAJu0wTxofDpZpRs0S0TXo4gJuJiJE4RgqklNIkRPT7TJ0o
         jxjgCgyCWM1SkPVvR3xg498SDIYXQ8JwLD/mbm6I59whcJFbAS8jNBCR0yYvROwsq5Si
         ZME3mINGsc9K5pQ8CVMfKWk+3BVVKhDN/aAMHRdt3JMCZSt/PIVN5K3mfl6eM9rg1MK9
         5ivkE1FrO4aIJDGPgJyjXpvL2jN944nflCevs9EkR0B9mNl9rRePkPEtuYxTg5xFrzXZ
         B7K4rc2+7NbI2UJz+ycAxCbnXlZ/G76xzv0B2vM5hchE2KqIZkKMuKY/l7SlHlQrevFQ
         7TSw==
X-Gm-Message-State: ACrzQf0GmVSJc0VP+EDvU1YXcLKzl5FWDLERGGm5Bz4ajnLGGOH08ytP
        emT+I2IVECCzqf2Jv1hxaCE8RopGLGLxGQ==
X-Google-Smtp-Source: AMsMyM4Papbz7gmenhcGeWRLHNTGBU6j8IWT5TkhsU5QNi/FZqmEM15BTTwaCqYZhCnykGo8Tpdl/g==
X-Received: by 2002:adf:9c87:0:b0:232:a0fb:ea5f with SMTP id d7-20020adf9c87000000b00232a0fbea5fmr7895835wre.473.1667218525020;
        Mon, 31 Oct 2022 05:15:25 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id bl19-20020adfe253000000b00236576c8eddsm7006730wrb.12.2022.10.31.05.15.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Oct 2022 05:15:24 -0700 (PDT)
Message-ID: <6f976e6b-9e00-f6ce-fb95-7b7a21183b5d@linaro.org>
Date:   Mon, 31 Oct 2022 13:15:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH] mips: boot/compressed: use __NO_FORITFY
Content-Language: en-US
To:     John Thomson <git@johnthomson.fastmail.com.au>,
        tsbogend@alpha.franken.de, keescook@chromium.org
Cc:     linux-mips@vger.kernel.org, linux-hardening@vger.kernel.org,
        kernel test robot <lkp@intel.com>
References: <20221030183647.3371915-1-git@johnthomson.fastmail.com.au>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221030183647.3371915-1-git@johnthomson.fastmail.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 30/10/22 19:36, John Thomson wrote:
> In the mips CONFIG_SYS_SUPPORTS_ZBOOT kernel, fix the compile error
> when using CONFIG_FORTIFY_SOURCE=y
> 
> LD      vmlinuz
> mipsel-openwrt-linux-musl-ld: arch/mips/boot/compressed/decompress.o: in
> function `decompress_kernel':
> ./include/linux/decompress/mm.h:(.text.decompress_kernel+0x177c):
> undefined reference to `warn_slowpath_fmt'
> 
> kernel test robot helped identify this as related to fortify. The error
> appeared with commit 54d9469bc515 ("fortify: Add run-time WARN for
> cross-field memcpy()")
> Link: https://lore.kernel.org/r/202209161144.x9xSqNQZ-lkp@intel.com/
> 
> Resolve this in the same style as commit cfecea6ead5f ("lib/string:
> Move helper functions out of string.c")
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: 54d9469bc515 ("fortify: Add run-time WARN for cross-field memcpy()")
> Signed-off-by: John Thomson <git@johnthomson.fastmail.com.au>
> ---
> not sure about the fixes tag:
> compile error only occurs due to the fortify commit, but it looks like
> this change could have been part of the other commit identified in the
> message: lib/string move helper functions?
> ---
>   arch/mips/boot/compressed/decompress.c | 1 +
>   1 file changed, 1 insertion(+)

Typo "__NO_FORTIFY" in subject.

