Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0939216031
	for <lists+linux-mips@lfdr.de>; Mon,  6 Jul 2020 22:22:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726280AbgGFUWy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 6 Jul 2020 16:22:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725860AbgGFUWy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 6 Jul 2020 16:22:54 -0400
Received: from srv1.deutnet.info (srv1.deutnet.info [IPv6:2a01:4f8:c2c:6846::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62FFEC061755;
        Mon,  6 Jul 2020 13:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=deutnet.info; s=default; h=In-Reply-To:Date:Message-ID:From:Cc:To:Subject;
         bh=QHBoMnopn1GeLbQTtaFDXykK4kBLCM1Q0oST0aeB5hc=; b=n4VB5fe918Nk4ritAC86gzwqh
        2g3OXDucNHbXUyywRSdmKDY+ZI9QxRpqWbe4RXzi7G0HoHUqPLf4qpTX74IIwDJW0EnGzIPWb6ZFT
        LP42pHUc0QpAuoqlcyUPref/1Db85VPE2pHJfbaXBLP0WDVXeEqzc/f+TB3WWJwHNhOtt0ZNW0UOc
        mMFrhqHmxy9uoCF5O1WSwR5KJjlUqU68V7SXRyaxMDu0y17Bs3rmQl+9Zz8QUfwqdGTvTh73+HXej
        DaSn3KeTNxraDmUX1CKTLZqogxXh4gL0FpluQfjABb7+lNkN1j+JiZJR0Ih2KWJ5tizMqBbJaDVEO
        gm+Zwc3aw==;
Received: from [2a01:e0a:186:d21:be5f:f4ff:fe8b:2fc1]
        by srv1.deutnet.info with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <agriveaux@deutnet.info>)
        id 1jsXda-0005ot-8b; Mon, 06 Jul 2020 22:22:50 +0200
Subject: Re: [PATCH] MIPS: CI20: DTS: Correcting IW8103 Wifi binding
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        linux-mips <linux-mips@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
References: <20200705103215.96672-1-agriveaux@deutnet.info>
 <457C75ED-A033-4B46-A9D9-53B510C16F37@goldelico.com>
From:   Alexandre GRIVEAUX <agriveaux@deutnet.info>
Message-ID: <f617580b-fad7-f4f2-e89d-402b53c21c47@deutnet.info>
Date:   Mon, 6 Jul 2020 22:22:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <457C75ED-A033-4B46-A9D9-53B510C16F37@goldelico.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Le 06/07/2020 à 13:15, H. Nikolaus Schaller a écrit :
> Hi Alexandre,
>
>> Am 05.07.2020 um 12:32 schrieb agriveaux@deutnet.info:
>>
>> From: Alexandre GRIVEAUX <agriveaux@deutnet.info>
>>
>> Use brcm,bcm4329-fmac instead of brcm,bcm4330-fmac.
>>
>> Signed-off-by: Alexandre GRIVEAUX <agriveaux@deutnet.info>
>> ---
>> arch/mips/boot/dts/ingenic/ci20.dts | 4 ++--
>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/mips/boot/dts/ingenic/ci20.dts b/arch/mips/boot/dts/ingenic/ci20.dts
>> index 75f5bfbf2c37..82a1f126b778 100644
>> --- a/arch/mips/boot/dts/ingenic/ci20.dts
>> +++ b/arch/mips/boot/dts/ingenic/ci20.dts
>> @@ -116,8 +116,8 @@
>> 	pinctrl-0 = <&pins_mmc1>;
>>
>> 	brcmf: wifi@1 {
>> -/*		reg = <4>;*/
>> -		compatible = "brcm,bcm4330-fmac";
>> +		reg = <1>;
>> +		compatible = "brcm,bcm4329-fmac";
>> 		vcc-supply = <&wlan0_power>;
>> 		device-wakeup-gpios = <&gpd 9 GPIO_ACTIVE_HIGH>;
>> 		shutdown-gpios = <&gpf 7 GPIO_ACTIVE_LOW>;
> Do you have it working with a v5.8 kernel?
>
> I don't see any activity to detect the module or load firmware.
>
> Does it rely on some other patch?
>
> BR and thanks,
> Nikolaus
>
Hi Nikolaus


At this time the patch have been only "tested" for error will doing make:

make ARCH=mips CROSS_COMPILE=mipsel-linux-gnu- olddefconfig &&  make
ARCH=mips CROSS_COMPILE=mipsel-linux-gnu- -j8 && make ARCH=mips
CROSS_COMPILE=mipsel-linux-gnu- -j8 uImage


The .config come from creator-ci20 kernel 'config-3.18.3-ci20-1'


Even with the right DT
(Documentation/devicetree/bindings/net/wireless/brcm,bcm43xx-fmac.txt)
it's need some config with brcm enabled I gess.


I need to do some investigation will trying the uImage this week,
unfortunaly kernel developpement is not my main work, it's a hobby.


Thanks.

