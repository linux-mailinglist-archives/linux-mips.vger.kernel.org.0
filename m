Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E810417AD95
	for <lists+linux-mips@lfdr.de>; Thu,  5 Mar 2020 18:53:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726173AbgCERxB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 5 Mar 2020 12:53:01 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:50725 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725948AbgCERxB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 5 Mar 2020 12:53:01 -0500
Received: by mail-wm1-f68.google.com with SMTP id a5so7381125wmb.0
        for <linux-mips@vger.kernel.org>; Thu, 05 Mar 2020 09:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KcyqRvrpWHyXsg3I8LCAXPYVgW36m1Cq/+UDOpNaVeo=;
        b=g+HMjmtozjjhSxVZrLc4ZlEqwlIP5Yg+vjIf4mOfH206Navl+swLn6iWKn2xtVanr3
         vRXFfih6VU0JY+fNCbU4QMuffm+ogWSlbru2ro0rmbE+QNXF5ugQMzsR2kbwMFIVO0Ip
         97oUvOGquM3T+mg7eKjAkqifk1m5rOaGxYX5ycvl1JqIszq+O1eI2Mrzefx7aImTs75r
         3S7kIANr8koPWohZ7gC1A1L9lDQ/wOHWx50TQTTVPVYruQvhaSH7o3kHyqEhUitlEhDV
         o6D92P7M6KhG8O09XC7GWWB58m1XVkuE0Hm1VRWOh9d9SI6BHDnyGgyJpH7jpF3G0+e7
         j6lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KcyqRvrpWHyXsg3I8LCAXPYVgW36m1Cq/+UDOpNaVeo=;
        b=Q1KetuwjyhokMES9Seh4UmKs2fGby/nFibY3kMEnRnu17agxHVhq0Xom7Or5GfqgGK
         2BlFGQMaapRi0rS2Yziaru9cLXkALQc1LDy0ZU1dpAJKIFwbSE4ue88z8/WO5+aXY2p7
         3FOFe1mnaKR3qOedEVXY/vEC9WyDeNx9dTxrhw5P8JbIJRr51Xuegy8tvFyON4O1oaHd
         q/vDQMrbnmP7SC2swzqzFaGhMFhG//ky2GxR7+N9Vjp1LV+ZanCh2JS9gEzYMIVnBT32
         J+eBGuaZKz2Vn9lArCl+xxSUSa1QfiCciP+Wj//fECloMGuxRt5cFHc4PE/PmUsi8ECp
         3LUQ==
X-Gm-Message-State: ANhLgQ3xG3PBSAvq8qRqbVng6+TeFHIkwkjCCt5ZSMgjn1FCLZ11uDBL
        sOa/R6npVwCpRLRuh/jkBwNl3w==
X-Google-Smtp-Source: ADFU+vuW+uectjdhI4kDRkzGukNNpiJGlsIkqt4eAKS4/2+Q77zLj1vuhdIE1wBz2TDMOMKBN/x3IQ==
X-Received: by 2002:a7b:cb42:: with SMTP id v2mr11012702wmj.170.1583430779468;
        Thu, 05 Mar 2020 09:52:59 -0800 (PST)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id v14sm6568362wrr.34.2020.03.05.09.52.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Mar 2020 09:52:58 -0800 (PST)
Subject: Re: [PATCH v8 3/7] Bindings: nvmem: add bindings for JZ4780 efuse
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
 <37d3b9e4c60692215fff0e75a78ac1e7792aaf75.1582905653.git.hns@goldelico.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <8d507b75-1c06-b38e-3b7a-8422f63a4959@linaro.org>
Date:   Thu, 5 Mar 2020 17:52:57 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <37d3b9e4c60692215fff0e75a78ac1e7792aaf75.1582905653.git.hns@goldelico.com>
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
> a read only access to the entire 8K bits efuse memory.
> 
> Tested-by: Mathieu Malaterre <malat@debian.org>
> Signed-off-by: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
> Signed-off-by: Mathieu Malaterre <malat@debian.org>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> [converted to yaml]
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>   .../bindings/nvmem/ingenic,jz4780-efuse.yaml  | 45 +++++++++++++++++++
>   1 file changed, 45 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/nvmem/ingenic,jz4780-efuse.yaml

Applied thanks,
--srini
