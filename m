Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 370B97627E2
	for <lists+linux-mips@lfdr.de>; Wed, 26 Jul 2023 02:55:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229712AbjGZAzg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 25 Jul 2023 20:55:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbjGZAzf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 25 Jul 2023 20:55:35 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01olkn2058.outbound.protection.outlook.com [40.92.99.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 806072119;
        Tue, 25 Jul 2023 17:55:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K3dgQ1cgHiIpbFqE8T81We9V8a5fTY3fodiG164kreVnh/bMhoHDblqn5jJNiIS5kZE3uhrzxsHCC58fJefXtE+0cE3oqD21RuhTwLSieDMH1VCan4c3fihmEeaqqTBZtGzuH2nILFPTrMagWkf5wbTbnpE6zyjCm4HjkKlkGfgTAuxkVB/YcUFhbBLzcLgeEWxcenzrFnYM+hZhil9mZakDH2Slo7Mfx34iEl6kd1UhLbCdGzj2S9jtd8vmY2ZJV7tfkfmbeCMMY2ds0VxIq8PB0+DfTXK3RhbH5/PV7oXu3e2FhU+CiddlJfynM5nVdgfTWUTBv1ymhFL0Qu4BAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gxKPSKcwc8LsDItkyxUT43A/3f3XSRi45LjaYNevXj0=;
 b=dWl/+dQQ2WUeahuZiS/1gYSqwZ6Lx/kRZudoYL53t5uWDdl1zfaAxsAuvM6E7zlLfPUWB58wiD2o3Gncj9K6SGHO5tzN2NjSSdEn3+hA5LKzE+e2WjTa8cJME2NGwX1hlnHsH2zYQOnI+8l6xSHkgfCrz1+Wccv8y/3zg2lFY8TuXkNeEVyDI2FnxCjgogqmTaHj/y6rMvfNEOfgpjgrXJd3PYtKWX0p/i5q7qfHEqZyGklJ1yUVKVB8CjlrbgZ0FHsdgcHYWwH/ZxVKfX/Argz5vF6M/dlDUKw/Niz2IGo3x5b/6YJITbHvCv9loylmuJUpfah7p0nVvRhWbcOyQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gxKPSKcwc8LsDItkyxUT43A/3f3XSRi45LjaYNevXj0=;
 b=LxHjPFa+UV+RYQUn8aEXZ1+bCdw68uccAvhqggA4zWQfu2YC77Ie/a34kW9zWdjuhIqoyuIcgpKlwyUMW6205cBI0jSJht4S0KixBdMnYQwflhcRjYiDCMU1ZnRLGvYYFOMLYoVXttwOpqw/Eb/slT41u3vMydlj1lX7D7v0QGlCf9OmLcq2V2Vm4ai1oHWrqjz38UOr3AciddfjgO0VOqMnA14YcOPVoZ/N3cYME0gKi76l2c4L7SdlAJkyiYOD9VfpikAPj2rpbpATgayLUPAQlBjF4biyDriiRHxdS7uR8wZ5mAo29obS+3/rN9WZ/ryuG0nw3o/mQ1mq5HHB3g==
Received: from TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM (2603:1096:404:8041::8)
 by TYCP286MB3458.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:3a9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 00:55:26 +0000
Received: from TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM
 ([fe80::f4c2:4b38:d074:f1e9]) by TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM
 ([fe80::f4c2:4b38:d074:f1e9%5]) with mapi id 15.20.6631.026; Wed, 26 Jul 2023
 00:55:26 +0000
From:   Shiji Yang <yangshiji66@outlook.com>
To:     yangshiji66@outlook.com
Cc:     angelogioacchino.delregno@collabora.com, arinc.unal@arinc9.com,
        linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org,
        matthias.bgg@gmail.com, sean.wang@kernel.org,
        sergio.paracuellos@gmail.com
Subject: Re: [PATCH] pinctrl: mtmips: do not log when repeating the same pinctrl request
Date:   Wed, 26 Jul 2023 08:55:14 +0800
Message-ID: <TYAP286MB03153BF627F4D104C702C312BC00A@TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <TYAP286MB0315FB4EAD83E36FA371F119BC38A@TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM>
References: <TYAP286MB0315FB4EAD83E36FA371F119BC38A@TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN:  [R2rhURJbc00RAoArf/WmZ3i4hRx6XoXI]
X-ClientProxiedBy: TYCPR01CA0037.jpnprd01.prod.outlook.com
 (2603:1096:405:1::25) To TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:8041::8)
X-Microsoft-Original-Message-ID: <20230726005514.2346-1-yangshiji66@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYAP286MB0315:EE_|TYCP286MB3458:EE_
X-MS-Office365-Filtering-Correlation-Id: edd845c9-6873-44c9-5f27-08db8d72ffd8
X-MS-Exchange-SLBlob-MailProps: ScCmN3RHayHhpQ0czleOUWcnbjlzPJubXPKNI20811wX+JlKkdxY6xUln1MjNJJkVcH0VyOVlbeIweb4fzYx6vo9ZA5Df1qjmdWqIvwJy+Kfa4/9UdauNQndCfsc5/IMTg7lTEAEMpEMgXZA/0Kw8G47d6cZwnQNMcilWVY+gkFzl8ICAyvGiwi54uJWCvXv/wbnoWPuElE6jdf1PMG4DmvzTH6U7PujsJJZeIr8AJCYCB0rhfssAqGHSkbKcbyHyeWbne7sZLJN2g2EryalqCpNP2ozQnOjAaeCzPpQ2p1O6oD6mW51O/xvh015Njey6Q1kW+2cg0Tq04MH5Px4o3RRKC+stjM0C5E75+lOqG3wuqvAxArx928o1CO6FKHeQighWa0k1X0dzqiROmW2Nz5FfuYbdAMhrPAVa0hyb6qmzHJT7ryb+mqYM/4mT4KgXPJAIPJRZBocPc8SiVdZjP2/1NOe/65gP9Fb4xxhautUC/i8v3XLopr28cN42SJXHbq1PfjzLdiCFjtMFVaa1ckzDnpL658hp0hS/P8YRHf0Pby9UuSSfAhXHS2OmHrR6iW/Eih2lBjGs2ZBxAHdS3z8NTnnKK8t1TaZ1ADn6GquUYfKOqSHS5qK5jwjOn6KIeTncANiSyF8/HBTDlhr57UL7cbWoT/9itUPzwMxR+OUzpNlYXhQTa+08Tm8ODVjUQY2iK+gmgZVlPmSR1qmbYQ/mcRYQ317pVfUddx7dZA=
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Wm365zGCd8x2+xMKdOGQrhyK2S2D6WNasNs4Wrs/xqCpWuWJEKfuvcs72jy8Zutf2EsBijP/878mZv0QaXGD204GWgJsKtxW5iH4rxz8s+HljMcHfuYfAFz1Bnk0QJKtGz0tIAWXhUYOsA4/aTHdp3ftH/MEJ1WJKL4sZbLGB7VVsRvvNn5uBpwuVsXWdWw/lXCdaSou8+CI7MG0arTBvZU9VyDUJABXogmp+8shUSBwLsbaHZ7GKMnkcIb7jhVrKP1sLlzW2FolVIhWjfjndU1CnRUCaT87zJnDvCrwaqwTB/AVmA4L57XAncAMf5IB1ZkH9ZoBQC2MPptu7piYyG3jJsnsMaAgyE/54oODua7tVe7PtAxH+q/l/3HTj5IJVxVsWDzpvZ1ZVe06I3AZquhQEVRbQep2n5lhMd27+iJhPIEVzgLaUSEz8SOq5S+QaFXZVs4nddPPs+3AVifdIS7+1WhbAVWKqe3Enfaod6+rPheOVLzNzDnIYmA+nCcL6f+mQdmzQoGWLHhqxWqWh5w/coz17Pb6OC1G/+MuAh9zSgMPGUXxksQqwYcv7PX+UAYMoGj/axzADiU42OnGRm4mqfEpR3LHDWCaFIEpo5w=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6YX1OF239XAZxIqaNe69sDXAYsVBteKVdZtrpj6uU2+5a7+uVF3bWbVcBUhK?=
 =?us-ascii?Q?h66Ea2oRqA8vcAvj/SPhG9MnfNM65IKcmHRanYCW4igKhk+G+SNC8WR3l3aJ?=
 =?us-ascii?Q?M6gyYW7qmFw9i2EJz9+/q43VbVcHeQFgZettfXFlpfHRhtiXKNWlqPGpMr2L?=
 =?us-ascii?Q?EmfPlfkit8I9aeaTpbqpUMLs21QBnl/bsFgX70GFjIaCi2u3XMUcRBdHTXln?=
 =?us-ascii?Q?gt2wKe5RI+IWuZcNH1AO6O/izaB6bEG4IfXkUZhreA+7YiT+YSVXcPZ1hEyr?=
 =?us-ascii?Q?Uw1c99h4UB2mrPyNfUURqV/DBk293I1CErMKzhaBolOSEdAcTZA6J0Tqel6T?=
 =?us-ascii?Q?Q/d9N3GlAwCX6KLnyvSYgCloQA5zvKkODoTBYhDJ2gQivopie8ynoc4iX4qG?=
 =?us-ascii?Q?x09fdBGUjBv0dCh48G1gM//Te7P54yWEBH+odOIpTPUJtyMQYqnqzp3Sbyw1?=
 =?us-ascii?Q?LAah7X8EDUgHExOmmGlLL/oVD3ipn5es4rdMia7AlAGTgfXoUEntj7ZIwLXf?=
 =?us-ascii?Q?+hEAqS5mACkYFhvlq3IBHsocvchq27MeqROcDKkngL+q7tEZs+DPzazGNJwU?=
 =?us-ascii?Q?seEUk4sjpNcVPrlBho7rmnvinjDqsf3qjZjt0SrqtfaasGqsG/w/PMdxZ3Py?=
 =?us-ascii?Q?bC+dciww51i5CCJd1oyOjtuv6+Tz121PxbrsTeaapMnJWu1eTpG/NYXnSzSh?=
 =?us-ascii?Q?8ud2JmYHfLkbI5Su9O8lci7Wq8riyrpNkD7ysQg3yGWjoeGGGSvXNiA7xYmU?=
 =?us-ascii?Q?hXVuz4X3wVBbKu29nsO0iJ8Vy40XQ4TGnENIr7wEal9XkSGChChaxO0ubhYo?=
 =?us-ascii?Q?Crm16NhqQ+uh9QZHTDBpNWe/epIBjPbNOcCcFkj55UUwZL6Rvs8FZbtYZ15K?=
 =?us-ascii?Q?6LwfLFsoHB5O0Fu8vR47mki7aWhINZyNO65p/BThL9MKDvnqeKho666I5jsJ?=
 =?us-ascii?Q?whYRMnJGg3NUvlG0NEu0duQRIrJtJUZw96Y2Je7LPaAQGf61+dfTqSyCkvnP?=
 =?us-ascii?Q?KQfDK/vOaPFEih14PJbub7/lkctIyuQO9dqIDa8IYyGtW+wF0pHqy3NMcvVw?=
 =?us-ascii?Q?5REc8emjrI2pQea/SH/m1KOWFlbKJCdmml5QuMuahWhTlgpcQbWNf2l00aKF?=
 =?us-ascii?Q?gaEvJVrnCNrJpWWon9Axvh2oWxD1EH9fqEE9Ihb+dO70g6Pufkjel+K5FRzg?=
 =?us-ascii?Q?yHynmZe69Jaotuk3IPuF0NMJq3ukcFKkWLk+czHrfOWNdLo7FWxfTbxvzXk?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edd845c9-6873-44c9-5f27-08db8d72ffd8
X-MS-Exchange-CrossTenant-AuthSource: TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 00:55:26.6318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB3458
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This patch is outdated and has been suppressed by
https://lore.kernel.org/all/TYAP286MB0315FB4EAD83E36FA371F119BC38A@TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM/
