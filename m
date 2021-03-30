Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E2DB34EF21
	for <lists+linux-mips@lfdr.de>; Tue, 30 Mar 2021 19:14:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232471AbhC3ROU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 Mar 2021 13:14:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232421AbhC3ROM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 30 Mar 2021 13:14:12 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE5F4C061574;
        Tue, 30 Mar 2021 10:14:12 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id y32so11042301pga.11;
        Tue, 30 Mar 2021 10:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=IY0oe04rrzRs4tJk5orey3ebqIuxABmWC9UUdY6wqMY=;
        b=D1w6C2oSpu95Wjg6AWrcPYAX46Gkla4461Ntcv2RKuMZ9RByy3NkDlyWUrGBtJuXRH
         nvr7CSBBS5apWxPU219g14BM4onhBbN7tB1rNWwi4vQmCTYMcj09eWB2WVRyMBxRGowo
         kRKmR91e1LFE5CQVWmY8p6McnE9QKczpe5FbkqeV4o3Q1s1LXgGmdfV5jR2dIhctR1Zr
         iaJwahJ2st6nnFU0Mt84roq32l2+TmZF/wqw3wT4WGZYBkgykNFp+AbZ84Z9IcKeYRtq
         cxUzyYhRdtHLzYl/M/GGva05p9YXG6fJEMW4YJKPBmKkAYtWR3g0cmK2r84hxmnGaWIK
         3nYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IY0oe04rrzRs4tJk5orey3ebqIuxABmWC9UUdY6wqMY=;
        b=k5Dl5xOsZSJyhCfkbfecGL23jKTMf11QwIi8++J/up88SIKJm7XWkIymRb4zmSObXC
         Hrw28oVL5SD8sTtZBxr3meFJXFiZB3nL9A8RkUkQDZtQLg7EILoicQaP8R/NemgyFAkN
         4/PaRPgaLyYT2Tn343iUwhNw9EbI/RNMivIeflLJpT2sZjmpEMoDQDM3yyOAAa57Cmc0
         1iQHicyr7NyhEPebj3A7olJgMn5Ecy8/sUS49RCpI1KrshblwrlIUOrR77yl1+blcYZy
         MtnVnqdsaGroPBucK8TQctE3SaYUap7KyBvHSt6iuHBXca2wYrV8ohFZlW3aS6uZJGZJ
         BgIw==
X-Gm-Message-State: AOAM533kd26VQw40IP70t3mRlFAiq+BSQFzN5n7hmkPeuwdOnV7U2aLX
        eyTxRQiowLN8NTAgZgrsLBTrDaDbtdk=
X-Google-Smtp-Source: ABdhPJzWmsm29+iw5KYEnjJI1koXM2B8OFPoITOscL3kvMRh1JK6SS26cK39V+M9fm/UMKt4qFHg3Q==
X-Received: by 2002:aa7:8bd4:0:b029:1fa:9f1b:1cd1 with SMTP id s20-20020aa78bd40000b02901fa9f1b1cd1mr31322561pfd.31.1617124451991;
        Tue, 30 Mar 2021 10:14:11 -0700 (PDT)
Received: from [10.67.49.104] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id 132sm21370533pfu.158.2021.03.30.10.14.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Mar 2021 10:14:11 -0700 (PDT)
Subject: Re: [PATCH v2 0/6] mips: bmips: fix and improve reboot nodes
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Florian Fainelli <f.fainelli@gmail.com>
Cc:     =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
        Paul Burton <paulburton@kernel.org>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210314164351.24665-1-noltari@gmail.com>
 <20210330130944.GB11217@alpha.franken.de>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <d55889f3-d952-c05b-5243-424caf0bc415@gmail.com>
Date:   Tue, 30 Mar 2021 10:14:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210330130944.GB11217@alpha.franken.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 3/30/21 6:09 AM, Thomas Bogendoerfer wrote:
> On Sun, Mar 14, 2021 at 05:43:45PM +0100, Álvaro Fernández Rojas wrote:
>> These patches improve bmips bcm63xx device tree nodes.
>>
>> v2: add missing BCM63268 patch.
>>
>> Álvaro Fernández Rojas (6):
>>   mips: bmips: fix syscon-reboot nodes
>>   mips: bmips: bcm6328: populate device tree nodes
>>   mips: bmips: bcm6358: populate device tree nodes
>>   mips: bmips: bcm6362: populate device tree nodes
>>   mips: bmips: bcm6368: populate device tree nodes
>>   mips: bmips: bcm63268: populate device tree nodes
>>
>>  arch/mips/boot/dts/brcm/bcm3368.dtsi  |   2 +-
>>  arch/mips/boot/dts/brcm/bcm63268.dtsi | 132 +++++++++++++++++++++++---
>>  arch/mips/boot/dts/brcm/bcm6328.dtsi  | 119 ++++++++++++++++++++---
>>  arch/mips/boot/dts/brcm/bcm6358.dtsi  |  85 ++++++++++++++---
>>  arch/mips/boot/dts/brcm/bcm6362.dtsi  | 129 ++++++++++++++++++++++---
>>  arch/mips/boot/dts/brcm/bcm6368.dtsi  | 129 ++++++++++++++++++++++---
>>  6 files changed, 530 insertions(+), 66 deletions(-)
> 
> Florian, are you ok with this changes ? If yes, I'm going to apply them
> to mips-next.

This all looks good to me and matches the hardware manuals as far as
resources are declared. There may be some room for doing a bit more
consolidation since there is not that much difference between SoCs after
all, maybe as a subsequent change.
-- 
Florian
