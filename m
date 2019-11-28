Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1038710C2D4
	for <lists+linux-mips@lfdr.de>; Thu, 28 Nov 2019 04:27:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727225AbfK1D1w (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 27 Nov 2019 22:27:52 -0500
Received: from sender4-pp-o98.zoho.com ([136.143.188.98]:25878 "EHLO
        sender4-pp-o98.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727113AbfK1D1w (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 27 Nov 2019 22:27:52 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1574911629; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=SBgDnXauIGwMG/V3rh54/4hIICTGALqafTOQyTN5jT/ztfk4LnfHp3ni0PQ4YugvLb4j+uDt/NA/aD7DrMYi6n4h0ktCjyxTPmXVlsHgp1+xo4055xix3nn96YiCQm0IbOOsLEKJdhnU5m12G7p/3ljjlD7HoLLy87Ja1xMlUJo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1574911629; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=2kXngwStwb77hgVkiYty+9VogGIhnRmmO+0aZj/j2Pw=; 
        b=oBF8iA5I3dgw8hdbjjLvBoOmy+mvKPY7nnGWqozry2ImTnVv+KbhzStTErufcVoocBTXFiqoQ/U3DkXSoudb6zk73VmTfvccyPsUByPnC5UJAnK8SgRYIfEBggpl0icBRLih9Yf2rU8PHNDhixwPwV5/i6hLSDatR1sgEabYdok=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=subject:to:references:cc:from:message-id:date:user-agent:mime-version:in-reply-to:content-type; 
  b=jsuc/yQzIANxqCDQWoGtmfpWcSw3cLnu4Qih+yV4ilYpQSi1QSyWHgeGUcRT9UNYmIDOcKAfg7T4
    4Opn16zsro+W+TjtjAdS8B5vF6JPK9diNJ2qHFzpdXQ76jBEcW8B  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1574911629;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
        bh=2kXngwStwb77hgVkiYty+9VogGIhnRmmO+0aZj/j2Pw=;
        b=FCyCsZzPB7tCWlH+awogkr2tMlOc7TtkpJQfF6VGPpkMnkuj4uRzu7V/pu2NjjQ3
        XvcZN9FJ4whrlFh8u0LJV86kXSiH3r5nOyzMX1fsLKwqi3yvc7ztHNZBWGCbVQ1qmEU
        7dVMDx57ErP4dUbOauNGVX+gqOOqooRuWRKPxd3I=
Received: from [192.168.88.130] (182.148.156.27 [182.148.156.27]) by mx.zohomail.com
        with SMTPS id 1574911628677616.8260073790145; Wed, 27 Nov 2019 19:27:08 -0800 (PST)
Subject: Re: [PATCH v4 5/6] MIPS: X1000: Add pdma controller DT node.
To:     Paul Cercueil <paul@crapouillou.net>
References: <1574787974-58040-1-git-send-email-zhouyanjie@zoho.com>
 <1574787974-58040-6-git-send-email-zhouyanjie@zoho.com>
 <1574873298.3.0@crapouillou.net>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        paul.burton@mips.com, paulburton@kernel.org, jhogan@kernel.org,
        mripard@kernel.org, shawnguo@kernel.org, mark.rutland@arm.com,
        syq@debian.org, ralf@linux-mips.org, heiko@sntech.de,
        icenowy@aosc.io, laurent.pinchart@ideasonboard.com,
        krzk@kernel.org, geert+renesas@glider.be,
        prasannatsmkumar@gmail.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com, 772753199@qq.com
From:   Zhou Yanjie <zhouyanjie@zoho.com>
Message-ID: <5DDF3E81.2060502@zoho.com>
Date:   Thu, 28 Nov 2019 11:26:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <1574873298.3.0@crapouillou.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

On 2019=E5=B9=B411=E6=9C=8828=E6=97=A5 00:48, Paul Cercueil wrote:
> Hi Zhou,
>
>
> Le mer., nov. 27, 2019 at 01:06, Zhou Yanjie <zhouyanjie@zoho.com> a=20
> =C3=A9crit :
>> Add the appropriate DT node to probe the pdma controller driver
>> using the devicetree.
>>
>> Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
>> ---
>>
>> Notes:
>>     v4:
>>     New patch.
>>
>>  arch/mips/boot/dts/ingenic/x1000.dtsi | 13 +++++++++++++
>>  1 file changed, 13 insertions(+)
>>
>> diff --git a/arch/mips/boot/dts/ingenic/x1000.dtsi=20
>> b/arch/mips/boot/dts/ingenic/x1000.dtsi
>> index 9e55edd..edfa70d 100644
>> --- a/arch/mips/boot/dts/ingenic/x1000.dtsi
>> +++ b/arch/mips/boot/dts/ingenic/x1000.dtsi
>> @@ -1,5 +1,6 @@
>>  // SPDX-License-Identifier: GPL-2.0
>>  #include <dt-bindings/clock/x1000-cgu.h>
>> +#include <dt-bindings/dma/x1000-dma.h>
>
> You're not using any macro from that include file, so there's no need=20
> to have it here.
>

Sure, I will fix this in v7.

Thanks and best regards!

> Cheers,
> -Paul
>
>
>>
>>  / {
>>      #address-cells =3D <1>;
>> @@ -173,4 +174,16 @@
>>
>>          status =3D "disabled";
>>      };
>> +
>> +    pdma: dma-controller@13420000 {
>> +        compatible =3D "ingenic,x1000-dma";
>> +        reg =3D <0x13420000 0x400
>> +               0x13421000 0x40>;
>> +        #dma-cells =3D <2>;
>> +
>> +        interrupt-parent =3D <&intc>;
>> +        interrupts =3D <10>;
>> +
>> +        clocks =3D <&cgu X1000_CLK_PDMA>;
>> +    };
>>  };
>> --=20
>> 2.7.4
>>
>>
>
>



