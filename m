Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59A437627F2
	for <lists+linux-mips@lfdr.de>; Wed, 26 Jul 2023 03:03:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbjGZBDw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 25 Jul 2023 21:03:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjGZBDv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 25 Jul 2023 21:03:51 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01olkn2039.outbound.protection.outlook.com [40.92.99.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54A79211F;
        Tue, 25 Jul 2023 18:03:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QEN8lDazbRMpM2p84PiUGrGsYnOZsrH5jy82np5XjlKRLTLgkI3JkEYm7YGgsSPuCF6OwPE48k8gZehtLfUkGC9CA8OC1edxHQ5O/GnVvvUtORPvi3g/UqcHRvi2+uHVNaMSnCRxIzFLdM60YQx7VmW9dzFW2e4ZFfmWT1R83IA2KlobPs0Rbngi9z0tVzm87OUNHOfyu7rkT6pI3HOk6gEo4WPlNKNUvSr1i89gdAcrgXNxHzmGAH7Ptmp0p3SE7tWBGf5FMC99xon/j6LGaUNGDH3xyEDW/9xqitMcOgeZX7cJfYvjKBWjACWQ074q6g2HbTjvtCtrDGLuXpmUrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lM4daytJyhNFatzosHQKWwJ2ou96HnhMR0IZ/i2wX6Y=;
 b=Ah2+G9fpTi1YLFBd032Md7DXYxQJDM478BOT//IDJ3RmP7qvep3ABlMz1ZPP9QuNkiiNkhB96Ejo94kqY4h4/IUWJn7/CIhSYBVYSV3pYUt15xzKJepYa41PrA7bjV7eGPTiy0i8K1QlTOthZmVY0+MR+ptj9nyiCaPyJrRQ5lmj7p3TTDXM9wBnZShOYZc6PUTp/IAAjTuPcvWfS3lLpQ20td5RYzdxAnCzxeOFwWrgyVnOl+VsmnGl2g1eHkMAm9kIrY98jFR5o77l5Stk1zdnS62PMDOYdp7aFoaQQa8gkQ9YAUo4dV0s5n6ucyasStwr+XlQUnKScwd3S5Eg0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lM4daytJyhNFatzosHQKWwJ2ou96HnhMR0IZ/i2wX6Y=;
 b=fEe/skIJ9IXWqYXcKJ3F06KvSgPAtJDV/XPj8+F3RCH1/aV7+FguhoEM016YCKiK2CBE4oADPrVa9eadshluvqw833BEt9+cGlBjVA3p26crILGKwJklRfkOxtTQ3uC843j/I/nN8c0MBYBA7VtlND0n+Biz6JGWJ/fJLJDIXuV9IMUi2e+u86J7/VMVi0uGdc4y9fE2zjrRFcbBoaQInadoGQRSiuEUgCgUiVs/C574nAVu/WOrQcXg5x0F4c0HiB34pa405QHhvTGR9dKPN0pjsLTmhNVOlc4BbvipB/OybgrrMEFumGMzf0Rxdkya38zwae5yONdODYtXWdkZHw==
Received: from TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM (2603:1096:404:8041::8)
 by TYCP286MB3500.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:3ab::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 01:03:46 +0000
Received: from TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM
 ([fe80::f4c2:4b38:d074:f1e9]) by TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM
 ([fe80::f4c2:4b38:d074:f1e9%5]) with mapi id 15.20.6631.026; Wed, 26 Jul 2023
 01:03:46 +0000
From:   Shiji Yang <yangshiji66@outlook.com>
To:     yangshiji66@outlook.com
Cc:     angelogioacchino.delregno@collabora.com, arinc.unal@arinc9.com,
        linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org,
        matthias.bgg@gmail.com, sean.wang@kernel.org,
        sergio.paracuellos@gmail.com
Subject: Re: [PATCH] pinctrl: mtmips: do not log when repeating the same pinctrl request
Date:   Wed, 26 Jul 2023 09:03:32 +0800
Message-ID: <TYAP286MB03156DAA2E26B753370DDE7CBC00A@TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <TYAP286MB03153BF627F4D104C702C312BC00A@TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM>
References: <TYAP286MB03153BF627F4D104C702C312BC00A@TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN:  [Nhi5seeHJPaMov7pVR5FtDUg2Ae5t5TZuTW6V44H8sE=]
X-ClientProxiedBy: SG2PR02CA0030.apcprd02.prod.outlook.com
 (2603:1096:3:18::18) To TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:8041::8)
X-Microsoft-Original-Message-ID: <20230726010332.2717-1-yangshiji66@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYAP286MB0315:EE_|TYCP286MB3500:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bf2727a-dcdb-4f9c-eca5-08db8d742a1d
X-MS-Exchange-SLBlob-MailProps: ScCmN3RHayHhpQ0czleOUWcnbjlzPJubOQSYqNCVAw0Pcgp8tyOa4+UDTDp6w8R7rReHSchOtV0zrWszQ2zxkVYOlvFTMniJb3FzkS0oWDWUJ77mpR9hLb8p6YGNuOW1v3U9gQbThck1NlwfeJtFO17sXoV8oLhcwuRf++O1UZEmk82VIhCNQR8QXbFp/oyiq9mojUs+ihPyNM898H3u2ZhZje4g0V3gCWcRt3kH822/X8KTy6UGixNRM7gJx0OU8v2/KL16hmHlq2ZZhfRs46y+uYGpMMgTGJs8OoCQ/R+oSj0TPGV1xRaAZho9aB4/STXe17cosZjZF2EBW19qM1YseoVC2Ox2r7b2gWjI8QPwdfPG7E0zt/jpox4olfBjFpEKexNkFHfv7Irng21HhsoclHt2ThY8Iioy0gXvAYE7stznR2dStkFudcm6W73M19Th41hPmBrBkZuvBgRx4uYqROS8osWS6FeRRBcltkyI6eHWI9ZoapdnyGwGypF5Keqnw55Vl5hgKXCVLru2+bQ+eiqLQGZWLCA1IRDP332XBTNB7JqSpSuev9hJsi8KMkrjLEjiDfnIa1++M2/lrfDpFRkEXzE8SH+uhE7NIo/l4IO8DTt64Z2WOGU0kl/wJHMm0hPKcVXaRBwwoxRJMYqnYsItT69cA0dbvhAOGN9gPYUEhl3LUfeAHt42FnrSLJG7Cq5mzMZ3C/pXEoxi6ptZcKOL2ZMbY1pLtz07uXI=
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U5py/uMz4Aq6ONPGzZwhshF9sx6aLrrBc3pjnwsWIpNOBHT5X3+N4aBy884pw3SnMK66Uxf8wwl01g+fdWRmrgrNSl0z1r4UynPbwHF1pyoO984K52SHhUTklKwHssss6fiWMBbwX7tYPKPtLGzHAurPLn9PPOSygLvDG+5NTkfl6GTetB0FRdFGkw0AaJxZdwk8lCPQxpr7WQR07ZAfC+Kc1yHoI/7RmSYgasSCPxXG3yz85EUGTC147qN2YhMsPlAaJZTVqJhvvfube9nLup4U5DDhh04hCzJJLmNa5yCC7rBgkV2USAPPN1CfFW6qMSz/hOpuU/S3XqhQ+lsZxVyJVVzT7XlMf8PTZ+mwosEyOujUxJNmQDFfXTrw8xn+CdXOrLubR6TBxjPadLTcSVrzOOVAWYBqqkEL5wXzqbz4gJ4SANu+oUxU8pKsDcTkUo8jskihhLuJJ80LZoXIA5ZkRE7sDkTqmrSXjp2LTx5bxZUTwnYPfjfB7mce3zMjBDszjo1O/Dm+GDYfpTao/NtR6EfRzqviFmZ5/N2Uc5AwgsHmu7lGmHlFvtFNb8ewWV6/RRbsnQ6LxBIZWWg33PGSfKIFwoWVPdOsdy2YeUFW2QM1x7uq7e+rMjeE8ufugIJ3qP8f0bbkFx/YRGIIfA==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2iZDekOInTfbfrMcQ4F1rQnaSOUlWdzT6FL2P20VVadfGg/IRNOSCMOO5zFp?=
 =?us-ascii?Q?ZM1z8VDnHbdN6v4Rnx1czeEZCxeJqm3nUOnUzNT3MnpK3omuzqhqTXWO5bQ9?=
 =?us-ascii?Q?vrrBldClNO98jPSCP4NoMhnrdATKfdQzb1/YvWP6Cb4yeElmNmxAGwLuZhIT?=
 =?us-ascii?Q?15h+Db35x5Wfm0/guPtAiEZS0HSgdsjnhBiKjV3T+Olx4MqUbqQAQpgUVcuJ?=
 =?us-ascii?Q?9v+IfdNx4NRicmj7wATT0hcdv+KpYVqQXMYJIE4uwXjRm9jEFp41rMz2uBEf?=
 =?us-ascii?Q?OzOIgyl32hcxug6LYNfbrY2DI4g2M0r1XNGAm8nreSRboWiK2+SQfCjGTqG8?=
 =?us-ascii?Q?XtQQn6AukKZQX3WYldHw5HdsVnTlx5MpEf50eOmerrR4UB21jpvBgebfWY5A?=
 =?us-ascii?Q?FfM+uZwwaFgXseNYSTfmojWp0O5pjFBC7CwL0XvLv5AhAq2HwdTo9shh5fC6?=
 =?us-ascii?Q?2fEmVTNEMirNDMoRktfbdBQIbMNOoGXcXK0gJGLl+GWj45ZsmeAzLQDg0fGq?=
 =?us-ascii?Q?1N1H2T+0rAW97qtJ6StiD0hdpF2ZiespefshfTJiLOHUKTmKDJ/NFufGFhpt?=
 =?us-ascii?Q?GM97QFXpzZD2m7S1wHa9dUFlHOOWt+sGtBlBOu+8c/eag/z8f5OUr1vhB+u/?=
 =?us-ascii?Q?sSxm9d9/yz59bk/ypbPV9uTvXg/O0w4MyHVV/ahBFOalkMRTbIZyTbJJNUSA?=
 =?us-ascii?Q?aOffUOkVqwaPOfi7BQ0LfviuR69lwF0RxS5RSpweRH3uFV30inOqvDY8zAVY?=
 =?us-ascii?Q?XzWag6Tpy/1JIqL8SJOWz/rLENAxXf3V05Pz5N1bH345bHjsGRvGpc48RzEq?=
 =?us-ascii?Q?ct0V0H7n/Bx8x+Yh9F80kTsRao3IFgnJYGz4XIrspMZ2JLfp1VRdZWcS6xy8?=
 =?us-ascii?Q?qTvevjqvPsXac+xE1qbRZxjZksW9+PNqbTVrOxz50m4qg9aM3p5l47E95g6O?=
 =?us-ascii?Q?xZjYOMr23bc9fRgq0uV3wylh2kev2y5+FiPH8yumyVlkoYC+LLZ72oxHEmlC?=
 =?us-ascii?Q?geoY9TXbvQixMp1ryU1EjVXPSGMS67h5jmlLVkR3K+TpX1aC08HZotlDgB4S?=
 =?us-ascii?Q?hykggDMRlGo249id0Syii80szE7xHGiMffiXFxZcwXDD3DUYrg4utVixesn+?=
 =?us-ascii?Q?Bo/+K61QWZAmzyyLqlUMHX/HGriBDHBVON2zK3DlZDCFWsRhYQc7Q0MFwsGl?=
 =?us-ascii?Q?Pf6USa1ChMW8pfz1+AJtnKlzd0sTARgR8x4Ukuu2EtZivlLXRZipCt5RoRI?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bf2727a-dcdb-4f9c-eca5-08db8d742a1d
X-MS-Exchange-CrossTenant-AuthSource: TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 01:03:46.8609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB3500
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

>This patch is outdated and has been suppressed by
>https://lore.kernel.org/all/TYAP286MB0315FB4EAD83E36FA371F119BC38A@TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM/

Correct URL:
https://lore.kernel.org/all/TYAP286MB0315A9671B4BA0347E70D9E0BC00A@TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM/
