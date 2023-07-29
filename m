Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D00B7680A0
	for <lists+linux-mips@lfdr.de>; Sat, 29 Jul 2023 18:39:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229545AbjG2Qjs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 29 Jul 2023 12:39:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbjG2Qjr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 29 Jul 2023 12:39:47 -0400
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5315CE79;
        Sat, 29 Jul 2023 09:39:44 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9200B1BF207;
        Sat, 29 Jul 2023 16:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
        t=1690648783;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Q1vPYh+RBZ0E0Mk1ojSUtBjCV8F9zDSzqFOeRor6Gi8=;
        b=Ca6970Xdd0mzheJuqr9TNeSO6LKpUu9ThBv1MtHWD7tc1raBHhvJ7bI8jhDK0Sqe+Fide5
        7+g08PbWPKt+CDHhFWYXfHKSGb5/ZjFk/ujaGX312s1TLnomUi4ncg3mrnEY4HWOlSc5rm
        J9vmrWUYbRDzSuFh5BuU2yYRELwxBfPRB2mLKZzWjfdXr1X2qI1UHaCou3sAqXwSLLyOjX
        89f8AMiI3sHBdBnGeztvJe+WonGDh/DnOxDlKM+wELQvP5JNi493OVoCQeMIYaWsbIjhqh
        WXKWLM/9G9cpd+SqesY1QO9TTGfursygGS977NuPwrC/6Q5huqyh6pJ+MJmAAg==
Message-ID: <2eb012d9-0d36-54c6-6f2c-1a286d45c497@arinc9.com>
Date:   Sat, 29 Jul 2023 19:39:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: mtmips: support requesting different functions
 for same group
To:     Shiji Yang <yangshiji66@outlook.com>, linux-gpio@vger.kernel.org
Cc:     Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org
References: <TYAP286MB0315A9671B4BA0347E70D9E0BC00A@TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM>
Content-Language: en-US
From:   =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <TYAP286MB0315A9671B4BA0347E70D9E0BC00A@TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 26.07.2023 03:48, Shiji Yang wrote:
> Sometimes pinctrl consumers may request different functions for the
> same pin group in different situations. This patch can help to reset
> the group function flag when requesting a different function.
> 
> Signed-off-by: Shiji Yang <yangshiji66@outlook.com>
> ---
>   drivers/pinctrl/mediatek/pinctrl-mtmips.c | 21 +++++++++++++++++----
>   1 file changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtmips.c b/drivers/pinctrl/mediatek/pinctrl-mtmips.c
> index efd77b6c5..e5e085915 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtmips.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtmips.c
> @@ -123,11 +123,24 @@ static int mtmips_pmx_group_enable(struct pinctrl_dev *pctrldev,
>   	int i;
>   	int shift;
>   
> -	/* dont allow double use */
> +	/*
> +	 * for the same pin group, if request a different function,
> +	 * then clear the group function flag and continue, else exit.
> +	 */
>   	if (p->groups[group].enabled) {
> -		dev_err(p->dev, "%s is already enabled\n",
> -			p->groups[group].name);
> -		return 0;
> +		for (i = 0; i < p->groups[group].func_count; i++) {
> +			if (p->groups[group].func[i].enabled == 1) {
> +				if (!strcmp(p->func[func]->name,
> +					p->groups[group].func[i].name))
> +					return 0;
> +				p->groups[group].func[i].enabled = 0;
> +				break;
> +			}
> +		}
> +
> +		/* exit if request the "gpio" function again */
> +		if (i == p->groups[group].func_count && func == 0)
> +			return 0;

Could you help me understand why? The @gpio_request_enable operation is 
not properly implemented on this driver so this check would never be 
true, no?

Even if it was, this makes it so that if a pin group is already given a 
function (meaning the pin group is enabled), it will never be given the 
gpio function when requested, unless I understand it wrong.

Arınç
