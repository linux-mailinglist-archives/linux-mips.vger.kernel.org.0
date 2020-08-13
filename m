Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02476243DE5
	for <lists+linux-mips@lfdr.de>; Thu, 13 Aug 2020 19:02:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbgHMRCl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 13 Aug 2020 13:02:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726167AbgHMRCj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 13 Aug 2020 13:02:39 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25B8FC061383;
        Thu, 13 Aug 2020 10:02:39 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id k13so2874223plk.13;
        Thu, 13 Aug 2020 10:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=10drFE+uTTpb6lINTPTQwSefo910miH9jBjU0zXrqe0=;
        b=c2H2bi0mHe1ic8YgpHupWtb2rL15EEyR897QK4jysQ8HCDqUA9CT7pxnd2Ads/KZcc
         Rw8VmuE/tmkuB4JBAq0r1IAqDr9pZHIFm8couLsfCAoXYB+h+fz9dTJpuKP42bk9CEX6
         DfZXGXrkVhI5IuInAJ6HCCIJUjFZOW/ij3z431JqUzusKvG60//C5jkLM13x0PDtVSZB
         QfHy0Gl7EVvd5vmTDWfFZwt2v5v5jvNdzWgW2VGRvPqpVplA+BKHXEpDBX5+/ebizTrb
         825ld3BRHwT9HcXgwoMZTE5k/+TTJAVL7duI/iNij3h7+Lm91L+wXzNC0pUchpeRSM+W
         FphQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=10drFE+uTTpb6lINTPTQwSefo910miH9jBjU0zXrqe0=;
        b=J/7tGpVam6YTFeg6jtcpHyveRNCivka/Vua3QG50kXVJhlEwtoh/6WJhBfCFsMOaMb
         Upn3ZI3p6NL48goiUbGzCxQjdPZEt7t59krZyoEBqAgjBo/a1SfbUDuvc//5L/eTFnzn
         zzXHon0jsZwDGYd+BuGqeOH9/ISzDLScuk/gyogSG6PUY/JGtxZLMQp9t79aT8N7Cw4R
         rcRuNwre11C4gg8bLKHXgnfuQ4qoHnAjDccNX/15yOYFcKxTsK4WX2DAjfF3oM3eEjwx
         6Xoz7WqXinWcXLy+Muy1cOOppYApgNgle50EsndBGvwJPEccUGcG7bxNqBQWEmsX6Egg
         iGBg==
X-Gm-Message-State: AOAM5328ckOURGuD3EeONlec182pHU8lq2koDAlW/6RD/f/oNm6N3ZMn
        vTC8kkvDAPfFFJFGYDdyqvLJFyvV
X-Google-Smtp-Source: ABdhPJwDYQeZ/g7sDsMqc2tbtjoYGlGguG8GepQ/qeunWbkapTtV85SzBTWc3P84biUwHcznl/yR/A==
X-Received: by 2002:a17:90a:bc45:: with SMTP id t5mr5994851pjv.139.1597338158250;
        Thu, 13 Aug 2020 10:02:38 -0700 (PDT)
Received: from [10.230.30.107] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id z3sm5782066pgk.49.2020.08.13.10.02.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2020 10:02:37 -0700 (PDT)
Subject: Re: [PATCH 07/14] mips: bmips: add BCM6368 irq definitions
To:     =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        robh+dt@kernel.org, tsbogend@alpha.franken.de,
        jonas.gorski@gmail.com, bcm-kernel-feedback-list@broadcom.com,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200812063129.361862-1-noltari@gmail.com>
 <20200812063129.361862-8-noltari@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <f21ecdcb-4055-4ca4-8962-3c3710625f02@gmail.com>
Date:   Thu, 13 Aug 2020 10:02:30 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <20200812063129.361862-8-noltari@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 8/11/2020 11:31 PM, Álvaro Fernández Rojas wrote:
> Add header with BCM6368 definitions in order to be able to include it from
> device tree files.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
