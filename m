Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 225394FFA78
	for <lists+linux-mips@lfdr.de>; Wed, 13 Apr 2022 17:39:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236631AbiDMPlp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 Apr 2022 11:41:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236638AbiDMPln (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 13 Apr 2022 11:41:43 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 541FED67
        for <linux-mips@vger.kernel.org>; Wed, 13 Apr 2022 08:39:19 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id d10so2947290edj.0
        for <linux-mips@vger.kernel.org>; Wed, 13 Apr 2022 08:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=X9hKp3Y2zMwZgy3YpyTWq8d0i7RnkuDLtpEpok8446A=;
        b=owXOYmJ1qaFLaC+Sa4OOMEFbc7CITeVzef7eB4mZeIN4NwmuozoX/Xk0zG4jCEFGx3
         85BxQFrIeadN+7Pobfn8LuqZ9XA1q0oxGI8VeZPlsmnHuuAqgMpokFQYIHCq1Zu5N9uv
         BBdtYQqdtnKkA5iBxI7JZSPvKzjn6vZuQzD6aiW4esXRSSgph91BlTKgZH3xxTCqGE9x
         czdbDvnGIdn+xGdL8zn7NhTBxFl+q8kY1q92CstLQ2aDEpzEHTSN1BSO4NJe12uQm7t6
         dLblsPPAoIoQ9fMIu8UWVKwpWV5rabUwGKgqq5Jx2CpsKGxEHwELM7+yIekP2afeBUCK
         mnVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=X9hKp3Y2zMwZgy3YpyTWq8d0i7RnkuDLtpEpok8446A=;
        b=KIszwE9dYBt2BZDF69RHmg7COSwejg2r989XZ3NgDdNsW5pgfIANIyiWpON/Xx58nA
         AbAXn0uF5/KXGb2Ekd12Vo6Za1Y33Jtqn96ABvpkxvDHQ1Hox9JDVrfmxCu0vAN/3ajj
         vPxidQMVRs1Gbc9AsTWCIz0JUTR5YjBCHafqC5PDnwHipKqh9aiZjoFDqaD9OnJx5Gu+
         9odEws+UisQIKzBxnEovEuKQtEPEKjbZDHni+2eOtdboGWY9dZwWyNv3jvZwGp/v0K1I
         0eivof+ZNFFMjSZPtD93pglcQONiEmX+H5+p/MvD1BhA8LZp25BxDoOOHlbE7gCapoY1
         r8oQ==
X-Gm-Message-State: AOAM533Y2Q1ZDxHv9V/q2PTBkr5nNtJ+pKZetijZq8W59xHQ1Rj47TFc
        1ACgI8XJpWpUogqCoMRZJmq1Uw==
X-Google-Smtp-Source: ABdhPJzIGkKaUTPpciLe0PPwKf0l7G1vuQhtJBWbomF92oUQp0hsUbfNZiKNgS5HEYVmfixJI8mMcQ==
X-Received: by 2002:a05:6402:42d4:b0:416:5cac:a9a0 with SMTP id i20-20020a05640242d400b004165caca9a0mr45238172edc.86.1649864357797;
        Wed, 13 Apr 2022 08:39:17 -0700 (PDT)
Received: from [192.168.0.205] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id t19-20020a056402525300b0041952a1a764sm1380150edd.33.2022.04.13.08.39.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Apr 2022 08:39:17 -0700 (PDT)
Message-ID: <e6424c41-fadd-d326-49af-28db51606c2d@linaro.org>
Date:   Wed, 13 Apr 2022 17:39:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 0/14] Refactor Ralink Pinctrl and Add Documentation
Content-Language: en-US
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc:     Luiz Angelo Daros de Luca <luizluca@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        erkin.bozoglu@xeront.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-arm-kernel@lists.infradead.org,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>
References: <20220413060729.27639-1-arinc.unal@arinc9.com>
 <CAMhs-H_oRzpeqJY8Oe+7Su5v-4B1WPwzOfhrvBC08FVi-O6fVA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAMhs-H_oRzpeqJY8Oe+7Su5v-4B1WPwzOfhrvBC08FVi-O6fVA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 13/04/2022 08:36, Sergio Paracuellos wrote:
> I think you cannot change compatible strings because you have to be
> compatible with previous stuff. That is the reason why when I
> refactored all of this stuff from 'arch/mips/ralink' into
> 'drivers/pinctrl' I maintained the same for all of them and only
> created one binding for all. I know that these SoCs are mostly used in
> openWRT and the way of doing things there is that when a new version
> is released a new dtb is also compiled so I understand the motivation
> of the change itself. In any case, Rob has the last word here, not me
> :).

Breaking other users is usually not accepted, so some good reason would
be needed here...


Best regards,
Krzysztof
