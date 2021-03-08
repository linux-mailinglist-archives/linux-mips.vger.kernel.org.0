Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2661E33196C
	for <lists+linux-mips@lfdr.de>; Mon,  8 Mar 2021 22:38:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229627AbhCHVh7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Mar 2021 16:37:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbhCHVhr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 8 Mar 2021 16:37:47 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D134C06174A;
        Mon,  8 Mar 2021 13:37:47 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id q25so23432043lfc.8;
        Mon, 08 Mar 2021 13:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=abCnK8oP7nGAZ35KUotLl907eUfcfc7ef69hK2Ao3gI=;
        b=q7tUPr1VQ7bVdJbvdxenDQb/xwGyHwhmoA9P9W/590dIwEAVL2HC22XxfMRNOUnmQo
         5oNUbY529XkX92H7DFl80j+kTyXfNPL5pTasuzVCTPG5JU+QbaAPCfUQrrTIMVrP+EdV
         rOgyEGO0T6TKGQ52OuoPb/cF7EdIkkcwMyQ0VUZaYIhk1NhBnnu/5uyqvWmIlJBzcTqC
         iuqYLCnYh/4Uv1xMPgAHnjewntJ/NHAfXnT223A4X4JWN+4ZZc5FshT4HiW4DqkNTQVO
         y/l7URIhXa1MhN+GajR7VBPoe2yDh/KOP3t0FXrWydZCN7kzYzfZ3P12klTu2djxTNkR
         butw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=abCnK8oP7nGAZ35KUotLl907eUfcfc7ef69hK2Ao3gI=;
        b=NzE3zysZWrHxZJsgBV9UyOVeoYkTlNnk+M+MJWI/8falLQD8A0enDmXR0V47DRdYJo
         VLOfnrT1lj5jsHVMkea/pa6hQ6qCjQHqQzSxzFym2iRh0JhUvKul0CipoMZ4Garlro4r
         WnSDvMi6r4k66BoFZ/R3UPz+4Hd5e8dR8oEGKoVvb8B1aFSYiu24yfYHTHPXR75QHkgD
         nXneV2/F0tCzslPEXKqT7n0r5PEtUz5G3URVJU9CihLHenZ0wPwSJStOsqhN9k9EbcIS
         nLBTYP/qdg38RqJ+Ezvxl/yH8LcWJ0QWa72/giEuf4RsU+oTqqQI10pdGh2/hddlraEy
         YrQg==
X-Gm-Message-State: AOAM532GtDhcX9gYjX82URW+s2C7OOB5F9MvFF1CNYkQo/5XmcxBl3Uk
        y6MyuGo0mjs8TsCYJIZopUzm+U6+5d4=
X-Google-Smtp-Source: ABdhPJxDX9YRLuxfX9/RB9OZeqE/YER1VnjejatoSNNHGwuYIfvOLQDBLTXgcweEq12GUsavC1EUAA==
X-Received: by 2002:a19:4108:: with SMTP id o8mr15805486lfa.180.1615239465466;
        Mon, 08 Mar 2021 13:37:45 -0800 (PST)
Received: from localhost.localdomain (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id f10sm1491470lfm.194.2021.03.08.13.37.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Mar 2021 13:37:44 -0800 (PST)
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
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Message-ID: <93f1d985-54ae-9cbe-ef42-9e62b86d2633@gmail.com>
Date:   Mon, 8 Mar 2021 22:37:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210308184308.GA2762703@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 08.03.2021 19:43, Rob Herring wrote:
> On Tue, Mar 02, 2021 at 08:44:04AM +0100, Rafał Miłecki wrote:
>> From: Rafał Miłecki <rafal@milecki.pl>
>>
>> NVRAM structure contains device data and can be accessed using MMIO.
>>
>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>> ---
>>   .../bindings/firmware/brcm,nvram.yaml         | 41 +++++++++++++++++++
>>   1 file changed, 41 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/firmware/brcm,nvram.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/firmware/brcm,nvram.yaml b/Documentation/devicetree/bindings/firmware/brcm,nvram.yaml
>> new file mode 100644
>> index 000000000000..12af8e2e7c9c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/firmware/brcm,nvram.yaml
>> @@ -0,0 +1,41 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: "http://devicetree.org/schemas/firmware/brcm,nvram.yaml#"
>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>> +
>> +title: Broadcom's NVRAM
>> +
>> +maintainers:
>> +  - Rafał Miłecki <rafal@milecki.pl>
>> +
>> +description: |
>> +  NVRAM is a structure containing device specific environment variables.
>> +  It is used for storing device configuration, booting parameters and
>> +  calibration data.
> 
> The structure of the data is fully discoverable just from a genericish
> 'brcm,nvram'?

Yes, NVRAM structure is a header (with magic and length) and a list of
key-value pairs separated by \0. If you map memory at given address you
should verify magic and start reading key-value pairs.

Content example: foo=bar\0baz=qux\0quux(...)

There is no predefined order of pairs, set of keys or anything similar I
could think of. I can't think of anything more worth describing in DT.


> And it's a dedicated memory outside of regular RAM?

Yes
