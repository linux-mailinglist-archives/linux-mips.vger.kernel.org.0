Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 121721F594E
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2020 18:44:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726610AbgFJQo0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Jun 2020 12:44:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726095AbgFJQoZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Jun 2020 12:44:25 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A708FC03E96B;
        Wed, 10 Jun 2020 09:44:25 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id n23so1206328pgb.12;
        Wed, 10 Jun 2020 09:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=N3nz8VAx3pKlB78ptGPJm5PU6bVNdaxgHQ+ZtZ70o9g=;
        b=RsK0qjQFG8smIxeDdC/ls5gDxMuvHX5+WypypUF024Eh63wsT1MsDgA13sE5uy0HDc
         dPmzxBGYGshoC3i+1AtL/WmMIURMP/2xE3y81c3yPS4efGLfyhTvG9AFFcb0A64kp7/Y
         edagcH+s6qf6uwq3KTZvwD4l2PzfGsRL+PVK++/1+yK1ZC1UJZbvwB2CbY6+KM1wyqcU
         RvwWuoV3ek52JrICTM1Q7LsoEkgYaq1XjJKadz+T2q0YbspNHYG/EHlmdUKOBJLNeimF
         ZV14DkA3gNqx5RfFpUvzwPdkxcRggPr/IsiizXOlFPvSt4FSRM8kZuYihbCxN+97fAHI
         9rkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=N3nz8VAx3pKlB78ptGPJm5PU6bVNdaxgHQ+ZtZ70o9g=;
        b=ryW93pvwz5K5BvlTG5oaVvwM9Kaxf7vDX6zJzioWXfC1TU5Xjgq5xWtlQ05t7KDT0q
         cXu1ZN8T4O2ujiSQ+lu+bB0cEU0rNKFXac0ktZbeMw9TnvhLXilxJwh8vTmKT0X2DS5F
         xUqS0rr5gEEqi83WXxxBmmNm/qdVeo62uh41arvWzvGdlH6xDBzcXL5odBfoLQ/bxnPp
         wX7e0gZrCeacSRv8mMxnxTHFLXfF/orrpL8vfvSj/C8BMksq5xQeXp4+ge7XDQbiDN5Z
         WpdcZOiwGEZvJj6C0gqueZfE/05ym0C7vWpE+enwu0RtVD108JPh2dGFTAQDR1vZ6T7V
         jhfw==
X-Gm-Message-State: AOAM532zTt/C9Kjff7BqZN3F2yLICcUpuxdBHtHCOkY5ne+/wOz7OO6M
        x0rOzoJZIR6jiRCN+T6EkeU=
X-Google-Smtp-Source: ABdhPJy0NGS7tUqHFFyb+RqTdlQCvJL+oOjZKAXNJ0x3T27vy1QMofrb6uWEJqEWGS1qIggn63zRlg==
X-Received: by 2002:a63:5fc8:: with SMTP id t191mr3313480pgb.185.1591807465016;
        Wed, 10 Jun 2020 09:44:25 -0700 (PDT)
Received: from [10.230.188.43] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id u128sm387931pfu.148.2020.06.10.09.44.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2020 09:44:24 -0700 (PDT)
Subject: Re: [PATCH v2 1/6] dt-bindings: soc: brcm: add BCM63xx power domain
 binding
To:     =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        hauke@hauke-m.de, zajec5@gmail.com, tsbogend@alpha.franken.de,
        robh+dt@kernel.org, jonas.gorski@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20200609105244.4014823-1-noltari@gmail.com>
 <20200610163301.461160-1-noltari@gmail.com>
 <20200610163301.461160-2-noltari@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <61be8299-890e-37c4-4374-06893b8e9e3f@gmail.com>
Date:   Wed, 10 Jun 2020 09:44:21 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200610163301.461160-2-noltari@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 6/10/2020 9:32 AM, Álvaro Fernández Rojas wrote:
> BCM6318, BCM6328, BCM6362 and BCM63268 SoCs have a power domain controller
> to enable/disable certain components in order to save power.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
