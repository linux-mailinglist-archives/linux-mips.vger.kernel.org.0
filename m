Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B88301F4B47
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2020 04:19:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725954AbgFJCTn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Jun 2020 22:19:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725798AbgFJCTm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 9 Jun 2020 22:19:42 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDACDC05BD1E;
        Tue,  9 Jun 2020 19:19:41 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id w7so268231edt.1;
        Tue, 09 Jun 2020 19:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=6nDD9b7w8r1Mr/3MxkpIoE8zWpfhH3upQWRgRKaz8Zc=;
        b=d8fXfi1l7KInOy0Riqv289V5I5J1ZgSHL1mnqhUsN3TjXORhR79t8BUP4noaM6wxaV
         oF4HRekWinwy8NGtF9jeedNMhsCBi4m+sXOFRMrd4zvoeaAFaLCp+bO5Vs9NADVkdVmb
         E8XhMxF9b8v9mq893gxQNCngsZ/XC2oFr+hcO+higI+G2hcc+rErDQ3k1LLqDGmYSMIb
         WvswuoE/M1rnLHZyRUGJlOBg6FMpqstb0DLvcg2oOGa9ueadZj5PNTIKZ7JeNDh/XzyT
         EOky1jWF3pqojumstOj6V70bDCg4u20Tv8vBfPXCCddfq08EKytUPg24PfOscZ4ZNv/J
         eCZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6nDD9b7w8r1Mr/3MxkpIoE8zWpfhH3upQWRgRKaz8Zc=;
        b=RrF6vpttQIyGPG86B7RDWPKWHINqPLY2oWsy2LfnRS6fV+QBGJfmcxB8dFkM36Dhe4
         xVm0DvVAkAJzsQvRpMGEEJ8FUhW3oWS26q/5/4+440ruLMuQm4slWs3OOwIQ9LDQ3Jc2
         axvsnBukuWHnZh8Pnf4DkudgvNVjofIUGZiZJMmbncKdpf1nTaFoYmlW6JXBp4IPnyjr
         rVqyIrwhmdaumx7ihfJCHEsOKPJ1t72Mm8q+NiQwF8jHgcoJX4zw3SAcrNiuB+Ja1sCS
         40oRQR75iYC73H8yU5IfthhS0ft7lpnFUyckpnt/RL+XYpGbWRX0c2Lwm7DtmqWHIaVn
         u33Q==
X-Gm-Message-State: AOAM5338g8k5P9b1gI/QF9WbRpXg//OurhNqyWZtI8JGifUDrZFLk5aQ
        prfd5HqBJCUB6+vRPbCFvew=
X-Google-Smtp-Source: ABdhPJyHM8AkM6LFw1w6gnIiVHMouyYrPLgZFtrZzLehkjZn/vUa+ZeZVaI4/d8rIky9PTihQBilQA==
X-Received: by 2002:a50:b022:: with SMTP id i31mr595400edd.301.1591755580360;
        Tue, 09 Jun 2020 19:19:40 -0700 (PDT)
Received: from [192.168.1.3] (ip68-111-84-250.oc.oc.cox.net. [68.111.84.250])
        by smtp.gmail.com with ESMTPSA id ss4sm14296639ejb.63.2020.06.09.19.19.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2020 19:19:39 -0700 (PDT)
Subject: Re: [PATCH 2/4] soc: bcm: add BCM63xx power domain driver
To:     =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        hauke@hauke-m.de, zajec5@gmail.com, tsbogend@alpha.franken.de,
        robh+dt@kernel.org, jonas.gorski@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20200609105244.4014823-1-noltari@gmail.com>
 <20200609105244.4014823-3-noltari@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <13cc694b-c643-0f68-e510-062df5352eaa@gmail.com>
Date:   Tue, 9 Jun 2020 19:19:33 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200609105244.4014823-3-noltari@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 6/9/2020 3:52 AM, Álvaro Fernández Rojas wrote:
> BCM6318, BCM6328, BCM6362 and BCM63268 SoCs have a power domain controller
> to enable/disable certain components in order to save power.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> ---
>  drivers/soc/bcm/Kconfig         |   8 +
>  drivers/soc/bcm/Makefile        |   1 +
>  drivers/soc/bcm/bcm63xx-power.c | 374 ++++++++++++++++++++++++++++++++

I would create drivers/soc/bcm/bcm63xx because there are likely going to
be more changes for BCM63xx DSL SOCs in the future that would land
there, for instance the BCM63138 and newer SoCs have an entirely
different reset controller using the on-chip micro controller that would
be landing there.

Can you also make sure that the MAINTAINERS file still matches that
location?

With respect to the code, given that you have defined #reset-cells = <1>
in the Device Tree binding, I would expect that you create a header
under include/dt-bindings/ which defines constants for the various SoCs
which you are then using within your power domain provider driver.
bcm2835-power.c is a good example of how this works for instance.
-- 
Florian
