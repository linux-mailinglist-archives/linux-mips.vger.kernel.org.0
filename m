Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A19B6A61CB
	for <lists+linux-mips@lfdr.de>; Tue, 28 Feb 2023 22:54:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229686AbjB1Vyi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Feb 2023 16:54:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229728AbjB1Vyf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 28 Feb 2023 16:54:35 -0500
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1A1B4C32
        for <linux-mips@vger.kernel.org>; Tue, 28 Feb 2023 13:54:33 -0800 (PST)
Received: by mail-qt1-x833.google.com with SMTP id c18so12268255qte.5
        for <linux-mips@vger.kernel.org>; Tue, 28 Feb 2023 13:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677621273;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rMgdYMzZvXNWzKeivTjC5ghEKfC2j+31bPS+5KYwLa4=;
        b=NaEFJUie2B0FLdI6Nj/feNA+IpPLxp1pY6uTvcXj+yKT3yg43yNRrh9NZcEKeeuosT
         24lkPRwFdPE9ZAX8llQrfRcR45LWYkgjrTbnjm75DQ2qPBMR9BRF8x5gN/jHNWmMbWsb
         CKl+3nfApu+YUVmLioT02b7/IV6WWhwSjD2FsbyVsXfr70EGZwgtNxKbCDLx0SNBHaHJ
         0Z2uylMKI3MDXOCc/twUVG5i3l8ZH7dgDQLJj6oi6xxu4RU87uOb8cYOkQjMWIBeYDwb
         QCakT0iqWp1GytHVhO8VA3pajWhiFb6noHNWGLHfb5lDM19+tKmrTwYTX0TRxiQv7Uuy
         3k8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677621273;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rMgdYMzZvXNWzKeivTjC5ghEKfC2j+31bPS+5KYwLa4=;
        b=1iFaOisewnSBzI3ULDnccPglfazZhLiurPxUja+MW8mYnLwxhqWaJWqtnweiyxymFs
         gEMEs+BztkT/PwFVRwmpoh5T4KGU4SonA+V0t9pnqgVShuEsqGnRwod/4xlwJka8aS2X
         01+P84TklGB+9GtODmjJMkNMkwdYe8Vsqe8UTj+jLbbD+5MdzW3ggx9YIM074qZSbCSP
         4D0+yPivAZEp0Cfxo0vQkNAWu9VLhoEy8zX4JrqlvDZ9ezdehR9/Ot5eNDjqrqdbGGyW
         Mg8ZG7q13OH7dAPoVoez/UEkRxs5iC/kFwwAFcgJAEJTXvOdsKY75/pzFIs9DfcEmKCK
         J/Hw==
X-Gm-Message-State: AO0yUKWKdW2Nkie9WofinNU3i2HoAftH+bTt6EF7vBwSLAHZiD+xQXOt
        il6YSfobMMRUum7H5ZZvbDc=
X-Google-Smtp-Source: AK7set9N8ytO5ogAIl2L/TneWos6fWef6xLxCgDMzzMCSmk2PWkxMPa6bMnidhiQDT9QNQKau43Tog==
X-Received: by 2002:ac8:580f:0:b0:3bf:dc2d:f29a with SMTP id g15-20020ac8580f000000b003bfdc2df29amr7862652qtg.18.1677621272733;
        Tue, 28 Feb 2023 13:54:32 -0800 (PST)
Received: from [10.69.40.170] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 190-20020a3705c7000000b0073b9ccb171asm7426411qkf.130.2023.02.28.13.54.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 13:54:32 -0800 (PST)
Message-ID: <7731bf3a-b9ce-9020-6d6d-a13d39a9088c@gmail.com>
Date:   Tue, 28 Feb 2023 13:54:30 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] MIPS: BCM47XX: Add support for Huawei B593u-12
Content-Language: en-US
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Hauke Mehrtens <hauke@hauke-m.de>, linux-mips@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20230227080911.15039-1-zajec5@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20230227080911.15039-1-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 2/27/2023 12:09 AM, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> It's a BCM5358 based home router. One of very few bcm47xx devices with
> cellular modems (here: LTE).
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
