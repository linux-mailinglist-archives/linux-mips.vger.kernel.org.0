Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97FC5243DBB
	for <lists+linux-mips@lfdr.de>; Thu, 13 Aug 2020 18:55:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726192AbgHMQzJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 13 Aug 2020 12:55:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726167AbgHMQzI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 13 Aug 2020 12:55:08 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6385EC061757;
        Thu, 13 Aug 2020 09:55:08 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id t6so3037499pjr.0;
        Thu, 13 Aug 2020 09:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=o2XD1ciiB6iwDPUOkRnbFCRHBk6RWiKB7lZfaPUZ4wI=;
        b=eoW/ZUUe+BSnLxPURAXSBeAAFZ6CRNXvj2/WrdFHl7vkZuHNs35rkY4Ks+gvo+cHJY
         SeLycLwcuO4emt/PdyKZuVMigNpIynJ3u23d8qsGamSBRCOnPdvCu4g1D8HgBGjsiOpn
         +LtpwK/rKLUB3Y1pqRMMTvFIq6qCJ0PyolVI0A8OgGucDdVrfwL07x6MI1MWiEXnjt2t
         z6OjhpTc9082zdbIOMaxPSPNa0beiN9GY5MlS6jwFuIrZGBvhdxCzpysHqyLhwejJH20
         ERczqSzee2Krfev+lpaF8hv+0bpQzehK0ol4FFBSJxa6a3iGcvVAvycnWqsSxYgdgu+l
         HZGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=o2XD1ciiB6iwDPUOkRnbFCRHBk6RWiKB7lZfaPUZ4wI=;
        b=dmDkDR/CKudNUGkPWiGigm8LukeFfT+dX6QhR0/uuI+GQiXPsRPwpjJGxixEoXqOer
         kPeYlV1e93f/4AX/MNIoE+UePCRlf/X6spdQgkoX1EO2nB109I+uoWg1PaJYJY2klepF
         7R+jddivDBBTpHFa3NNOBfPbWwsuunIOjUTQhrNzzLLhsFMC5ZazE4R2/un9pJS+0yTL
         QHmq+P3UsEwKnM+2cyCtLpZNSSWURSQ+jwZCzDypWZRJLpUhhToumJbw18/ygijIzdwE
         LJUQ0+wED5UlserDNdjlZs7qXbQ4gNJrHdfC/enAa/PeBdupN7+9hNSJG7lILJjseDBe
         QQuQ==
X-Gm-Message-State: AOAM531y09BiFWAsPINv2r7RyMlVtKwSsJFzNDT9WowIqRPLsgGw0gOk
        UNgHr8ezLj90BYYl3Pv7xIhaTcoP
X-Google-Smtp-Source: ABdhPJxMPkV5VaA7NGqB+TNKD/dPV9Kt5tDjT2CQpuPqGmqILmIhYxPCXILWSF7FzGTNXpwLYPKQXg==
X-Received: by 2002:a17:902:7b89:: with SMTP id w9mr4704147pll.175.1597337707472;
        Thu, 13 Aug 2020 09:55:07 -0700 (PDT)
Received: from [10.230.30.107] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id j13sm6387086pfn.166.2020.08.13.09.55.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2020 09:55:06 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH 01/14] mips: dts: brcm: allow including header files
To:     =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        robh+dt@kernel.org, tsbogend@alpha.franken.de,
        jonas.gorski@gmail.com, bcm-kernel-feedback-list@broadcom.com,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200812063129.361862-1-noltari@gmail.com>
 <20200812063129.361862-2-noltari@gmail.com>
Message-ID: <9db7f3b8-286e-6ca4-b0c0-0392a366c3ba@gmail.com>
Date:   Thu, 13 Aug 2020 09:55:04 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <20200812063129.361862-2-noltari@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 8/11/2020 11:31 PM, Álvaro Fernández Rojas wrote:
> Change /include/ with #include in order to be able to include header files
> from dt-bindings.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
