Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C18F2F1203
	for <lists+linux-mips@lfdr.de>; Mon, 11 Jan 2021 13:01:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729407AbhAKMAE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 11 Jan 2021 07:00:04 -0500
Received: from mail-am6eur05on2099.outbound.protection.outlook.com ([40.107.22.99]:4791
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729401AbhAKMAE (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 11 Jan 2021 07:00:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l2Qp9vOsTBzohU4J+qLmWgJKjAbOenCQUKGUqmGLLCrOiXcYsqAbe7as3ER+gSSdAr/zVEJub/fUOrWH/Lu/3bDysklnAZ3nGZpY5PbPlOjtoyIBnsUOQ9UTkZcxA8Bftp7K3bDfABKQByWv8aZ5KJ332WMO3vOwE4ePpzkqbuHlNvQlQEnH2lA/1AGcqZxATIiTZPjxsU9fvBkS4ppR66Osc+XHQh16K8ESBjYO+8bbGUHIcwrh7IBZEDtgdMHgyr2t3avuOQNCQC9Xv66o+rblDxx+o54HQMFs5VwHQ3PT9HZXOAfDBp6O8IU5iQCrbuMevk39naXme2XapPi+5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DGD+rzCRrhGhpldb+70nTPAlI9uB71mjbB+qkI1Rx5c=;
 b=TVmb279gv6wmVrJi56YBwGDDQdC8QaxgvM74C0scpZ8dDr1/YTsZ3cZ06fr0xlGIIOxHUP2oqNEtDawM7osLX+fSpsJUdFypKJ2M7sNTFZ3Vp/tE0rE7thoBFdMY4LDmKSD0DSsoYu5SomzBnZUSjcu2S804iiv8mPjfGxvcLH6Ue1dOUGRgjxdS1og4tLN9uNvPrHuP0emcIYqUP/zYIjAcwQjYpWC5SyNod6IKPu+u2AYx/+E0E5EwcHxIlCcsQs0ybOhz9Cf55S9nqn82ct+hK3o2m6i4QStd3LK+rwkbHZmHOy8EBri52nTIS/YoQzhvhCdq4brRMFTk7rT4Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com;
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DGD+rzCRrhGhpldb+70nTPAlI9uB71mjbB+qkI1Rx5c=;
 b=HQ69/MyGd5S5/6yfX3MLRZA9rx9tK+R0UU9Gy8S0Wp6lNU+ZweYBh4CdzCUIOIhf/cWQKTe4Lha6xolQlDSVRrmNfArJ2qy7sQJOce3MuZ3p9+7bN5/MdnrPJBPiosLOSuuWy72O92A+R6XlFeDjT6RGupn/8mBj28a8FC5UxU4=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=nokia.com;
Received: from AM0PR07MB4531.eurprd07.prod.outlook.com (2603:10a6:208:6e::15)
 by AM4PR07MB3092.eurprd07.prod.outlook.com (2603:10a6:205:7::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.8; Mon, 11 Jan
 2021 11:59:12 +0000
Received: from AM0PR07MB4531.eurprd07.prod.outlook.com
 ([fe80::e965:2884:260b:b29a]) by AM0PR07MB4531.eurprd07.prod.outlook.com
 ([fe80::e965:2884:260b:b29a%3]) with mapi id 15.20.3763.009; Mon, 11 Jan 2021
 11:59:12 +0000
Subject: Re: [PATCH] MIPS: OCTEON: fix unreachable code in octeon_irq_init_ciu
To:     menglong8.dong@gmail.com, paulburton@kernel.org
Cc:     tsbogend@alpha.franken.de, dong.menglong@zte.com.cn,
        colin.king@canonical.com, gustavo@embeddedor.com,
        ralf@linux-mips.org, peter.swain@cavium.com,
        aleksey.makarov@auriga.com, lrosenboim@caviumnetworks.com,
        david.daney@cavium.com, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210111113605.3863-1-dong.menglong@zte.com.cn>
From:   Alexander Sverdlin <alexander.sverdlin@nokia.com>
Message-ID: <d2ed48b2-2043-a9f1-ea7a-2fb5c4027c57@nokia.com>
Date:   Mon, 11 Jan 2021 12:59:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210111113605.3863-1-dong.menglong@zte.com.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [131.228.32.169]
X-ClientProxiedBy: AM0PR08CA0019.eurprd08.prod.outlook.com
 (2603:10a6:208:d2::32) To AM0PR07MB4531.eurprd07.prod.outlook.com
 (2603:10a6:208:6e::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ulegcpsvhp1.emea.nsn-net.net (131.228.32.169) by AM0PR08CA0019.eurprd08.prod.outlook.com (2603:10a6:208:d2::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Mon, 11 Jan 2021 11:59:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f3c7cfd3-71ef-4063-e83c-08d8b6284fab
X-MS-TrafficTypeDiagnostic: AM4PR07MB3092:
X-Microsoft-Antispam-PRVS: <AM4PR07MB30925AB8D083C9CAE5B448D288AB0@AM4PR07MB3092.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1265;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: efyIdkykFg9eB4c4gpNyG9K3Lyd3/rEpFEStmQ0tahlp50Jldhmu/xyfOBIF1ej4dFPQsM05PkZDueLnH2BdMf5H8QkLQ3kTBy9p0TieIGmNSC3eWUt9RXHpkSGpWO3+sSaLkVaMpAewct/KPQlr1wR2xHI15v+lSDKRKOFNG2NrHY1CHNCwfjFnZ43CvKL4wM2SoTi3ZXOV/YlBWZ2VgNKNOeN/HnJQ7S3WAYvyWKyEcje8QTnFUSRkoKTorw92Qd/qlCCqdu2YyI5LzAooAFUyi3JgPySgdAkuQigBfziM/hUqgGiTWsZaSYeEhDn28OEBZOcSl8H5LYEVoitIdyxGSJlc1TK0nRAgWkmXDCiDonkh/yyFfrWmuUjdBwdptQC+Y2kjJLIvv+LCpKxPtxLkg127nVS5Vgc1YpYjPJoqofZV0KBwVl0p9P3NT7RDw+R8RlRlXmUOEg67QZLGBI4lqgqiS0CT+DYvHMSgaLo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR07MB4531.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(366004)(39860400002)(376002)(136003)(4326008)(66556008)(44832011)(66476007)(31696002)(478600001)(52116002)(186003)(26005)(66946007)(8676002)(6506007)(31686004)(53546011)(16526019)(2616005)(8936002)(83380400001)(6486002)(316002)(7416002)(6512007)(86362001)(5660300002)(956004)(2906002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SGhFbVB0ZXBEYUxZMDlrNGQvM05pOVF1U2NpcUNKSk83SGxheG1iUW5YRndl?=
 =?utf-8?B?a2ZHRXREdzI4SmpRSFlHRUNYUUFHYzhCcnpGR2orKzYyanM1L05zSi9DdTJw?=
 =?utf-8?B?UnZaRWorUXVsN1BUUy9aaE1UWU9CU3cxNHNld0RxdkpacFllS0xVT3ZVeEsx?=
 =?utf-8?B?ZTVmdGZOYjBCc2dmTWZDV3pxV1poN2ZBb2hkVC85L29CSW9Bb0R6M3hUYUxS?=
 =?utf-8?B?ZVVKSjRkTTJDbHFrZ0o5Vllaa1cybnhzdEY5R0lHM3NWTTVmcGN0WlFKM2xT?=
 =?utf-8?B?OTkrZ2hhbzF0d2QzZWc3MzA1ZEtyTm13MjNkRzIxZHM0WXArTXgwTVNHNXRX?=
 =?utf-8?B?Ym1LSTdnVFMxaWVsVGppQmpSekxTUXF0Nm1TYXNpRmpEVUZGVjZqWk5ad2Nr?=
 =?utf-8?B?WlRpSDNnSWpwV1hhVENBUFNIdFBISGdra2JJN2JrZHRONnk4UVFLVUg0V1k2?=
 =?utf-8?B?TmtyVXpEUDdzRStnRHB4NGRwOSs3M0pZdHNrNHN2R2k3Qkc2NXYralFFZDZj?=
 =?utf-8?B?Z29JUERGZ1NNV2VyVEFyWWNseDZWbEhRd1VubmswNHVCNzM3dUdreXp3WFpz?=
 =?utf-8?B?b2VhblhMSm5weWdVVEI2N1JLZ1JyVFdFMkxQY3o1YUQ3N3R6aEtWL0hhZnhG?=
 =?utf-8?B?N0QvblNuSTN0Vlc1N2UyUG82Wmk1RkdmdnJNamlwMER6QnB3N2g0RVJ4ajlX?=
 =?utf-8?B?OFRwZjBESGE5QmJXQWZFbFRuSTVEaDU4b0pMZ1ZnRTFkUGl4bk50akVaUmtw?=
 =?utf-8?B?VURGbUY5V2dBY1VSVzVoNGpXNlQxOUt3S3lvazA4bktqUExGODhFTWlJWWll?=
 =?utf-8?B?Y2dNVjhjcU1XdUtuamIxUC92VnhnUnozZ0t6TWtHeThTbEprV3cyVjk4NUlC?=
 =?utf-8?B?NjhZbjl3cWFXWnJvMlJFbTBPV3NXNGVDTTBLTkwrVjdKeDQxcUVKR3hiYUc5?=
 =?utf-8?B?NkR3ejdLaVdSK3ZDNzlXaFRRRU9oT0l4TXJ6T2pCLzRBZ1puamhlajgxUWlE?=
 =?utf-8?B?V21NMndzbmZ2cmdPMUxwdW93RXMySm01SEw4TFc4c1NJWlBPck5KTHZBdHFs?=
 =?utf-8?B?TDM5cWdVdmhSRVAxaVphOUNGUHFldXpMNUYzanJzdXFpL2JjVTRobHNnMWlT?=
 =?utf-8?B?REtlSnp5Q2dTU0pvWWorMFBqMkQ4eEdXdEtDaFF0Q0Znc1dzRnZUMEhMRnov?=
 =?utf-8?B?WjZwcjM5VUJHZ2lMTHlFMlpoTlZNMk9DR0JBTis5UTUxZjMxN3IzN3MySnlv?=
 =?utf-8?B?ckVFVnZRL0htdS9ZamxiL2g1V1lZaW16clhqRlVDVSsxR2FFRGdObkJnbDdR?=
 =?utf-8?Q?GXQlrXUBJpKZjJXjhKUbU/vg4sHRy7Pxiu?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-AuthSource: AM0PR07MB4531.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2021 11:59:12.3618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-Network-Message-Id: f3c7cfd3-71ef-4063-e83c-08d8b6284fab
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9/fDSG0VjoTOuBMd2osr+1e+6Vd3lnB/cPA0+uOJSmKuLRpFNOFv82RKVcSinOn2BZ86CecKLi633byX1RLuqRIyottAXfspqqQkvYkFsqE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR07MB3092
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello Menglong!

Thank you for the fix! A small correction below:

On 11/01/2021 12:36, menglong8.dong@gmail.com wrote:
> From: Menglong Dong <dong.menglong@zte.com.cn>
> 
> The type of 'r' in octeon_irq_init_ciu is 'unsigned int', so 'r < 0'
> can't be true.
> 
> Fix this by change the type of 'r' and 'i' from 'unsigned int'
> to 'int'. As 'i' won't be negative, this change works.
> 
> Fixes: 64b139f97c01("MIPS: OCTEON: irq: add CIB and other fixes")

The patch actually fixes my commit 99fbc70f8547
("MIPS: Octeon: irq: Alloc desc before configuring IRQ").
With "Fixes:" tag corrected, you can put my

Reviewed-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>

> Signed-off-by: Menglong Dong <dong.menglong@zte.com.cn>
> ---
>  arch/mips/cavium-octeon/octeon-irq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/cavium-octeon/octeon-irq.c b/arch/mips/cavium-octeon/octeon-irq.c
> index bd47e15d02c7..be5d4afcd30f 100644
> --- a/arch/mips/cavium-octeon/octeon-irq.c
> +++ b/arch/mips/cavium-octeon/octeon-irq.c
> @@ -1444,7 +1444,7 @@ static void octeon_irq_setup_secondary_ciu2(void)
>  static int __init octeon_irq_init_ciu(
>  	struct device_node *ciu_node, struct device_node *parent)
>  {
> -	unsigned int i, r;
> +	int i, r;
>  	struct irq_chip *chip;
>  	struct irq_chip *chip_edge;
>  	struct irq_chip *chip_mbox;
> 

-- 
Best regards,
Alexander Sverdlin.
