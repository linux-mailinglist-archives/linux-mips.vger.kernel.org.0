Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECB411B90FE
	for <lists+linux-mips@lfdr.de>; Sun, 26 Apr 2020 16:58:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726162AbgDZO5W (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 26 Apr 2020 10:57:22 -0400
Received: from mail-bn8nam11olkn2035.outbound.protection.outlook.com ([40.92.20.35]:6657
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726152AbgDZO5W (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 26 Apr 2020 10:57:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ay5aXiPmGAU6gIRc5Fw8oYXPk6MUvy9D8u6NdUxVEVZYoEQoGdfTaySDVZZ3ItQchb8oMYnChTW9wG1ZjKCQOigUwSVNZz70mpFeBjxsxFv9grdwgMPC/cc41emNEDSa0LTsBcZgpnhZKWKTS7k6AXEftHkTF1Ex5DnMbfrZSqZ5LYsyfHXurW1MJLk6kKm/fAL/2ku7AZtcW/Ga/ANPudN6eo0zRl/otG4o/V11glnJDyd9xZbQYrk1aeeoBXPd47CBMTIYYg1XA6i/YybDGQFOI4bRZiox09WCLmKYqZT2DqrylPEmsmEaNUTIffm+poV5/BMhQr2BhwYtiN6U8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rCl3rY0wkUejQntKOCRLgSoEtSbDA20DEt0Lp6EAeQw=;
 b=XcydcxaB3GWWwBg0qhKGybdwe+RfKugK7++6EZoTXxit5PUP2Tka24Vf1SyXeIZTcly1u6ywzx9j47jCjranR1d6s/UdgvsHW6GR6Yfjik8Xq1GW5dodHLJicGnN9vU+1/zziYx307tz/zzHOkTQz6gr6xsL17mUiR4RUgM0Zx0EsG15vEBhGQKXKVjsTd4tsMPG245r1gI9J94S/ADWrm5DFl/aaTA4wSJpeZfAJNbkts/msCXwF2XJH69Jl7vfVDKbzI485GpRQoZDp7ZRXCF3EqHl6CCIaCAe3u0Ejs8swsvxDKfa4TtCY3uWDF56z32l2G0tl7KSHIB6gRSyOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=live.ca; dmarc=pass action=none header.from=live.ca; dkim=pass
 header.d=live.ca; arc=none
Received: from CO1NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2a01:111:e400:3861::47) by
 CO1NAM11HT148.eop-nam11.prod.protection.outlook.com (2a01:111:e400:3861::275)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.15; Sun, 26 Apr
 2020 14:57:17 +0000
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 (2a01:111:e400:3861::4d) by CO1NAM11FT032.mail.protection.outlook.com
 (2a01:111:e400:3861::218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.15 via Frontend
 Transport; Sun, 26 Apr 2020 14:57:17 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:E81CF6BFCFE073454522CA0EAAF72EEBFDD4626B33AA54E33244858FAA4E44A9;UpperCasedChecksum:B59FE0D74AE6107E11CB223A88241A401D292CCDCAC3F731F6A2F9AC6F7CB0FE;SizeAsReceived:9919;Count:50
Received: from BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::ad10:4127:4bc8:76fc]) by BN6PR04MB0660.namprd04.prod.outlook.com
 ([fe80::ad10:4127:4bc8:76fc%6]) with mapi id 15.20.2937.020; Sun, 26 Apr 2020
 14:57:17 +0000
Subject: Re: [PATCH v7 08/12] arm: dts: s5pv210: Add node for SGX 540
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
From:   Jonathan Bakker <xc-racer2@live.ca>
Message-ID: <BN6PR04MB0660A180D2069848E5C03D7EA3AE0@BN6PR04MB0660.namprd04.prod.outlook.com>
Date:   Sun, 26 Apr 2020 07:57:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
In-Reply-To: <NYBE9Q.YH08US7A7DC3@crapouillou.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CO2PR05CA0059.namprd05.prod.outlook.com
 (2603:10b6:102:2::27) To BN6PR04MB0660.namprd04.prod.outlook.com
 (2603:10b6:404:d9::21)
X-Microsoft-Original-Message-ID: <c7fba899-d520-559f-d14c-1d92f629329e@live.ca>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2001:569:fb67:7300:9f89:4b96:de0b:cd14] (2001:569:fb67:7300:9f89:4b96:de0b:cd14) by CO2PR05CA0059.namprd05.prod.outlook.com (2603:10b6:102:2::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.12 via Frontend Transport; Sun, 26 Apr 2020 14:57:14 +0000
X-Microsoft-Original-Message-ID: <c7fba899-d520-559f-d14c-1d92f629329e@live.ca>
X-TMN:  [OmgafuzCUqVRB2i/C6FSFbGQe5x8huTGu/6RGTYJ87Y/NFFW81q0f1xbGex4LyHn]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 50
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: cbade908-3c53-44a5-a6de-08d7e9f21cd1
X-MS-TrafficTypeDiagnostic: CO1NAM11HT148:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QwTfGRGC0v5LCTZiqw648BnLUPKmgF4piL5vYUxxnRbFF3jRYYLJaiiCpWhoMoXyun1bOoXNLWVAufhHYJdce/SE0dKQZD9b+gEu1+6CRnw86wcRbtWcpD2FEWg37aNVZWOPo4o/0GXz8vBkYzW0CD47dOBdvOuxcO8Tnayi23egP0iSstBHimHh8antuNuFgNGybBGfDQzllIG4jKC04Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR04MB0660.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 8808OTabogw8sV0VMpFUQqObuTnPvfdGv11P400fYeD1iMYdPEq4G/dgFkf3NmGGEEbDa05lFeFmKjbQM3b5L96FQ5G2pK/UROup5LS7M9B2DgKscxJaRp7dNO3Vs1bYl1PB7cvDahfb/2GF9jEYWhElQxuXGrx3RBRkjC+ffFTTcYivf2OhXZrGotJ99khwYRshb5dW/r/Vh1L0XgUPvQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbade908-3c53-44a5-a6de-08d7e9f21cd1
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2020 14:57:17.5591
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1NAM11HT148
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

On 2020-04-26 5:56 a.m., Paul Cercueil wrote:
> 
> 
> Le ven. 24 avril 2020 à 22:34, H. Nikolaus Schaller <hns@goldelico.com> a écrit :
>> From: Jonathan Bakker <xc-racer2@live.ca>
>>
>> All s5pv210 devices have a PowerVR SGX 540 (revision 120) attached.
>>
>> There is no external regulator for it so it can be enabled by default.
>>
>> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> ---
>>  arch/arm/boot/dts/s5pv210.dtsi | 13 +++++++++++++
>>  1 file changed, 13 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/s5pv210.dtsi b/arch/arm/boot/dts/s5pv210.dtsi
>> index 2ad642f51fd9..abbdda205c1b 100644
>> --- a/arch/arm/boot/dts/s5pv210.dtsi
>> +++ b/arch/arm/boot/dts/s5pv210.dtsi
>> @@ -512,6 +512,19 @@ vic3: interrupt-controller@f2300000 {
>>              #interrupt-cells = <1>;
>>          };
>>
>> +        gpu: gpu@f3000000 {
>> +            compatible = "samsung,s5pv210-sgx540-120";
>> +            reg = <0xf3000000 0x10000>;
>> +            interrupt-parent = <&vic2>;
>> +            interrupts = <10>;
>> +            clock-names = "core";
>> +            clocks = <&clocks CLK_G3D>;
>> +
>> +            assigned-clocks = <&clocks MOUT_G3D>, <&clocks DOUT_G3D>;
>> +            assigned-clock-rates = <0>, <66700000>;
>> +            assigned-clock-parents = <&clocks MOUT_MPLL>;
> 
> What are these clocks for, and why are they reparented / reclocked?
> 
> Shouldn't they be passed to 'clocks' as well?
> 
> -Paul
> 

The G3D clock system can have multiple parents, and for stable operation
it's recommended to use the MPLL clock as the parent (which in turn
is actually a mux as well).  MOUT_G3D is simply the mux for CLK_G3D
(SGX core clock), DOUT_G3D is the divider.  DOUT_G3D could equally be CLK_G3D
(and probably should be, for readability) as CLK_G3D is simply the gate and
DOUT_G3D is the divider for it.

The SGX clock layout on S5PV210 looks something like this:

        MOUT_MPLL -----------> MOUT_G3D ---> DOUT_G3D  ---> CLK_G3D
(selectable parent clock)      (mux)    ---> (divider) ---> (gate)

This is fairly common for older Samsung SoCs, eg having a look at
arch/arm/boot/dts/exynos4210-universal_c210.dts you can see that
the FIMC clocks are parented to MPLL and have a rate set.

>> +        };
>> +
>>          fimd: fimd@f8000000 {
>>              compatible = "samsung,s5pv210-fimd";
>>              interrupt-parent = <&vic2>;
>> -- 
>> 2.25.1
>>
> 
> 

Thanks,
Jonathan
