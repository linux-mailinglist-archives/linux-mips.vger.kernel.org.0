Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48EB8768475
	for <lists+linux-mips@lfdr.de>; Sun, 30 Jul 2023 10:28:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbjG3I2m (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 30 Jul 2023 04:28:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbjG3I2l (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 30 Jul 2023 04:28:41 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEA9D30D6
        for <linux-mips@vger.kernel.org>; Sun, 30 Jul 2023 01:28:11 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-52164adea19so4619196a12.1
        for <linux-mips@vger.kernel.org>; Sun, 30 Jul 2023 01:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690705666; x=1691310466;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D60VbFymTmhk33TulwzZUfrsQML4Fn7VfvjzkkAQ+Fw=;
        b=v9LyuYPhpC6zcLchqJqp+K/pksVlx/CBkDNKjRiTnvqtKr3pmNJXzl3FHUDjuzf18E
         9b2h1St0PpofjI++XeuayZCfHG0TDgEsZIE6DPoQeVeuPyj16CpLCQqWeBS5HByjtv8z
         sZP5LqylaJZTUptNhODkx0aw1jfyJN64TzQCVxQp0a6XYhEq6I4jjbBNI+MDOAv+vaU4
         0bOzSJFO4PhEobSuRRgAwgdWiLCJqxxQ+2juO08hKddXwcIMDwPN5Q3ZqHz+rYjYRqn1
         Vg6mNtBGtlUg0HnvkU9h2bV9l1+ayXOpo6264yJBjV+rrXYosNdd1xtRVSIMdh5MPKRo
         nVhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690705666; x=1691310466;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D60VbFymTmhk33TulwzZUfrsQML4Fn7VfvjzkkAQ+Fw=;
        b=R3Dx9j/U/hyZToIrIVxYUQSO6GKBQYwI7vHi5cTvfAwndEzl4ATcSGRnVjUKolqWHH
         WKQWa71qALFitIZpRkZlVkQaKdn2P1z2s5XPBfuj4u3WCAyHwDWezTLGR42mYy/U1QkX
         ajDlZftiDa6YDKY5MQJi5SVMi/Egq8gqU8/5krTpJZK1Jb2h+e5cS/crPgTmAX+Ga9WA
         O4YwDUnDbr3UnFftZAPk5Afwc7ME2SBE+NS4aZZ712xq0RCbeyC0Q3Hno/Rptn6oAEmK
         y/dl3d2M3skXgZm/Nos6BQ0KST7zuqdR8bIjA4lBpbn4E4A3g8tGDYDbxsfxCLmBuS5l
         Sedw==
X-Gm-Message-State: ABy/qLZ1WkIv2GQoqKppw+Z+ZvPvZXI9cPevSzh+JMuWJMqfjsWc2zXg
        n9UIVaazRZ8jH0iEROM9DrqV8+tNU3l0/8rDCMQ=
X-Google-Smtp-Source: APBJJlEkx8evuqe35HveMmTK6Z9zxyAvK3EkdcIpk1D+eGhBx5CLd26uF+T5+BYxOm63+kwz6uVdTQ==
X-Received: by 2002:a17:907:784f:b0:99b:d693:cb8e with SMTP id lb15-20020a170907784f00b0099bd693cb8emr3556505ejc.71.1690705666463;
        Sun, 30 Jul 2023 01:27:46 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.183])
        by smtp.gmail.com with ESMTPSA id v23-20020a1709067d9700b00993860a6d37sm4314892ejo.40.2023.07.30.01.27.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Jul 2023 01:27:45 -0700 (PDT)
Message-ID: <dfd8be75-6ae7-8989-4717-db82c5c0656d@linaro.org>
Date:   Sun, 30 Jul 2023 10:27:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 14/17] mips: dts: loongson1b: Add PWM timer clocksource
Content-Language: en-US
To:     Keguang Zhang <keguang.zhang@gmail.com>,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
References: <20230729134318.1694467-1-keguang.zhang@gmail.com>
 <20230729134318.1694467-15-keguang.zhang@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230729134318.1694467-15-keguang.zhang@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 29/07/2023 15:43, Keguang Zhang wrote:
> Add the device node of PWM timer clocksource
> for Loongson-1B boards.

Don't split adding new DTS into many small commits. There is little
point in adding broken/incomplete DTS and immediately fix it. Just add
complete one. We do the same for each drivers and DTS is not different here.

It would be entirely different if you followed 'release early, release
often' approach, so release pieces as fast as you have them ready. You
decided to ignore that rule, so no, you don't get 20 commits fixing DTS
you added in first commit of the same patchset.



Best regards,
Krzysztof

