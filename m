Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36A9B5FF942
	for <lists+linux-mips@lfdr.de>; Sat, 15 Oct 2022 10:58:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229646AbiJOI6F (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 15 Oct 2022 04:58:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbiJOI6B (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 15 Oct 2022 04:58:01 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B26C35508B;
        Sat, 15 Oct 2022 01:58:00 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id fy4so15036418ejc.5;
        Sat, 15 Oct 2022 01:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8THr6e5dwrx+OFbz/eCJDkyw6kNXf6tcFfVfShB5Ghc=;
        b=PYkuZuRdNzxrv0OD0mIbbvrBnUkodAuyGNCxDt6hQBbxYVIW18gxO2UNn7A5DTXXhK
         7xSOFCeGjJFHHVrxKCfmSbDcE2tC46tGcy+WUB+ca6GYyWUTpiPUBP55dWNmuNWHxfPD
         A20zltxsv7dLa5/jD8qMUzu7GX8s+F2qnSE0Mjcn8zbxgIiZHkKns4Mt2bsNc5W9nGrr
         xhY/UGCYgtKRObfP4S+UJsb3iMu6m4FitzIBbfwt7tlylNhuJDcp7sXAbPDjyoVSW3d9
         MhIXlNaSaf/ObdQbBMKaUMp9Jqf8EYXgBr9mYCBF6wnAzIMmxqbKhv6eG0TV7gsYMGmK
         Ye4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8THr6e5dwrx+OFbz/eCJDkyw6kNXf6tcFfVfShB5Ghc=;
        b=vbUIzZEdVHSLLuHNKIZMt/BV8fuQFxqQf7xA3I3pyB9WYQvTBX2wHaQwHRHa50lDTZ
         33Yc0CqMO+UcaNWtuKu8A929PsEy1/HDqOu/tkFf6Tlg+Ol8xSgas0jjqEUWsCz8Aoqi
         6+hhGFlCsr9NXSbkjYeYJ96XPYV+hcxQ68ZQbVPsFpGvdrzQGvm/YHMK6lA+LYYtaZoo
         ZRMP3ws2pSMbxwzXys1EvsC9lYRqEhZxdacbDVlG2lafdLpRgJVQNNAS/6MVMDujkJ0U
         QhytIoyW4MFiYrdCK5P6J6XoAIKvHB+HbWcUrZF2FFWzeodqnIJFgdAaKYFid2eT2jSo
         gm+w==
X-Gm-Message-State: ACrzQf2Vo5SS0HfeAeP2NHewPSLQnc6JyXI6JaDgoTbNZikLWwSrPoaP
        H16Wu0VLXIh7QahQnsW7XGc=
X-Google-Smtp-Source: AMsMyM6rEV1B5jLb3ffAxNGxXsPvb0SuOmKpM8CYU3+FvJlIBcAv7Ts5bcgBpEKqOXGDzWwiQlTyQQ==
X-Received: by 2002:a17:906:eec9:b0:73d:c369:690f with SMTP id wu9-20020a170906eec900b0073dc369690fmr1351837ejb.767.1665824279047;
        Sat, 15 Oct 2022 01:57:59 -0700 (PDT)
Received: from [192.168.26.149] (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.googlemail.com with ESMTPSA id kz1-20020a17090777c100b0073d753759fasm2840341ejc.172.2022.10.15.01.57.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Oct 2022 01:57:58 -0700 (PDT)
Message-ID: <27607fc6-fcab-ec13-7a21-16e6e0de7602@gmail.com>
Date:   Sat, 15 Oct 2022 10:57:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH V2 1/2] dt-bindings: mtd: partitions: add TP-Link
 SafeLoader layout
To:     Rob Herring <robh@kernel.org>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        Hauke Mehrtens <hauke@hauke-m.de>,
        bcm-kernel-feedback-list@broadcom.com,
        John Crispin <john@phrozen.org>,
        =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20221012050442.6815-1-zajec5@gmail.com>
 <20221012162117.GA2275712-robh@kernel.org>
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <20221012162117.GA2275712-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 12.10.2022 18:21, Rob Herring wrote:
> On Wed, Oct 12, 2022 at 07:04:41AM +0200, Rafał Miłecki wrote:
>> From: Rafał Miłecki <rafal@milecki.pl>
>>
>> Most TP-Link home routers use the same partitioning system based on a
>> custom ASCII table.
>>
>> It doesn't seem to have any official name. GPL sources contain tool
>> named simply "make_flash" and Makefile target "FlashMaker".
>>
>> This partitions table format was first found in devices with a custom
>> SafeLoader bootloader so it was called SafeLoader by a community. Later
>> it was ported to other bootloaders but it seems the name sticked.
>>
>> Add binding for describing flashes with SafeLoader partitions table. It
>> allows operating systems to parse it properly and register proper flash
>> layout.
>>
>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>> ---
>> V2: Fix typo in commit: s/same/name/
>> ---
>>   .../tplink,safeloader-partitions.yaml         | 44 +++++++++++++++++++
>>   1 file changed, 44 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mtd/partitions/tplink,safeloader-partitions.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/mtd/partitions/tplink,safeloader-partitions.yaml b/Documentation/devicetree/bindings/mtd/partitions/tplink,safeloader-partitions.yaml
>> new file mode 100644
>> index 000000000000..e38aaea5aa11
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mtd/partitions/tplink,safeloader-partitions.yaml
>> @@ -0,0 +1,44 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/mtd/partitions/tplink,safeloader-partitions.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: TP-Link SafeLoader partitions
>> +
>> +description: |
>> +  TP-Link home routers store various data on flash (e.g. bootloader,
>> +  flash layout, firmware, product info, configuration, calibration
>> +  data). That requires flash partitioning.
>> +
>> +  Flash space layout of TP-Link devices is stored on flash itself using
>> +  a custom ASCII-based format. That format was first found in TP-Link
>> +  devices with a custom SafeLoader bootloader. Later it was adapted to
>> +  CFE and U-Boot bootloaders.
>> +
>> +  This binding describes partitioning method and defines offset of ASCII
>> +  based partitions table. That offset is picked at manufacturing process
>> +  and doesn't change.
>> +
>> +maintainers:
>> +  - Rafał Miłecki <rafal@milecki.pl>
>> +
>> +properties:
>> +  compatible:
>> +    const: tplink,safeloader-partitions
>> +
>> +  partitions-table-offset:
>> +    description: Flash offset of partitions table
>> +    $ref: "/schemas/types.yaml#/definitions/uint32"
> 
> Don't need quotes.
> 
>> +
>> +required:
>> +  - partitions-table-offset
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    partitions {
>> +        compatible = "tplink,safeloader-partitions";
>> +        partitions-table-offset = <0x100000>;
> 
> What is in the space before this? It is part of the safeloader
> partitions? If the safeloader partitions are not the entire device, then
> perhaps we still need fixed partitions.

Various partitions are placed before and after partitions table.

Usually/always the whole flash space is covered by partitions defined in
the partitions table.
