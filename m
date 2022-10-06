Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FBF25F6534
	for <lists+linux-mips@lfdr.de>; Thu,  6 Oct 2022 13:28:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231313AbiJFL21 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 6 Oct 2022 07:28:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229729AbiJFL20 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 6 Oct 2022 07:28:26 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64EFE9C7FE
        for <linux-mips@vger.kernel.org>; Thu,  6 Oct 2022 04:28:25 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id c24so1423567pls.9
        for <linux-mips@vger.kernel.org>; Thu, 06 Oct 2022 04:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fungible.com; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pmVwP88BbyiccxwgFsL5G+0jWvM/e0TmyMG64Wo7BA8=;
        b=NJokJKPnOKKKA9kH8j2MszCemK9PRZ9JjSwT4Mxs6rD4eH/Bk8qbNj76qigyS5a0Mw
         IY6rRh0xEQno+rG5LZn+ZjWV118yaMdXNXcKBvrWhKarWFSQgdl1S02V4yukMO8u8i4H
         Sz/SdFPQPeJj8epYAz+mTXTDjy4T2PqZmmblU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pmVwP88BbyiccxwgFsL5G+0jWvM/e0TmyMG64Wo7BA8=;
        b=dhIVctEQfMCkZDLzMFT8xtyxVJduPZE3pV72yyro7rkejAtPnSVf4RLGG3kdV8TE2M
         jpLGFMpTPn1H6HIpHD9bEgBZK8NuFOtyJ99Jsd/buPuZl8m/GoXhFhF7FzW2CxpZGoYG
         tG3S1E9/E5kFW0F3ug0FLBtqTvMXYLJFElzoGu1b0w573SrxVaY9A3QzGxgLQOcql/OV
         O5aSOcVj1wLl5JYq0SrYJzF5z/M5ZVC0N/Xf3aO6WbA1aqkhxDyHlO3S6zE7b0eR3ePL
         WQEs+2ilMGFE6TXxRpercKAqiGjWoQzjhoSyJjhON6o6hQl6zZckUQzQ9IHV6igQ239p
         qPkg==
X-Gm-Message-State: ACrzQf1mqcAtbc8PoF9e+WEd82TRYjClXY0dMDNvrqbjHQezv65fETng
        qrjBy5YY9MdM4LmFrGbJy2mXSg==
X-Google-Smtp-Source: AMsMyM75rzBUhNZIb4F7OWBd8+uwbeCMt+G+fE3jM1Np586733YCJGLszAceyj1VLJ2/MqkBnQddiw==
X-Received: by 2002:a17:90b:17c4:b0:20a:7f07:d878 with SMTP id me4-20020a17090b17c400b0020a7f07d878mr10274547pjb.7.1665055704968;
        Thu, 06 Oct 2022 04:28:24 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id a16-20020aa78e90000000b005385e2e86eesm4816584pfr.18.2022.10.06.04.28.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Oct 2022 04:28:24 -0700 (PDT)
Message-ID: <e1a64ab1-1e6f-0551-9bb4-7866c422fb81@fungible.com>
Date:   Thu, 6 Oct 2022 13:28:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH] mips: allow firmware to pass RNG seed to kernel
Content-Language: en-US
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20220930140138.575751-1-Jason@zx2c4.com>
 <CAAdtpL5BQA-y-N0Bc--KbfT9WXok0kNQ17YuF1Yyjg13DHLtgQ@mail.gmail.com>
 <CAHmME9pbVUxTJrF-2XRHsz07P127TyvEWbDL38hi2YdRry+pAQ@mail.gmail.com>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@fungible.com>
In-Reply-To: <CAHmME9pbVUxTJrF-2XRHsz07P127TyvEWbDL38hi2YdRry+pAQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 4/10/22 00:30, Jason A. Donenfeld wrote:
> Hi Philippe,
> 
> On Tue, Oct 4, 2022 at 12:07 AM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>> +       add_bootloader_randomness(rng_seed, len);
>>
>> So we call char/random code with len=0. Is it safe?
>> Maybe simply safer to check len before calling hex2bin?
> 
> add_bootloader_randomness() is safe for all input sizes, and is
> written to be callable with len=0 and have no effect. So this function
> should be good as-is; there's no need to special case an unlikely
> instance that's already handled by add_bootloader_randomness().

OK, thanks for the clarification.

Phil.
