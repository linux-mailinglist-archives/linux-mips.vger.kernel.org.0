Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 461672FFB03
	for <lists+linux-mips@lfdr.de>; Fri, 22 Jan 2021 04:26:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726199AbhAVD0j (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 21 Jan 2021 22:26:39 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:58072 "EHLO
        esa3.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726030AbhAVD0a (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 21 Jan 2021 22:26:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1611285989; x=1642821989;
  h=from:to:cc:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=4vz3LQZdj3cx8wRes6tQAU1rR36bMX2ATApGOapVqxA=;
  b=U5LiOIxRRcgVRHMzDeHv2/XZHwQ9GK9XL8Ne754WtO0FB6B+Viy3i29d
   1bpfFSAI/JN1/tG/foY86Voe2y5Ga6+arksJ2TVppVOY0YzxZ3iWVjU62
   2dPTWExR3DZ9SDc9LDLdz3Xqhm07fSOCLlgL0QSZLJZxCLXtI52y/fb/M
   csHY1PlisZ6w6grDRJxjkSnMHKFdqDAoxoaw68/vRzyHWnG2P2sXG3aa2
   Ko3a/wM+3ZXVQ4rKbPasxnUXXn1Q3XKgB1VRJwVMvtPay9o6wJJpjIBRd
   cQZrH8vAneXDEspHnM1lMwIuXtUhvL3QFRSrC7VTtN67xnT2KoQc8cMoc
   Q==;
IronPort-SDR: rw+Ejd44qGbbQnfbYkykoSBQiRopUtW4I0rm0vlbzWblsGKjv6Kw9IWWR0vkUFS3NH3iNTh8nZ
 8zwSDL5WQE9QAyRJGduRLZ+3Q8NAjd9asvShLNc4BXTfLm1icLHNvlvGvDR+/+RKaZZpqxOEGE
 3HPAwUsdDdJh2eRv7bwOvXRgaqX7xSFSVAiTLt3cLfSsyM+pLf3eEy+/CtMkqT4+ItUuBBTrdY
 38Zbfj3RT9vf1MBYytemyBK1FuPvSILjhO9cb2m8cWe50HK5q+mtvsHfJ/2jLiPAIIrt1n+DOu
 Qss=
X-IronPort-AV: E=Sophos;i="5.79,365,1602518400"; 
   d="scan'208";a="162490182"
Received: from mail-mw2nam10lp2106.outbound.protection.outlook.com (HELO NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.106])
  by ob1.hgst.iphmx.com with ESMTP; 22 Jan 2021 11:25:21 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FIY9nJg+630+8dzjypHdbD8QeVcO3ynqUo0HwusVzHRDW8yuAgkUZmi7f/H0EBtxGx5qywnptC+ELRW5XCwuEva4HSx2yzyGZrFWi+6C5N/ZIsprJnoo8SoWUeIxhh2OGb1rEPcPWcWbV3W/flzxWAxgRj20WbjrZnI/OxvzizxvXn3U/tUw8ASwxckVyVAEI8b4H99qwu5oeUk/VtzBNqVE7HtL+NLzB6IR1tNB/JP6i+YSsHyNwPOGloymPoGY9ER60TK28X4ujIPnStXUr/8eUbiy+DI9xFbQQLiHogz1MouHQimfkY5Kja2ajGhDTbDW1/rdUC0SAlhA23OlxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4vz3LQZdj3cx8wRes6tQAU1rR36bMX2ATApGOapVqxA=;
 b=j0XobWRqL4XFpU/rST7nvmqmlfiNNOmMVxZfq374eM/OfpHZzrUEm2H11GlQcOfL76KFUVasxUsfeHTveh+P/te8vAWk130zGKIU7OR7TeJLVii7WlDMNd1nCnSSQTOFHD6d5gXowIfzzXauRagw7C7lW2964brvP+n2uqbPbYVS4AF1NAFu7Pn/435U3GouZyLj3q2vC0SmwJwpwL7RKGOYuB4xRmm4caJ8oYa44Vu2hGKZ0ogQKstqutT9pe/GNYPZis2ANF37NqTcPN8bt6QeMpUCUmj1J5+Z/c6OqJfQymE48v5WuW4aNm/DTBSx8oxU+znLTk+z1lA0ykKo1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4vz3LQZdj3cx8wRes6tQAU1rR36bMX2ATApGOapVqxA=;
 b=aPM5uuR6IcnBUe4qGdMBNjNUWf89vma55iRRCarHjfHyAZnqhsgZhmBttifdyI1avII+DoiLYNa4ZaSyMYlQuPzr8mo3YyF/UQ8SkS2YPEE6X7eDljBxt59ypcwMO1Mpu0Szl9Hq0oF4A1xaaI4KV6gCyl2DFBWtLtkD+XoDNjY=
Received: from BYAPR04MB4965.namprd04.prod.outlook.com (2603:10b6:a03:4d::25)
 by BY5PR04MB6961.namprd04.prod.outlook.com (2603:10b6:a03:22b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Fri, 22 Jan
 2021 03:25:20 +0000
Received: from BYAPR04MB4965.namprd04.prod.outlook.com
 ([fe80::716c:4e0c:c6d1:298a]) by BYAPR04MB4965.namprd04.prod.outlook.com
 ([fe80::716c:4e0c:c6d1:298a%6]) with mapi id 15.20.3742.014; Fri, 22 Jan 2021
 03:25:20 +0000
From:   Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
To:     Lauri Kasanen <cand@gmx.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>,
        "axboe@kernel.dk" <axboe@kernel.dk>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
        Keith Busch <kbusch@kernel.org>,
        "hch@infradead.org" <hch@infradead.org>
Subject: Re: [PATCH v8] block: Add n64 cart driver
Thread-Topic: [PATCH v8] block: Add n64 cart driver
Thread-Index: AQHW7+7j81o2oc19D0iSKgHpidQYvA==
Date:   Fri, 22 Jan 2021 03:25:20 +0000
Message-ID: <BYAPR04MB49658B093AEBBFBF61B77AC386A00@BYAPR04MB4965.namprd04.prod.outlook.com>
References: <20210121130205.d2810df601bd00536195c87b@gmx.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmx.com; dkim=none (message not signed)
 header.d=none;gmx.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [2600:1700:31ee:290:475:2d41:83ae:3ed5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 32f91e91-71e3-44e2-280f-08d8be8558c7
x-ms-traffictypediagnostic: BY5PR04MB6961:
x-ld-processed: b61c8803-16f3-4c35-9b17-6f65f441df86,ExtAddr
x-microsoft-antispam-prvs: <BY5PR04MB69618B94EAB02F4F049F1CE786A09@BY5PR04MB6961.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:549;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TvRZ3u5l1WGkaoxBzLdjHaneFTsqqL5ac2geoQKdDwnQcnNXxzljRX/9+S8q/dZBQd4Qk3qcI6AfrYRU+NciJ61ViYTio3EaoJEuaa2LwJrRpRkpXyCEOhZAJ1x22ELOuCVfABeps1/P8hLGFztcuxJaFxnjdp9sCDgHSM4QyLKFAPWmPyW063x3qCTbjwkyA0eIX5Ta3T+blMkBesg7pyzdIwutlOPLFX6QgoyIzl30Q1UXVOKSwCOJZRMCOTtHCMb1XWTu/TcQSFdsYXQOMj9T3qUqXZ5tkcA71CfbqJ7w0CvXzFn4RtH4cr0HeoLSbPNGi1trzp7CTx9wWXWC2sdbDwSfVZjfstFxaELhsbT1s684hrRl252Jn0moDrIXZN3xPfa8ReiLnNFTJbn04g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR04MB4965.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(136003)(346002)(39860400002)(396003)(66946007)(76116006)(4744005)(9686003)(4326008)(8936002)(2906002)(6506007)(7696005)(55016002)(66446008)(478600001)(64756008)(52536014)(53546011)(66556008)(66476007)(5660300002)(71200400001)(8676002)(186003)(33656002)(110136005)(316002)(54906003)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?wTwQTG5YBQ5xlreP2iXZrd5UtcXAdggpQzj7IqKmhgoJ8kjAK1OIms9vkX2D?=
 =?us-ascii?Q?qIP2TlsO7+/Up2XBXqvmQLyIaGldwZ6QtYGv38HOdvXAFYS4t6msIRZ35s7C?=
 =?us-ascii?Q?DXhUfFbxrY8z38chTVke48P2AEPmqU9SVu6MP/XB1N40Mle5Rwo7BUT+YcIL?=
 =?us-ascii?Q?vHH5nYvJge6wXyQADWMpoEVzCQSf6+3X7NWA8XTtHTDxw1uUyiN6sihowUel?=
 =?us-ascii?Q?EiJEWDBudkAKyT2V4H172umJVsWzWc9LqF8fD8CnRxgCie0CovrbgZZtve2T?=
 =?us-ascii?Q?uKHVlnyLp5QRQJiVYY4F6cVXkZUQLFAs8ODT+lbzQsXvwEX2fW51JY70tMdY?=
 =?us-ascii?Q?AaFOaICtHPhcXwSpEGBqouJypJOt/dVz9MFSo/6m0JVWs9lRIOGi6npxxvrM?=
 =?us-ascii?Q?lLMWElFYG2LXMAsXmKaBM77u75eg8iZjUNZ/KKztw/TJ1XYpeOXfDP9ohPpi?=
 =?us-ascii?Q?7MV5DkaTD3u10iTj8J90BFAh1gLMY2zDHHRerQCQVaGJRff8xVBqjTEGdSqX?=
 =?us-ascii?Q?gespAwNxSURncYzyqq6qiBUXVmmcDTMMLu/kIrlG/A/Hixn3KqQhsDXYzm+Y?=
 =?us-ascii?Q?3eCkLKxoYkkxX74H3Mhti+btRFl6jPxUlci6UccgwH7qg2jvXesb6vx0gtdg?=
 =?us-ascii?Q?wk6nEc7FHQXzFa9ywJ0R4fONmdXh1LZmrtIZoxtsI48pJqBYqy86PTh7EibA?=
 =?us-ascii?Q?chOSAWix99JOuBlz69JcLrdaHRJ+UBpFLqB2dd9lW8/TY5l9WvbAVfbJilEi?=
 =?us-ascii?Q?7g0sR8ZThHm5DqUYCbYTwr/O96TLU9TxJewXFwNhsCCCFoHR8YFp5g2GKr8f?=
 =?us-ascii?Q?OJLlQbET1zjf15JZqLC6kz9cXEURS4N6EGNAsHUS57qJlzxpcgITnUUAWR7e?=
 =?us-ascii?Q?PuFWdXmVgakM324SZ6mdzs5YxgyVLlFelhwy+7BuH39TNuHpAkT8QHqP0kiH?=
 =?us-ascii?Q?MeMPN2dfBe8S7ApiUP/ThMiRbsIkhl9fOmMv+lg4I7t+FJ+43XyMxZE9ypEb?=
 =?us-ascii?Q?+BvhBBDFPooUvDfNTfxuS13ZSaTpATDb8sF/bTFb9fJV6Fv/gm/6cp+zo+LE?=
 =?us-ascii?Q?SNtybVGD?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR04MB4965.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32f91e91-71e3-44e2-280f-08d8be8558c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2021 03:25:20.1381
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hYs+JYAKGN46jqKUqwSl77KO4HNrnqNZFz2Kqiq6elOdFO3Ps8SSMN9r/GMlzwQZXciGfFzo5cpStzUd+kBvV6qZOEkGq1R0WPwoq0yHAd4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6961
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 1/21/21 4:13 AM, Lauri Kasanen wrote:=0A=
> This adds support for the Nintendo 64 console's carts.=0A=
> Carts are a read-only media ranging from 8mb to 64mb.=0A=
>=0A=
> Only one cart can be connected at once, and switching=0A=
> it requires a reboot.=0A=
The above lines needs to be extended till 72 char to match=0A=
the commit what we have in the tree :-=0A=
=0A=
This adds support for the Nintendo 64 console's carts. Carts are=0A=
a read-only media ranging from 8mb to 64mb.=0A=
=0A=
Only one cart can be connected at once, and switching it requires=0A=
a reboot. =0A=
> No module support to save RAM, as the target has 8mb RAM.=0A=
>=0A=
> Signed-off-by: Lauri Kasanen <cand@gmx.com>=0A=
> ---=0A=
=0A=
