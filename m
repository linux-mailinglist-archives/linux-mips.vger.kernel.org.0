Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2428D75E964
	for <lists+linux-mips@lfdr.de>; Mon, 24 Jul 2023 03:55:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232942AbjGXBzg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 23 Jul 2023 21:55:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232758AbjGXBzS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 23 Jul 2023 21:55:18 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01olkn20800.outbound.protection.outlook.com [IPv6:2a01:111:f403:700c::800])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F83EAD3C;
        Sun, 23 Jul 2023 18:45:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K70k0SvOEVwS+YxD1fAvSgne8fUQ8ilEAChmzmxgvCfobTBiEDcKXEoV+lKygKC8pS+IFDIkVU7rDxyQxxKZVswNWYcJC0HwNW15H3ooATda0EiIfAfGMQHddDf4I6O+AYtUydrOgsVotfNBWXpf8DAajPnk+eOiyHiNygFa0L0gsqaaFbZ1SHsuOj+6jJ2l5FflJRi/Ms8LhkSjL1FPcz/QCxPBOIgmWmDumP538JE4h3k3bxRc/fZeiU02zAq8M1dFe6t80rQDB2oV2DWTEgRnkASaIuvjYtD7pHOnZEjydYvpqTRXZYtsa+uWa9uwaGWLw5N5ygTJxdpZ0VRZeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZmGqFkAFKPv1OOSnztujaaycylVXWO29pqrVZDFIWVM=;
 b=Bl/1PBOqQG5yr14xs18SxcoAqS49a2QJCUhRiuKOtPXPr6IiCupeV+MPAOe+qsyB/CdUnZMRx0fqyK5Q3kdqeSQBLJF0zhMvVTJ36Ptx/6120eWGGlgCCvlPIVovtvx78BInfA3SPD09zpcPSt60w2vj+DyRZ9qoSRRjEnZU3T/SmBsQkmpHGxTdzRMV5MCbPPXDzintNo/dIa6nVVNX7zjkh/ol3aCx1ajkAdKq4XftX0v19bDmEsmGCHEZ/wkUY1XNs+dmBXgsGkcjhZ9LFF/bABtKSw8MNArxJ5zLJKBAp5oBmgI7SAcfL/URe5NwxqyvqmsMIcEuD+35lGEXiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZmGqFkAFKPv1OOSnztujaaycylVXWO29pqrVZDFIWVM=;
 b=TeLkjDL+qhtbMDgn4eK/tq6zeCMPteJhJhbuho7xRALCmKOJS5kd7wtkrwhdrGV5RtDh3vtKlw3XI9siHfnCqMPfl6hR0pi2DFzq7lyKpIeLpd+FiRGMJW9QUYdLerwtsVpfkUNYrC5hdsauJ6WEo3RhyOTFg2pGeM7YgbTa9/ZwKsyxXqwKz0ST+p+m2KHcj8q5tiphUD16XIEEY+VXhIfSUopWkntHfRdGqhNWdBx+EffA2jrfyt/b0xTAF/F5lvmAY3BADInsccwTnkvtrD2k7eDc8jea4SMy5ztxcYTdt6L49HgGZOXY4d3Ui0BiHUbALvU+q/mnBsId1HbsdQ==
Received: from TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM (2603:1096:404:8041::8)
 by TYCP286MB2589.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:240::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 01:31:47 +0000
Received: from TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM
 ([fe80::f4c2:4b38:d074:f1e9]) by TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM
 ([fe80::f4c2:4b38:d074:f1e9%5]) with mapi id 15.20.6609.031; Mon, 24 Jul 2023
 01:31:47 +0000
From:   Shiji Yang <yangshiji66@outlook.com>
To:     linus.walleij@linaro.org
Cc:     angelogioacchino.delregno@collabora.com, arinc.unal@arinc9.com,
        linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-mips@vger.kernel.org, matthias.bgg@gmail.com,
        sean.wang@kernel.org, sergio.paracuellos@gmail.com,
        yangshiji66@outlook.com
Subject: Re: [PATCH] pinctrl: mtmips: do not log when repeating the same pinctrl request
Date:   Mon, 24 Jul 2023 09:31:34 +0800
Message-ID: <TYAP286MB03159367B2B1932DD38252CDBC02A@TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <CACRpkdYzytbM0sN7Q-Niwq2jUgbeVPpREmwUTbja86eGROOB+w@mail.gmail.com>
References: <CACRpkdYzytbM0sN7Q-Niwq2jUgbeVPpREmwUTbja86eGROOB+w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TMN:  [ipFgohZ4bUdpKNU0nP06sPn16ykRPtEG]
X-ClientProxiedBy: TYCP286CA0112.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::7) To TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:8041::8)
X-Microsoft-Original-Message-ID: <20230724013134.448-1-yangshiji66@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYAP286MB0315:EE_|TYCP286MB2589:EE_
X-MS-Office365-Filtering-Correlation-Id: ecb42ada-ccfc-4f6f-dcf2-08db8be5bf29
X-MS-Exchange-SLBlob-MailProps: laRBL560oLS6buqkouoaL65lqUYHK3x1lBEEjJ7ORZvqLBYIUQ5aOEXVYyu1t13hx1SDdFwcDSRBBG2HPPj8V2Y/avzMhbLgztQFiGYJ/puzkzOaZ0lOAt6MFkgtCIMDrCM5SyjuEUwNM57s8fju9u15GtsEd8QwllJLNDZpBuY9AwObKtFGSZ7f8Ptyx1uaigQUw7O6L7CtyrLV8UbL2FI6Z/XvLqgOK4rKaoQDQE8pyBqiad6Scign3Yz1vFm3zW641sqKznjkshNV/fCVtAaiW0w33tc+G5x8Hoo0LQAO9ncyFsAbUy/sXLiYAxOfBY8vR6ekkw3e4fFCXAvc+Sb3fKkjTBY6srfNr1hWBivnw3LmG3tgkIQWUL6tBQp6ojk0DS91IRitU8jDdaBgTndrpC9HGFhc9PHjs6Zw6xCVR/gseOZxy23hov9AT7Ho28FM795o3NhhZLuYqqwrVNvAeiWF3/34MA8PH0c6V1TsrL3iXpBSkevt65QTLDLJBhBPunorvdRze/nhntULNTrTTYiFyNBZdNLqJvyCjM6P6ZTnK303KClz58tmWGt31d9E34ECOV7IPNg3WGy09w94u5+erKNzESZz68I0Oizk9iSUOHabA1GSQLJWrArG5gwpZYpJ9Qn0RPcl0KrAogEer5tEFON8ubJGSz+otOnvv0LDofEjdmw4J6xwhjY9f2H4FWLMqJQziAy3ps3glJKB8C24QVKXocuCIkQk8CusArRFBpfZzlI9hfF92nQEVzNe54sjwJRs9JbH6hdvEdlS/mKsAJsT
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MqpkHVcjdRjVeMYOMlkATepWs1uFTFHPcCActBw3osYfovGaKWZnrf3bxLISURBBlvId1Zttof1/LtUMyxjxuey22mWlJxvQO9vgJqrUhClMKrgaIIslJEF7drtMaGuUzslIWkMRtxOjbU9GPpxAUf5rVrUAnklv/6z4n6OHz9lx7cXz8Fums99kThn0Wf0sSPi6MNujjER0vODiIsjIwamV4C+CDOhCSLhjs3XPmRq/V2fNQ4QudXkDwnSaVovZ/M8nw3IyjbF+in8eIE2beh+X5TFLV+WjHCyq8/xgDVQE4o6jPyu5L2jzDGccn2x3m4e6e1tUugJIwiGNRjzEa6g5cuh0718g7gPcAIUzbSqJY4d+PuFahRxZdxbUm6Ena8Pa0fdZ98h6vL8PMBYHcT2KWShMoFRQ63W318czbkXUhofuWrPYpC0CAK/8m/XP1AzAXzu0ErPXBrEQ2+tYMZrC5mq0nDkL1PgmPrlsoOQe9zS0Kmg0lKqaObzsQeubMKrKNSvwlDxDFYlEo4E6D2SsJKFgnVIertOjDg5fED9nBskcwSiJzF2ElP5KM9pvmTChrY2Xk1BQ9cKUAq6cA+I78Ia8Dr4f5nofrkPaxEM=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KzVyR3JUbEpoZHNjcW03MlB3WExGNnJnTGsrUkwzVFVXbmQ0WTFLeEQrZ2No?=
 =?utf-8?B?UFpmNzdORmd3NTdYQ0ZvNVdQeURNOHF6SmRRdDUvTzZ1MUlJU0Q2VGFoUnZ6?=
 =?utf-8?B?c0drQTgyWGJwaWtaa0h2MHZsUmRJRm05c0M3M3BHZTIyR0FSbmtZdHhsbjli?=
 =?utf-8?B?dXVKaUJnZUxGVFhVcWNCQjhKOVNpTVJEMlRHRWIvdWtTTUduOTlvU2RlcEkz?=
 =?utf-8?B?amNMSm1HRnBmY0NrN2lwc2h0MXd0WG81eUNiazJDM2JqVWVCNldSVmRVTGtj?=
 =?utf-8?B?Vzg4a2ZoWVR2ZGYwSVN1WjdkZFhrenoxeTVwSEMvMzdzb3BRZGpzVjNiZXRq?=
 =?utf-8?B?N0NKTWJXOXZJTzVRc0xMdjlFaWo5WFMwOTFmNVp2dEJwN2pPeGM0NmZEMnhP?=
 =?utf-8?B?cXpTeXVHREhYR1RDLzhnNElUM3dXSjNTTG8zODNmYytDeE5yUy9KZVJNTFRP?=
 =?utf-8?B?R1YvN2xzRzlYK21pV1M1MGU1ZmFJUHFHcG1nVlNSb3l2OFBuMG5BOVloUXBZ?=
 =?utf-8?B?cFd6bTNpa1ZlYnlxbXNzU3FjTTZKVkdpQkU2UVRlTFFqeWhCUUVMNHJpYkVX?=
 =?utf-8?B?Y3VGK1F3blFDOVBZZlhxZmhMT3lUMCs3UTNSUE5DWVZON3pVZ0MvajlpYytO?=
 =?utf-8?B?SHdRclE0bW5pejJFNGlFVjZNcXp3QStMUHVNQlV1ZjhmZzUzcmR5M28vR0FS?=
 =?utf-8?B?WFJkb0ZaWVVhNEdNSWpuR3NjY3dTL0cycHdjM3JDSVY5N0ttbnZVZGRjRldO?=
 =?utf-8?B?VElzYjREVCt2WFlGRzhRRXFyTGhyS3Z2eDVxKzNLU3VZVlIwNVJ1N0dwNEps?=
 =?utf-8?B?T3h3OTdhc0lBZDdRbGkzYnkvWkk3aThVMTdrYkNOSjNreVgyZFhWQ0lXODVC?=
 =?utf-8?B?WE9QcGtoS280K3VSazhpVi9QM2V0NzJJcStBSlJmTUdmaU9hY3ZsZm1FSWl0?=
 =?utf-8?B?ZGhNWG5TU0o4bEZrM0s4bFk4cHNZZTFmWEsvYVpEOUhuamY5MytRYys4eC9Y?=
 =?utf-8?B?b1lhTEdhQnpUVDhoQ2FqOVpHam5TN2NDMXpLUGNMS1dQUEZGNkxpeDZSbzZC?=
 =?utf-8?B?RDNJcTE2NnB4Ny9ZSVpHUjBiUEZCRDNIcm40cng2cy9JZm9qU3FOZEsxRWZR?=
 =?utf-8?B?T09ub0hOd1Q2TTRmdkYyaDQ3cWYrdlJlajNkUU1lV3lSUnhlTVl2WFFtR1BC?=
 =?utf-8?B?YmtaeUVEQmJEcFB5QlYvR1hHa2Nwd2daekIvb21PSks1ZTNKS1FhOGVxZDRC?=
 =?utf-8?B?TmtvTzY0VFNzVklZQW9pMDJtUWQ0bjVKVUk4SEF3V09GY3RFT2NzRFJBUE5Y?=
 =?utf-8?B?NmNsR2Y3ZmR3ZXZ5WlVTM0cxYm42RjgwUDJ2VFljemozdUI1ajFmaGJpMk9p?=
 =?utf-8?B?VzNNd0JYSkk3eWtTOWVBSFJETVpMeE1PTlRiaDlzYTVMbXp6dEdrdk1CTDYx?=
 =?utf-8?B?WDNTcUJWRkNKS2kzRGZSVlJZdVQvaGpXY2k2L08vODc2blZra05mQzRJNE1p?=
 =?utf-8?B?Vm0yQ0N6b2hWZUpud3ViZ2J1WWN5WHFvYWFvQlRlVGx0emtINkFCWURFa0Z5?=
 =?utf-8?B?R3JZZWtNcCtUdUlPZnJaaGRTVHg2MCttTS9KeVhZdnBnVzVZN3BjSGtNNE1s?=
 =?utf-8?Q?qqMY9We2/03yQRJMvt8VG8xGKWOHESBKJIBonWCQlE1E=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecb42ada-ccfc-4f6f-dcf2-08db8be5bf29
X-MS-Exchange-CrossTenant-AuthSource: TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 01:31:47.8355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB2589
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,
Thank you for your review.

On Sun, 23 Jul 2023 21:49:52 +0200 Linus Walleij wrote:

>On Tue, Jul 18, 2023 at 5:16 PM Shiji Yang <yangshiji66@outlook.com> wrote:
>
>> Sometimes when driver fails to probe a device, the kernel will retry
>> it later. However, this will result in duplicate requests for the
>> same pinctrl configuration. In this case, we should not throw error
>> logs. This patch adds extra check for the pin group function. Now the
>> pinctrl driver only prints error log when attempting to configure the
>> same group as different functions.
>>
>> Signed-off-by: Shiji Yang <yangshiji66@outlook.com>
>> ---
>>  drivers/pinctrl/mediatek/pinctrl-mtmips.c | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtmips.c b/drivers/pinctrl/mediatek/pinctrl-mtmips.c
>> index efd77b6c5..8f5493220 100644
>> --- a/drivers/pinctrl/mediatek/pinctrl-mtmips.c
>> +++ b/drivers/pinctrl/mediatek/pinctrl-mtmips.c
>> @@ -125,8 +125,9 @@ static int mtmips_pmx_group_enable(struct pinctrl_dev *pctrldev,
>>
>>         /* dont allow double use */
>>         if (p->groups[group].enabled) {
>> -               dev_err(p->dev, "%s is already enabled\n",
>> -                       p->groups[group].name);
>> +               if (!p->func[func]->enabled)
>> +                       dev_err(p->dev, "%s is already enabled\n",
>> +                               p->groups[group].name);
>
>Why is the driver not backing out properly and setting this .enabled back
>to false when probing fails for some requesting driver?
>
>Or am I getting something wrong here?
>
>Yours,
>Linus Walleij
>

We use pinctrl_select_state() to request the pinctrl and set the pin
function. After searching "include/linux/pinctrl/consumer.h", I don't
find a relevant API to reverse this operation so we can't set .enabled
back to the false state. If I'm wrong please correct me, I don't know
much about the pinctrl architecture.

At least I can sure pinctrl-mtmips doesn't have an implementation to
unset func[]->enabled and groups[].enabled status.

ref:
https://elixir.bootlin.com/linux/latest/source/include/linux/pinctrl/consumer.h

Regards,
Shiji Yang
