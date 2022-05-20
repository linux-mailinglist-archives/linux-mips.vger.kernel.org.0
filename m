Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29D8852E15E
	for <lists+linux-mips@lfdr.de>; Fri, 20 May 2022 02:51:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344079AbiETAvN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 19 May 2022 20:51:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232937AbiETAvM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 19 May 2022 20:51:12 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2129.outbound.protection.outlook.com [40.107.114.129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52D50D125;
        Thu, 19 May 2022 17:51:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ham/sqo3cyXvAyS8MGwNqmcUvTycb5abrIOnw+CC7gIwD9YAHlv7cxQxj/ILh9ZQAss/eM/gRGLiRrwOep4u0A93Naa9aXoa/scUfZhN52tr4A2x8BYZ0B2nKhblXinyRRTVsdtHelab7fpsXMc718ZJpCtc1aVXsdNAE/WdMKEgOrgZ2QybJTAhgVu5Jib451Pm/tmFRdqBxzJQoI/6OiyNasdLY2TXR4RQfksx0hGEcNWYrB7e6GJcd/eQtQbMylIL38ZkJ1VrncoY5LZSb4J93u/7C8Y6EW9E+F1J/sMvRaeHKYf+jfZItaxvj5AyizD5xIwbk3RoQN8ehyPy8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uldb51NexQCJIiRN2JQzWK+a41hil9DpVG2uv4YH4/I=;
 b=Hq405XvmJvA99dBijZj8N7hi3KhOZ5HfYf3aE/uZDFsFBWzbW+bAYjWV/VJvNHtOGQdnjulMZRN7RqNfZIeS3I38wl4nETOO4kYlm6dIa4iHCFK7bCHXXkjfCepJlZ3QhFP9fQeOtBpWlhIvp5Zh5dhhupkIA9R0GDv6YbnsK3SlCHJLmfXgrZeqh40vSdxY5U2B9d3ouujKyC+JubI+t47/qhef3Aw+Q+qR42Jre90/bcTROdvvZIibCVEybeDiB86m/HiiYIL3e9nrjuKfr326QL328UhW9c5AjCPP+Gztz7vrdTczFPVsZfBZQ6l3dJaSn/vzkyptpuSg/2SDig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uldb51NexQCJIiRN2JQzWK+a41hil9DpVG2uv4YH4/I=;
 b=i+3+tCYAQ+p8GJaxyQbU70JczUUGgKSRj98MMzD/TAnOxy+vKq1EMya8p1cW2PDcxNXJqd2x9iZUREc/1KnZRvd8jjgzX10fC2BzZK5gYEzm2tDlmXhwM00mXkrwt+IxLYrx8UIneeMXGoi7OIzpCKCCp78FIKPR1ifmBUhiQQE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB10242.jpnprd01.prod.outlook.com (2603:1096:400:1d4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.15; Fri, 20 May
 2022 00:51:07 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::f4d9:ee3d:e07b:171a]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::f4d9:ee3d:e07b:171a%8]) with mapi id 15.20.5273.017; Fri, 20 May 2022
 00:51:07 +0000
Message-ID: <87fsl581s5.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: Re: [PATCH 20/56] ASoC: sh: Update to use set_fmt_new callback
In-Reply-To: <20220519154318.2153729-21-ckeepax@opensource.cirrus.com>
References: <20220519154318.2153729-1-ckeepax@opensource.cirrus.com>
        <20220519154318.2153729-21-ckeepax@opensource.cirrus.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Fri, 20 May 2022 00:51:07 +0000
X-ClientProxiedBy: TY1PR01CA0193.jpnprd01.prod.outlook.com (2603:1096:403::23)
 To OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20696cd1-548f-4ddb-c539-08da39fad345
X-MS-TrafficTypeDiagnostic: TYWPR01MB10242:EE_
X-Microsoft-Antispam-PRVS: <TYWPR01MB10242DBFA0D0B199661758D28D4D39@TYWPR01MB10242.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r4YfE2RVmjEjyi6nQJysWg1xjLsrdhD2dJCzqi2+X/GZ5BRb/nBs+puNBpOQdQiGW+915fLd5VDzIsqpSeubwrWAxiU8aI0SKyApr5xmAp9dFYbqMwadk2LyUOlEFubUk/3U0zuvhGMoBhupyKMoVX9dI/LIfMSSl5H/CBI0ith7PpmHK9CB/ghqhWMzB8dmfiygE6poXYZElTzqIqZAbIc3mZi6mFk7Rp1wsC8U6DQwPGidn1qUUTLkEp8Jzt3NbnwNTzZgyb0WY4xVx+B8nPDh/Q7wRj3SpLjs5iXEaCtPdZAenbjnsP24/bWBY0TF2nSu0U7zMq3K8vHscBhga778iN2cg0OkyTtJT8fbRKJAI4GnM0RFGsU+VRyNXCwhXtXYBERWVxpGC3AwKeZVDelD4hZdt8fzu08a70eD2txKe8IjD1ubvIBLJ0cS20fiSENvo/JRm6a3d8O7yE5BN5A2WlpPSbSOCmdc7gtBr4sZUGHI2eDY1W3gNvJH60TJJZvPdaZ5W2Cy78huv6l8nTfutpnDNpUMAimX0vLAmb+fuTfizLWkIfRuAt9aftd5dXFZnJ1XyDi9QXzPe/Qo24AXSP4TfkUJsApBN1DTwJrVeKNvjfM9ToQsvU/svnjOXUPp9sHHVCOGNXBR9V5ByWLsEEjnqTHtbI8VKAZUSYeJRGdFMUze930cJWbSe281ST31F4cR2BgRqQ6jdFHGPQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(4326008)(6486002)(6506007)(52116002)(8676002)(15650500001)(4744005)(2906002)(8936002)(83380400001)(26005)(38100700002)(86362001)(5660300002)(38350700002)(6512007)(508600001)(186003)(316002)(66946007)(54906003)(2616005)(36756003)(7416002)(6916009)(66556008)(66476007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ss83jNqWMG9uSzRKOG48vRP5HuqI0SaIp0LaqOEAsLdQE/9ywR/aYj+jPk3W?=
 =?us-ascii?Q?rQqFIfY1eUj5uB2AXzaxW7gn8Wq0XmZmrfEG587cpkAfJEtbhClNn0QEnTOn?=
 =?us-ascii?Q?Mbf5vpWrrLsQ4hfc7Ec7pz2GmH91XJnxtIlb+1K5s1IovbrEqlhM1dSV2WvE?=
 =?us-ascii?Q?Zc+yYOqdDRRm3nLQVFnQqh0kC/IuvwmFtJ9DSEV81dXheIcI/paqM5WugDvX?=
 =?us-ascii?Q?8XQEztRiwCMWL2+UzPQzM7uUQdnFLLfBLuZ/0zA9v/GGI7Oc3lbMyR2WIjiZ?=
 =?us-ascii?Q?qUX/xhWeklAF/TZv7Gr9NqMYUVOC2y/DfO4vGKWD06k9UTGeb3sA2u+iirFR?=
 =?us-ascii?Q?6GLuPx7qzwt0x+Wfal7YWf3mqPbvlqho+/1hcgPIQ9psO2nibD2LqsBpLeGj?=
 =?us-ascii?Q?G6Lbzz6YYxlsDOHiOLZInhVaJM/Gz/jylyTE3ZlvKg4wc0HwByiY14jafR9H?=
 =?us-ascii?Q?IC2/VCxD+sQV90sN4NlALmpADvkfBSA1h9QQWEzhi7bT6ooNs2YMyRj3toul?=
 =?us-ascii?Q?Y93f/HotAK2LHlcR8qu9MKDR/j9FNm12xgOzmLgay6ROGKTzDNHtsKc9YMlh?=
 =?us-ascii?Q?hGfjw4gUcBF60OKF7lqdTlSQBeIckcqcfmu5M1xo39zZaenVS4C7ijDbrhhI?=
 =?us-ascii?Q?mCbwY0mPyn8jOF6tbi1kEoRXvIycgZ9bjF95dLC0u4poeD03NqevxyEumZit?=
 =?us-ascii?Q?yeXHOK7uGHGFfcAFQvm7LwPh3yLU8h1ME09FaZN+R6NzFLM7JkznRttsVIxR?=
 =?us-ascii?Q?wXkrD6opOTGwST7dIbVvu5i8hg17Vo2cPQPl6SuGfHKrNxLmhkbcUbAwnCWe?=
 =?us-ascii?Q?eP6C+hGFNe42EebnadAdeuVv7AD65zYhdz9sxJJHW7Sq8YIH6td0hDwvz2wW?=
 =?us-ascii?Q?aqja8buEByCFwvX+lni3eyczytc8LJxveVJqWMrR1bSgGC1P1rwxGsA4tkO8?=
 =?us-ascii?Q?fdaEN1aS/CGaF8Z2DazGV5Tyz+3aBnLx47UjpJc0yWXE75tTTjvjxo2qL4VU?=
 =?us-ascii?Q?FxRu+oLoRoTXfRp6255ZC1fcyAoAvzXgsx8nW4ZCe0eOXXvU5jNiQ3LbKeS2?=
 =?us-ascii?Q?V+IAyHn3lEt3o18CXgLotBaLgGkwDaQ77anYB6QbMzrNiU5kWLqNJxNxllFg?=
 =?us-ascii?Q?J0LnqULDeXbifXCMY+1+kS77I4wQ3y8BRLQEs2SCW4HVOmKEuHoNtX7gC3z8?=
 =?us-ascii?Q?EVS8+p1hz1xw0OOZEbsdRTuKhrsWgnxozS+2YCxrTVDeoJL2BwcFHtuR+UA6?=
 =?us-ascii?Q?lUTh2QLi5A4zm9aNKpsk5CZLBjPNPyXrQv2pdXzqymBgiYa6lG/IW4ofMtXe?=
 =?us-ascii?Q?I0RJAbjoYUSa5NnQTrKOXXOHhWM0i+riP2ZRz7YfuOd8aVTMD2eN16Vy4tOz?=
 =?us-ascii?Q?S2gphnKInk5MgM5PbWjOV7x31Yc0yRX2ByUaPQ5mWGeEMhACj9f7P+N6WRsO?=
 =?us-ascii?Q?qyNvLYPbEVSUJtS0nGE4DczYFAnWvtaGcure8q/KI4ej/5ejEA6NWwVmIpwZ?=
 =?us-ascii?Q?dfR1ONluPp7QZlT414NRTP2SHVrzRxOY8LMnWizR4KTfrrvfWuX11UoQkver?=
 =?us-ascii?Q?NJGLdX7Xcg4EajvzBiiOGVz72gEVGQFJQiDXwH/IFh1NkiD5IJFMBj023Srg?=
 =?us-ascii?Q?PH10Fax9e26tlSm8jSfq9VeNSYbc/atMhodTtjOQf/8gYMG8MuanwRzY5u10?=
 =?us-ascii?Q?IioHmRDLv6Lqu6OcMOmRq/RCkY+Pt+zJAqQf8MiqkeKeDcPzPSX2ECCXagCn?=
 =?us-ascii?Q?AHu640j8EA9hEYD6LPEfEFZKdIydhcqnCUihrSlbPgNHW4zzysVA?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20696cd1-548f-4ddb-c539-08da39fad345
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2022 00:51:07.6612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YKznAWJ9mc6mPCtEzowq48nzwAk4hY4sNqvgra2rVMBVKoAIqdZhRtsX8Cc1yryZE5Pj1sJRjn7uSkC8j+RdscybP/dg1MJVbRi/E6F0R8jljl6GQcNj8qFBDWwmOCqJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10242
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
> provider or consumer update these CPU side drivers to use the new direct
> callback.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Thank you for your help !!

Best regards
---
Kuninori Morimoto
