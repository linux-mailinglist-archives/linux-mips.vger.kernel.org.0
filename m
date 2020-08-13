Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4049243DD2
	for <lists+linux-mips@lfdr.de>; Thu, 13 Aug 2020 19:00:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726419AbgHMRAF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 13 Aug 2020 13:00:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726167AbgHMRAE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 13 Aug 2020 13:00:04 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2A5FC061757;
        Thu, 13 Aug 2020 10:00:04 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id l60so3058024pjb.3;
        Thu, 13 Aug 2020 10:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=olkCz3qauGZtAoAm2mefdOOlM1vSB0djGLpawNROqyk=;
        b=sjIS5Lsmo4U4A6e8wXKF6dDCzU3jvadMfmMATv1CNfM+uPyHIw0XpFzHhG00Y9gLc3
         JkV++bTHm3vRH0KtrE+5cPSC6Mc3t84isqbVBhc90XbfmbcNxANKOjZOoRpeLe7ZUFN+
         9lvl+j6+85llEwGMxsJh2rZqOcxiaQDaTtFJsrHBr/Q29iKVFIYVZdC5DXIEkFYI4z++
         sFkraCVDHgV5HDRAmm74doPR8pnK//6lzSJn/L0n5QO55k5FpoBEo0adMGyrIw5905TQ
         zNlJS9dyo6gG6swXTPXdcmngO0ATV8ssIumZNwMOCv333nhqWvtzBGvrInw4YQhhA3t4
         vv+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=olkCz3qauGZtAoAm2mefdOOlM1vSB0djGLpawNROqyk=;
        b=QZzHML9vLqCiwk551tAwKs/IpNif2+yecXypyRg9CZrHqhzQf3hfer2FT7XlYreSqB
         95sohW3JJm74k95xk26+Vd8e3WhaF4C+GdN8RvjTC62OncUfp9nIKleTot99RalU3bUg
         VJwTiKKalHomABOUeBVKOQabTEg9VMmj22oBi6tjOJ2pAPvGCl0xFB799DPop2PDwEsx
         14MQKYc4jpoFaumJ5dLQJDnglBmzzT/zEvsLioejJm1NvSTGzbYwZAu3cHO/5i2pYu5R
         2328na/s14RNCcuPFzneJ9v3yWh0JDBob/BLTiHzl8EmH+JUfwrRwf2YkCPyOnCG2OiM
         PPOw==
X-Gm-Message-State: AOAM533sxVJyjWJVHbRwFVPAjeKFy3Af3DUcHDzk203Q04SpL4KmxlHc
        RApNsZTlLhRZdN4eRZ4Wbp6QyfeB
X-Google-Smtp-Source: ABdhPJz0UeKRbmvYSJ6Q5BLwDd5AMhiowFW9EuelYwZvomhVCH4ri/owM0QFJ/fdE9+JTNrVmW5fPg==
X-Received: by 2002:a17:90a:a10c:: with SMTP id s12mr6132341pjp.32.1597338003442;
        Thu, 13 Aug 2020 10:00:03 -0700 (PDT)
Received: from [10.230.30.107] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id c15sm6466542pfo.115.2020.08.13.09.59.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2020 10:00:02 -0700 (PDT)
Subject: Re: [PATCH 12/14] mips: bmips: bcm6362: include and use dt-bindings
To:     =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        robh+dt@kernel.org, tsbogend@alpha.franken.de,
        jonas.gorski@gmail.com, bcm-kernel-feedback-list@broadcom.com,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200812063129.361862-1-noltari@gmail.com>
 <20200812063129.361862-13-noltari@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <2c71f8db-ea2e-9649-628a-31796356f7c8@gmail.com>
Date:   Thu, 13 Aug 2020 09:59:56 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <20200812063129.361862-13-noltari@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 8/11/2020 11:31 PM, Álvaro Fernández Rojas wrote:
> Now that there are proper device tree bindings we can start using them.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
