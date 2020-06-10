Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6ACE1F4AC0
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jun 2020 03:15:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726039AbgFJBPj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Jun 2020 21:15:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725885AbgFJBPi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 9 Jun 2020 21:15:38 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCED8C05BD1E;
        Tue,  9 Jun 2020 18:15:38 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id n2so274143pld.13;
        Tue, 09 Jun 2020 18:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=oyato65N6RhbhXQIpX0Ba1w0djuilKUjyr0ebq1Bq+g=;
        b=XAD197r7c9G2ON3v9ggHzGURpIIX5fCie1iMJMy2/tvb3a6pMJUm1LRwaalwCdjSo1
         bRWQ62AzU7nw2m1RSWHyug2jEmqSPBTU+253TuIu9NSAB40I8rBOStnwx9SFd/Kz7aBf
         AFXpVGbRdQpDkfqjeM0EGEFmiA9VT6OLygXfKKm6ZxIapAfh8ea00MQ+x/2REbNxQFaj
         LTe/89pCIwQgENpdU12qpAam0ryG6tcv1pom0dxVU5v+hej4205SpZ322QqVJm8bc+JC
         uzHZZ9zc2gnh0Kir/2qbTZYMO1PrSmvhw5lck5EKvImBFD7EeoUk6vIoyYXQBgx85XP+
         FRog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=oyato65N6RhbhXQIpX0Ba1w0djuilKUjyr0ebq1Bq+g=;
        b=jPQRbc8naA4kqIrHTjoB1Mu09gwB30pDnRMm6bvC7SzePUpePZT5D+EG4Eoa46PyjL
         Z1OUM4vGvi+uTdxKFdLdcLNDKsuotM60u0L40SpYqdx7AezhjevARP8qNjXyFm8zsQzf
         Q4s7ckhVQymuyPWRQJO/wb/ewZQ+WCsd6XQpFwjDR9IvV7pMyOSI29VHp4X2BGc3puWi
         S6L57j2HP3DElRi7tdHCIe9VI8L+mbR5Llt8T7l5hsVIZlUQV6ygtZEBOicl5WsjVAfr
         z7TYKHx/w0W2W4ksaBfNEzv0XLnOrBHgSpx5h6K+XJcec+q3lUGfqxVuvT1qXssp62ka
         mjkA==
X-Gm-Message-State: AOAM5316iL1Bc58VDVGqaVCLLOXDNmo46vVBawre+yqdAN+RMIC1OvQG
        /xLPxW1r7JGM4iLy/kWJST8=
X-Google-Smtp-Source: ABdhPJw4WPqJ6jPJGhBvMYVHRL0Ltxuo05ja1OqxCvgSxGd+SkQ2jtPG1jINATFQyZH3XnEavHuDcQ==
X-Received: by 2002:a17:90a:b90:: with SMTP id 16mr548953pjr.85.1591751738313;
        Tue, 09 Jun 2020 18:15:38 -0700 (PDT)
Received: from [10.230.188.43] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id o1sm11595856pfu.70.2020.06.09.18.15.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2020 18:15:37 -0700 (PDT)
Subject: Re: [PATCH 1/4] dt-bindings: soc: brcm: add BCM63xx power domain
 binding
To:     =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        hauke@hauke-m.de, zajec5@gmail.com, tsbogend@alpha.franken.de,
        robh+dt@kernel.org, f.fainelli@gmail.com, jonas.gorski@gmail.com,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20200609105244.4014823-1-noltari@gmail.com>
 <20200609105244.4014823-2-noltari@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <f6cbb9bb-15df-6283-a509-ea8a8b9bdaab@gmail.com>
Date:   Tue, 9 Jun 2020 18:15:35 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Firefox/68.0 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200609105244.4014823-2-noltari@gmail.com>
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
>  .../devicetree/bindings/mips/brcm/soc.txt       | 17 +++++++++++++++++

You should probably create a YAML binding from the beginning that way
you get validation for free. This file should ultimately be broken down
into separate YAML bindings, but I Have not had the time to do that yet
(you are welcome to if you feel like it).

Other than that, the binding definition looks good to me.
-- 
Florian
