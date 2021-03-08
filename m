Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3837331977
	for <lists+linux-mips@lfdr.de>; Mon,  8 Mar 2021 22:41:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229978AbhCHVlK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Mar 2021 16:41:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229797AbhCHVlF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 8 Mar 2021 16:41:05 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8588C06174A;
        Mon,  8 Mar 2021 13:41:04 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id 18so23448093lff.6;
        Mon, 08 Mar 2021 13:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vPvKVk+SS2hHuikOj+SudvAPMev+b1p1j/4m7ZYGhKo=;
        b=j7dl59YCxIjbaePmGicyH0IL8wSIFehvsnSu4VHf3oD+LlDTfRUOC+ntyycels9eMw
         uBJ/G/k5tXorEv7e0OMMevKbWJTZ4CUd+Ihawwgpdple4k1s9QifXT2Y5ZWidEYNY+Ei
         W6n+K2tsjEVwavZxy3coJIPEJj+T1FUkk9jzym47vybslfZxu6A7VapFWABYaNNT4ygg
         p6qNw5tAFEFj5V6kXlNGpIC/1a+zdk9IiMVBOB2nS02xFeWirIG6tLWWfkmqIqc90CR6
         AST4eYG4lOc8UwzD3oKAxPFUPhH8vYP7rt4AHsIcUs9jYf/o8RgfUT7Z4wg0mhS0geCH
         q3Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vPvKVk+SS2hHuikOj+SudvAPMev+b1p1j/4m7ZYGhKo=;
        b=E9HrElKFp/6tOpWgsEWcZoB2x6xYQFVMNWTW+Ih8hVzN1Gngn+Vp941DdOqPnbfZWW
         Lz71h9iib7MN3r4PMRyTHliiqHSQ/o2BZPLKRZmHuvFlZ7s0SdH7KZxLOGcQDnnryQ0k
         an6IhS8ZLsGAjE6XG6iHMTDq2uQ6OzGesKQo/ARQZjwW7v1PCgU5rlq0I3+SyhYZTie+
         wDng4Dgt62sxWY/0Sop3JlSpTAbL/cOtFUmjDggvAb/FAEC1tel9O4pFD2vaTfUHS3em
         ei4Ho1r8VXhOOrdh5lJrtoNMDAc3tpfgXDm+LdoNX3K2Egz51AhRiZQzC6C+l8OZObzP
         JUQQ==
X-Gm-Message-State: AOAM531NKYCgkAUPpYiAZu+uor/9DadOMx9ieK+15SV5ToGoR5nCcBp1
        r7Lyi1/u6wQkky93SElOfsI=
X-Google-Smtp-Source: ABdhPJzqR/lVxZgOYKYvYpxs6vuK+sR67/oi0vpH2NvowriJbllLHXyn6JVlIjpfC1DDRcLJ1Ke3eQ==
X-Received: by 2002:ac2:57c6:: with SMTP id k6mr15631546lfo.264.1615239663311;
        Mon, 08 Mar 2021 13:41:03 -0800 (PST)
Received: from localhost.localdomain (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id w1sm519860ljw.14.2021.03.08.13.41.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Mar 2021 13:41:02 -0800 (PST)
Subject: Re: [PATCH stblinux.git 1/2] dt-bindings: firmware: add Broadcom's
 NVRAM memory mapping
To:     Rob Herring <robh@kernel.org>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Vivek Unune <npcomplete13@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
        linux-kernel@vger.kernel.org,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20210302074405.18998-1-zajec5@gmail.com>
 <20210308184308.GA2762703@robh.at.kernel.org>
 <93f1d985-54ae-9cbe-ef42-9e62b86d2633@gmail.com>
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Message-ID: <5f4a50dc-0981-45b4-bb89-d6152689fe2a@gmail.com>
Date:   Mon, 8 Mar 2021 22:41:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <93f1d985-54ae-9cbe-ef42-9e62b86d2633@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 08.03.2021 22:37, Rafał Miłecki wrote:
> On 08.03.2021 19:43, Rob Herring wrote:
>> On Tue, Mar 02, 2021 at 08:44:04AM +0100, Rafał Miłecki wrote:
>>> From: Rafał Miłecki <rafal@milecki.pl>
>>>
>>> NVRAM structure contains device data and can be accessed using MMIO.
>>>
>>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>>> ---
>>>   .../bindings/firmware/brcm,nvram.yaml         | 41 +++++++++++++++++++
>>>   1 file changed, 41 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/firmware/brcm,nvram.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/firmware/brcm,nvram.yaml b/Documentation/devicetree/bindings/firmware/brcm,nvram.yaml
>>> new file mode 100644
>>> index 000000000000..12af8e2e7c9c
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/firmware/brcm,nvram.yaml
>>> @@ -0,0 +1,41 @@
>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: "http://devicetree.org/schemas/firmware/brcm,nvram.yaml#"
>>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>>> +
>>> +title: Broadcom's NVRAM
>>> +
>>> +maintainers:
>>> +  - Rafał Miłecki <rafal@milecki.pl>
>>> +
>>> +description: |
>>> +  NVRAM is a structure containing device specific environment variables.
>>> +  It is used for storing device configuration, booting parameters and
>>> +  calibration data.
>>
>> The structure of the data is fully discoverable just from a genericish
>> 'brcm,nvram'?
> 
> Yes, NVRAM structure is a header (with magic and length) and a list of
> key-value pairs separated by \0. If you map memory at given address you
> should verify magic and start reading key-value pairs.
> 
> Content example: foo=bar\0baz=qux\0quux(...)
> 
> There is no predefined order of pairs, set of keys or anything similar I
> could think of. I can't think of anything more worth describing in DT.

Ah, I've just realized, I'm replying to the "firmware" binding patch.

Florian suggested to look at NVMEM subsystem instead. Please kindly check
[PATCH V2 1/2] dt-bindings: nvmem: add Broadcom's NVRAM
