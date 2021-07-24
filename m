Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D78523D47D8
	for <lists+linux-mips@lfdr.de>; Sat, 24 Jul 2021 15:24:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234316AbhGXMnf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 24 Jul 2021 08:43:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:49726 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230449AbhGXMnf (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 24 Jul 2021 08:43:35 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 96FD860E8F;
        Sat, 24 Jul 2021 13:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627133046;
        bh=mEUw99F293tWtz8wzxel1pIi1bx+JKngz0tGxATEfFo=;
        h=References:From:To:Cc:Subject:In-reply-to:Date:From;
        b=W+y68Scxf5cvGO18Lk4XDQUEO3CQJV2QFJ9gKGnbRK3gSaCd+09v3zTyCUorG2awk
         DnxfrgoAXrNac00GfAOa4X27hrfMIcwBX8c7mBPWbjm2hoJIFXyx/b764zK+gyoYmi
         MbHAqgYyFyNCXBEy4HZFkFDdaxQHdNC2sqVoQiFb5Kqr2k39IqOufobxBL3hCyOEO+
         Pu4smcXHc/dEtNn/3JkxXMuHnCx8gZaQLMPa3XBF9oPJzRbxyqC7P69jzxVbSCeXsM
         bNQtNCzY2gsLIwasjX3xQSB731WcHmuMKcQNuCq+OUG+noj00gdgcIzRu1KfWjSpsY
         +cEyxcfQ1Nr8g==
References: <1627116521-124612-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1627116521-124612-3-git-send-email-zhouyanjie@wanyeetech.com>
 <IQWQWQ.9EAMZ76IPL892@crapouillou.net>
 <e4f7897a-6b70-d936-a968-e66556382851@wanyeetech.com>
User-agent: mu4e 1.4.15; emacs 27.2
From:   Felipe Balbi <balbi@kernel.org>
To:     Zhou Yanjie <zhouyanjie@wanyeetech.com>
Cc:     Paul Cercueil <paul@crapouillou.net>, gregkh@linuxfoundation.org,
        robh+dt@kernel.org, hminas@synopsys.com,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sihui.liu@ingenic.com,
        jun.jiang@ingenic.com, sernia.zhou@foxmail.com,
        Dragan =?utf-8?B?xIxlxI1h?= =?utf-8?B?dmFj?= 
        <dragancecavac@yahoo.com>
Subject: Re: [PATCH 2/2] USB: dwc2: Add OTG support for Ingenic SoCs.
In-reply-to: <e4f7897a-6b70-d936-a968-e66556382851@wanyeetech.com>
Date:   Sat, 24 Jul 2021 16:24:01 +0300
Message-ID: <8735s37slq.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


Hi Zhou,

Zhou Yanjie writes:
>>> diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
>>> index 67c5eb1..a7a1b50 100644
>>> --- a/drivers/usb/dwc2/params.c
>>> +++ b/drivers/usb/dwc2/params.c
>>> @@ -71,6 +71,47 @@ static void dwc2_set_his_params(struct
>>> dwc2_hsotg *hsotg)
>>>      p->power_down = DWC2_POWER_DOWN_PARAM_NONE;
>>>  }
>>>
>>> +static void dwc2_set_jz4775_params(struct dwc2_hsotg *hsotg)
>>> +{
>>> +    struct dwc2_core_params *p = &hsotg->params;
>>> +
>>> +    p->otg_cap = DWC2_CAP_PARAM_NO_HNP_SRP_CAPABLE;
>>> +    p->speed = DWC2_SPEED_PARAM_HIGH;
>>> +    p->phy_type = DWC2_PHY_TYPE_PARAM_UTMI;
>>> +    p->phy_utmi_width = 16;
>>> +    p->deactivate_ingenic_overcurrent_detection =
>>> +        device_property_read_bool(hsotg->dev, "disable-over-current");
>>
>> That device property was not documented in the previous patch. Also
>> this probably should be "ingenic,disable-over-current".
>>
>
> This device property already exists (it has been used in the
> "dwc2_get_device_properties()" function below).
>
> Under normal circumstances, after using this device attribute, it
> should be possible to turn off the overcurrent
>
> detection, but on the Ingenic processors, somehow it did not take
> effect normally, and we must operate the
>
> "VBVALOEN" bit and "VBVALOVAL" bit of "GOTGCTL" register to make it normal.

I believe what Paul is suggesting is that this property lacks
documentation under Documentation/devicetree/bindings/. If that's the
case, you could take the opportunity to document the property and,
perhaps, add the missing prefix.

-- 
balbi
