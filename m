Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4351A5F5B05
	for <lists+linux-mips@lfdr.de>; Wed,  5 Oct 2022 22:33:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230384AbiJEUdD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 5 Oct 2022 16:33:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230325AbiJEUdC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 5 Oct 2022 16:33:02 -0400
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [IPv6:2001:67c:2050:0:465::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1C4C3FEED;
        Wed,  5 Oct 2022 13:33:01 -0700 (PDT)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4MjR8k44bKz9sVw;
        Wed,  5 Oct 2022 22:32:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hauke-m.de; s=MBO0001;
        t=1665001974;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=G3ttKhwrHMUW6WW1RkisMJse/CsC2rDUCyGbXu3N9nE=;
        b=udKaAzFBnhRXsHN0k6OqMFOpG5/je89Asq8fD/tDbsgpnTcCLBfrCU0f+mGRYjDpRXaZH9
        vTaQRMDD7VHsUe6c/Zw4mKXJbB+RsXkl4DUREEuKac8dHiyw8qQ7MpqJSPSjnFIvWdzCy/
        ekOQHeDsfyPsF+BHaWsQ3kpSfeesesQX0xm3GNKDLgBf8q5OltixjvJGWTbB9e6su/IqQM
        /Oz5YrQnBmpKbyEzdSQ5LSJXpocm5cjr+xmH+9GvfQIAKO8GSD4oMQcv043HZSU8RvbFbd
        +6Xt85b0dbxQvf+/jzwGxQzQbqmwM2Rkr+VXsH9Cq367sTpRQNbo57dvTqiDag==
Message-ID: <e9bf3c1a-1a18-c62a-0059-f57a29eeeb06@hauke-m.de>
Date:   Wed, 5 Oct 2022 22:32:52 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v6 2/2] dt-bindings: mips: brcm: add Broadcom SoCs
 bindings
Content-Language: en-US
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        zhouyanjie@wanyeetech.com,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh@kernel.org>
References: <20221004050924.986211-1-sergio.paracuellos@gmail.com>
 <20221004050924.986211-3-sergio.paracuellos@gmail.com>
 <d73089a7-f7ad-2f45-8307-3c4ec20cbb79@gmail.com>
 <CAMhs-H8531j+1b_rjZnbymfkhUjGUwg94QFFsHkcPAo8pzmkeQ@mail.gmail.com>
From:   Hauke Mehrtens <hauke@hauke-m.de>
In-Reply-To: <CAMhs-H8531j+1b_rjZnbymfkhUjGUwg94QFFsHkcPAo8pzmkeQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4MjR8k44bKz9sVw
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 10/4/22 07:20, Sergio Paracuellos wrote:
> On Tue, Oct 4, 2022 at 7:14 AM Rafał Miłecki <zajec5@gmail.com> wrote:
>>
>> On 4.10.2022 07:09, Sergio Paracuellos wrote:
>>> Add the yaml binding for MIPS Broadcom cable/DSL/settop platforms.
>>>
>>> Acked-by: Florian Fainelli <f.fainelli@gmail.com>
>>> Reviewed-by: Rob Herring <robh@kernel.org>
>>> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
>>> ---
>>>    .../devicetree/bindings/mips/brcm/soc.yaml    | 98 +++++++++++++++++++
>>>    1 file changed, 98 insertions(+)
>>>    create mode 100644 Documentation/devicetree/bindings/mips/brcm/soc.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/mips/brcm/soc.yaml b/Documentation/devicetree/bindings/mips/brcm/soc.yaml
>>> new file mode 100644
>>> index 000000000000..39b4609cd1cc
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/mips/brcm/soc.yaml
>>> @@ -0,0 +1,98 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/mips/brcm/soc.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Broadcom cable/DSL/settop platforms
>>> +
>>> +maintainers:
>>> +  - Hauke Mehrtens <hauke@hauke-m.de>
>>> +  - Rafał Miłecki <zajec5@gmail.com>
>>> +  - Florian Fainelli <f.fainelli@gmail.com>
>>
>> The only MIPS SoCs I really worked on were BCM47xx. I didn't do any real
>> work on cable/DSL/STB.
>>
>> I don't really feel up to like maintaining those SoCs.
> 
> I can remove you from maintainers in this new file. I added you
> because of this entry in MAINTAINERS file:
> 
> BROADCOM BCM47XX MIPS ARCHITECTURE
> M:  Hauke Mehrtens <hauke@hauke-m.de>
> M:  Rafał Miłecki <zajec5@gmail.com>
> L:  linux-mips@vger.kernel.org
> S:  Maintained
> F:  Documentation/devicetree/bindings/mips/brcm/
> F:  arch/mips/bcm47xx/*
> F:  arch/mips/include/asm/mach-bcm47xx/*
> 
> Since 'Documentation/devicetree/bindings/mips/brcm/' is supposed to be
> maintained also by you I thought it makes sense to list you also here.
> 
> I don't know, maybe you should remove yourself also from the
> MAINTAINERS file for BROADCOM BCM47XX MIPS ARCHITECTURE???
> 
> Let me know what you want me to do.
> 
> Thanks,
>      Sergio Paracuellos

Hi,

Please remove me also from the maintainers of this Broadcom CPU like you 
removed Rafał. The BCM47XX SoCs mostly use standard MIPS cores and only 
very few use Broadcom MIPS cores. The Broadcom MIPS cores are much more 
often used in the BCM63XX SoCs.

Hauke

