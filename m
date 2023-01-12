Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C695D666D6C
	for <lists+linux-mips@lfdr.de>; Thu, 12 Jan 2023 10:07:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239957AbjALJHC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 12 Jan 2023 04:07:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239969AbjALJGZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 12 Jan 2023 04:06:25 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D3F1B7FC
        for <linux-mips@vger.kernel.org>; Thu, 12 Jan 2023 01:01:38 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id u9so43165390ejo.0
        for <linux-mips@vger.kernel.org>; Thu, 12 Jan 2023 01:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fw3Q/H2DqZcykx9Yf41o4SkW0Lqzy2WimZ0SDIfRlGk=;
        b=v7RpQTEjYePJD15M7bQOhOp9x1hrcoCCtsYjcZGrE2dnoQAko+4f180sMszd/yRtg3
         mVupZj8TJgJj1qJkhYYzbpqY3Gaf7ts3XhsdzPBbhIJ+PIagEIi89+ZprEVTLl9hiNyH
         OYJKzWF4AcP22D/wMUnwEq4+koIM5T8SbJ7YMVK6HRyXxczA4a6m3MrhFbbJQJpG/f3u
         c4AMTDWdNxebDmZ8SEBTCxyb5W57EzGcSBos1RLvk5eoeXKG8uBYMidcLpaRnChBj/25
         9Kp0QpR9UrQYplZd2dmgnTrQfaYnEyhUv/ew0g16feu+TK48/8IbpSVSdyM3+Wdl1nRi
         xTgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fw3Q/H2DqZcykx9Yf41o4SkW0Lqzy2WimZ0SDIfRlGk=;
        b=VJG+gmKXWolqpRE6gOUUZkfKyuV8ZSmOoPHPMNtV/S1DnXS9tugDr+AjUS0qjXFJg3
         0IBJ9I07E2dGjig9iITQarPxqknMeaEeTsYXjGkNMYKji/1zshBh4Uabkt+r26P+nvw1
         L6njhzh+8FSzYxjaE8mVu0xAhjIngppvRR+fCWAmCZt6VccPTyciMVR11y9Cj9rna46k
         XNn9zZEuxnfkYvF0sYXO3XbkIu1L3NJu9uFeFWSw4f7Hg2K5W3bw7FvqZ5Sg25fzfnDs
         ugwV37CF5IqkpMuLRqhEbmfPf6uh0BJtsy9gvaRUX7rt+WiEXd/OnludKsyuXACF6yt3
         piHQ==
X-Gm-Message-State: AFqh2kriSfxLF0DLq/scF9wEP/LQk8B728oiBJ+6hO7Vys9dCWJOatdg
        bEiEjxOmiv0UglfyWeUTmOsNjw==
X-Google-Smtp-Source: AMrXdXv4mC7D8HDXP4WeWECNsQDB1gN1Ra2s3PCCbrk2dewthSPR0qKu3wp1FZvvgOfmypDSgOJ5JQ==
X-Received: by 2002:a17:907:a643:b0:83c:7308:b2ed with SMTP id vu3-20020a170907a64300b0083c7308b2edmr66493767ejc.17.1673514097334;
        Thu, 12 Jan 2023 01:01:37 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id s10-20020a17090699ca00b0084d43100f19sm5176918ejn.89.2023.01.12.01.01.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 01:01:36 -0800 (PST)
Message-ID: <1b5880bb-d0ce-9dde-2fe6-e058f6efb6f1@linaro.org>
Date:   Thu, 12 Jan 2023 10:01:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 3/6] dt-bindings: pinctrl: mt7621: add proper function
 muxing binding
Content-Language: en-US
To:     =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, erkin.bozoglu@xeront.com
References: <20221231160849.40544-1-arinc.unal@arinc9.com>
 <20221231160849.40544-4-arinc.unal@arinc9.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221231160849.40544-4-arinc.unal@arinc9.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 31/12/2022 17:08, Arınç ÜNAL wrote:
> Not every function can be muxed to a group. Add proper binding which
> documents which function can be muxed to a group or set of groups.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>

Didn't I already ack it?

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

