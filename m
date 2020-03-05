Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D6A617ADA4
	for <lists+linux-mips@lfdr.de>; Thu,  5 Mar 2020 18:55:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726181AbgCERzQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 5 Mar 2020 12:55:16 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:38072 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725948AbgCERzQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 5 Mar 2020 12:55:16 -0500
Received: by mail-wm1-f68.google.com with SMTP id u9so6711311wml.3
        for <linux-mips@vger.kernel.org>; Thu, 05 Mar 2020 09:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fHBpesZTfJ6mKcWi00bWDILKSsEsVfAhb2bNBmir3Uk=;
        b=yEcRzx34oEY0MIxdeSv4UP8BF0gJMpDCn6WZD+fCY7zu+uqg0wYs1LopL9OtaE2xhz
         Urgl67efLMFYrfCAMDfkHf5Fd9k8bk4XPp7dd6EnEuy6h75rlhUxOARvwB8UhIlSnDd6
         HjzO/rYByVTO2Rqg5uVOFxl7aOcXIaiRgD5WOTnLDR6+anjX7odFjnkMLEfqGsS0+Th+
         ON55fMYa1Zs/QprDipf7F2lqOGCzjhGNoPAoEFWV3f6yzbBrZiYTFOb7IRxweflMITla
         qsUR41WBs257WRFRdkSaOsmM1eobhstWjSe7o25oPZW/hr0Cr+/YlZjAnRwUZlYWx5Pe
         0gKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fHBpesZTfJ6mKcWi00bWDILKSsEsVfAhb2bNBmir3Uk=;
        b=BTrm6TeAsX/lg/8K6wSxYbukMagOSWC3OHdl1mYG5HrEWr6cuanA6TjCt2AO92xGZk
         fkITZ/4HKsX7O3pFuRYr3kXviix2/i4tUSxfvDMMvyqVhwVbWJhSDFHNB7EqhaoOtg9S
         2wcWqI6/LHf/8ak5ZicYj9igbNMUBiurVhhv5RmN68jOef4VqVxfFBcRy9D/ocQ3Xl1I
         QKp4r9bWuD4Fn9XxZ2p8mkVFilZcnaemsItC6oTXOYJqysEG5UhWR52KuWPII6doveWm
         8ZZ74fOPpfUyu7PhQB+Ah/+fVS5It9+KPTJwrP8WYYornZHb3iufQiSfwDNoeytFuHqh
         zFJQ==
X-Gm-Message-State: ANhLgQ3rSKzpL1o48c+kS/w1bDSQX+jpMj+fR+Z4aC2jy7AG6BKD40FM
        CJQWUoRpEtdKkr9L3Wn6NAesDA==
X-Google-Smtp-Source: ADFU+vtp3ZeU9yc0Pk2bmRUnySPmTNZKNaB3BjkVR8s8SVb8uArIqVRmBUEcxJLKksj0YY16FGcMFg==
X-Received: by 2002:a05:600c:48c:: with SMTP id d12mr8889884wme.183.1583430914521;
        Thu, 05 Mar 2020 09:55:14 -0800 (PST)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id q4sm719751wro.56.2020.03.05.09.55.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Mar 2020 09:55:13 -0800 (PST)
Subject: Re: [PATCH v8 4/7] Documentation: ABI: nvmem: add documentation for
 JZ4780 efuse ABI
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
 <08f3bb4e0fe5499907c4e07fa6751bfb2016f23d.1582905653.git.hns@goldelico.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <b7c8567b-5d51-1646-6d0d-8f034839460a@linaro.org>
Date:   Thu, 5 Mar 2020 17:55:12 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <08f3bb4e0fe5499907c4e07fa6751bfb2016f23d.1582905653.git.hns@goldelico.com>
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
> ---
>   .../ABI/testing/sysfs-driver-jz4780-efuse        | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)

Applied thanks,
--srini
