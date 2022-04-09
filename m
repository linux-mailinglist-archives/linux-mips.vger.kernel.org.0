Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13B394FA874
	for <lists+linux-mips@lfdr.de>; Sat,  9 Apr 2022 15:28:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242046AbiDINaV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 9 Apr 2022 09:30:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234369AbiDINaQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 9 Apr 2022 09:30:16 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AD41A1B1
        for <linux-mips@vger.kernel.org>; Sat,  9 Apr 2022 06:28:09 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id n6so22225278ejc.13
        for <linux-mips@vger.kernel.org>; Sat, 09 Apr 2022 06:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=WfUSXlXrMXR33ODc/54LO2tDQwXt6HKIL4RTuhmRewY=;
        b=JCPkCyGCqp3BPrWxH7ovgeBbLYdi1tscFVS7xVKDVZlj7/NnSTs7WL5yT7RQtUIIzo
         LsKcQj2cjcmJJNW6pV79TrPQ4t2C9084Kb36I4Hc/YcF44ZlGbZBEW2I6j0S12k9Wqzd
         XOqfFDR9tWjlV+6xrxtfK3NJw9DfBradQBCYXyzVbVhG+obEE1HcWWz7Xl6Q23azCSd8
         C1xpqI2ey4Z7MbHDvnQ0Q2GPdiPkkwULfQmErk6utUb8oINrUvnA3/cqFrCnOHxBMxXg
         3IYNTe6nWOpIHJ+blYZ4h+YCkswD7v3nFsG2QuSunT+DONqwH0fQipjh8xbdqF7yQMpU
         T4MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=WfUSXlXrMXR33ODc/54LO2tDQwXt6HKIL4RTuhmRewY=;
        b=uHi02SPONbvcrLrFtEGYG2TLNhccyGJbU73We2IqTyb5GXSPFchl+pKhMS4gWZZ/qC
         E+o5qd6zIL2L7gJA4vIT6vLTasufeOCUB2sFZ1mR9EA6Jb9I9v6dzwaM4F6Wg/Q+GvAm
         mJWLNqzG20QArtxjfMiB5UAFBkE/C0E73FYZ1vdt2myUNceuRC+3aNE/D1Fay5yj3vKx
         PI5XAMO1L0r6JoUjAFG4nANT2XEIk6vRxTTat5EGY1UCUgN7Dld3ZuX4XARvaBwa4WgD
         PCAEkCbIP1p0CDKF0/ClAMFnem1RTme8EhizVeE8VJF11tL3fohBzwfQBQaKqSrq/zkS
         IqWA==
X-Gm-Message-State: AOAM531hPRwUuh2CELuvRmgzdDGzhWPF34W5B0yVgcTKiz12PfzLtFvd
        yRpDtg3JU7cJqCwEXOB8/wfg8eoUQ1q2nYOZ
X-Google-Smtp-Source: ABdhPJzyu7DiTTQlw3nnSyPL0gMP7uVYvQ5deCqIFbrL6SGeB7jQY9o4HWRld6WxiWhvTxPLaVU7MQ==
X-Received: by 2002:a17:907:2d9f:b0:6e8:58d9:8c4 with SMTP id gt31-20020a1709072d9f00b006e858d908c4mr6632748ejc.386.1649510887756;
        Sat, 09 Apr 2022 06:28:07 -0700 (PDT)
Received: from [192.168.0.188] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id cb7-20020a170906a44700b006e879b4ba2dsm287759ejb.56.2022.04.09.06.28.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Apr 2022 06:28:07 -0700 (PDT)
Message-ID: <59eded10-699e-299a-a462-530c2e789151@linaro.org>
Date:   Sat, 9 Apr 2022 15:28:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 10/18] MIPS: DTS: jz4780: fix uart dmas as reported by
 dtbscheck
Content-Language: en-US
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, letux-kernel@openphoenux.org
References: <cover.1649443080.git.hns@goldelico.com>
 <00ec9d965cac78b252e14444deed8c93f5116bca.1649443080.git.hns@goldelico.com>
 <a7a46736-e917-7274-1593-147ed36a2a68@linaro.org>
 <86044652-7B23-4F4D-B60F-C413F3C7BEF1@goldelico.com>
 <79dd8425-947d-603c-ebab-0625921551d8@linaro.org>
 <5F7268BB-CCF3-4F01-ABB9-D5C3319F31F1@goldelico.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <5F7268BB-CCF3-4F01-ABB9-D5C3319F31F1@goldelico.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 09/04/2022 15:26, H. Nikolaus Schaller wrote:
>>
>> Which does not make sense and there is no need... Automation does it
>> (see Rob's tools). Don't make human life more difficult...
> 
> Ok, you are right. If you apply this patch and then run dtbscheck again, there would be
> a warning left over.
> 
> But may I honestly ask why you review the commits and read the commit message at all?
> You could simply ignore it... And it would be easier for both of us to leave it completely
> to Rob's tools :)
>

I am not reading it. :) It takes more effort to scroll to the actual
contents.

Best regards,
Krzysztof
