Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B4B61B93A3
	for <lists+linux-mips@lfdr.de>; Sun, 26 Apr 2020 21:32:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726174AbgDZTb6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 26 Apr 2020 15:31:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726166AbgDZTb6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sun, 26 Apr 2020 15:31:58 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D59AAC061A0F;
        Sun, 26 Apr 2020 12:31:57 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id t14so17996830wrw.12;
        Sun, 26 Apr 2020 12:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Ddfze3qGmVwKRJLH5Pd6gdehcdFm5JRcS337ydQjW/U=;
        b=jQcl+bpXmxhFBTQ1M9eHnLMzFVPHRyZ/cLzBouQvUYniMNhGBH+5AXm1DlBj9u1f4c
         Lipke/EQrl3ISBSW/H+ZzrEoH/o+rXVFzj3bMcTy/OhN46NydVkgIuaeUwxBeLscmw6a
         HKwpJ1HHGToP9mkZt0I9t1sW71QECAzPn6juMlTudg8KpqbEYVHCVXaXrYrJzUNQ5I+v
         mGnWB2NcnNCw02lB8lyhanUPJyy+ayrshbwzHW7sRZyt+JTvJFVqH6SbKx+Y97TL6jZ8
         MjSaKyS5VFxmn9GyhaDx/6k4pgUo+rmyfuOEXKqq6yH+g5H0UPmdewApYWVYML7KSN9U
         nk8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ddfze3qGmVwKRJLH5Pd6gdehcdFm5JRcS337ydQjW/U=;
        b=Tltct5/IBqZVTuaw6kCNFUvzZzGWiXgdVQgUaWuXDorbrefRzuvZ8e2YtNmLdJu0Pu
         Gcf1/FG6cpPWcwwRNCH1Wk3Q8y9n2+/TnUpLUZThLClpsv8fq8SABPYxj/k0Drgatw9T
         sx5eQ+oLQx55ybCoF7Z0yxNyehHkhWfUK5Lg5tK8LshWt2pNiv51475d+KMzHK1zZOfS
         yisMa4uB65/8teC7eEZTwMP9riCfa5txoNHx3tVBHfJlnQwMm7praL4I1o4UoO7wgmbo
         CjYTdNASU+8FShjf7bwq9jZhLMLaEWIdsKeyFuGsgtTdQ4nXhpHabtIG7jzUhW4YWfQR
         kKZw==
X-Gm-Message-State: AGi0PuYojtJooZS4+WdsDeP4U5yjNr7ijV/3WURNn+Vdu3n0e8WMtVHO
        K5kuAhEbw2Q9fIRBX4IFXXi8GVPj
X-Google-Smtp-Source: APiQypL2Adb7hVF3vbjtHZE8Vu9e/+IvQOWRq3atLNaVZ0J2vDG1dCBedbrwuM1ZZYXc7bdUl12enw==
X-Received: by 2002:adf:9bd4:: with SMTP id e20mr23138649wrc.199.1587929515985;
        Sun, 26 Apr 2020 12:31:55 -0700 (PDT)
Received: from ?IPv6:2a02:810d:340:2e50:10d8:ba05:5002:2dff? ([2a02:810d:340:2e50:10d8:ba05:5002:2dff])
        by smtp.gmail.com with ESMTPSA id a187sm12613135wmh.40.2020.04.26.12.31.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Apr 2020 12:31:55 -0700 (PDT)
Subject: Re: [PATCH v7 09/12] ARM: dts: sun6i: a31: add sgx gpu child node
To:     Paul Cercueil <paul@crapouillou.net>,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jonathan Bakker <xc-racer2@live.ca>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        openpvrsgx-devgroup@letux.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <cover.1587760454.git.hns@goldelico.com>
 <47740d708e00632735a8c1957109ca349029c716.1587760454.git.hns@goldelico.com>
 <VTBE9Q.B8A32JWI2Q9V3@crapouillou.net>
From:   Philipp Rossak <embed3d@gmail.com>
Message-ID: <276c20d6-13f1-6fc8-c245-049b4a852181@gmail.com>
Date:   Sun, 26 Apr 2020 21:31:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <VTBE9Q.B8A32JWI2Q9V3@crapouillou.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

On 26.04.20 14:53, Paul Cercueil wrote:
> 
> 
> Le ven. 24 avril 2020 à 22:34, H. Nikolaus Schaller <hns@goldelico.com> 
> a écrit :
>> From: Philipp Rossak <embed3d@gmail.com>
>>
>> We are adding the devicetree binding for the PVR-SGX-544-115 gpu.
>>
>> This driver is currently under development in the openpvrsgx-devgroup.
>> Right now the full binding is not figured out, so we provide here a
>> placeholder. It will be completed as soon as there is a demo available.
>>
>> The currently used binding that is used during development is more
>> complete and was already verifyed by loading the kernelmodule successful.
>>
>> Signed-off-by: Philipp Rossak <embed3d@gmail.com>
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> ---
>>  arch/arm/boot/dts/sun6i-a31.dtsi | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/sun6i-a31.dtsi 
>> b/arch/arm/boot/dts/sun6i-a31.dtsi
>> index f3425a66fc0a..933a825bf460 100644
>> --- a/arch/arm/boot/dts/sun6i-a31.dtsi
>> +++ b/arch/arm/boot/dts/sun6i-a31.dtsi
>> @@ -1417,5 +1417,16 @@ p2wi: i2c@1f03400 {
>>              #address-cells = <1>;
>>              #size-cells = <0>;
>>          };
>> +
>> +        gpu: gpu@1c400000 {
>> +            compatible = "allwinner,sun8i-a31-sgx544-115",

looks like a copy paste error from my side this should be 
allwinner,sun6i-a31-sgx544-115

>> +                     "img,sgx544-115", "img,sgx544";
>> +            reg = <0x01c40000 0x10000>;
>> +            /*
>> +             * This node is currently a placeholder for the gpu.
>> +             * This will be completed when a full demonstration
>> +             * of the openpvrsgx driver is available for this board.
>> +             */
> 
> This node doesn't have clocks, so I don't see how it'd work.
> 
> Better delay the introduction of the GPU node for this board until you 
> know it works.
> 
> -Paul
This was already discuss in an earlier version that series that this 
should be delayed.

I will send a follow up patch series, as soon as I mainlined an other 
driver that I'm working on, which is required to properly describe the gpu.

Cheers
Philipp
