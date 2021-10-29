Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73C1B44049D
	for <lists+linux-mips@lfdr.de>; Fri, 29 Oct 2021 23:03:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230419AbhJ2VFm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 Oct 2021 17:05:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230334AbhJ2VFm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 29 Oct 2021 17:05:42 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8806DC061570;
        Fri, 29 Oct 2021 14:03:13 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id m21so10927194pgu.13;
        Fri, 29 Oct 2021 14:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vSTjUmaYi95YI8+6BE8mKmVpfTUnAIv65ZcmAiNEDow=;
        b=TfMdG6ZG5pQKnL90BtFuU+9PqGfaseF1YJP+P9ARhc3u9wj1SECqSU5RClWUZOQ+hG
         1P/yjb2FQiRXKmsMwbiPAWQFnt1+FCsbxt2y2BAzpaJzXgbNpQWlO2V4I+B5t23oLKIf
         yfAWr3xoxUp+O+vVVuOeusKCRKHSIDIUraTcQos9J57QO8acKC4OKLFIuxMwdCejWx2k
         RnVHl11DGfRJrgZWtMj26KLwAYYNkUmmBtedtgcdIapmkPAUcCTBPKqw/gKrGxZQU00T
         7F3WDuzynokggvpy2QxTJbjdnf3Qk32vmeAzL5eOKQE7pTWyrVyk36/ii3eouS4n9XBp
         HF9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vSTjUmaYi95YI8+6BE8mKmVpfTUnAIv65ZcmAiNEDow=;
        b=n/QAYNgasiKR/F2vP8lh44LCzErTjUUHu2WY7K8aDfpH9SgCuI5ZIZdM6YKyWfXfsk
         b9oBvIdZAfLEXy+UCwRBJ55kS0EEOM4ay6I0pIrLUGVwLQQ9haJNZLcPqwZVhZ+Aj5CV
         PSWlhNLlSBrIJu4V8kixwKO1n1cU8Bq8ksxc003A9YF0C7ZN2cwRSLjOxmh1WUpFn1Zf
         Q8Ot9Rzt6grcuh2HDvhZ2p3LnEgmQJBobXpZRH1AVTsL5bV6oiyZQbx1KCFd6ct2YSZa
         pwELV+MfsOYMQtiQm8uVUnYKP2v49ZJReQMZoFaioJyhfIEQiBk+YCaClKmE/FKR2PWg
         Vsdw==
X-Gm-Message-State: AOAM531WrMbRJ7S5RoUe0sujyJ6FRWv8dm9v77oF6mQkU8jKpE7Oh3zM
        LxbSOTLviNn5J84eu9j8OVY=
X-Google-Smtp-Source: ABdhPJzl6vFO7Te/eISlpuHsNFsaNOsc1j2Bf03UdOj/0+LL7kGBgp0ERGqs0MLLeErg6mChf2VUyw==
X-Received: by 2002:aa7:9212:0:b0:47b:aefd:2cc4 with SMTP id 18-20020aa79212000000b0047baefd2cc4mr13492356pfo.47.1635541393055;
        Fri, 29 Oct 2021 14:03:13 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id z22sm8525095pfe.1.2021.10.29.14.03.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Oct 2021 14:03:12 -0700 (PDT)
Subject: Re: [PATCH 2/2] dt-bindings: mfd: add Broadcom's timer MFD block
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Justin Chen <justinpopo6@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20211029202505.7106-1-zajec5@gmail.com>
 <20211029202505.7106-2-zajec5@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <4d4334f0-c76f-f205-8c4c-a66a41809266@gmail.com>
Date:   Fri, 29 Oct 2021 14:03:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211029202505.7106-2-zajec5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 10/29/21 1:25 PM, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This block is called timer in documentation but it actually behaves like
> a MFD.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>  .../bindings/mfd/brcm,timer-mfd.yaml          | 64 +++++++++++++++++++
>  1 file changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/brcm,timer-mfd.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/brcm,timer-mfd.yaml b/Documentation/devicetree/bindings/mfd/brcm,timer-mfd.yaml
> new file mode 100644
> index 000000000000..0060b6c443a7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/brcm,timer-mfd.yaml
> @@ -0,0 +1,64 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/brcm,timer-mfd.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom's timer MFD
> +
> +maintainers:
> +  - Rafał Miłecki <rafal@milecki.pl>
> +
> +description: |
> +  Broadcom's timer is a block used in multiple SoCs (e.g., BCM4908, BCM63xx,
> +  BCM7038). Despite its name it's not strictly a timer device. It consists of:
> +  timers, watchdog and software reset handler.

Small nit here, the software reset handler part is only present on the
BCM63xx and BCM4908 (which is a derivative of 63xx) but not on the
BCM7xxx chips.

Also, there is some difference in how the registers are organized:

4908 has it that way:

TIMERCTL0
TIMERCTL1
TIMERCTL2
TIMERCNT0
TIMERCNT1
TIMERCNT2
TIMERIRQMASK
TIMERIRQSTAT
WATCHDOG_COUNT
WATCHDOG_CTL
WATCHDOG_RESET_CNT
CHIP_RESET

Whereas on STB chips it looks like this for all chips:

TIMERIS (interrupt status)
TIMERIE (interrupt enable)
TIMER0_CTRL
TIMER1_CTRL
TIMER2_CTRL
TIMER3_CTRL
TIMER0_STATUS
TIMER1_STATUS
TIMER2_STATUS
TIMER3_STATUS
WATCHDOG_COUNT
WATCHDOT_CTL
WATCHDOG_RESET_CNT
TIMERIE0 (interrupt enable the STB chip is a PCI(e) end-point)
WATCHDOG_CTRL (controls the type of event signaled: NMI, half-life etc.)

I suppose it is just more justification to have them broken out as
separate blocks given their layout looks largely the same except where
it does not.

Thanks
-- 
Florian
