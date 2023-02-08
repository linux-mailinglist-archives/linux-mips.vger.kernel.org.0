Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43D9B68F402
	for <lists+linux-mips@lfdr.de>; Wed,  8 Feb 2023 18:08:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231351AbjBHRIc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 8 Feb 2023 12:08:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229674AbjBHRI2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 8 Feb 2023 12:08:28 -0500
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF0AB4C6C9
        for <linux-mips@vger.kernel.org>; Wed,  8 Feb 2023 09:08:27 -0800 (PST)
Received: by mail-qt1-x82b.google.com with SMTP id f10so21522283qtv.1
        for <linux-mips@vger.kernel.org>; Wed, 08 Feb 2023 09:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oBukM/lnC0020ebNFVVy7IAp436Vg3MV7QEKezX06dY=;
        b=Jkd00Ldwe1l0XYrLsMen5GIokIbdEvqGxh2HUCndtfr2vdub+xnZqJYPhhydZ5cCub
         y7QkCxeyY81wh6XQRiUgIz1NlNJDXZJ6Jmsww4sKWj47dQG4NeutB/s9fKZLuvYnJ+5r
         QA9HHb5fCxPZKGav5MAIdI7crNKgcv1reKJsjYFz3AwpxULDHWs4Bw+R5loC9/QUiOL7
         8QyhZA7izp6xop2/1e7RQnPf2nc5Jt+1jle2uZGCa78N8k9SiQzyBnbf+Hov+mN/wLPL
         771RVBE0BRtMSy0Pl0K4IhgUAa6ydHKJRgWWCmRrC2U8dic7i3LmEA4YzQC8hCmlyNdq
         qFdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oBukM/lnC0020ebNFVVy7IAp436Vg3MV7QEKezX06dY=;
        b=e5v9p9ZqvxlmRZlOBeFIK+1SLgnVvdDi8PaDruQsRmQUdO4DO9D7Enm0Vh2lX4Ghhf
         N0wFlr07EFaafE0hfIdNo2L575GTd4Zl37AaFUhPFgvJhfMNgMpQwtaS79C/c3u5T/a3
         bcaUDD2Dv+I6Nmzr+x+z8nbN+Rtd7qZKLqyXdlz0RMpA1VIC9gX2iJJ0aEGQ8mLlV6O3
         xI2fIZipAIa/CR2MPlnTL6PzOMqcM/LDDOMplKkPlbR2n94js6fLtmmD/lmAArXyhLU7
         BeOSQAj6u2htrLSLskxRgyvdOvYpH6VFkLzC2fXnACRJ3cEeykA/wseoXGezvRderbiG
         ttZA==
X-Gm-Message-State: AO0yUKU3/8o+cyA/f5lFRsergZRGsH5SP1pd2bdaEO1fcO34KEg8MIW+
        kf0j+4F2E4OI1nl+wM/tLmA=
X-Google-Smtp-Source: AK7set8eahdlW98WU1GMGG4/kb1FyXc8HNQNxQpEfYXXId+h296qoxjFhJyG4SXp9tSFBf6FDao1Cg==
X-Received: by 2002:ac8:5a54:0:b0:3ba:1acd:4f8 with SMTP id o20-20020ac85a54000000b003ba1acd04f8mr14173314qta.42.1675876106730;
        Wed, 08 Feb 2023 09:08:26 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id el18-20020a05622a431200b003a81eef14efsm11621271qtb.45.2023.02.08.09.08.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Feb 2023 09:08:18 -0800 (PST)
Message-ID: <7bd3bb0a-b090-604d-53dc-0daea4e291b2@gmail.com>
Date:   Wed, 8 Feb 2023 09:08:11 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] MIPS: BCM47XX: Add support for Linksys E2500 V3
Content-Language: en-US
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Hauke Mehrtens <hauke@hauke-m.de>, linux-mips@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20230208070301.5338-1-zajec5@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20230208070301.5338-1-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2/7/23 23:03, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> It's a BCM5358 based home WiFi router. 16 MiB flash, 64 MiB RAM, BCM5325
> switch, on-SoC 802.11n radio.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

