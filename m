Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D8811BCEEC
	for <lists+linux-mips@lfdr.de>; Tue, 28 Apr 2020 23:39:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726689AbgD1VjY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Apr 2020 17:39:24 -0400
Received: from mail-bn8nam11olkn2066.outbound.protection.outlook.com ([40.92.20.66]:52125
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726256AbgD1VjY (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 28 Apr 2020 17:39:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fPx7g9ao5an1V3FvVMpMRbg0SI7mbUxSLYUuZKO6DBmmEKCdlIkkZOzl2WOSCs++1QdJ5EI6E14f9GkiGlQ8XIR8kBBc3wF/QpHSQ6sC1bg6ZGdE4cBQvtR481JYSNL1J25A7GSzA5OcjshtSd/2BjONqSxvwgyu7x0s2sPdP27c32vX3gPVzVSUjrnwJnfeYSE7xU79vnn/zWVYoNUTzVuLC8seon9ktI9dKPhqCbYJA3oc+GxzC6GAXdYMYQo/c/Qt9/qjuZdeaYUXFwFgk0H7uqPs1+gVnr+DdlsXGtZupk5UwqRPeUvQGzFqORfLyOpJqmJ+n93wKt107ms9KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zt+11Ldtf3glce+SciMw/wPMLwOlV8OmZlM/x7y8ADs=;
 b=jZEBnxT0vTa0dvROqUXqsmKYQbcFKCd2vx0lBPxIcyQpbpnaF/ris1AHlFh4nrv1XaYjpFDk1Q3AsppTmCn0kTD/FycEeXH/AZARmKdHiBPjxl4PbH8soDcmAzioazND+g7W8CBEU7Rs4C1G34XpzzPKiyTRZM4Qu3Q/WcHW++0HPaRSlszKFXQ3KLDn5vi1VHkInkm8NvQWLPvOM2j3gBcJkQ6WuYgoMI6HmovurXEAA+m6miVdN2u3yysL9/wax981495950VUN9tLEDr62ajTEQes65dqcn8cuPqRmWuYOwPWbjN7DC4HPXMdeuMA0tx5tzPz45HmcmqYhGrouQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=live.ca; dmarc=pass action=none header.from=live.ca; dkim=pass
 header.d=live.ca; arc=none
Received: from DM6NAM11FT033.eop-nam11.prod.protection.outlook.com
 (2a01:111:e400:fc4d::46) by
 DM6NAM11HT249.eop-nam11.prod.protection.outlook.com (2a01:111:e400:fc4d::212)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.15; Tue, 28 Apr
 2020 21:39:20 +0000
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 (2a01:111:e400:fc4d::4e) by DM6NAM11FT033.mail.protection.outlook.com
 (2a01:111:e400:fc4d::221) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.19 via Frontend
 Transport; Tue, 28 Apr 2020 21:39:20 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:28F5F02185C5E04051ED80926CB782C29EE4DB171420ABC2B053968DABB39086;UpperCasedChecksum:279D0200178AC5B999032F9459168FADA96122720AA5FE5D30D8AA4363ACA612;SizeAsReceived:10027;Count:50
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::ad10:4127:4bc8:76fc]) by BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::ad10:4127:4bc8:76fc%6]) with mapi id 15.20.2937.023; Tue, 28 Apr 2020
 21:39:20 +0000
Subject: Re: [PATCH v7 08/12] arm: dts: s5pv210: Add node for SGX 540
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
From:   Jonathan Bakker <xc-racer2@live.ca>
Message-ID: <BN6PR04MB06605F014024061C894AFBA4A3AC0@BN6PR04MB0660.namprd04.prod.outlook.com>
Date:   Tue, 28 Apr 2020 14:39:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
In-Reply-To: <20200427154617.GA1798@pi3>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MWHPR20CA0038.namprd20.prod.outlook.com
 (2603:10b6:300:ed::24) To BN6PR04MB0660.namprd04.prod.outlook.com
 (2603:10b6:404:d9::21)
X-Microsoft-Original-Message-ID: <7bf2cb45-d9a1-7c3f-9efc-8dd0e8d7939a@live.ca>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2001:569:fb67:7300:9f89:4b96:de0b:cd14] (2001:569:fb67:7300:9f89:4b96:de0b:cd14) by MWHPR20CA0038.namprd20.prod.outlook.com (2603:10b6:300:ed::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.13 via Frontend Transport; Tue, 28 Apr 2020 21:39:17 +0000
X-Microsoft-Original-Message-ID: <7bf2cb45-d9a1-7c3f-9efc-8dd0e8d7939a@live.ca>
X-TMN:  [XQ4bYy16QTd757uucX8/ZshxJB4VRIHnZHfMejwEPlAMFVFR72l3yAYYxtSchIi7]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 50
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: dabcd893-72f5-4de7-f4ef-08d7ebbc9be1
X-MS-TrafficTypeDiagnostic: DM6NAM11HT249:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8kNBP7qn0kIsRMXv3mgH2CWAkzQVGL1asywzAwJmrIt7xgR7xunct+WroNd3uT34UTfSFySXiN3LP6DWyfoDC//QlNMs+Iy0J9E+/xPlgCm+LWm/jx9nW+OrxPJdXPzPrb+Rp7jQF+0BAAM97mCzrodYt2VrLKYOqCKZZpg0hMvimvN1JGdV+ZnIm7g5DSLMN2KRU5ZSw9+KaBNIpnLu3w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR04MB0660.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 5X16aCAa4cWHX0E0zbWBl0Xt+Xq1kyp0gZPcIQV3xtpSF5JqYgEfymJM1Bg2C4Az+tQYt1BT38WYBan9AeZQ+iWh0rfSPGeb10MipmTV14n5HIDqvPJQd7TUNR656DNWP0syTJ2elTIRCXFbG2oVkjaAW83Gp1jZE17IghT1uEVsCAA0jejdW3AyHJnHpM4/MMVG7O56z+1/bz/yHIJlWg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dabcd893-72f5-4de7-f4ef-08d7ebbc9be1
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2020 21:39:20.3378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6NAM11HT249
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Krzysztof,

On 2020-04-27 8:46 a.m., Krzysztof Kozlowski wrote:
> On Sun, Apr 26, 2020 at 07:57:12AM -0700, Jonathan Bakker wrote:
>> Hi Paul,
>>
>> On 2020-04-26 5:56 a.m., Paul Cercueil wrote:
>>>
>>>
>>> Le ven. 24 avril 2020 à 22:34, H. Nikolaus Schaller <hns@goldelico.com> a écrit :
>>>> From: Jonathan Bakker <xc-racer2@live.ca>
>>>>
>>>> All s5pv210 devices have a PowerVR SGX 540 (revision 120) attached.
>>>>
>>>> There is no external regulator for it so it can be enabled by default.
>>>>
>>>> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
>>>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>>>> ---
>>>>  arch/arm/boot/dts/s5pv210.dtsi | 13 +++++++++++++
>>>>  1 file changed, 13 insertions(+)
>>>>
>>>> diff --git a/arch/arm/boot/dts/s5pv210.dtsi b/arch/arm/boot/dts/s5pv210.dtsi
>>>> index 2ad642f51fd9..abbdda205c1b 100644
>>>> --- a/arch/arm/boot/dts/s5pv210.dtsi
>>>> +++ b/arch/arm/boot/dts/s5pv210.dtsi
>>>> @@ -512,6 +512,19 @@ vic3: interrupt-controller@f2300000 {
>>>>              #interrupt-cells = <1>;
>>>>          };
>>>>
>>>> +        gpu: gpu@f3000000 {
>>>> +            compatible = "samsung,s5pv210-sgx540-120";
> 
> This should not pass the bindings check because you missed last
> compatibles.
> 

Thanks for pointing that out, I'll add it and make sure it passes the bindings check.

>>>> +            reg = <0xf3000000 0x10000>;
>>>> +            interrupt-parent = <&vic2>;
>>>> +            interrupts = <10>;
>>>> +            clock-names = "core";
>>>> +            clocks = <&clocks CLK_G3D>;
>>>> +
>>>> +            assigned-clocks = <&clocks MOUT_G3D>, <&clocks DOUT_G3D>;
>>>> +            assigned-clock-rates = <0>, <66700000>;
>>>> +            assigned-clock-parents = <&clocks MOUT_MPLL>;
>>>
>>> What are these clocks for, and why are they reparented / reclocked?
>>>
>>> Shouldn't they be passed to 'clocks' as well?
>>>
>>> -Paul
>>>
>>
>> The G3D clock system can have multiple parents, and for stable operation
>> it's recommended to use the MPLL clock as the parent (which in turn
>> is actually a mux as well).  MOUT_G3D is simply the mux for CLK_G3D
>> (SGX core clock), DOUT_G3D is the divider.  DOUT_G3D could equally be CLK_G3D
>> (and probably should be, for readability) as CLK_G3D is simply the gate and
>> DOUT_G3D is the divider for it.
> 
> Good point, it should be CLK_G3D instead of DOUT.  Can you fix this as
> well?

Yep, will do.  Nikolaus, I'll send you an updated patch to include.

> 
> Best regards,
> Krzysztof
> 

Thanks,
Jonathan
