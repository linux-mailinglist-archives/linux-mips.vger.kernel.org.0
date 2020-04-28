Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FBB11BD041
	for <lists+linux-mips@lfdr.de>; Wed, 29 Apr 2020 00:58:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726286AbgD1W6P (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Apr 2020 18:58:15 -0400
Received: from mail-dm6nam10olkn2022.outbound.protection.outlook.com ([40.92.41.22]:57792
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725934AbgD1W6P (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 28 Apr 2020 18:58:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dH4OalpptlhlKSBkjvdbN4KZvamuU0+zjqlKIoQ2+zXwzHYaU+zo/+P1vaLoAQqJ4lgpWbB7LCTD32URDk34NheeUOla9GIzo58E4x8IKWn7zyyDGkmUHqU+xZXaCQlGghZp18BBvLxbcrccoUWUwrcYQcVl7wKdGMe+YdlXmdSebBT1uKrg0zxcb9Clowu/FJjWgxfSxJZmUNQCQlVp7RGPLvIQSxthaTMpF20zYS697LXxMJflN5JKlf6Gz9YwZlG/1T8zufMctEW3QcoLjhMv9gf1Yj1CoWkRnp/UMniFrc3XgrzJdIBqv4w0Lq9u820tDWx/bsxUsx8iqSSsQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MuaIE8TgI8eeUG5HV45zullZYlfZTfh5z+WzEAXePtY=;
 b=CIYuZMhb+xwGuItEubHM6hBQ4Y0g8275Yw/I424BkGXAsWOzZwPuA21PZM4pWz9pvU1vuG+eCiPYJEhqsryBr8WinXtqHr3QzQOUhs5IuH2u2yO52uiR8qF7t/WZup8JesmrkqcIkaoBVBFtPOyvlKPc1dLvq6Sv+soIKJssA4laP7fW2Xix3nNjqDKdNdnkWg+42+FlWhTBo5HkT7Oq0YQ2Cqdqi4aW/t8g/xaPcG36EBcn9zr/mkGiKlJEbW+7qnBr5afjwSmGo6fdL7/u9R/1h4tp1oz4O+HS6uy9lzyIsJNxT5zmkzOXzE+zE8+BNirk8cE7zpiHpJ4SgmBTyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=live.ca; dmarc=pass action=none header.from=live.ca; dkim=pass
 header.d=live.ca; arc=none
Received: from DM6NAM10FT053.eop-nam10.prod.protection.outlook.com
 (2a01:111:e400:7e86::45) by
 DM6NAM10HT010.eop-nam10.prod.protection.outlook.com (2a01:111:e400:7e86::83)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.15; Tue, 28 Apr
 2020 22:58:11 +0000
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 (2a01:111:e400:7e86::4f) by DM6NAM10FT053.mail.protection.outlook.com
 (2a01:111:e400:7e86::442) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.15 via Frontend
 Transport; Tue, 28 Apr 2020 22:58:11 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:9DD91C560F719B6A0FD0859D0B9EB727363D20AB69F890889C2A5E39D02BC068;UpperCasedChecksum:C40B9486CA0DDFBB9B19B9961A7974577A1BE048E67E179F3A60565C4A004CED;SizeAsReceived:10167;Count:50
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::ad10:4127:4bc8:76fc]) by BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::ad10:4127:4bc8:76fc%6]) with mapi id 15.20.2937.023; Tue, 28 Apr 2020
 22:58:11 +0000
Subject: Re: [PATCH v7 08/12] arm: dts: s5pv210: Add node for SGX 540
From:   Jonathan Bakker <xc-racer2@live.ca>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Paul Cercueil <paul@crapouillou.net>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Philipp Rossak <embed3d@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        openpvrsgx-devgroup@letux.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <cover.1587760454.git.hns@goldelico.com>
 <3fd18c747426e15fd1f3500b9c4adce2db9ddd0c.1587760454.git.hns@goldelico.com>
 <NYBE9Q.YH08US7A7DC3@crapouillou.net>
 <BN6PR04MB0660A180D2069848E5C03D7EA3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
 <20200427154617.GA1798@pi3>
 <BN6PR04MB06605F014024061C894AFBA4A3AC0@BN6PR04MB0660.namprd04.prod.outlook.com>
Message-ID: <BN6PR04MB0660044B5B1D45BE4CBCD2AAA3AC0@BN6PR04MB0660.namprd04.prod.outlook.com>
Date:   Tue, 28 Apr 2020 15:58:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
In-Reply-To: <BN6PR04MB06605F014024061C894AFBA4A3AC0@BN6PR04MB0660.namprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MWHPR1701CA0020.namprd17.prod.outlook.com
 (2603:10b6:301:14::30) To BN6PR04MB0660.namprd04.prod.outlook.com
 (2603:10b6:404:d9::21)
X-Microsoft-Original-Message-ID: <f4d70bab-caba-8700-00aa-010384f053e2@live.ca>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2001:569:fb67:7300:9f89:4b96:de0b:cd14] (2001:569:fb67:7300:9f89:4b96:de0b:cd14) by MWHPR1701CA0020.namprd17.prod.outlook.com (2603:10b6:301:14::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.19 via Frontend Transport; Tue, 28 Apr 2020 22:58:06 +0000
X-Microsoft-Original-Message-ID: <f4d70bab-caba-8700-00aa-010384f053e2@live.ca>
X-TMN:  [p5xCICxpvEcF+C5bcn3IY6/23cHHsfWLGQe5HxJm1+AAXApmKRg140W6WwoNl3IS]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 50
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 9f8a5563-8f46-468c-edd6-08d7ebc7a02f
X-MS-TrafficTypeDiagnostic: DM6NAM10HT010:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Eu6+DJDb/VXQQhT1KQyJeLAlptyYlZo/0nlf3oPLCHod9hzxJfrhd+tN5qcfmT7gYUsFmIbDt3JXi0dg+KmPHIK812Vz864xR/+SnPw6AlAHXKmnVC2PyxrhzDKdsXp6uVVEXXcYzI/BR2TCh7kFG9zx9cgrVDX+ZlmCCZfI+UwZFroiWr7qRKhycdzA9AheuLe4DYxk+4fi2x7z/I5iBQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR04MB0660.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: jcwqMPeBOgdjmQA0oMP6IpFxptHmfDaomCReXOB2Xj68q1dz2VvhXXz4M2Uj+NaKxE86mtQV5Dl5AD7n6nMInqZuBpyZw3wu8FB380euZHZzI71vmdADajZdObPM2fFdAqbEtMkfds9ldDO3ul3irkcaxUq4cgZuIQI6qdt9B6Rq9eYvTGzJoES2/nw7P6ruYwvNsv8uD/0bs8zhdJSZ8Q==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f8a5563-8f46-468c-edd6-08d7ebc7a02f
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2020 22:58:11.8237
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6NAM10HT010
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi all,

On 2020-04-28 2:39 p.m., Jonathan Bakker wrote:
> Hi Krzysztof,
> 
> On 2020-04-27 8:46 a.m., Krzysztof Kozlowski wrote:
>> On Sun, Apr 26, 2020 at 07:57:12AM -0700, Jonathan Bakker wrote:
>>> Hi Paul,
>>>
>>> On 2020-04-26 5:56 a.m., Paul Cercueil wrote:
>>>>
>>>>
>>>> Le ven. 24 avril 2020 à 22:34, H. Nikolaus Schaller <hns@goldelico.com> a écrit :
>>>>> From: Jonathan Bakker <xc-racer2@live.ca>
>>>>>
>>>>> All s5pv210 devices have a PowerVR SGX 540 (revision 120) attached.
>>>>>
>>>>> There is no external regulator for it so it can be enabled by default.
>>>>>
>>>>> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
>>>>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>>>>> ---
>>>>>  arch/arm/boot/dts/s5pv210.dtsi | 13 +++++++++++++
>>>>>  1 file changed, 13 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm/boot/dts/s5pv210.dtsi b/arch/arm/boot/dts/s5pv210.dtsi
>>>>> index 2ad642f51fd9..abbdda205c1b 100644
>>>>> --- a/arch/arm/boot/dts/s5pv210.dtsi
>>>>> +++ b/arch/arm/boot/dts/s5pv210.dtsi
>>>>> @@ -512,6 +512,19 @@ vic3: interrupt-controller@f2300000 {
>>>>>              #interrupt-cells = <1>;
>>>>>          };
>>>>>
>>>>> +        gpu: gpu@f3000000 {
>>>>> +            compatible = "samsung,s5pv210-sgx540-120";
>>
>> This should not pass the bindings check because you missed last
>> compatibles.
>>
> 
> Thanks for pointing that out, I'll add it and make sure it passes the bindings check.
> 
>>>>> +            reg = <0xf3000000 0x10000>;
>>>>> +            interrupt-parent = <&vic2>;
>>>>> +            interrupts = <10>;
>>>>> +            clock-names = "core";
>>>>> +            clocks = <&clocks CLK_G3D>;
>>>>> +
>>>>> +            assigned-clocks = <&clocks MOUT_G3D>, <&clocks DOUT_G3D>;
>>>>> +            assigned-clock-rates = <0>, <66700000>;
>>>>> +            assigned-clock-parents = <&clocks MOUT_MPLL>;
>>>>
>>>> What are these clocks for, and why are they reparented / reclocked?
>>>>
>>>> Shouldn't they be passed to 'clocks' as well?
>>>>
>>>> -Paul
>>>>
>>>
>>> The G3D clock system can have multiple parents, and for stable operation
>>> it's recommended to use the MPLL clock as the parent (which in turn
>>> is actually a mux as well).  MOUT_G3D is simply the mux for CLK_G3D
>>> (SGX core clock), DOUT_G3D is the divider.  DOUT_G3D could equally be CLK_G3D
>>> (and probably should be, for readability) as CLK_G3D is simply the gate and
>>> DOUT_G3D is the divider for it.
>>
>> Good point, it should be CLK_G3D instead of DOUT.  Can you fix this as
>> well?
> 
> Yep, will do.  Nikolaus, I'll send you an updated patch to include.
> 

How are assigned-clocks handled in the yaml DT schema?  When running make dtbs_check,
I end up with messages such as

arch/arm/boot/dts/s5pv210-aquila.dt.yaml: gpu@f3000000: 'assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' do not match any of the regexes: 'pinctrl-[0-9]+'

Do they need to explicitly be listed as valid entries?

Thanks,
Jonathan
