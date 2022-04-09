Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3CB74FA86F
	for <lists+linux-mips@lfdr.de>; Sat,  9 Apr 2022 15:27:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241966AbiDIN3F (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 9 Apr 2022 09:29:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242216AbiDIN2C (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 9 Apr 2022 09:28:02 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91463BF534
        for <linux-mips@vger.kernel.org>; Sat,  9 Apr 2022 06:24:52 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id t25so289923edt.9
        for <linux-mips@vger.kernel.org>; Sat, 09 Apr 2022 06:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=fDcvYkIEVq0f5BjuAYxIIri1A/cHLRrOx9YyUXqMPAI=;
        b=UawB3WzU+FxwrZ0kFUke+Bm5I2fHVYUC0ogGFxCbj94TVJljWRaz0NDT5A7zTtAUZP
         fw8JHjOxm0qDf1SFRI97P2JQv88wFOu2m9eUaHnYpkfvpZ25Rvb4FAMqI14CNSdAjI0q
         MchM+RmS9n5ye2oDsJq58sV+qzk6fsAb7jzr2e4SvyCyBgoCRj4qEEcZZJWfJkv24jHM
         RLCIy70bXWocIqk0Ww1n3bzsMfnl5U3iEJa6RmO6EmtvJN+P+HdPPAewAKhfBkB9OdPi
         ypoMSsTJBzRCut4Tt2V/nUtglORaWD2g+yPw4BTVrKPG/Ir3Rfaxnpm309KIsB8iHEza
         yEDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=fDcvYkIEVq0f5BjuAYxIIri1A/cHLRrOx9YyUXqMPAI=;
        b=FOh6bLqlg0QEphOcDWruN3ZLEgw4V3o1zTx+x/qck32587cJWPXgEF7CxwRrWuUkce
         iwptjLugkAiMTUhwqDZJUPMaQOm705mwA22SSI95Kze4woISXx/3cEvACq+XFgmiS4bo
         gtDL95t4XcQkH6pKWBVHltmoTf02x3uaxZYo/0SY5WTVioGUuQlgWXtLENPI65as16LD
         RsCgTUY8qqzFKT23ejCpg+rAqFvN4MCjlEQWMkk5l31LRZPd8OJ4ksTYeT1nI/xYgNzY
         yFljlIYDZLCr0ALQQ+A4S9fj403tRIMFndti3JicmbWWKJ3Wn24qS3aZlaADZkt7EUcV
         qU8g==
X-Gm-Message-State: AOAM5335sXUxBC+1Cs+tY1fNGs+wgc/GtWs3zQv8aFPUlSSplthzWu23
        AmVdMKmhrk2xmZQguuVGxyEYOg==
X-Google-Smtp-Source: ABdhPJw6YN/NpLXgV8emVgfWbE/XMoacETKHzCEKKobJ+5XMQwN9fvrsU3zZ93bJ71gUMnzQUAZ8xg==
X-Received: by 2002:a50:8d09:0:b0:41c:b898:19a6 with SMTP id s9-20020a508d09000000b0041cb89819a6mr24551282eds.30.1649510690712;
        Sat, 09 Apr 2022 06:24:50 -0700 (PDT)
Received: from [192.168.0.188] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id m20-20020a170906235400b006e718d8b849sm7846661eja.45.2022.04.09.06.24.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Apr 2022 06:24:50 -0700 (PDT)
Message-ID: <f40e1a00-be4d-11c7-6a7c-6b50635a2960@linaro.org>
Date:   Sat, 9 Apr 2022 15:24:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 05/18] MIPS: DTS: jz4780: fix pinctrl as reported by
 dtbscheck
Content-Language: en-US
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, letux-kernel@openphoenux.org
References: <cover.1649443080.git.hns@goldelico.com>
 <1941bc4ed553b27f399ad00ea61ff2b0237d14e3.1649443080.git.hns@goldelico.com>
 <e905896e-335d-a88a-1961-d17b92e46585@linaro.org>
 <530E0F7F-FC03-45DD-BF87-D049D3108AD3@goldelico.com>
 <c84b5ec0-0193-ab62-1985-25bc2baa9f05@linaro.org>
 <B5EB5983-DA9F-4631-B737-2B1417CF9054@goldelico.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <B5EB5983-DA9F-4631-B737-2B1417CF9054@goldelico.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 09/04/2022 15:22, H. Nikolaus Schaller wrote:
>>
>> What does that mean? One cannot create multiple patches and apply them?
> 
> This patch set was created by some automatic scripts. And they produce one patch
> per group of warnings.
> 
> But here you ask me to merge 4 unrelated topics into a single one.
> 
> Or do you mean something else?

You can edit a commit, right? git commit --amend? So where is the problem?

> 
>>
>>> And they are not related. Every one is based on a different .yaml
>>> schema file.
>>
>> Which does not matter, because the name of the node does not matter. We
>> enforce it in schema to makes things organized and easier in testing.
>> This does not fix any real problem, just the problem we created by
>> ourselves with schema.
>>
>>>
>>> That in all cases the result looks similar comes from similar
>>> requirements by the schemata and has no inherent connection.
>>
>> All schemas will require it, won't they? The same for arm...
> 
> We may be talking about different things here.
> 
> My understanding:
> you ask me to merge 5/18, 8/18, 9/18, 12/18 because they contain "controller" in the node-name.
> 
> Right? If not then we must clarify that first.

No. I ask you to fix all pin-controller cases, for entire MIPS, not just
one.

And in one month one more. And then again one more.


Best regards,
Krzysztof
