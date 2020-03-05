Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66C3417AD9A
	for <lists+linux-mips@lfdr.de>; Thu,  5 Mar 2020 18:53:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726083AbgCERxO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 5 Mar 2020 12:53:14 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:40875 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726145AbgCERxO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 5 Mar 2020 12:53:14 -0500
Received: by mail-wm1-f67.google.com with SMTP id e26so6698305wme.5
        for <linux-mips@vger.kernel.org>; Thu, 05 Mar 2020 09:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zOLC9otCZ1SIV9HUGqyUtds0dA8IbLQFlalxBZvds9o=;
        b=nJGM09JeeGN/bIiSjLDTgOQ9n9N7i5SV+K6n7BXvNhRMbK8aV9wkXOy1j6MkwbmHng
         m0BykEBGpy7Y9cK596I3j33SD929OLAr3SA2xlw5QbQYglRM5Hs2P0YkmkCGREf43/Ck
         4DDo2p/8IYSYfNGlLi07+SKK/tDdEziRuDmVZiHdJejy5gHV04rOkig+75S1iDibDnte
         DhgnuRGldrOEb06uWJ5YsFD3+AWrSDTvo1VeK0zxCA+DOnLo4n8pxcIFbnX6G/zhNcNa
         KMN7Sy9VF2ojFS3atTNRYS8XL+HYYKF17tX36W/imoEghPdwv7CJEVdH7Tgu/7KR2k7F
         aFvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zOLC9otCZ1SIV9HUGqyUtds0dA8IbLQFlalxBZvds9o=;
        b=DTWCJPwFtduopgMdR1vBJkzujR7tFYJB+8cS/tAK0irj4aYbnlznvANMO6opbhIPDW
         cRcVa3EiNoLcZSSVkl9a+TBZUNxJcfm3nfqAkP+pVbTaY9wdGUC5GQh87OgCUrtA2sn2
         8ZoRnTxvh3DW41WzLEdKtXZSA1hq+EQCjd2B9lkhIIpyCVLPYNgBMiGIysBIMuSuwGYy
         nwDcTsQ8ntizFshWaUlTfdedLPXEh2pSwRK1NHvgyFEjz4+GEcpOK0hf53P2tYIertWA
         kaubBfZiziqNlujq0UN+DPQ8VxBTpph8KkgRIkKzZwyqaRNidNJtw9Iss8gR2EYs5EH7
         5vQg==
X-Gm-Message-State: ANhLgQ0/DyZmCZpVMXx9KGv9ODwc4+Rsxk/3IndOpzUrcC+QKjYrVtVV
        w89y+7oKdGF2qpgQI8+A/zsfOdiDo+M=
X-Google-Smtp-Source: ADFU+vuKmO6BoAfVtg5Ag4cHIkSD0MIjwghSUnCuGd4DlW1wi44m02J8f7mrrm2Zda3VZN7BoN7Ozg==
X-Received: by 2002:a1c:6a13:: with SMTP id f19mr11079317wmc.134.1583430791173;
        Thu, 05 Mar 2020 09:53:11 -0800 (PST)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id l5sm10165746wml.3.2020.03.05.09.53.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Mar 2020 09:53:10 -0800 (PST)
Subject: Re: [PATCH v8 2/7] nvmem: add driver for JZ4780 efuse
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
 <86886abd9493d0d3b7c9b2eba4e928c2aa4be5d7.1582905653.git.hns@goldelico.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <e1c70dc7-05e4-ce64-d683-04aa7fc37e82@linaro.org>
Date:   Thu, 5 Mar 2020 17:53:09 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <86886abd9493d0d3b7c9b2eba4e928c2aa4be5d7.1582905653.git.hns@goldelico.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 28/02/2020 16:00, H. Nikolaus Schaller wrote:
> From: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
> 
> This patch brings support for the JZ4780 efuse. Currently it only exposes
> a read only access to the entire 8K bits efuse memory and nvmem cells.
> 
> To fetch for example the MAC address:
> 
> dd if=/sys/devices/platform/134100d0.efuse/jz4780-efuse0/nvmem bs=1 skip=34 count=6 status=none | xxd
> 
> Tested-by: Mathieu Malaterre <malat@debian.org>
> Signed-off-by: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
> Signed-off-by: Mathieu Malaterre <malat@debian.org>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>   drivers/nvmem/Kconfig        |  12 ++
>   drivers/nvmem/Makefile       |   2 +
>   drivers/nvmem/jz4780-efuse.c | 239 +++++++++++++++++++++++++++++++++++

Applied thanks,
--srini
