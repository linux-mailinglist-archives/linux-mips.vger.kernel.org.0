Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FDAF1CD3C4
	for <lists+linux-mips@lfdr.de>; Mon, 11 May 2020 10:25:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729046AbgEKIZi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 11 May 2020 04:25:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728968AbgEKIZi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 11 May 2020 04:25:38 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A842DC05BD09
        for <linux-mips@vger.kernel.org>; Mon, 11 May 2020 01:25:37 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id a4so6726384lfh.12
        for <linux-mips@vger.kernel.org>; Mon, 11 May 2020 01:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WDxg1DeZ8sJ0XodxOs3Lm7xIglVAG2LNLkzOH+NSeUw=;
        b=a9kB4Tqs2dCfJPVXLW7rIUKcpadFGS95KUujA0Gg0bh3yvN04Iz5hXJvAqcYo0Fo0S
         e2r7UnavF1g1b/yQKVtxwTj7QwPbAZ4neNiZ+DiFmEf1XD98zE76t0mSXo8oAcg+X3xe
         l+jRZpz/1I1nC+f0b95Q4F33TiK5C7hQ9tkUIklIWnGk6+TMkp4h1ffCL9jUxWSQEeok
         /l5ckU8tbMHVzxKLO7uOVNcKFbKJS/tFAODjz+tXLPwLtLlAvjsEsKOjCOyYnJ5jZ41z
         yWY4QOs6wuj7Z5j0d/7twGR1B7bJocqwEe4xr1rhP/AdovuJq9xM0J1y/TbQuZnAcZOS
         WtMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WDxg1DeZ8sJ0XodxOs3Lm7xIglVAG2LNLkzOH+NSeUw=;
        b=Y1En3F68KcgfQBK6If8sjx2UjoCcBV7Nf5m2r8S4AIrHSS7Wr23XgTn//tvsMu2g8z
         WLWIhB98tDZqUiYeeRAMUsgm+REWpjgBdpSwylm+yAeZ8/gJ4bD87CptuJaVtc4a9k0r
         DTVS00h3XR4TeU0fHBJbaLE14rFmo1eFqlUa3Zsm6XofSRT0juw+7zOsbY9LRgEqIb4F
         cRUNZ1vb2Y8eGsP0z6yzlibfjv/3h4caCs4k9js5Bfp1tZahZRrewpYDTq7+2PAQ4bbf
         rWEk198t7vrmI95QhoZp2AbpDGCvQ2bZlDIs3RDjXKgdFcPmfS95xFRoauUr2lAX6+Z1
         RvgQ==
X-Gm-Message-State: AOAM531TICtNdxElh3fLDNA2k3SIIkczCkj/vOwWgXHjsd7/s8JIyYL7
        vJe2ByY5MzXV57+bivMea0upHA==
X-Google-Smtp-Source: ABdhPJwG0Z0oAyGtpSM5Xhb1unFN6lqX0CQnA/utE93CSThdYjV3Swfvkr8C4tDKnBb/YXkFbUWqSA==
X-Received: by 2002:a19:e013:: with SMTP id x19mr1639311lfg.49.1589185536031;
        Mon, 11 May 2020 01:25:36 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:482:2677:ba:b682:3c24:214e? ([2a00:1fa0:482:2677:ba:b682:3c24:214e])
        by smtp.gmail.com with ESMTPSA id s27sm9101690ljo.80.2020.05.11.01.25.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2020 01:25:35 -0700 (PDT)
Subject: Re: [PATCH v2 2/7] dt-bindings: watchdog: dw-wdt: Support devices
 with asynch clocks
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-mips@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200306132758.703FC8030704@mail.baikalelectronics.ru>
 <20200510105807.880-1-Sergey.Semin@baikalelectronics.ru>
 <20200510105807.880-3-Sergey.Semin@baikalelectronics.ru>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <f065ff5f-af86-4293-b208-766e41699436@cogentembedded.com>
Date:   Mon, 11 May 2020 11:25:31 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200510105807.880-3-Sergey.Semin@baikalelectronics.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello!

On 10.05.2020 13:58, Serge Semin wrote:

> DW Watchdog IP core can be synthesised with asynchronous timer/APB
> clocks support (WDT_ASYNC_CLK_MODE_ENABLE == 1). In this case
> a separate clock signal is supposed to be used to feed watchdog timer
> and APB interface of the device. Lets along with the watchdog timer
                                        ^ verb missing? or comma?

> reference clock expect to have the optional APB3 bu interface clock
> sepcified in a DW WDT dt node.

    Specified.

> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Paul Burton <paulburton@kernel.org>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: linux-mips@vger.kernel.org
[...]

MBR, Sergei
