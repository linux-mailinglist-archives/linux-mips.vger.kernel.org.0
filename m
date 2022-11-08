Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89B76621BC3
	for <lists+linux-mips@lfdr.de>; Tue,  8 Nov 2022 19:21:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234799AbiKHSVI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Nov 2022 13:21:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234816AbiKHSUp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 8 Nov 2022 13:20:45 -0500
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE30C7054B;
        Tue,  8 Nov 2022 10:20:16 -0800 (PST)
Received: by mail-qt1-x833.google.com with SMTP id x15so9117100qtv.9;
        Tue, 08 Nov 2022 10:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dds6n3pa0ZNU44FMOnijGAbu1rZyoy+W/S80mJkNJys=;
        b=j4FM8XSe33BB5Mj2lc0ZsfXBSWCah9A86ROxsNO6pZMRFgviTVw1vnUHOg9rrrNxQx
         dJx2GFIH1iTl2wC/ZAQBtbhX19XGV2lW/UUGVbxqXyohsfzBnPRRwNB4gAONwFwTX7Wu
         CHqrq6wKhYtSRlKAX/O85C6hBffzLKGJCto0V7K3E5LGfvOISXdxlxi6Ryj4YfY7xtbd
         p5Nf1UUo/zB81XSlupF36RTIdVDpYFysdcaPEBvCO1cH/kZ3f43WGh9oQlfaJbQYsmW+
         aQ8uULhtgSYaiGCJP1yWglv3WVttI3h9/QG8dfwwECE/3kutxniFj3AJ/f24lgbeidjs
         Qw5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dds6n3pa0ZNU44FMOnijGAbu1rZyoy+W/S80mJkNJys=;
        b=0cGE93PlMRY04x0KggA0lxw2WHVdg0zfLJ6NKgG9BVTPvjb8nPNIh/ewhPdxiIyE1t
         NvUBQLXiu2DOhubUb/Og/r9aG1hcBCOhNn0InJVHhvRhUo+zPPRg2j6amfmPiCpD542I
         5xcP/cMm0V04t/dyBgEcnBBoWSfY1SDnCgrl/twTTM0IasUI840UooBDtPH1RKL8e45a
         VPxr0eCy7Q3Jw48xgR0E27wQD5vNRUdMMQ4BcdeISOC89IwIcXy6oo66o8Pp68+BZ6WB
         mTp5eCNI3n8Y3YTR1FGKU+oA4TUf2RdRJCWM614f+0Zri/84jw6NIkUbELFCWd71TgZD
         rG9g==
X-Gm-Message-State: ANoB5pnaRz5R9ZI+P/59XVmb9GMIRWKUhpX+v5dznUGHqxF817pwtth1
        v4l6eDaAk634YaDhJ4JPLJ4=
X-Google-Smtp-Source: AA0mqf6DFZvkLfK2BCaUB2lJ9ZiAHME+bHk1Hqh+RrEBPKQSJqszpPUmrV+phO23eZcp1dLOgv2ASg==
X-Received: by 2002:ac8:1193:0:b0:3a5:81e9:d17e with SMTP id d19-20020ac81193000000b003a581e9d17emr12543320qtj.173.1667931615782;
        Tue, 08 Nov 2022 10:20:15 -0800 (PST)
Received: from [192.168.1.3] (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
        by smtp.gmail.com with ESMTPSA id fc17-20020a05622a489100b003a5612c3f28sm8569225qtb.56.2022.11.08.10.20.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 10:20:14 -0800 (PST)
Message-ID: <90b0bd9d-b4d9-c5f3-7276-dfe145a2947c@gmail.com>
Date:   Tue, 8 Nov 2022 10:20:12 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] mips: dts: brcm: bcm7435: add "interrupt-names" for NAND
 controller
Content-Language: en-US
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20221108085032.4609-1-zajec5@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20221108085032.4609-1-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 11/8/2022 12:50 AM, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> Second interrupt can be DMA or EDU one. Specify it explicitly using
> interrupt-names property. This matches documented binding.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
