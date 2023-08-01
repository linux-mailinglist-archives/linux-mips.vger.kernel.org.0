Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0F4176B750
	for <lists+linux-mips@lfdr.de>; Tue,  1 Aug 2023 16:24:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234644AbjHAOYw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Aug 2023 10:24:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234645AbjHAOYt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 1 Aug 2023 10:24:49 -0400
Received: from DM6FTOPR00CU001.outbound.protection.outlook.com (mail-centralusazon11020022.outbound.protection.outlook.com [52.101.61.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9256171B;
        Tue,  1 Aug 2023 07:24:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XbdK9MDZSxM+EyHgjan3har5Z0Z/wW8YWxG2PxMzwLkYzevo0cQj9MSA3laL5D8OBX5BZ21uLbkR2PnkVN/iEw9WL4Y+HLQM7KyYVZVEPN2teO7GSxY6NKJHHs9Y4zAR7or3LCF7qowzRU/CTtcowT5oyLDh7+JjbrM+c0ihmgowzjR7pxYRmo3/vlkQzzgTm7x+rZkcnMspMK2pXOl+bvhWqNAz/UDirs6IciyrObi4CFTYH/MAG5it/sBdZZwV+MryugtYdnFYINsAOBRrYp0Onk9gCPJm6D0YdXIbpz+/I8hGMPjfJfbJTQ0E9Q6sWqND5uN6EyYGctA6sfR7SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0RaufZ4exwo2CHsEUJ6IhgLbpxonqJSdxmu0qZ8/AiU=;
 b=L76Msv8sh5INg2cy+ialSUuJzo/YcIDycgHVAd+2Fj3IMDNZBeAO30Jd0qLi96yrSq0kHIIhj7U1js/oOjUAjShML3Ts+7O6WfrqXCPt3ikprE8jtdVeKcgRtFINF7nFWPHtUPCWqWcUwU5KwKEi/mKA/OsPPtpwFodNNr2/xYyW/yyEKeM4FO6sI5oW+9LMMYpqaIfxp5/zpOJMaVNnYw8ZIPL4rwnhsCyoALsLLD7LJ5Kp8RjC7OXfK84cj4L2YuJ0+TncXoO4Nc5It+TW0LWWzjxM7GMPBIGH5VWLgwfpCFJppOqee07CjbwZnI0weBDJgqGH2OPn5QIrliIIrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0RaufZ4exwo2CHsEUJ6IhgLbpxonqJSdxmu0qZ8/AiU=;
 b=X4qzkrXIB37F44E2av20XDRSJKhHWQsGZhO4+/s7jP7J2kpczIplECWh8RA0sY2kxFaqiQLuLdneaOYsdIi88c52NADMqi3aqvC6vEd8U+9e3F3+fDseEUEdx+CFTvieQ1dnc0+hwrxVgRU25ZDBJ2v9SWkb2a6um8RK8D6BGzY=
Received: from DM4PR21MB3783.namprd21.prod.outlook.com (2603:10b6:8:a0::11) by
 SA1PR21MB4034.namprd21.prod.outlook.com (2603:10b6:806:38f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.4; Tue, 1 Aug
 2023 14:24:41 +0000
Received: from DM4PR21MB3783.namprd21.prod.outlook.com
 ([fe80::ed0a:b50b:ad34:4651]) by DM4PR21MB3783.namprd21.prod.outlook.com
 ([fe80::ed0a:b50b:ad34:4651%7]) with mapi id 15.20.6652.004; Tue, 1 Aug 2023
 14:24:41 +0000
From:   David Daney <daviddaney@microsoft.com>
To:     =?iso-8859-2?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
        Ladislav Michl <oss-lists@triops.cz>
CC:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Liang He <windhl@126.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: RE: [EXTERNAL] Re: [PATCH v5 7/7] usb: dwc3: dwc3-octeon: Add SPDX
 header and copyright
Thread-Topic: [EXTERNAL] Re: [PATCH v5 7/7] usb: dwc3: dwc3-octeon: Add SPDX
 header and copyright
Thread-Index: AQHZxH8nH1RuoKGnsEKfIg/HW1qxJ6/Vfe9w
Date:   Tue, 1 Aug 2023 14:24:40 +0000
Message-ID: <DM4PR21MB3783BB69BA155E89F92026B7C80AA@DM4PR21MB3783.namprd21.prod.outlook.com>
References: <ZMd/HzISn0mPsNWt@lenoch> <ZMeAAYx6Z3hlQBNQ@lenoch>
 <76e29459-d407-e2d1-c052-c841bfab9474@linaro.org>
In-Reply-To: <76e29459-d407-e2d1-c052-c841bfab9474@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=13bc329c-21f8-4f7e-bf47-80fb2667ddca;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2023-08-01T14:21:30Z;MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR21MB3783:EE_|SA1PR21MB4034:EE_
x-ms-office365-filtering-correlation-id: 51e10e02-bcd7-4f1f-838a-08db929b0b4b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uJtlNkxRqrLJ8/Z056NvhxlmVNDlJFiFqAFtz6EV6gHhqHxlXWHs2/EMSkGBwfuzq0puCX9Wo5pJH/3RY/oTsIf1AxYRWNRa1i1MiPicL8h5dK0sarZ+TkAsGub9iEe56bhKA7l1KLKi7qjTzIhzMBXuGRmUXVQteXlJaNBCYHzhLLiLjCVQlnzYVmjy3k79v5naB+0k0MYE/fyzg71xeWLvUEJc+Kx+lT6CzweqquC8W2uFb+UBAZVs4LdlQsmgoCwaXx/jzmWA19oroP/08gHa3TPUIVeuMcelDAVBZMZ32b0E/A8/+VRqepBJvHq67J0IR/IQ+AZYZT9vFvYsKZHB4iUKBhlpXs6L9SWjSY2F3GjGX18XMijlHJJHeZH5sTeCYz4dNo+gWr7rqPS2X26wDch/NL+UpcNc2N9qNmjHyTkq0zpPlsFRwR57xlCwi/uN1wV4PJIDSCPxxAYJVHI0WbO8gMVQ6s0+VGmIQxFtYp64S3CkeNJduHtjA8Uyqv/9T1g8Cog220APG8cgRP4fssVulQdr7HRw+S3nHgBb7MzgiRm3/g5gOem2ThTdeY5dcUjS0BLpGJ6gwJJpWenS/J++F72fjrQYZd6C/lu9SstVgPq6gLA2BeIJQ+2dNKN6YaV/4d+DfvYWGOomjvoZUnWEEWCg5eOvnH8X0ew=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR21MB3783.namprd21.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(136003)(376002)(39860400002)(396003)(451199021)(82950400001)(5660300002)(83380400001)(9686003)(38100700002)(38070700005)(53546011)(33656002)(186003)(6506007)(55016003)(8990500004)(66574015)(82960400001)(86362001)(26005)(2906002)(52536014)(71200400001)(478600001)(10290500003)(7696005)(122000001)(41300700001)(66446008)(110136005)(64756008)(4326008)(66556008)(66476007)(966005)(54906003)(786003)(316002)(8936002)(66946007)(76116006)(8676002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?WYWR/TfpNO/nXQda1LkcJK7Tnsn0AW8T/93GUr2rfCdfe9ba0BU6m5FReE?=
 =?iso-8859-2?Q?2sVX7GFCkSrYHovzYA5+8J1G6pep/VZPn8D4NLgkKWziDZK3UNAqEUMBgP?=
 =?iso-8859-2?Q?SY8sJzmKN0QjTtI+v2rlkYEki44ztQ4V1itIxjdPB7ztbyO3fWqQyshFU3?=
 =?iso-8859-2?Q?RaduatRc8evLZ4oIrq7bXvcB+90qSnnR2y3YnsfiivqJ/MekD2RPx60TwA?=
 =?iso-8859-2?Q?kbl1KDa7+xNOP/EuENQEOMuGEG9zkX4US+goJHx3pXx7X9PBulHCkWcWZn?=
 =?iso-8859-2?Q?STHiX67mNT/YKFYyRt1OVLxBpAQ4YAklDaDQRv8QA8NzMQjZq6qOnXQ5Wk?=
 =?iso-8859-2?Q?p/TO5eYF2l9cNc6DVi5YumzNWEajvIttJ543JDYAnVjzN5B1vgIPY2BF/z?=
 =?iso-8859-2?Q?FW0j1Ai2NiDanquef3lTI64ZUmc6YMs17IjSn7OcTYsRs1I5klOaQoriDG?=
 =?iso-8859-2?Q?Mx4TLNzlOevWqAs08UNsSU4frKea9oeghBjhGGZ5hqcQ+hAWsq00MswI6Z?=
 =?iso-8859-2?Q?EJqJI4+/26wkxw5DG5FlM+mDeYKOp7vTWCaX6lR4Ybqr6CGW/9GusgcXrZ?=
 =?iso-8859-2?Q?Ft6s1sXuXSQed2febr76VwxR4AYdaSCBG/Ei8F9EqCqFJNNr3pxbykig5A?=
 =?iso-8859-2?Q?7L66/GyWRbPrXxyWhD4Q1NKZ5rHLpd+WfcgMsJf1ePR6ng5eUxl0/XBQMr?=
 =?iso-8859-2?Q?DSLW4mFXOwkrhlx9j1nD0EaBCI8MkocumeTDxdnaVsquu+VBJY6VcOC7r7?=
 =?iso-8859-2?Q?U0BhZUpNkY78pp29OsicLUhMAkWVCe3ok6f765JoO//nmPQJpb59hanuAr?=
 =?iso-8859-2?Q?+mJOf6zmWqsnq56PQjCmNfam1HPbqO+OecNJ5B2S9i+8jFVFRXa5hDqyvK?=
 =?iso-8859-2?Q?HBoLLyrpgHaadQosb6ujP0bU3ZRaB1GOHexl+4oJXRkSWKqluiInHIHEnX?=
 =?iso-8859-2?Q?Jp+zUVECWBbQ4ZEZ0Soxmd1iwRXSfn3aj2hZKsvyN5Uj68A13YNftUhjx2?=
 =?iso-8859-2?Q?rI15Mv5lxGDji2O7eRK3jYzf1rKz43Bnc8sFgMa1kenYITrTnHgLAvSQaV?=
 =?iso-8859-2?Q?Pc1sTdtKfQww0vXwJpMLyUhwZXHrmnyr84N282KchGonI6PK56CHQJiGri?=
 =?iso-8859-2?Q?rXTnG18pTaZML218YyXfZ5TcIo3uF8lMfIEyjSkhnhwKggu2mqdO9Nple1?=
 =?iso-8859-2?Q?7lMhbuJFSMWmc0po9feEbAJZIwUD5TEDjaJhSmsaJVl6g73faXO3q9x8Fu?=
 =?iso-8859-2?Q?hGzzH3hGHTo8KItdByZXYsfT2oDuvykSfgUuVuE02KI7Z0KC1zHteIPJqu?=
 =?iso-8859-2?Q?natFRMWEqQTqI5E+ZfAVj258qD8j58cu9GvZoZOoPzml3zzNbi9JrbuxFr?=
 =?iso-8859-2?Q?1fFnVDpWIApnUgFcCBB2CEGrRIkv5az5gFWAbKCSYUQ0JPX1AmNoEYGCgt?=
 =?iso-8859-2?Q?qEBtVTyklR1dnrdrpTomYhZzymqFoxHm3IsdokF1bpyfOag2XWOfxTqjVB?=
 =?iso-8859-2?Q?OpIk+dKYXYGgg06/25NPfPXFXNmUmsi3+NXWifLuZlm2GbDkkb5Kij+tb6?=
 =?iso-8859-2?Q?3sgUZbYDk19oqHUkSw0fZ+E/XH/+?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR21MB3783.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51e10e02-bcd7-4f1f-838a-08db929b0b4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2023 14:24:40.9633
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PxOnzDRp8BD4GnVCbFsWUVhxPdfCTslKR1A8wFgkeLuYFIhcQw9bZdblbYDZqGgZJWuEbqXs1FCxogi88wAeAsIfeySTLH4TNQDON4rR6jA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR21MB4034
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Acked-by: David Daney <daviddaney@microsoft.com>

... and apologies for the Outlook style top-post. What have I become?
-----Original Message-----
From: Philippe Mathieu-Daud=E9 <philmd@linaro.org>=20
Sent: Tuesday, August 1, 2023 8:51 AM
To: Ladislav Michl <oss-lists@triops.cz>; David Daney <daviddaney@microsoft=
.com>
Cc: linux-mips@vger.kernel.org; Thinh Nguyen <Thinh.Nguyen@synopsys.com>; l=
inux-usb@vger.kernel.org; Liang He <windhl@126.com>; Greg Kroah-Hartman <gr=
egkh@linuxfoundation.org>; Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [EXTERNAL] Re: [PATCH v5 7/7] usb: dwc3: dwc3-octeon: Add SPDX hea=
der and copyright

[You don't often get email from philmd@linaro.org. Learn why this is import=
ant at https://aka.ms/LearnAboutSenderIdentification ]

On 31/7/23 11:33, Ladislav Michl wrote:
> From: Ladislav Michl <ladis@linux-mips.org>
>
> Assign copyright to indicate driver rewrite is done for RACOM s.r.o.
> As David no longer works for Marvell (Cavium), I'm to blame for breakage.
>
> Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
> ---
>   CHANGES:
>   - v2: None
>   - v3: None
>   - v4: Assign copyring to RACOM s.r.o., M=EDrov=E1 1283, Nov=E9 M=ECsto =
na Morav=EC
>   - v5: None
>
>   drivers/usb/dwc3/dwc3-octeon.c | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/usb/dwc3/dwc3-octeon.c=20
> b/drivers/usb/dwc3/dwc3-octeon.c index d578110f7afb..6f47262a117a=20
> 100644
> --- a/drivers/usb/dwc3/dwc3-octeon.c
> +++ b/drivers/usb/dwc3/dwc3-octeon.c
> @@ -1,11 +1,9 @@
> +// SPDX-License-Identifier: GPL-2.0
>   /*
> - * XHCI HCD glue for Cavium Octeon III SOCs.
> + * DWC3 glue for Cavium Octeon III SOCs.
>    *
>    * Copyright (C) 2010-2017 Cavium Networks
> - *
> - * This file is subject to the terms and conditions of the GNU=20
> General Public
> - * License.  See the file "COPYING" in the main directory of this=20
> archive
> - * for more details.
> + * Copyright (C) 2023 RACOM s.r.o.
>    */
>
>   #include <linux/bitfield.h>
> @@ -537,6 +535,6 @@ static struct platform_driver dwc3_octeon_driver =3D =
{
>   module_platform_driver(dwc3_octeon_driver);
>
>   MODULE_ALIAS("platform:dwc3-octeon");
> -MODULE_AUTHOR("David Daney <david.daney@cavium.com>");
> +MODULE_AUTHOR("Ladislav Michl <ladis@linux-mips.org>");
>   MODULE_LICENSE("GPL");
>   MODULE_DESCRIPTION("DesignWare USB3 OCTEON III Glue Layer");

Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@linaro.org>

