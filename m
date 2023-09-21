Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3063A7AA01B
	for <lists+linux-mips@lfdr.de>; Thu, 21 Sep 2023 22:32:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230347AbjIUUco (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 21 Sep 2023 16:32:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231895AbjIUUcU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 21 Sep 2023 16:32:20 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD80079F32
        for <linux-mips@vger.kernel.org>; Thu, 21 Sep 2023 10:36:49 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-52f3ba561d9so2612726a12.1
        for <linux-mips@vger.kernel.org>; Thu, 21 Sep 2023 10:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695317808; x=1695922608; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BdRKt7DZk+jjVJa9+TmUISsmxBaFaLipfQVb6i5Sv3Q=;
        b=LMxmhBgvI0vPz7dgF+POE3Fgucdx/gG/aFiZE/sz+1LvkSHvG6rxmNfKMb38QcNyMA
         8SBm+7JeWXWJRXJz0lnFEBOg2TxXvzl0SVVHodJ8nvpQ47yd6MALFbhrcyBFaZ4tn3vd
         caVc9t0zxiWvV1sBOGNXN8Yy9guVJZxf09CFHo3ItSFY5O0ANSBl2njSvMs7GI8RcJkL
         1tAa/ctU9jOByWBGKJFOYFF/hBpZ7SyYkuNlPpZ73Lg4fjY1uImSKaYP5n/pNYKShOft
         rf/7Y/pmc1X0qDHuU4T4RENsY239+TI06vY/pL+knBFp7pRWLGvJ9BmwL1s/lKdjwiao
         umjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695317808; x=1695922608;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BdRKt7DZk+jjVJa9+TmUISsmxBaFaLipfQVb6i5Sv3Q=;
        b=CGWVjvEj6tKH1ITsHbUdXomczGMzOPphGQsbqFZxaxm5m1ERt30TWqrRv2kOGlxAdI
         Oi7MGdA5HYdumGFTy1E75jVVty2WXV3KsSsffmrstiKQRA/5uJU9Zbynr8hA/qIJAuDz
         1nKqiZryqLZT1KsmMI75ueNfEhti11Bjv1QWfei6l+VMXoDNOqVd71zpo5int7/ZdS1Z
         3+o+MUULziUUUdrgRodZpk8oFUKCjUxx3SOvz72ZDaj0Iv1L+41BOPc//i9C4pSnJnyD
         AcX7n5Oofcsp9COQiME22lYZ/4vy07wjQr1JGQ8ndWR4I1lukwtFfw3+8HLyUiJbLtjU
         mTNg==
X-Gm-Message-State: AOJu0YzJhYJ32FmoQ3R6k/XVkhpDyEsvHo0aQ7RdjofF510913A7DR8a
        q8Z7Dg2VKO1uc+lXKeDmpyeesulDGt9UiPaQnZc=
X-Google-Smtp-Source: AGHT+IEpwsRPhWLHd8PAT2dNP1MXglwufqkS9mIHN4cKFywtNIagh0BRbKUXzIfYEo4aQy+U7dfSAQ==
X-Received: by 2002:a17:907:d690:b0:9ad:8a96:ad55 with SMTP id wf16-20020a170907d69000b009ad8a96ad55mr10998951ejc.14.1695299572903;
        Thu, 21 Sep 2023 05:32:52 -0700 (PDT)
Received: from [172.20.41.70] (static-212-193-78-212.thenetworkfactory.nl. [212.78.193.212])
        by smtp.gmail.com with ESMTPSA id x18-20020a1709065ad200b0097073f1ed84sm991732ejs.4.2023.09.21.05.32.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Sep 2023 05:32:52 -0700 (PDT)
Message-ID: <5a2ee8c1-6058-ee65-7959-d191c075748e@linaro.org>
Date:   Thu, 21 Sep 2023 14:32:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 3/6] vlynq: remove bus driver
Content-Language: en-US
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mips@vger.kernel.org, Jonas Gorski <jonas.gorski@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
References: <20230920201035.3445-1-wsa+renesas@sang-engineering.com>
 <20230920201035.3445-4-wsa+renesas@sang-engineering.com>
 <30279c62-c80b-330f-260f-0c64a7893555@linaro.org> <ZQwxwUm3HbqqwEzb@shikoro>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <ZQwxwUm3HbqqwEzb@shikoro>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 21/9/23 14:06, Wolfram Sang wrote:
> On Thu, Sep 21, 2023 at 12:37:54PM +0200, Philippe Mathieu-Daudé wrote:
>> On 20/9/23 22:10, Wolfram Sang wrote:
>>> There are no users with a vlynq_driver in the Kernel tree. Also, only
>>> the AR7 platform ever initialized a VLYNQ bus, but AR7 is going to be
>>> removed from the Kernel. OpenWRT had some out-of-tree drivers which they
>>> probably intended to upport, but AR7 devices are even there not
>>
>> Typo "support".
> 
> "support" would also fit, but we use the term "upporting" frequently to
> express that we want to bring some code from downstream to upstream.

Oh I see, thanks, TIL :)

