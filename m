Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 038DE3A2CDD
	for <lists+linux-mips@lfdr.de>; Thu, 10 Jun 2021 15:24:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230238AbhFJN0y convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Thu, 10 Jun 2021 09:26:54 -0400
Received: from mslow1.mail.gandi.net ([217.70.178.240]:39297 "EHLO
        mslow1.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230084AbhFJN0x (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 10 Jun 2021 09:26:53 -0400
Received: from relay6-d.mail.gandi.net (unknown [217.70.183.198])
        by mslow1.mail.gandi.net (Postfix) with ESMTP id 0CAB3C58FF;
        Thu, 10 Jun 2021 13:14:43 +0000 (UTC)
Received: (Authenticated sender: paul@opendingux.net)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 2E8F5C0002;
        Thu, 10 Jun 2021 13:14:16 +0000 (UTC)
Date:   Thu, 10 Jun 2021 14:14:09 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 1/2] dt-bindings: mmc: JZ4740: Add bindings for JZ4775.
To:     =?UTF-8?b?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>
Cc:     ulf.hansson@linaro.org, robh+dt@kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sihui.liu@ingenic.com,
        jun.jiang@ingenic.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com
Message-Id: <L3MHUQ.A87BDK2JG0G33@crapouillou.net>
In-Reply-To: <1623329930-14387-2-git-send-email-zhouyanjie@wanyeetech.com>
References: <1623329930-14387-1-git-send-email-zhouyanjie@wanyeetech.com>
        <1623329930-14387-2-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Zhou,

Le jeu., juin 10 2021 at 20:58:49 +0800, 周琰杰 (Zhou Yanjie) 
<zhouyanjie@wanyeetech.com> a écrit :
> Add the MMC bindings for the JZ4775 SoC from Ingenic.
> 
> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>

Acked-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
> 
> Notes:
>     v1->v2:
>     No change.
> 
>  Documentation/devicetree/bindings/mmc/ingenic,mmc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/ingenic,mmc.yaml 
> b/Documentation/devicetree/bindings/mmc/ingenic,mmc.yaml
> index 04ba8b7..546480f 100644
> --- a/Documentation/devicetree/bindings/mmc/ingenic,mmc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/ingenic,mmc.yaml
> @@ -19,6 +19,7 @@ properties:
>            - ingenic,jz4740-mmc
>            - ingenic,jz4725b-mmc
>            - ingenic,jz4760-mmc
> +          - ingenic,jz4775-mmc
>            - ingenic,jz4780-mmc
>            - ingenic,x1000-mmc
>        - items:
> --
> 2.7.4
> 


