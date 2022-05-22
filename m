Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A88A5306B4
	for <lists+linux-mips@lfdr.de>; Mon, 23 May 2022 01:26:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231666AbiEVX0Y (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 22 May 2022 19:26:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231317AbiEVX0Y (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 22 May 2022 19:26:24 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2116.outbound.protection.outlook.com [40.107.113.116])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FAF4BCA3;
        Sun, 22 May 2022 16:26:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iLTaWden5/JzR+9N2YQR1xIOcKaZ9DgNqRe7w2jPeO+N2NOb/N+s24DOkvYqK+dUyBXP5465PpKy07aFSdwcTlThCroh8/VVx1JOvzK9nnlCnIA2uztvClcXjVURean8CUgE3yIWOwPq8ZV0HzFwxOg/cmj1j3VHLSO3gDiuKT5/HPA998mzD8rqW3AhksDo0df9SZHoA6Cuq3qsd5g6hogZoGx/2xYaPRsanhlO9xMdgRT1G4hNq5JIIzw19tgPOXNVTOxA403d4ceiNRmYW7QfD/rc32ZDCMLwWw5SEzV82Gs2wt2pnEeRBrbML/ohMPJBmhfuTd7jy8wIX3MorQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mfkbh7VD/OXUtCIUM1z9Wp8Ezx9Pm3IQNN3ZSESLMrM=;
 b=VMKj+WWc2TmsZMQe7yVBf/nCeZ9wShjMzCgR1NVz2YDx+vh2yUy6LofW7qfenmUFLXfC+t4zMV1t6ip8Kwlp41Rp7VBRJsr0dqy92ZgI/KpGBr4YhrxxUlTn3joskfZHKGwcTLQe2Y8SWC894at/avuVSWsJYTHOi8lwIoDwSqy3Qv6sg62nj7Q1sTNZ7TqImKGs4N2f2cVoqHfn8oldzJcV7eHvMF+GRc6NgvFyIRtM9VDiCm2EmEC6JyscwY3EKPJ9VtnqVYAESzXPGhdsV3QzEgUe31iOPdcS1GzAvxCb+xSj/06pj8caR7XnbFMUYd4QjBMuazAsvceusauwRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mfkbh7VD/OXUtCIUM1z9Wp8Ezx9Pm3IQNN3ZSESLMrM=;
 b=MYwpg/ShrW4rRZrPccr9ODIRkua8uWJ31OhNObN4vGXEjnv7J3DbPOBSj+mPvxtuNRz7V497J6193G8cRH1fsCveaMn9SpmAMMDqZxzMmw4wbegNmpIScnS/VadzxeSnf6+oi8HQ/HWO9FSADjpkVO8ENqy9/ZDck2bWdgputYg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSBPR01MB2135.jpnprd01.prod.outlook.com (2603:1096:603:23::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.18; Sun, 22 May
 2022 23:26:19 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::f4d9:ee3d:e07b:171a]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::f4d9:ee3d:e07b:171a%8]) with mapi id 15.20.5273.022; Sun, 22 May 2022
 23:26:18 +0000
Message-ID: <87o7zpno8b.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: Re: [PATCH 56/56] ASoC: simple-card-utils: Move snd_soc_component_is_codec to be local
In-Reply-To: <20220520102447.GL38351@ediswmail.ad.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
        <20220519154318.2153729-57-ckeepax@opensource.cirrus.com>
        <87czg98193.wl-kuninori.morimoto.gx@renesas.com>
        <20220520102447.GL38351@ediswmail.ad.cirrus.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Sun, 22 May 2022 23:26:17 +0000
X-ClientProxiedBy: TYCPR01CA0118.jpnprd01.prod.outlook.com
 (2603:1096:405:4::34) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 57841910-a5ca-4c34-2f6f-08da3c4a78e6
X-MS-TrafficTypeDiagnostic: OSBPR01MB2135:EE_
X-Microsoft-Antispam-PRVS: <OSBPR01MB2135DABC178B5EB90C0849D6D4D59@OSBPR01MB2135.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /XnFRfnB1iKz6kUjhJAvTrQk1dW8jMWZhLScwW7um5SSE0WYE3UXfpBucI+w8HBtq+OUujpgBMrkmxd/XN8B/CJSKSMHc3WK4RYS9Bb5aCXhULGVv5LDadBgfhMTT2FiEfinsAfC2W0BXweENpIDUGUPz8VIkagGgObZDCOU8pUKNAEocyIuGp+rBiN+grE2tPIgrsz91DQnGfDURTEILXJeQJKpbeBA2iLz7Dypkh9u0jpUOL+Q83OK3pA/mnsQ6j2LD9QVFgKpsfPWszU6N/xtOJnLv/v8F9bhi11b9x17OYeW/m01ZEeTbZeoM6irQyCESmspA481abQdfBbbmElctECqIEROeyT+fa40GoSgwDJ2XRPwo46WmOxOocTk3g1bzYojqE8DKI309cauiGGAacEvxaCALmaP9nqzzeHhGQj7HS2Bir8s3/fp04KdSPhV459lMNEKinK+pfYgseBdRSnVeBf1Dd6ZUbVJc+hvILmnxK2ycGOycTNtThQc1eXirHg70GW3tkPnvlkAAeD0O+jFPSQLOiqy913JALUv1BfmyNwpg8jCxK/UOPWE70TdmMzI1VwVzHL7nwUzRfQ+CK1/Z28HdWriejLG66nSX4qQcDcdUPVfoMtQW1Lsx2xcljycKWg+F/i8vh4hMeYrvzOyNZ0FfgpIQuNvXNnLX7Vi3tKMy2zCASj8GSg1
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6512007)(2616005)(186003)(6486002)(508600001)(8936002)(2906002)(86362001)(36756003)(52116002)(26005)(6506007)(38350700002)(38100700002)(4744005)(316002)(7416002)(5660300002)(66946007)(8676002)(54906003)(4326008)(66476007)(66556008)(6916009);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bHVvLKJD1+8MLk9HC6CzPk3F0IllS09LMNecicKCZb1BxEb+ZwmpSnTdTaHV?=
 =?us-ascii?Q?SlCkpRhJ5hJUWFnLi15AFXAFaDHjRKUB0BZgrhxnrpXke1ZxfZgd17HQuHqo?=
 =?us-ascii?Q?FCQVF8SwveS2n1d36LzKcBV0IZmEs8IfDOdB6/Hdu3Zu70mB18exZfiPM8gH?=
 =?us-ascii?Q?GyGkM5zSlQ1WEHqNLj9cC5QF2XxIRJ7Myyp7F0CqbQYLkMrvbdTBZn62cM/F?=
 =?us-ascii?Q?WWvjLIiucbyHtHb7j+Q04jNAXHqncDNFGVIo7/KOINvk8E2pPQY6Ca1y9vow?=
 =?us-ascii?Q?RpUwFPJQr81krG85bBq7uE1iJn+MJKi22q+G+iqZKJlVtNQ0JUI8sIJC6TYf?=
 =?us-ascii?Q?FioGIo3QCClvZIAbOh7kCG2gGHrGsiwj5K2TUiHctAH0GNJhnC6aTR+v7DMc?=
 =?us-ascii?Q?NGgd2RnZsGnK8USIMs1O91x0uz2WWMHeMFDGZuN63wNQZmrOT9PmyDnGwon+?=
 =?us-ascii?Q?qUvnztgK/MIEoo5oFZaEYlT+JrumCOdbwZuO+a134UW5itk54Scy2AT6QhBq?=
 =?us-ascii?Q?al3aUCq6Q3bLIWn51/j6WJQtNU2VdDgkQdZAgJIyi+uUE1dlZctfJQlVA9An?=
 =?us-ascii?Q?j0Z82uo2ZJ9OmyZKnQ14obMzxm/V9UEe+65BGZvJ3tchQmmZnxxTQj5YPzYg?=
 =?us-ascii?Q?RoWMvX42ojR+10V58+wRfEYs5y+JfasNothygxv2oegigS4COVK33r7mo3xe?=
 =?us-ascii?Q?loRfzWGISFriDts+ni2cIaPylUr3NZ7ht46as81t/xspZF0acnlokeKRz+2S?=
 =?us-ascii?Q?PJ5yxRKG0akWooJOWcXBPl4lTDjq7XhzFZqVkfsqgiCIRhj9h9anL/jC0AG9?=
 =?us-ascii?Q?UmX29ZLgaLNm/zfjXCav2ms2ALY5QmNseHFltvr6l7a60w4gLrPUw8QXvbEf?=
 =?us-ascii?Q?QEVCuS5Csc/r2tkvYuZOfpoDCct/yFI1Xhqxsmqasq/OY9FBinxYLZ1tqzsg?=
 =?us-ascii?Q?c2gtp8l8VBOxU2wrgCx4PkYeg5JEi9AUwV5TrZlrhTOLn2LSZSMIV4J+WAqJ?=
 =?us-ascii?Q?jwGwv6q+XKSpJu75qgdkN/j9jYXAPWP0uCmGRjzY2mJJT+RpDJ0x1UQwXiCx?=
 =?us-ascii?Q?pUnNH4u1VfBxqtby++G4/zLKVLgL7Va93Ytk+FVxy2ieA0QkUGeO2rXIrQxR?=
 =?us-ascii?Q?I7GfO5PtHEFmJZlEP8a9ERA5SXQsW02R2GoQuST8ypcPHMFjCdwfUMMXQJsI?=
 =?us-ascii?Q?MRP2gXJFmAtMMkbVxFWoRWBGU6fhKR1Q0apUYdxIuI2QwxepHvQRduCJgP4B?=
 =?us-ascii?Q?7+XNWMU6qFPpoXrM7E+liwRQB1PYxkVhpLS8kOOWfYVaTzHLn2BPY3eXprfz?=
 =?us-ascii?Q?0rT8fRG+1EahoGSpkERDuCYuzvSO9FmakY63fJmWxVJndNFfGIXsm+TCtxpj?=
 =?us-ascii?Q?cqxlTBwNIDrBUaYz9sgyIp60q+8yLBYfyyy8Q9T0fGXa6BSnKQm0kipFRHv8?=
 =?us-ascii?Q?F2PkVMd5hlZ4wJbFAxPwU1YckAVYdERiTRxAWxgGxjhstH92CIqhnfYfIijQ?=
 =?us-ascii?Q?Cwe2Oans0g40o3rkBtr2I2wZwtaujMnDEG1j2Dzg+syeuP0wCAjvwYiSSD0w?=
 =?us-ascii?Q?OR6ZYYqF4qsoZ+hp9sslH2X0cEHV+Liz/argPe2ijIn/TwI3mqTR0sugaAu2?=
 =?us-ascii?Q?YRU/oir4E2MkfgV+4j0NG/Xxx58OQsDbS7Y29prsK5KfErhJq7j0FPNfaT/b?=
 =?us-ascii?Q?9r5Ky4n/t6RcuVCbTOSDfo69//s8UVFai6uPOyM9Zaf8JNeZ5VSYqhTKRH9/?=
 =?us-ascii?Q?ldn0FkpzzXAu5wOkp4vq5l0Ka9+AJzmqfBVIwrHIauKrGV18+1lX?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57841910-a5ca-4c34-2f6f-08da3c4a78e6
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2022 23:26:18.1818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hlNj65R1lxLQAFo8gcM3bkjtX5l/pK2ioU5PbOL+8bwIGeez3ke/GWpr0NYKlNBKq8HvJdODG1IsuYT1jQNJma0qdaTweBQ8KOsAyox6ycYRRaYZUlODCva2890LfEIw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2135
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

> > -	.endianness
> > -	.non_legacy_dai_naming
> > +	.is_codec
> 
> Yeah I considered this but it didn't really feel like the right
> way to go to me. Firstly, at this stage we almost certainly need
> to keep the endianness and non_legacy_dai_naming flags, there are
> corner cases when endianness probably shouldn't be applied to CODECs
> (as noted in my endianness series), and there are platform drivers
> that use non_legacy_dai_naming.

Oops, yes indeed :)
Thank you for pointing it.

> We could add an is_codec flag along side the other two. But it
> means a whole extra flag and means the the core is still requiring
> a concept of what is a CODEC driver, which really we want to get
> rid of as part of componentisation.

Hmm... yes, indeed.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
