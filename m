Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9F60768373
	for <lists+linux-mips@lfdr.de>; Sun, 30 Jul 2023 04:06:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229500AbjG3CGP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 29 Jul 2023 22:06:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjG3CGO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 29 Jul 2023 22:06:14 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01olkn2083.outbound.protection.outlook.com [40.92.99.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A6A22115;
        Sat, 29 Jul 2023 19:06:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cJoRDD+w9G85l9tDeCbnivmbTG4Np2oDpwNui8juxyyg5EtubuCYnsdZSfPR6HzyiWpleUgO7p13dw4trpgEtJXiIJgpYg3tVfP9Wlcv3SXXy5A3+Q5j+b5dKQaSY9SJxTVg5+qUlDG2ihwPP1mopMPkxHWVyKZ2w8Q5V++tHrY1hizwwcydg6lepd3S4vRpVB8hguYttlPVGgWDTF3LqpGsQQYoL2uZ11o2r/DhosXR6uAbAavjeDetAnilaaDlXhIo+nxiX/PMuvn4edGAI1fJWKURHF78NTXEdqgK4S5mZ48TeseqduZyeEsOELUjBZ1nyrzOkm8rC7Rmczee4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K+1VTjJbxCmFHeFSo9yQAYwvvsFfGTU+qgxw1UGrjwk=;
 b=YejtZXMvX8fVeLKAmONOxXMXGndS8G5Zp+Fc8hHmGbIXvIOEIFWahWs2+k01fQ2kwXmUwtLRKgc+AsUDfan984NpppF0E7W/cDbvCZ7XnOH6ywdjmbooxosojmhhZ9wupQGoroofgdwk/WPOpcWZdRijRx3SLVChJJ+H05eLY6nZsoKQiTRNnID0Lzq7ayEMqpa7S28eXJ/Idw8GB33igEaXAZq1EsIen6XmA+tBXps0cSjjO/UT/GnXdihgZ3XksBvFnhqJx84I1VRRKd+8Lf4L2A85twHQulpmu2K8zpjn8HfNU+5GmcngrRqaXSy6dfk6gZ3zHe7+4QE6CpDaBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K+1VTjJbxCmFHeFSo9yQAYwvvsFfGTU+qgxw1UGrjwk=;
 b=g/aCjwWU80ICDvXILKYfwXcCWMImLv5vlyGKUx+hFRUxrB0iVB3wOiE0A1YuHnHbJJmCU+rgdlMOW5ij/+o8w9YxPlduv4v7xeiVHd/PVJqyH1nDBKgX4wJ/D6G6sRhmR/km4Y/kTc4v1AZAcC8VZXShU6WAYnoeFAHyw6bRV0mVB2AE5yHqoXCQKJLBIsfNP8JAcVPO5tuj+2qkX+VGvFESgVlKdJMYWaAo9+wmiQBKn4fV1cAcVYyZbG1drGKtNlkjzwd8KrE2x9U5uwOwaP2lj+Et7/ysLUU1ZYrDttFBfZdfKCBfJpv2K2kyUH6p7KoFNK4KWtUr8negwN1F7Q==
Received: from TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM (2603:1096:404:8041::8)
 by OS3P286MB1783.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:1bd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.42; Sun, 30 Jul
 2023 02:06:08 +0000
Received: from TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM
 ([fe80::f4c2:4b38:d074:f1e9]) by TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM
 ([fe80::f4c2:4b38:d074:f1e9%5]) with mapi id 15.20.6631.042; Sun, 30 Jul 2023
 02:06:08 +0000
From:   Shiji Yang <yangshiji66@outlook.com>
To:     arinc.unal@arinc9.com
Cc:     angelogioacchino.delregno@collabora.com, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-mips@vger.kernel.org, matthias.bgg@gmail.com,
        sean.wang@kernel.org, sergio.paracuellos@gmail.com
Subject: Re: [PATCH] pinctrl: mtmips: support requesting different functions for same group
Date:   Sun, 30 Jul 2023 10:03:55 +0800
Message-ID: <TYAP286MB031521A726F0A4C80876F473BC04A@TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <2eb012d9-0d36-54c6-6f2c-1a286d45c497@arinc9.com>
References: <2eb012d9-0d36-54c6-6f2c-1a286d45c497@arinc9.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TMN:  [9shSMEgPJMiV2WdKJ6k60p/WzBSSVkBd1Ll8lOD0WuQ=]
X-ClientProxiedBy: TY2PR04CA0019.apcprd04.prod.outlook.com
 (2603:1096:404:f6::31) To TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:8041::8)
X-Microsoft-Original-Message-ID: <20230730020355.17808-1-yangshiji66@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYAP286MB0315:EE_|OS3P286MB1783:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dd5b0b5-512e-4802-9c9f-08db90a1899d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LG7FAaemxL9sF1vdpjmIeEKMWO1KyBvdED4FwHxQJwmkQDUhVsRDZ5fe5I+llLXgd1wZCubl8ynHCQR5OV/+CwpH9XUa5zIfd5+MQ4fvxlbWOo+aQJmBCftEYSqZf1s2RGhf98VwV8zMc+/jbM+iXifcVWpMvldqgmyB+TOc7jziszIry30Ohac3s0rbKxfan/yxeAw0DiBiwvEYsFvubLc7GLCC+iPj7M3/MQWVXh6l8qjk5uJd7p8LOMT+y/KPN0ZE/ROFVDc7WqxM/WCbA3usNnUUf17z58iwekHIG+srbeMmhB1f/IocDzImA5RLALeg0msjV1vR0wscV7TWPaFJkx1OUYQLtTsOcuI6J9bIYrZM28+1C4yyOx+rntgL11yPMoqaIlCK0TIeRPnhNbm08XBNNdyLOwzT/88k8aWyPoncz/T+shjyKvCYgo3k/bQ/flatHSKmS+GoaF4Fc6STnu22QOaRFxJH6sQkg0CpX0JrLZF8DpTDEFH5JozpyoXpFqd61YDV//Dd5OcP0b8Af3Rmr7nGhus5X0jFI0I=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1dLTjFLTHFKRVhLNE9BeWRwcjhNOE5EbXQ3ejkrK3d3TGdoNWxDa0pjRjVo?=
 =?utf-8?B?dm5DeHNvYThIdjRiWHMxOFZvYkIzdFl4bEkyTjZMTVF4K2dkSk9uV1lZZ0pr?=
 =?utf-8?B?ZTZOK2RnT3pXTGV5UkxWR2RHSjNaWjBGRVR5bmhpZ05LWlo5S2NBYkt0S284?=
 =?utf-8?B?VjVPdWxVU0Rwb2VraDNoQzNIU3FuL2o5c050ZmRJbmt5VCtPVFVqMUZjdGxM?=
 =?utf-8?B?MkpEaWNFU0dIM2hmbzlaQytSM3NMbWgyTmttS0gwVzQyQzhNRjlzNWRzTnUz?=
 =?utf-8?B?R1l3Y3ZMdFVHdVpOY0RUWE9sV0lUR2o1SEVNT0ZFcFRnT3g0S0l6VWl5YWJh?=
 =?utf-8?B?RFF3bTgyVVN3NklIV2pxNE1pM290U0JPNU9FZ2pQNHJqdlBWU3dpY0xpeW1M?=
 =?utf-8?B?YjhmSnVsODhSbmxtMzl1YWlwZXFlSi9uY2NGd011QUtCaE5PMDhOSm9uYTRU?=
 =?utf-8?B?dklzb3ZxZzRBMjd0cjE3TTlFMXlQc2k0MUpiK3Rndko0cGpYMFpUVmlvSFB2?=
 =?utf-8?B?YUI5NmQzUEZjam1sRS9mTDJ0WGxFV2o1TGY4SlFUUm5CR1EwbWVtbTJXZGky?=
 =?utf-8?B?Sk51b2xyMmxYeTczajFyRHM1dFd5QUp0T2xCZjdoS0l6T0J5cytZYkQ3NnRl?=
 =?utf-8?B?eFJwTDEwLzFNSEk5UGJGcHFhRG5zeXAyZlJlbktIb1VhNGhoQlJDTE9LVVVJ?=
 =?utf-8?B?SGlweHFFRFU1MFZtckpEaVdEU3pFWkYxRnRZWnlEbmd5REh4VUNLYUhSS3Fv?=
 =?utf-8?B?Yy9TSFYydFBxSStUaDRsQjVYekNEV05GZkp4VFVkY1c2eUU3VHZTS3V3VzBx?=
 =?utf-8?B?NzZHUHh2NUtJSWtuQTI2a3FzNXBHZEo2ZW9CUmhhK05KZXFGcEY2d2FnN01G?=
 =?utf-8?B?U0ZDV0hvUWRXaXpTZ1hjc0wzU1RqWjBjMnFRYkQ5Mmt1Z0ovd0ZqaGxTaWR0?=
 =?utf-8?B?STYvZ1Y0R2JMWUI3T2xtdi9ETm55U3o5TndiVkR4RHB1MU1jTFF5WStWMG1q?=
 =?utf-8?B?d3phUFpaeGtJcTJMY0JwVGxIUzhEelp1N3djbDBXN1dacDhkZEFaeXUrRWdQ?=
 =?utf-8?B?QUNKT3hUVDJlbGFoQXdwcFdSNmlGaXJybmhoOWxuR3hHeWZ1dkN6Mk81WEVh?=
 =?utf-8?B?aUtvYllaMUxOZ1ZQQTFTbmFkNlVoaHNhVnl3NGhMdSthZ3lpUkN3T0hFMnBn?=
 =?utf-8?B?dHdpd0pGeDVRN3ZMM1YyNCtya1BHNW1LYStKQTNycHhIeWlSalR5NzhoNDZl?=
 =?utf-8?B?U2FIVGwyTXJzeE9mVFpHUzBZNEFMK1BmTnR2Q2lvMDc4SlZTYi9ZVFhFMHNV?=
 =?utf-8?B?YllRVTQremxmcVRTYjNVeTZQWk5BeGJPc3dxYjNDUXl6Qlk1K3N1eTZiNHg1?=
 =?utf-8?B?SFBNNkZHV1oydW9rSGo4WERWQkdJV1JUN21hdDJGUERqVGFRVTdNMi9vemRH?=
 =?utf-8?B?WWx0dy9ZeSs1eTFOSU9OcG9kVEozd3Jqc2ptT2pxMUxWN3IzK0t4a25QREoz?=
 =?utf-8?B?VTF0NXBhUUdXd2JuYjh1dENpRzQ1NWpFSVVUcXhpZWRxcDZwTHQ4bkMwZHpP?=
 =?utf-8?B?bTd1c2VtVFUyNDhIYW9Wdy9ITG00MDAvVWVodFl3NVQzUTl3cE15RG9zakIr?=
 =?utf-8?Q?cMl7+nVp4vIvS3N+pmUlxjJEIYP64xl2hUvuOcm5GzZU=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dd5b0b5-512e-4802-9c9f-08db90a1899d
X-MS-Exchange-CrossTenant-AuthSource: TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2023 02:06:08.8139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3P286MB1783
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, 29 Jul 2023 19:39:34 +0300, Arınç ÜNAL wrote:
> On 26.07.2023 03:48, Shiji Yang wrote:
> > Sometimes pinctrl consumers may request different functions for the
> > same pin group in different situations. This patch can help to reset
> > the group function flag when requesting a different function.
> >
> > Signed-off-by: Shiji Yang <yangshiji66@outlook.com>
> > ---
> >   drivers/pinctrl/mediatek/pinctrl-mtmips.c | 21 +++++++++++++++++----
> >   1 file changed, 17 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/pinctrl/mediatek/pinctrl-mtmips.c b/drivers/pinctrl/mediatek/pinctrl-mtmips.c
> > index efd77b6c5..e5e085915 100644
> > --- a/drivers/pinctrl/mediatek/pinctrl-mtmips.c
> > +++ b/drivers/pinctrl/mediatek/pinctrl-mtmips.c
> > @@ -123,11 +123,24 @@ static int mtmips_pmx_group_enable(struct pinctrl_dev *pctrldev,
> >        int i;
> >        int shift;
> >  
> > -     /* dont allow double use */
> > +     /*
> > +      * for the same pin group, if request a different function,
> > +      * then clear the group function flag and continue, else exit.
> > +      */
> >        if (p->groups[group].enabled) {
> > -             dev_err(p->dev, "%s is already enabled\n",
> > -                     p->groups[group].name);
> > -             return 0;
> > +             for (i = 0; i < p->groups[group].func_count; i++) {
> > +                     if (p->groups[group].func[i].enabled == 1) {
> > +                             if (!strcmp(p->func[func]->name,
> > +                                     p->groups[group].func[i].name))
> > +                                     return 0;
> > +                             p->groups[group].func[i].enabled = 0;
> > +                             break;
> > +                     }
> > +             }
> > +
> > +             /* exit if request the "gpio" function again */
> > +             if (i == p->groups[group].func_count && func == 0)
> > +                     return 0;
> 
> Could you help me understand why? The @gpio_request_enable operation is
> not properly implemented on this driver so this check would never be
> true, no?

'.func_count' is the function number of a pin group. I will use MT7620's
'pa' group as an example to explain it. 'pa' group only has 1 function
'pa' ('gpio' function not included). When this group is first requested
as a gpio function, groups[pa].enabled will be set to 1, However,
groups[pa].func[i].enabled will still be 0 because 'gpio' is not a member
of groups[pa]. In this case, when we request gpio function again, for()
loop will do nothing but just increase 'i' to 1 (func_count). This will
make 'if (i == p->groups[group].func_count && func == 0)' to be true.


> 
> Even if it was, this makes it so that if a pin group is already given a
> function (meaning the pin group is enabled), it will never be given the
> gpio function when requested, unless I understand it wrong.
> 
> Arınç

When current function is pa, and we want to request a gpio function,
'if (p->groups[group].func[i].enabled == 1)' check will break the for()
loop and continue the pin configuration code.

If this 'if (p->groups[group].enabled)' check doesn't return, the pinmux
mode register will be reset and reconfigured.

	p->groups[group].enabled = 1;
	p->func[func]->enabled = 1;

	shift = p->groups[group].shift;
	if (shift >= 32) {
		shift -= 32;
		reg = SYSC_REG_GPIO_MODE2;
	}
	mode = rt_sysc_r32(reg);
	mode &= ~(p->groups[group].mask << shift);

	/* mark the pins as gpio */
	for (i = 0; i < p->groups[group].func[0].pin_count; i++)
		p->gpio[p->groups[group].func[0].pins[i]] = 1;

	/* function 0 is gpio and needs special handling */
	if (func == 0) {
		mode |= p->groups[group].gpio << shift;
	} else {
		for (i = 0; i < p->func[func]->pin_count; i++)
			p->gpio[p->func[func]->pins[i]] = 0;
		mode |= p->func[func]->value << shift;
	}
	rt_sysc_w32(mode, reg);


Ref:
MT7620 pa group switches between PA and GPIO functions during wireless calibration.
https://github.com/openwrt/openwrt/blob/main/package/kernel/mac80211/patches/rt2x00/994-rt2x00-import-support-for-external-LNA-on-MT7620.patch

Regards,
Shiji Yang
