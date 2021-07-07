Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 579763BEDA9
	for <lists+linux-mips@lfdr.de>; Wed,  7 Jul 2021 20:03:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231281AbhGGSFh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 7 Jul 2021 14:05:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbhGGSFg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 7 Jul 2021 14:05:36 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEF3DC061574;
        Wed,  7 Jul 2021 11:02:55 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id c28so6137051lfp.11;
        Wed, 07 Jul 2021 11:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WdK02twy8pyO9wtpquNhBoO1ciKpkv+L2J5dgsFFjAI=;
        b=IWT3gQxefwyakiP00/D+lm+LIGY9jtFE7/cqwyQPVOZ7Y53aW7h9eD2uOr9AKLMx2S
         iShcjfYIlhkE39PvOBzpL++wwIVkqsamo0hKgk/ndFh6ec85GF23RT55NQULhVD5G7Nb
         SckKLmMeVIHfnXVsFKUBpNDahra++ElkdnocbmnDKFoDIEb9d7pLFR42F6c7eAavC2mi
         G52XiJ2DmjOZfUr8KgBeHPfN0h9NMDv+sDOSWrqgnXNpuH5NCpwHrmxBej5Q+ndij7TD
         u5X/twSz/+bET0F250cNx2DXQBAywiVBs9WIuRERzBh/8uVPwMl2mSAB/v6OY6PPYTKw
         JflQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WdK02twy8pyO9wtpquNhBoO1ciKpkv+L2J5dgsFFjAI=;
        b=UvchVsVzdlqlL2yao1NqPGtxWlhsVvgeyYgtWYOUrn7d9nzDTKWQ2KjDAl5HTyxy+F
         JcijJ4y5R50OWyhOin8BOtER9EOKKxTnGZFe3lurlDKKNjn4E4ucFoOqpkCwFR8AJ1mH
         SsEhG0F2cWgeSksVij2R84rS6hC2+XA/FAecCSVI0c3TD1Nbpe1Pw+eRDygLXwDADh+q
         5LuoIpb1O3VJF1kZhG4gRlHAM67jONgTfUBvmfiu51pv8od+44gPdRcWUabszpPUq0n0
         OB0JI1Dxa5foKbEi38NlVKn1Pdi5wIv8ojew23z+WtWmKbwtSNGAvjKIBEh/0VQNN2Bd
         2nOQ==
X-Gm-Message-State: AOAM530sK+Ugrrh+ai4C4HtjasimXdx6+s1w671FppWXzX+UlMJWd/Za
        0PABM5qVfjGD1y+kgbO/0ii6oTeNreY=
X-Google-Smtp-Source: ABdhPJzsyUmcaHOcFZvqbMBc9bFOsQRLPYXTQaY0nN+NxeE247XE0Fu6V2mcrEgVFT0LVtNPhoh63Q==
X-Received: by 2002:ac2:435a:: with SMTP id o26mr19414441lfl.216.1625680973581;
        Wed, 07 Jul 2021 11:02:53 -0700 (PDT)
Received: from [192.168.1.102] ([178.176.76.61])
        by smtp.gmail.com with ESMTPSA id y14sm1099130lfk.81.2021.07.07.11.02.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jul 2021 11:02:53 -0700 (PDT)
Subject: Re: [PATCH v2 6/9] pinctrl: pistachio: Make it as a option
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, mturquette@baylibre.com,
        daniel.lezcano@linaro.org, linus.walleij@linaro.org,
        vkoul@kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org
References: <20210707031552.20166-1-jiaxun.yang@flygoat.com>
 <20210707031552.20166-7-jiaxun.yang@flygoat.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <22db9cb2-0439-7ef0-6379-ce104755a1c6@gmail.com>
Date:   Wed, 7 Jul 2021 21:02:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210707031552.20166-7-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 7/7/21 6:15 AM, Jiaxun Yang wrote:

    s/a/an/ in the subject.

> So it will be avilable for generic MIPS kernel.

   3d time's a charm -- no typo in kernel this time! :-)

> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
[...]

MBR, Sergei
