Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09AA22458A7
	for <lists+linux-mips@lfdr.de>; Sun, 16 Aug 2020 19:06:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728167AbgHPRGh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 16 Aug 2020 13:06:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726825AbgHPRGg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 16 Aug 2020 13:06:36 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1694C061786;
        Sun, 16 Aug 2020 10:06:35 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id g6so14895840ljn.11;
        Sun, 16 Aug 2020 10:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+gW0MeUUnWtjGRnB3GIB/WuouXI03ogec5oC+V29aXA=;
        b=THsajkBAG42CvgrWy6I1Je7Lx/8NmASsawcagk5GF0lskivIr6aFzS5ChY5lhYUZov
         mDcnQKZWeglWiacSJ5Ycv1CnUteCPoZpZs8VZwSi1gGb7rI3F/puVLI/OS82UTppzPtb
         EU5/JrYmZUI8Rx6Qt+XnNW4GQO/BDPrcjNx78xfPWHQnTA5MUI2Yn8SXKZ7AqQHIeCHm
         DuRhBpiSoeRTISRh3ZgjUQ1oTSzgPa9HOXgtXyURcDrVe/rv2A1lPhus4S3n/l46SPon
         Ks0UleO23P3swz0uDr31OaQx72gvLZdpuT3l5vfjo9CXRYTLQXn7Ve6kviAWMqPGCFeX
         WAmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+gW0MeUUnWtjGRnB3GIB/WuouXI03ogec5oC+V29aXA=;
        b=RxJcoa4Swu7L5bLcawu1WBCfqdc2UWtsigbff9zfghEb+wKMfuODH2r/c/fTO2D5Fg
         ZkCMRttJl8aauo3YWTyxsGP9i+RrIM1ulY9zIoUA818VQCvHefd5iY6T4cHWklDgp3Qo
         aWozP/MnHCJZ4FT+7x4Bxlc2cGobmCZ9ExhOwTvaO1qv+hAWQW6STMB7nFPcSbVMdlzZ
         ByAGxL0vX4sD067quhiHSG5aUvYsO0aK1C/xI8up3+3322cClEAOPFo8ylDOloDv/tmp
         +NKWbT83URlA18rpl33qDXfw3DD7R/fvWJH7DvRisKz/LHU9JItBr0OUYeTJp+AiRGuz
         +bbw==
X-Gm-Message-State: AOAM533pP3ZuToBmQjRmJsIOmlagPD0YRDjtQ5Bv8Yts7iqVhnwQ9bZQ
        2Zdmmqh4jL5uKVB4O0SjUBw=
X-Google-Smtp-Source: ABdhPJyNtcSHRXcoHCBFOUYMBtvctEp+pL4AFjbCfXAK5mX+sYqHMK321l2KNAO4FoTJLqe3YFcLcw==
X-Received: by 2002:a2e:98d5:: with SMTP id s21mr5151864ljj.59.1597597594314;
        Sun, 16 Aug 2020 10:06:34 -0700 (PDT)
Received: from wasted.omprussia.ru ([2a00:1fa0:48fd:f54c:8335:c09f:7e7c:be7b])
        by smtp.gmail.com with ESMTPSA id d6sm1320889lji.110.2020.08.16.10.06.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Aug 2020 10:06:33 -0700 (PDT)
Subject: Re: [PATCH 2/3] MIPS: DTS: img: marduk: Add Cascoda CA8210 6LoWPAN
To:     Hauke Mehrtens <hauke@hauke-m.de>, tsbogend@alpha.franken.de
Cc:     linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, james.hartley@sondrel.com,
        rahulbedarkar89@gmail.com, wigyori@uid0.hu
References: <20200815163514.11631-1-hauke@hauke-m.de>
 <20200815163514.11631-2-hauke@hauke-m.de>
 <b6267d62-af3b-4d29-51b0-3a61d0fd2679@gmail.com>
 <b094bf63-dd4e-e5e0-812c-957b1f11805a@hauke-m.de>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <5ed658c5-c5f8-8b06-82f8-0409901c6b40@gmail.com>
Date:   Sun, 16 Aug 2020 20:06:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b094bf63-dd4e-e5e0-812c-957b1f11805a@hauke-m.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 8/16/20 1:59 PM, Hauke Mehrtens wrote:
 
> Thank you for the review Sergei.

   You're welcome. :-)

[...]
>>> Add Cascoda CA8210 6LoWPAN controller to device tree.
>>>
>>> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
>>> ---
>>>   arch/mips/boot/dts/img/pistachio_marduk.dts | 22 +++++++++++++++++++++
>>>   1 file changed, 22 insertions(+)
>>>
>>> diff --git a/arch/mips/boot/dts/img/pistachio_marduk.dts
>>> b/arch/mips/boot/dts/img/pistachio_marduk.dts
>>> index ea11a21b133b..633a41954cc0 100644
>>> --- a/arch/mips/boot/dts/img/pistachio_marduk.dts
>>> +++ b/arch/mips/boot/dts/img/pistachio_marduk.dts
>>> @@ -75,6 +75,28 @@
>>>       VDD-supply = <&internal_dac_supply>;
>>>   };
>>>   +&spfi0 {
>>> +    status = "okay";
>>> +    pinctrl-0 = <&spim0_pins>, <&spim0_cs0_alt_pin>,
>>> <&spim0_cs2_alt_pin>, <&spim0_cs3_alt_pin>, <&spim0_cs4_alt_pin>;
>>> +    pinctrl-names = "default";
>>> +
>>> +    cs-gpios = <&gpio1 14 GPIO_ACTIVE_HIGH>, <&gpio0 2
>>> GPIO_ACTIVE_HIGH>,
>>> +            <&gpio1 12 GPIO_ACTIVE_HIGH>, <&gpio1 13 GPIO_ACTIVE_HIGH>;
>>> +
>>> +    ca8210: ca8210@0 {
>>
>>    The device nodes are supposed to have the generic names...
> 
> I am not referencing this, so I can also remove it:
> 	ca8210@0 {

   I said name, not label. :-)

> Otherwise, would this be ok:
> 	ieee802154: ca8210@0 {
> 
>>> +        status = "okay";
> 
> This status = "okay"; can be removed.

   Yes, and probably even shpould be removed...

>>> +        compatible = "cascoda,ca8210";
>>> +        reg = <0>;
>>> +        spi-max-frequency = <4000000>;
>>
>>    Only 4MHz?
> 
> The vendor device tree also use 4MHz:
> https://github.com/CreatorDev/openwrt/blob/ci40/target/linux/pistachio/dts/pistachio/pistachio_marduk.dts#L34
> The device tree binding says "Maximum clock speed, should be *less than*
> 4000000", it could even make sense to switch this to 3MHz.
> https://www.kernel.org/doc/Documentation/devicetree/bindings/net/ieee802154/ca8210.txt

   It just sounds too low SPI frequency, those a usually one order higher...

> I do not have the datasheet for the cascoda,ca8210.
> 
>>> +        spi-cpol;
>>> +        reset-gpio = <&gpio0 12 GPIO_ACTIVE_HIGH>;
>>> +        irq-gpio = <&gpio2 12 GPIO_ACTIVE_HIGH>;
>>> +        extclock-enable;
>>> +        extclock-freq = <16000000>;
>>> +        extclock-gpio = <2>;
>>
>>    Hm, strange spec for a GPIO prop, shouldn't they all be alike?
> 
> I am also getting this compile warning:
> arch/mips/boot/dts/img/pistachio_marduk.dts:135.3-23: Warning
> (gpios_property): /spi@18100f00/ca8210@0:extclock-gpio: cell 0 is not a
> phandle reference
> arch/mips/boot/dts/img/pistachio_marduk.dts:126.19-136.4: Warning
> (gpios_property): /spi@18100f00/ca8210@0: Missing property '#gpio-cells'
> in node /clk@18144000 or bad phandle (referred from extclock-gpio[0])

     Expected. :-)

> I do not know how to fix this.

> The binding is defined here:
> https://www.kernel.org/doc/Documentation/devicetree/bindings/net/ieee802154/ca8210.txt

   Have to fix the bindings somehow, "extclock-gpio" was a bad name...

> Hauke

MBR, Sergei
