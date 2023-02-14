Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E0A3695F47
	for <lists+linux-mips@lfdr.de>; Tue, 14 Feb 2023 10:33:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232372AbjBNJdl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 14 Feb 2023 04:33:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232265AbjBNJdk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 14 Feb 2023 04:33:40 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DEE655A4
        for <linux-mips@vger.kernel.org>; Tue, 14 Feb 2023 01:33:33 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id o15so11629477wrc.9
        for <linux-mips@vger.kernel.org>; Tue, 14 Feb 2023 01:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cfs+Q3/NCe1EQO+5Ft904kfT2AxcjZbiWamdz5bJvaY=;
        b=NBHd90XfEE+9tYmS2wB/jBXfk75s5nVkMimrJFGyXaOOIMZa0vkXAJOOHXF1u5XY9t
         xplGnNakc/TE5VfShtEHgvbB8At5wt8XtDhR7SuH29r0Y7aMzwZPloOMait+35FZHqie
         NYvksuYtcQdpbwfkMJ4o7bwaDzn2BZi9L9H6OQ9KmTRHLN/Oq26c1dD5rNv9ZEEbv2oX
         I1plKNd8RdeKsdQXmlEtI6hsz0cq8Lh0+aFPmuEBE1LWPiXx7qgQbYC49AhIaJJZj+sQ
         6BRubrd+kaochlSJDFS5OXlEnPM4V3JcargCwm5zMCrAq6ep0eOqWJcIPRi7r3D+NONd
         hsrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cfs+Q3/NCe1EQO+5Ft904kfT2AxcjZbiWamdz5bJvaY=;
        b=p3wwMe8ntPxfqUH6SSURPNeZlTd7ayihwrQ1ID8bylqkaI6rWcOPB+vLmqa9n6tlg3
         mY12t/ddlySZQdEU8aFCFXOszQrs7GhXxX7yqlTpROkllvLlC/BPROKaPeNXx5rrSQql
         uzi5VN6s28M89/zTYrjddtnynOa8xQpxVRS41yBWjRTC5oOj19EmFZ4D9NuQtZpymSKE
         fKimaYgHpznOChlKU2w7MAn/vBjgXzInMk/mrZ9DKHJdqEXWJzxPQvEaL4uX0ur2P/1a
         475fxT/j40oNhG6/zLo9CohH2+G8KmWryZWunqRJl6q7UwsrqBjGSWBeziJdfMXMrrkt
         CW2w==
X-Gm-Message-State: AO0yUKUw7URgT+aKQHW3UsYmabiSqYJJckMKJCYSRgb7oZX0FsDRvYQ/
        RiibaBjTlHYs5RhQvhomndrH+w==
X-Google-Smtp-Source: AK7set+dVtdtCDNLgA5545ILg7PF/u84//tVlT2VUmHK0xnzko5rFmzjH7eBd7V/o9AYBTmJjQEE+g==
X-Received: by 2002:adf:f8c6:0:b0:2bf:95d0:fa5d with SMTP id f6-20020adff8c6000000b002bf95d0fa5dmr2093230wrq.9.1676367211857;
        Tue, 14 Feb 2023 01:33:31 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n6-20020adffe06000000b002c559843748sm4162918wrr.10.2023.02.14.01.33.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 01:33:31 -0800 (PST)
Message-ID: <7f2e556c-ee11-fe4e-f4d6-94c761f976d0@linaro.org>
Date:   Tue, 14 Feb 2023 10:33:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v6 3/3] watchdog: mt7621-wdt: avoid ralink architecture
 dependent code
Content-Language: en-US
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     linux-watchdog@vger.kernel.org, wim@linux-watchdog.org,
        linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
        arinc.unal@arinc9.com, tsbogend@alpha.franken.de,
        p.zabel@pengutronix.de, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org
References: <20230213200519.889503-1-sergio.paracuellos@gmail.com>
 <20230213200519.889503-4-sergio.paracuellos@gmail.com>
 <f105c7a8-8821-1e7b-af46-13a46971db63@linaro.org>
 <CAMhs-H_Cd9F+UWWe+dAA89r_huX_srtsgjh1qus93nGehQN1AQ@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAMhs-H_Cd9F+UWWe+dAA89r_huX_srtsgjh1qus93nGehQN1AQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 14/02/2023 09:54, Sergio Paracuellos wrote:
>>>       return 0;
>>> @@ -143,6 +147,10 @@ static int mt7621_wdt_probe(struct platform_device *pdev)
>>>       if (!drvdata)
>>>               return -ENOMEM;
>>>
>>> +     drvdata->sysc = syscon_regmap_lookup_by_compatible("mediatek,mt7621-sysc");
>>> +     if (IS_ERR(drvdata->sysc))
>>> +             return PTR_ERR(drvdata->sysc);
>>
>> This should be the backup/error path for original code using syscon
>> property. Looking up by compatible is really not portable/re-usable.
> 
> I can change the code in the way you are pointing out here but...
> Why is it not re-usable? Compatible is not supposed to be changed
> since in other cases the DTB ABI will be broken. I am totally lost
> about what is an ABI breakage, then.

How do you use it on other platform?

Best regards,
Krzysztof

