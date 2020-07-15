Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF216220685
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jul 2020 09:56:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729488AbgGOH4J (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 15 Jul 2020 03:56:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729430AbgGOH4J (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 15 Jul 2020 03:56:09 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC252C061755
        for <linux-mips@vger.kernel.org>; Wed, 15 Jul 2020 00:56:08 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id x9so1524911ljc.5
        for <linux-mips@vger.kernel.org>; Wed, 15 Jul 2020 00:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=K5YLBhht2HRvgF96H7m+IGI8jSAwEMdpV9SgmyIfzMI=;
        b=r27Po4YObiocd+JoC+zwPaGCXmx6/xrstz3Nf7LzE73KixHCc+SkQnIvb7K0rUdihw
         ZtHlF5grpUIL7sHeWMSQTozSkKo+lT1+7EA44i3luWkNisuYErw8QsWQ0sJHhZ2lQwrF
         H06AlUD5ixFMqF5Yx3yJVUkiadIFV3HC6WFitVUPv+0xh1r2XbpbdxTBrfjZmSrxxAlh
         6wIQwhNLah0I9pgIuIqk/X7FmS7i7W0nn7FzJ5DZeRYXNW8EbBOIsV7zq1R9zHiFXLcH
         p/59lQXBi5X2wywUvlK6lWBhIRc+c/oblHKvTcFtWqTJzvzudlib1SOjhIygbYDhq43X
         Eozg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=K5YLBhht2HRvgF96H7m+IGI8jSAwEMdpV9SgmyIfzMI=;
        b=Ed6oGinqfMX0x5o9KiMBL6T3dGDYzsEYimPLbLrzhjFKvKcnOxquXT5fdBSv/MvtVH
         erAwocT9Ll15tYeO4mzRQNqtVIWawQNdUT+IhGsHdzLsoSBDglNDgvShS3Rk2/b7rgaE
         mmgJslOQYZMQVbgHdA4GMk+Xid9To1kVLtBH9IHuT32Jswo+0CAH31L7FDPChqeN7lB6
         XDizJFroAaRHMuIckfBW0Pe/yqe7gfHhNbOL1z2LTsFGMpuQrOOg94j5gyQWKoW+yKFO
         pOhByqI88oTPzWCHevJjrjw5VdSwLSliGGRyHt8nWHmAD0w9fOUKZv40oi0iDg5ElDkG
         6o0g==
X-Gm-Message-State: AOAM531UQSUYEzAGO2g4R6yfeGErdVn5luOPwfrqN1ytLlJExb5eqAlY
        7VMEITbMjphq4n1RT87JPWDjrQ==
X-Google-Smtp-Source: ABdhPJzU3yGsrxJIB8k0N5KCjSUvlWM7fbRR3TmBNr94BMV/CACDiq/9IoJDgdZbGb3qq9dF9aWHqA==
X-Received: by 2002:a2e:7816:: with SMTP id t22mr3862538ljc.373.1594799767026;
        Wed, 15 Jul 2020 00:56:07 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:42dd:3c8c:7d45:c199:bbef:e36? ([2a00:1fa0:42dd:3c8c:7d45:c199:bbef:e36])
        by smtp.gmail.com with ESMTPSA id y24sm327833lfy.49.2020.07.15.00.56.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2020 00:56:06 -0700 (PDT)
Subject: Re: [PATCH] MIPS: CPU#0 is not hotpluggable
To:     Huacai Chen <chenhc@lemote.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>, stable@vger.kernel.org
References: <1594791329-20563-1-git-send-email-chenhc@lemote.com>
From:   Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <32525b2d-6a5d-1064-788c-96233a375d1d@cogentembedded.com>
Date:   Wed, 15 Jul 2020 10:56:00 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1594791329-20563-1-git-send-email-chenhc@lemote.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hello!

On 15.07.2020 8:35, Huacai Chen wrote:

> Now CPU#0 is not hotpluggable on MIPS, so prevent to create /sys/devices
> /system/cpu/cpu0/online which confusing some user-space tools.

    Confuses?

> Cc: stable@vger.kernel.org
> Signed-off-by: Huacai Chen <chenhc@lemote.com>
[...]

MBR, Sergei
