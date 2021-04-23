Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D341369659
	for <lists+linux-mips@lfdr.de>; Fri, 23 Apr 2021 17:45:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230470AbhDWPqW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 23 Apr 2021 11:46:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230294AbhDWPqV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 23 Apr 2021 11:46:21 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C50CC061574;
        Fri, 23 Apr 2021 08:45:45 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id a12so34328924pfc.7;
        Fri, 23 Apr 2021 08:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=xVcqGlzpyrQHNmToxJ7ZnGOGDgcVdGv3b8uz5G7yLRM=;
        b=MfCOYQ7+QkiuAqFXjNyCl3AQCTca/IPTcblAM4Hg6d3RhpTMT2WBStXyvQI49KWb6H
         MbLXF2DNQ0E+7mFIN/vs+jkFznXXfHL+Z9UbPbtA6xh9VPYIRJqcUZtv8epFTxk8qgV2
         HPcF7i0Mo4PrfTNo1LQzvvSzdcSOH+2eyLi7pRx1LHuV+fN849SvA0ez5+y27eWhPnhL
         fclz5ZQTsdPWSRaFBYN31MFeNwT4ucAsvoKoShj6U6rghZsgSMsPRHDFDMVLKlWeRgPY
         tlZlnuVy1Ge/P4cdjlCEr17+7D8wGxr7/kaKqam36GVb+sjZlb5p+nc8+sUDXjWJSrT8
         ACuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xVcqGlzpyrQHNmToxJ7ZnGOGDgcVdGv3b8uz5G7yLRM=;
        b=TEoCScPfJma0WMNOjW7bxRPRA8Ioj/3QgwiSw8FrWlmV2eTzXc3m222wO+6cFJvqHD
         jb0lW3y5hxgF3DQEVOuoyBx3LzLiHJSiNAlOIsmmhjILkyFjoDhBtMCniqt63wMv0qmR
         3cyq4ZWLnF45j2MGIVV5ikbl9RZeDUT6pVccOVL/+dW0zQcsdNDcJNzwZ3yc3bGBrEoE
         IyQ7XfMr3zLwsan7BLIENmycUCcW2o9qTr2gJXGTb6V4nhYfoyMidOPzxyS/1y+Zn15u
         EP1tLOHlHgFNkWGb5IBebsU2ikq6fUIOiHYUcwZ3OFY5nyR6wtIStteQ80O+kifIKhtm
         rM2g==
X-Gm-Message-State: AOAM532127FbxvhtbPIUWMjROjHPDhib3q6GMF08cC+eBNGa4ivfhozR
        n4y9zo0weJEWg7tW3P2nMMningvUQSY=
X-Google-Smtp-Source: ABdhPJxMlBmMG7vSUI9BH9dYl6JGX6gw0FsoAOwoI0X9yC0u3xDMjYH9BLWIehqsPteetytEj9M95g==
X-Received: by 2002:a63:b515:: with SMTP id y21mr4423576pge.253.1619192744212;
        Fri, 23 Apr 2021 08:45:44 -0700 (PDT)
Received: from [10.230.29.202] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id g1sm5509326pgi.64.2021.04.23.08.45.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Apr 2021 08:45:43 -0700 (PDT)
Subject: Re: [PATCH] mips/bcm63xx: Use BUG_ON instead of if condition followed
 by BUG
To:     zhouchuangao <zhouchuangao@vivo.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <1619166623-70445-1-git-send-email-zhouchuangao@vivo.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <800fd777-dc61-07e0-bc13-bb95a0924335@gmail.com>
Date:   Fri, 23 Apr 2021 08:45:41 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <1619166623-70445-1-git-send-email-zhouchuangao@vivo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 4/23/2021 1:30 AM, zhouchuangao wrote:
> BUG_ON uses unlikely in if(), it can be optimized at compile time.
> 
> Usually, the condition in if() is not satisfied. In my opinion,
> this can improve the efficiency of the multi-stage pipeline.
> 
> Signed-off-by: zhouchuangao <zhouchuangao@vivo.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>

Subject prefix should have been: MIPS: BCM63XX: Use BUG_ON instead of
condition followed by BUG to match prior submissions done to this
directory. Thanks.
-- 
Florian
