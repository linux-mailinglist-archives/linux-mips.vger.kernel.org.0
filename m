Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5C023BED8B
	for <lists+linux-mips@lfdr.de>; Wed,  7 Jul 2021 19:55:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231288AbhGGR5w (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 7 Jul 2021 13:57:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230164AbhGGR5v (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 7 Jul 2021 13:57:51 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DD18C061574;
        Wed,  7 Jul 2021 10:55:10 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id r26so6126098lfp.2;
        Wed, 07 Jul 2021 10:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zQxdG9I9Woa7S81uA0jzyR2yog0q49/Cb6/kJl+fdKw=;
        b=DPrgZiDxLxxXsaeiP6iCEpP5oqHrr32wA0cgJIU4nTet5CoaGBrMeLBSTguCnSMbsf
         gZSBa6ckD574dcRSLXAaPOlgMNbtP5ibJLmgmaQs3IZbdYdaZNtkt8ORDtjofcwHrpeo
         X0pDJA+cYDO1swW6g2Q2kqyKOTO8fpwcrGsKNfFX/veaD7X5aR4tyN0UwJxW0cVdsaAG
         wlWHp1S8Dy3fnognXmJmrEUuiv9qpsJ8J1pNRtCaj4AIEeFfDE7oFqSg21b7NKdpOwWN
         XML0iqOjspip/aEkvl7rbFttEMF9B2+b9l4hm+y9A0hch9vub5tdcE9jmGOqsqC3kS/C
         qxzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zQxdG9I9Woa7S81uA0jzyR2yog0q49/Cb6/kJl+fdKw=;
        b=SIllCcHpYNOh3tkuYWBZBkuoWgBvxQZyTM2WPLeqas7xaY6r6Jp5pGNpHjzcS5ydhu
         1e8Y5NfrdVDDiVWYJ7p0GMJDK97/W7HRqwFJOREKVpxmoTwq1c9SsaPHEDgVZMXsr6CE
         fG861IzeMxIM+IaH7ReKg3ug4Klma3aBLY9IHyZac/xYXZqC6HZtvNCfryot6a0j7Tzv
         OvmRzr10mxy5M9OL0zE76g7clMAy1vj6WA1L1wMr2zqf2oQR2pzLo6sZcga2UwVQE778
         uX2fnNaTvf827Hh96ekki0+34M8j592Gu3GPh2QCbN64v9L/yooG8waCsWW2n+pkY4dC
         xWEw==
X-Gm-Message-State: AOAM532YfHHC6+Sac5KqK109SIuzShlDaMd+n6jYbDyq0oPLTz7aiHf9
        wJUpWrf6n2PKp92W+yI2zq8u6Zs0akg=
X-Google-Smtp-Source: ABdhPJwyOvh7JP+XAqY+4wG4EDAsP16uap1AjswsK9fEtNc3A6WHJwpiIM6SORNrG7sPVt+w1f6m0Q==
X-Received: by 2002:ac2:5189:: with SMTP id u9mr4551247lfi.161.1625680508344;
        Wed, 07 Jul 2021 10:55:08 -0700 (PDT)
Received: from [192.168.1.102] ([178.176.76.61])
        by smtp.gmail.com with ESMTPSA id i6sm1761452lfe.164.2021.07.07.10.55.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jul 2021 10:55:08 -0700 (PDT)
Subject: Re: [PATCH v2 4/9] clocksource/drivers/pistachio: Make it seletable
 for MIPS
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, mturquette@baylibre.com,
        daniel.lezcano@linaro.org, linus.walleij@linaro.org,
        vkoul@kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org
References: <20210707031552.20166-1-jiaxun.yang@flygoat.com>
 <20210707031552.20166-5-jiaxun.yang@flygoat.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <99803248-0a48-c4a8-e278-47e0794dbc48@gmail.com>
Date:   Wed, 7 Jul 2021 20:55:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210707031552.20166-5-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello!

   "Selectable" in the subject.

On 7/7/21 6:15 AM, Jiaxun Yang wrote:

> So it will be avilable for generic MIPS kenrel.

   "Kernel" here. :-)

> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
[...]

MBR, Sergei
