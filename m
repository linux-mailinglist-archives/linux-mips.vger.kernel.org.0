Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 425472C4675
	for <lists+linux-mips@lfdr.de>; Wed, 25 Nov 2020 18:09:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732619AbgKYRGs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 25 Nov 2020 12:06:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730608AbgKYRGr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 25 Nov 2020 12:06:47 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 312D2C0613D4;
        Wed, 25 Nov 2020 09:06:47 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id w202so2903861pff.10;
        Wed, 25 Nov 2020 09:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rMzUdsLk/Baa1uIcljWMbCJT5T6vm33MNxpq93tgE5w=;
        b=hCc1qr0lSPWOLc3Y+4oWrRH2TXCVQTYUkX1h+KVwsoGsg9ENaw8awNSU94fnQ4Fbpi
         73IJdLXv94KLahXpYGZSdTNhwkfu+Umru7nWiUkXkpH4yUzWxLlR+rFdtkw9+rkrnc0c
         NIsHLsVvpsHTxc1ye4lYM+0e8cwM26CLOef9YIluiLpsrUuQwVFbRW8taLHWwHNfElOs
         uT4H7+JsIlGSVr5Mb0R0O4uRc+h4xjFf4css7WnzqA3/Suf+kl5gof0liDt3YQ+zaa5d
         kkSHA96EanrhQRBZehtC4dDAcAFir5yICnNeTiHXSQSeuccO129OUijqRc8iuxNHS0WQ
         iD6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rMzUdsLk/Baa1uIcljWMbCJT5T6vm33MNxpq93tgE5w=;
        b=erUl1vR/1Oz8QXoEvCNCZhiZycGNalLwML/HE6XrngyEUvzcyvCInDZzdtFZniSGFZ
         pgJWxxTI1D85+VI8SqUmy0v26Qka8E/ezLWbgydWYr45eEn8UtHP8oHj6KJWhKdUzvbD
         VCHHwbs5HXIccWcZnnuWuBy9lmgNmdAjnkn/4pD9xOJiS0yHt4W2x44WuIKn4QpuDXjJ
         jZAUBPDDO35EZzMquSN4tQ+V2H4i6Hm/PPk73tW5z2RhFNoEU7XBXJiOWtv7dfMs2jYf
         RBU6/1nhVWFh7nFJBZVI0inLP7tnY+crPDSFO7IpGxF1M8kMOc7PizdlmFnxHOeTbZXj
         9EoQ==
X-Gm-Message-State: AOAM531FCM9dhGPaoH1c9pjgYM5V+jZmext2lST/FPgnP/ZJILtonqMu
        aH39LGFxF5OH1b9PT3Dcg5XrtM6MsN8=
X-Google-Smtp-Source: ABdhPJyuixgOHHOmbVpj9oxoPoOJiLrDW4uE0K4ChZhpsglAfQuaDkbXVLClAt7jNqomJ+bqkHVduw==
X-Received: by 2002:aa7:8812:0:b029:199:25e7:4ab7 with SMTP id c18-20020aa788120000b029019925e74ab7mr3479526pfo.30.1606324006683;
        Wed, 25 Nov 2020 09:06:46 -0800 (PST)
Received: from [10.230.28.242] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id q23sm2460183pfg.192.2020.11.25.09.06.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2020 09:06:45 -0800 (PST)
Subject: Re: [PATCH] MIPS: No need to check CPU 0 in
 {loongson3,bmips,octeon}_cpu_disable()
To:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
        linux-kernel@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>
References: <1606299090-14013-1-git-send-email-yangtiezhu@loongson.cn>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <31318f42-5b38-215e-bddc-cc77a8a1bc03@gmail.com>
Date:   Wed, 25 Nov 2020 09:06:43 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <1606299090-14013-1-git-send-email-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 11/25/2020 2:11 AM, Tiezhu Yang wrote:
> After commit 9cce844abf07 ("MIPS: CPU#0 is not hotpluggable"),
> c->hotpluggable is 0 for CPU 0 and it will not generate a control
> file in sysfs for this CPU:
> 
> [root@linux loongson]# cat /sys/devices/system/cpu/cpu0/online
> cat: /sys/devices/system/cpu/cpu0/online: No such file or directory
> [root@linux loongson]# echo 0 > /sys/devices/system/cpu/cpu0/online
> bash: /sys/devices/system/cpu/cpu0/online: Permission denied
> 
> So no need to check CPU 0 in {loongson3,bmips,octeon}_cpu_disable(),
> just remove them.
> 
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/mips/cavium-octeon/smp.c | 3 ---
>  arch/mips/kernel/smp-bmips.c  | 3 ---

For smp-bmips.c:

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
