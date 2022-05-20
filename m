Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D6D452E168
	for <lists+linux-mips@lfdr.de>; Fri, 20 May 2022 02:52:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232937AbiETAws (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 19 May 2022 20:52:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344155AbiETAwq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 19 May 2022 20:52:46 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2134.outbound.protection.outlook.com [40.107.114.134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26287132A2A;
        Thu, 19 May 2022 17:52:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LIvC/RSqFM22JWRN9tUWKgBJeRn7zbY3BfvgNYqrqpno6f6Obk4y7m9G08H3EHfEkl3smqxo3bhrDWMeVmxL9L1ibbUbrt5vN+HIUnuiC+gOaMk+VHhy2AaYLshl3xFlRZcjy6YL8o0WW+JADAQ8RvrFip6CqUJPDnQg/ctkabeSjJQCZWPu2h7BUvX8VmUbFFSX3HmNAm1kK/Il47/CScguc21LGuV8tRKY53as6D4aayFja6c5Ja1yPJsSCCMHkSdhV42X/lGCAcXtNAmeZxyxmWijUrf4WolroVo+rPwccBVlVutfNZMcWLZQf3yPE7Ng0Z3tcB5cADtTRh0yTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dk93yYZ78fH70jm48RrGo2q1lUC1oZWMiDhJ1vv7ukc=;
 b=XjgHnXH0f4wv3zOcQ7fm4E1pRm63Lr3rCYKg9R7CheRxfb34RM70XQULn6bHWt+7ey9vPHb+dmGi7LHGOJs+BRvJVidbknaTX99SQd24Gd1hRsQ2D8oQLe6EME3fib+CW/DCyAzcLf8H8Xl5NLvRokGZ4YoqGaEXrNP4azUr63gwig1k6hihx1s5OtnYSuPoSVE/gAT16vUNm5rIrs0u3mIwxhvRmrib7ylY5cf1vedC4KZoZ6i0WuLdAOxZrLaBxGPdyOZGb9SktlbO/XIzWpRefo6zbH1Yj7jRgKII3WBqgxAzcwvcppylLloQnQd/zfUMa6FEQ07igSQg/bGETw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dk93yYZ78fH70jm48RrGo2q1lUC1oZWMiDhJ1vv7ukc=;
 b=i5PiQpIkRelZMPMYoiRl141ORZ7/6tn7/IUKnknoTyw6u9Fzw6TGU8BdgOtWxYPKjhQ0rQgmT/s4u43xbLiTevC6ub1p9FHbb5Q8Nh6ckQ1FgvjvlCDAC75QRkgSqBbCdlgBAKlZ/O9c7tX4gr4g+bH54TdVRCKWmtic+CiBMCM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSBPR01MB4102.jpnprd01.prod.outlook.com (2603:1096:604:43::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.17; Fri, 20 May
 2022 00:52:43 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::f4d9:ee3d:e07b:171a]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::f4d9:ee3d:e07b:171a%8]) with mapi id 15.20.5273.017; Fri, 20 May 2022
 00:52:43 +0000
Message-ID: <87ee0p81pi.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <nicolas.ferre@microchip.com>, <nsaenz@kernel.org>,
        <shawnguo@kernel.org>, <linux-imx@nxp.com>,
        <cezary.rojewski@intel.com>,
        <pierre-louis.bossart@linux.intel.com>,
        <linux-mips@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
        <linux-amlogic@lists.infradead.org>, <daniel@zonque.org>,
        <srinivas.kandagatla@linaro.org>,
        <linux-rockchip@lists.infradead.org>, <krzk@kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-sunxi@lists.linux.dev>, <linux-tegra@vger.kernel.org>,
        <linux-omap@vger.kernel.org>, <linux-xtensa@linux-xtensa.org>,
        <peter.ujfalusi@gmail.com>, <jarkko.nikula@bitmer.com>,
        <heiko@sntech.de>, <jbrunet@baylibre.com>, <kernel@pengutronix.de>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>
Subject: Re: [PATCH 24/56] ASoC: test-component: Update to use set_fmt_new callback
In-Reply-To: <20220519154318.2153729-25-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
        <20220519154318.2153729-25-ckeepax@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Fri, 20 May 2022 00:52:42 +0000
X-ClientProxiedBy: TYCPR01CA0027.jpnprd01.prod.outlook.com
 (2603:1096:405:1::15) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 547f7806-f412-4966-4917-08da39fb0c4c
X-MS-TrafficTypeDiagnostic: OSBPR01MB4102:EE_
X-Microsoft-Antispam-PRVS: <OSBPR01MB410275F469BEE921EC8FB4AED4D39@OSBPR01MB4102.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rm/DVJHu8NXwF1WkXL7b0Mhn2cWYnjcq2jR8MKdSQx5qbDICHiZasecn2Enq+W/4QuVl+kg8bbO0SogDMuTxIBHlS3IgEzierwvh4zOC99p6BUawihenadjgGfdzFijPc7KN9aN0BLj33/nkkk4y0pBY+OECWy8cGTiydBzw1I1bnYRr0Fjz9nc3GtRtLml3ZYKSW5/0bpHnNPjEaOQ0gRj6JVEetEkTBK8lqKOHTSBJg7YuSdoPj229K2huOdWeWGVAUWMPTtczchkfqFvq6AKVwP1v9QdkMwnr4tH0j28TWG2bhoEikIrwAMufclr2EGa2T3F2BegxpZ6chQQk4n/NUTZPQ97NGGCFmBgYQH9Qyh//OlI0woQwZsyXQT5IQ36CuEu27fQHCY24sKk9aihb9ERGjmWGZvlIVFLWtOY+q1QuTO8uUJm+21LIhuZvzfVh0CkFB9C8lLJEZl5Qt0HtkxJqV+M94EFyO3nNTxrwY4HNOAyhIVmyRgNuxBMOVeB0Nf5peyR/i1AmM1d3nxYfQHRcG+mpn/zBOJBDKgebHx1s+akIKxQiWrGs2kEMhPDyABZPXkQj95eN1S/RgGwk8Mb4WhFOI0p8EYRgQ8eCp4L1nybzYSkILEZ24rBP7yrU4dJ0agQ2dr0WZQXiPww412sBdPpBXB+dB6mUXTkfehnucqyKH4O9N2agT93jKXDFXy+z6YWKQcMlyTUfVw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8676002)(66556008)(66476007)(66946007)(4326008)(2616005)(5660300002)(38100700002)(26005)(8936002)(7416002)(508600001)(6512007)(4744005)(6486002)(38350700002)(83380400001)(52116002)(186003)(36756003)(6916009)(54906003)(316002)(2906002)(6506007)(15650500001)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HY/sG3+lAtm7oHH14LCXxxsqbx2uoUcsiTJSwp8Wczctegc1GKoqbWmbOq0h?=
 =?us-ascii?Q?51j3MIQy3ey/A8BVSruyXzdBEF0If4LEOdJlcATpd7BRecD09aBL905v6DDw?=
 =?us-ascii?Q?0emQGwsbYYT1MAWSxxIbUH9HcJI9MIEB3BpFAV4BPRbVp7Z/xcYVpY/I9AD8?=
 =?us-ascii?Q?gtHmbOGW+DVMvlFb5LF9dOVuFzezASYJFhJm4CtPAfBPDCnLb7tQBjia+h6p?=
 =?us-ascii?Q?VNnVGgxyWie76c1xiyb8CaAsnG+ZIPfKoVeV6H8Erzy8SSXEN+JoIgRVVTw8?=
 =?us-ascii?Q?jpb9TWUN9N0OI+Q/ph5tKza7PBVdyc95eDJcJlXZoMXrmUJMbBE2ieK2P/lR?=
 =?us-ascii?Q?2scVcXSsdZUq4YMdwBk/aq6U+9r9Kd22ha6zzImfocEYHzMwCKu5CPhIsRuq?=
 =?us-ascii?Q?bIoin2yIxFxWqOxdrffrkn8xeID742O7JVray6vjCtfiQfdC/eEutVI9t933?=
 =?us-ascii?Q?bhm7wBXnnjzXEugT1QuoheDG0tFDd4o8Dz/LJlflaywRSpvTZmPFCfXFZUsm?=
 =?us-ascii?Q?PwHpfc/lOoc4BAcSiNzy3MC7rkpxc5rbhhbtprhnHmEnp45sUTAg7G3IBrxQ?=
 =?us-ascii?Q?SC3M18N2EdG5jeRiIuNa/H4EqojyQ4hk+qdUkZNKMIpStYQS7Nw7kUoRjkdS?=
 =?us-ascii?Q?rIby7ZP4wfB6vAmPnbbef1NUCKfP0nGK/oofoCEuzGDOyBTGfW7sUz8Q8TNB?=
 =?us-ascii?Q?gfaDVzD8uROtZhokMbzfcrW9cs05RyAMPVZujKKBDx+G56hFlpKhVNBVXhLd?=
 =?us-ascii?Q?CZiscXPTAlX643A2MEMG7yJ47cnSbdmi0le/QrRgIe5XKAn3rwapcEmShi1F?=
 =?us-ascii?Q?aXBtJ7ZIAgcRTzlP2j2fYAOMnmXYBr4sRplZ/BJAEuUMhTrunGDOUdr+fBAT?=
 =?us-ascii?Q?44bStYrTfwA7eLOC8AeeL4mTJBy3Wpc2ivu7xkPMKDbAphzIqhUo0OlH2lkm?=
 =?us-ascii?Q?uZBUpgsL7aMsByNIKIhhj6ZFzHlHvCYpX2JgeBUgVoOpz6ohakBvW278ZlCS?=
 =?us-ascii?Q?mjZbT5lAjki5Fm1XiIz9FKPiNpWgF66gKxgZtwBIT67LtIEF2HYeqly6leWN?=
 =?us-ascii?Q?qYmRRFSK7gWS659+k/e/ze9rqo6PF0NN4fR5/ahcPlUw20ribSFx/HI3wYdo?=
 =?us-ascii?Q?zdQ9AZ0YJFxVsfHY3fqsiKo0boJpOXEZ1UlPEhRGUzyQqpxRhdG+L5lbQ6C/?=
 =?us-ascii?Q?IdGpzhcczZ4xks9r4oFifQlf9AjD/+obH+/AwZUH7b4VFHwBGUEkBIf2jFCF?=
 =?us-ascii?Q?4fslCm4YN+YED6XyYBUj4H4WD6U22zNipI4GCaRoppn5UJ6v1rF5bBL93pHg?=
 =?us-ascii?Q?wykK4XnXzYUftoX6BXpG+sZjLZ5OYb7jc+qgH0mWLxxVbxXcGJpfU6kbJft7?=
 =?us-ascii?Q?MykfefPqEGyJoHyzn/CX5bD18byucXRoQPZVlPtxjepCFAQ/AxZWDpEjlUqK?=
 =?us-ascii?Q?lDjutvl34zwVdC2P4Hrwq4ZjVDPhzjlcjFNZZjJysGC97bxwW7mjIc6RclJ3?=
 =?us-ascii?Q?ZQu4MgXpuIW3z6Xqruxx/T0ondNORtIqVupXYNfd7vUc5JYAsqe9EzNYBHQH?=
 =?us-ascii?Q?qDS/Pdf0DNLk4IowM1tpAmWibXY2wwQIICiqpwsWYKuH3aiSXDgF2XhkhmXI?=
 =?us-ascii?Q?3hSKfbP27+wG2HEWRXLfeutJHuKq4Qf09ff+neMxAUmv3VTPDzMhmpbT6kK4?=
 =?us-ascii?Q?XpvzwkZT3hNFUVH9QJdJXlHjHxwScOaKFP/4IW1pwirooM2BqAHe7DxFDxTv?=
 =?us-ascii?Q?4nKuMPzM6Wi1z/XoHpDIrD2eCld/nhYNNTR0v3Wr9/vqldbdOQD/?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 547f7806-f412-4966-4917-08da39fb0c4c
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2022 00:52:43.3510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X3oj40fGnEEaOhT5AtKMNk4I/C0p747/oRFe6iJoLg788YBMI7iWLAFU1J2esrl11lP+el5F9o+8S9/xIURyjXLNuYss6QzLZWu/KR7Qe7HKJNv/6b9C9h+GIHDYObBP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4102
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


Hi

> As part of updating the core to directly tell drivers if they are clock
> provider or consumer update this CPU side driver to use the new direct
> callback.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>


Thank you for your help !!

Best regards
---
Kuninori Morimoto
