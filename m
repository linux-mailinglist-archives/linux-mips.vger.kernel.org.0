Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1FAC17ADCC
	for <lists+linux-mips@lfdr.de>; Thu,  5 Mar 2020 19:03:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726049AbgCESDk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 5 Mar 2020 13:03:40 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:39179 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726145AbgCESDj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 5 Mar 2020 13:03:39 -0500
Received: by mail-wr1-f67.google.com with SMTP id y17so8157492wrn.6
        for <linux-mips@vger.kernel.org>; Thu, 05 Mar 2020 10:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pacc1BawiG1/tj/EUN5oeT6l0SNiwMc2r5gM58s+hZU=;
        b=LjBCkZcySsVoxO+Ds1fzPM7qKl+m2oV1Wh+N2BfAVERHnTp6L8gT8PRW+QtaOlot4W
         DRnIzO10s/Bnbvjgdnay3OyeVuIqq6FcBm0lR7InFUaCyRO3KOrelt+ZPvLLpiJT3nsl
         oxQzZivGQBLvG+rEDRLiVHGMdXfSQTVciVLzCoLI1CIiRlWJRCve0bdO08hx+rbeUY0Z
         /fVCtR0Y0jvAJIJF0t+NKBhYzpL02zEgDeEpgEinmdnGFXhlwkcIDTmsIL2QjkTW2FLQ
         4BOmcLobWPkfG4EQW5eVt95UBaNlXidQtIonoPyfD8dXnOfQOjJA0lSCJCfwrI4zs5kh
         W5Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pacc1BawiG1/tj/EUN5oeT6l0SNiwMc2r5gM58s+hZU=;
        b=sgpqqQarrV7M5eS560T+oxE4hDq/olQ7f6xvwku+RuDNYzMUlKy7O44Nu9UdLyNv2v
         ESppyp97c3pbuWhOgf8slp9Ft9SBf2BzClY1XUuUBqmISYHQ2vtBWh1+7DgwH2up2rpy
         M9c1Ivl4CZx0HfXyUSPZZtQjTKIvcc3ogYpn0b5WmW6sRceI9OgbA3uxWmBCSJ0nyNNj
         uSRdT/8mubYr19KRZmOwz/XjMkF5whY1RT2IBqzxO0nkTpNTq0ynJZmqVhs3Vs59mNap
         gX6cKfEf4OikkhWxMBA1WqXv2nv+oXE9PKLzrRCp841qDN7BRHeCViLULgYGjHd6fZZB
         e/rg==
X-Gm-Message-State: ANhLgQ0r/NWo6W1kpsMI5A9R1YVgWVJyknhAeVZgIytmJlycn/6yTN98
        65HXzZI/I0scj4CSAHoB1CWTRQ==
X-Google-Smtp-Source: ADFU+vu10KPusAe5Mf1WcFCd23uu2DAWXK+sSy/qjCqr3KZsnMeAAFyJ7+ymA3ZM7QrCnwiThjF4dg==
X-Received: by 2002:adf:c445:: with SMTP id a5mr173997wrg.14.1583431415813;
        Thu, 05 Mar 2020 10:03:35 -0800 (PST)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id s22sm9668587wmc.16.2020.03.05.10.03.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Mar 2020 10:03:34 -0800 (PST)
Subject: Re: [PATCH v8 0/7] MIPS: CI20: Add efuse driver for Ingenic JZ4780
 and attach to DM9000 for stable MAC addresses
To:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Paul Cercueil <paul@crapouillou.net>,
        Mathieu Malaterre <malat@debian.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Andi Kleen <ak@linux.intel.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com
References: <cover.1582905653.git.hns@goldelico.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <e0122cd8-4346-8ae9-44e6-451f5e1e5469@linaro.org>
Date:   Thu, 5 Mar 2020 18:03:33 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <cover.1582905653.git.hns@goldelico.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 28/02/2020 16:00, H. Nikolaus Schaller wrote:
> * fix a compiler warning/error (reported by Paul Cercueil <paul@crapouillou.net>)
> * remove clock-names from properties (suggested by Paul Cercueil <paul@crapouillou.net>)
> 
> PATCH V7 2020-02-28 14:58:30:
> * use devm_add_action_or_reset to unprepare clock in case of error (suggested by Paul Cercueil <paul@crapouillou.net>)
> * use already existing constants to check for overflow of rd_adj and rd_strobe
> * remove clock-names from bindings example and DTS (suggested by Paul Cercueil <paul@crapouillou.net>)
> * addition for nemc driver to handle this correctly (contributed by Paul Cercueil <paul@crapouillou.net>)
> * make efuse a child node of nemc to avoid problems with overlapping
>    reg address ranges (suggested by Paul Cercueil <paul@crapouillou.net>)
> 
> PATCH V6 2020-02-26 12:16:07:
> * add dependency on CONFIG_OF and select REGMAP_MMIO (suggested by Paul Cercueil <paul@crapouillou.net>)
> * add clk_prepare_enable() (suggested by Paul Cercueil <paul@crapouillou.net>)
> * inline jz4780_efuse_read_32bytes() since it is only used once
> * remove read optimization for full block (suggested by Paul Cercueil <paul@crapouillou.net>)
> * simplify calculations for rd_adj and rd_strobe (suggested by Paul Cercueil <paul@crapouillou.net>)
> * do calculations for rd_adj and rd_strobe in local variables
> * fix overflow check (did allow for 5 bit values although register is 4 bit wide)
> * fixes for yaml (sugested by Andreas Kemnade <andreas@kemnade.info>)
> 
> PATCH V5 2020-02-22 11:25:35:
> * no longer RFC but PATCH
> * add yaml bindings (by Andreas Kemnade <andreas@kemnade.info>)
> * fixes to yaml (suggested by Rob Herring <robh@kernel.org>)
> 
> RFC V4 2020-02-17 17:55:35:
> * removed read_only for nvmem config because there is no write method
> * Kconfig: replaced depends MACH_JZ4780 with MACH_INGENIC
> * run through checkpatch and fixed issues
> * made use of devm_nvram_register() and get rid of jz4780_efuse_remove()
>    (suggested by Srinivas Kandagatla <srinivas.kandagatla@linaro.org>)
> * squashed previous patch 1/9 and 2/9 into single (regmap based) driver
> 
> RFC V3 2020-02-16 20:20:59:
> 
> This series is based on and a follow up for
> 
> https://lore.kernel.org/patchwork/cover/868157/
> 
> ("[v2,0/2] Add efuse driver for Ingenic JZ4780 SoC")
> 
> Original authors were
> PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
> Mathieu Malaterre <malat@debian.org>
> 
> and there are additions / code improvements by
> H. Nikolaus Schaller <hns@goldelico.com>
> Paul Cercueil <paul@crapouillou.net>
> 
> This setup works, if the dm9000 driver is compiled
> as a module.
> 
> Therefore it is all RFC level. It is also not completely
> checkpatched.
> 
> 
> H. Nikolaus Schaller (1):
>    MIPS: DTS: CI20: make DM9000 Ethernet controller use NVMEM to find the
>      default MAC address
> 
> Paul Cercueil (1):
>    memory: jz4780_nemc: Only request IO memory the driver will use
> 
> PrasannaKumar Muralidharan (5):
>    nvmem: add driver for JZ4780 efuse
>    Bindings: nvmem: add bindings for JZ4780 efuse
>    Documentation: ABI: nvmem: add documentation for JZ4780 efuse ABI
>    nvmem: MAINTAINERS: add maintainer for JZ4780 efuse driver
>    MIPS: DTS: JZ4780: define node for JZ4780 efuse
> 
>   .../ABI/testing/sysfs-driver-jz4780-efuse     |  16 ++
>   .../bindings/nvmem/ingenic,jz4780-efuse.yaml  |  45 ++++
>   MAINTAINERS                                   |   5 +
>   arch/mips/boot/dts/ingenic/ci20.dts           |   3 +
>   arch/mips/boot/dts/ingenic/jz4780.dtsi        |  19 +-
>   drivers/memory/jz4780-nemc.c                  |  15 +-
>   drivers/nvmem/Kconfig                         |  12 +
>   drivers/nvmem/Makefile                        |   2 +
>   drivers/nvmem/jz4780-efuse.c                  | 239 ++++++++++++++++++
>   9 files changed, 353 insertions(+), 3 deletions(-)
>   create mode 100644 Documentation/ABI/testing/sysfs-driver-jz4780-efuse
>   create mode 100644 Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.yaml
>   create mode 100644 drivers/nvmem/jz4780-efuse.c
> 
I have applied Patch 2/7, 3/7, 4/7 with are nvmem subsystem related, 
other patches have to go via respective maintainer tree.

--srini
