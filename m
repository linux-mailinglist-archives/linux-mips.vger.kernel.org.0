Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 224C43B4262
	for <lists+linux-mips@lfdr.de>; Fri, 25 Jun 2021 13:18:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230152AbhFYLVI convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Fri, 25 Jun 2021 07:21:08 -0400
Received: from aposti.net ([89.234.176.197]:38932 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229934AbhFYLVH (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 25 Jun 2021 07:21:07 -0400
Date:   Fri, 25 Jun 2021 12:18:35 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v3 2/4] dt-bindings: clock: Add documentation for MAC PHY
 control bindings.
To:     =?UTF-8?b?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>
Cc:     tsbogend@alpha.franken.de, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        sihui.liu@ingenic.com, jun.jiang@ingenic.com,
        sernia.zhou@foxmail.com
Message-Id: <ZQ89VQ.GVBTUGJHI7O93@crapouillou.net>
In-Reply-To: <1624547189-61079-3-git-send-email-zhouyanjie@wanyeetech.com>
References: <1624547189-61079-1-git-send-email-zhouyanjie@wanyeetech.com>
        <1624547189-61079-3-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Zhou,

Le jeu., juin 24 2021 at 23:06:27 +0800, 周琰杰 (Zhou Yanjie) 
<zhouyanjie@wanyeetech.com> a écrit :
> Update the CGU binding documentation, add mac-phy-ctrl as a
> pattern property.
> 
> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>

Acked-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
> 
> Notes:
>     v3:
>     New patch.
> 
>  Documentation/devicetree/bindings/clock/ingenic,cgu.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/ingenic,cgu.yaml 
> b/Documentation/devicetree/bindings/clock/ingenic,cgu.yaml
> index c65b945..ee9b5fb 100644
> --- a/Documentation/devicetree/bindings/clock/ingenic,cgu.yaml
> +++ b/Documentation/devicetree/bindings/clock/ingenic,cgu.yaml
> @@ -93,6 +93,8 @@ required:
>  patternProperties:
>    "^usb-phy@[a-f0-9]+$":
>      allOf: [ $ref: "../phy/ingenic,phy-usb.yaml#" ]
> +  "^mac-phy-ctrl@[a-f0-9]+$":
> +    allOf: [ $ref: "../net/ingenic,mac.yaml#" ]
> 
>  additionalProperties: false
> 
> --
> 2.7.4
> 


