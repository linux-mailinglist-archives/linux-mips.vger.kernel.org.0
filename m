Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C55C41F4B6A
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2020 04:27:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725988AbgFJC1d (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Jun 2020 22:27:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725798AbgFJC12 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 9 Jun 2020 22:27:28 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A27BC05BD1E;
        Tue,  9 Jun 2020 19:27:27 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id r10so291521pgv.8;
        Tue, 09 Jun 2020 19:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=6MDJxP19WPGYDK5RYXnflZJ1FBWzKzFWdzGVhyzU/Lk=;
        b=nKFql9qoJJ412TjcOwdtBKo0XP/Azm/+cAxSaHUsjFC8TwgVwHsidhjVhxcY4Hs2H6
         CHRGsi4ithzJfjLF+fZiMaH+lw6uajss6PiAffjbD00GlbO0x0YNca+Ca/Qy32q8D62K
         UEtE+EP4vo6+kyT3BQo1zVL0kftNb64uA4UkzzOI4fmlO7mhvJmGKMM05XpyMeaCduZA
         MFMzS0/SxXjC+wZuNMpxZicfF5R0JsGhCHBCPb/sshBWzS3XSgh2ZduhuCaQeSQROXXj
         c5jC/EGu0iHa7Mq6RkWLG9nr+Orl4ZJlJo5nbZDw8hKL0tLxJ/ko5tVDxiJUusqIc9BP
         SxWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6MDJxP19WPGYDK5RYXnflZJ1FBWzKzFWdzGVhyzU/Lk=;
        b=dzEu73Cde7KSVSqkxdYKl+GCR1HtCvr0JSQUKo7kaNqymH0a6cb68pSwy1tW4Ha7RZ
         Or6iZNDT4BgSMEKtaqPpkx+S1m6H6p8MjVhEFqskW0kA49+0Tdl9YAuMaEyqv4RXm0yb
         5ILKAMoOPfpKctHzinKGt4X7huUSh33bhcWZKLEwkV+c1GABKQlzdPYbUTnGEzOzfGfk
         KT4i4wV4HX0sx6YrtKbqZ6yHM3qaLAcCoAZm479cBOxwasGt26tyOqu/cFkM5EYfCU6b
         bIPeYoqUhNJFpTmC5vTis3vhnigxcitiYrScSWaHJedVdX9UW4/mtZngCRkRq+OSexQ4
         s1Bw==
X-Gm-Message-State: AOAM532DAFapiD25FoMGoWE1ruTU4REzOUy1ueM1aVQNgrmZHAhDzTRC
        DwXYBGti+lTEMiX2Tlmrmug=
X-Google-Smtp-Source: ABdhPJxUUZnClIL//Wqvm0VbUuZ1R/c0nZOIjemZg+Eez8yLqIdHcB5Yjx4SnIoePiWQU9shTrC/IQ==
X-Received: by 2002:a62:5ac5:: with SMTP id o188mr715392pfb.37.1591756047148;
        Tue, 09 Jun 2020 19:27:27 -0700 (PDT)
Received: from [10.230.188.43] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id j1sm3625949pjv.21.2020.06.09.19.27.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2020 19:27:26 -0700 (PDT)
Subject: Re: [PATCH 4/4] mips: bmips: dts: add BCM6362 power domain support
To:     =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        hauke@hauke-m.de, zajec5@gmail.com, tsbogend@alpha.franken.de,
        robh+dt@kernel.org, jonas.gorski@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20200609105244.4014823-1-noltari@gmail.com>
 <20200609105244.4014823-5-noltari@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <56bd5a50-f985-04c6-0c62-a48cbbabac4c@gmail.com>
Date:   Tue, 9 Jun 2020 19:27:24 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200609105244.4014823-5-noltari@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 6/9/2020 3:52 AM, Álvaro Fernández Rojas wrote:
> BCM6362 SoCs have a power domain controller to enable/disable certain
> components in order to save power.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
