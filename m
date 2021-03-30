Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAE9F34EEE6
	for <lists+linux-mips@lfdr.de>; Tue, 30 Mar 2021 19:04:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232599AbhC3RDl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 Mar 2021 13:03:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232608AbhC3RCy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 30 Mar 2021 13:02:54 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C30F9C0613DA;
        Tue, 30 Mar 2021 10:02:20 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id gb6so8097803pjb.0;
        Tue, 30 Mar 2021 10:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=VZ7hPMfkkH0ClkPZrlLHv0WaV7eFxnm7svjyAEo3eSA=;
        b=aN1+dAsUo/o/qwn6zz/8bJmkfICFTI0Fb8ueK8UmCji2EK2452V6bKSRAIO4/jUj60
         Gj6vk/ssTwmCpoLkWLW6XTL3csEG8eRBRlfKK+qy+JnYblK6g1Rw77ebQfF9tw8JmMy6
         c2wxI76UFz2AvepjXZTtgKeL7Txp2ZhFpQTdeKIVbZWn3yOP4UU7WSdvzSYPG9clj+q1
         loWRlJzlnMQLsDyHBtQbTKFlIU3IQpQzOVFGodmuY+M1A5ODw1g2Z3X8q9m8a7G+Bb/z
         uZlhlg89RzCAcCzqSZdd2uhSpHEit9CUNzAboe/7utL4HBadHUj+CSLfZpx4H+baaCAy
         IicQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VZ7hPMfkkH0ClkPZrlLHv0WaV7eFxnm7svjyAEo3eSA=;
        b=Quohzjtn3zxayzxUh3xJEH77KE2uxjZLcQZbMWIREZt87Eu6iSSp3Z33nZ/OHP39Ch
         00vOzU3tWAbpWRqLvbtBc3hfkdjhZQey8ZwN4tZq7ygVHN8V2VApQEQuWrBXs2cixzvP
         esXIyAeqUMKolL0lalhzVhLui+6FYnT32ofiUHSlZKVGqJ7VJ5X2U7jD7UzMK8D54Ktb
         wMrmaoobdDHYpAGlDDTRRziqZeOkNKzethUfjzEXQAQO5nKX3ASUq1vG+7ysd23hoAc5
         Q+SsaQNW4CecaQHxkG//c7qpbRCvhOYBFzr8c7GebGBp6nJ2RWmt74pxG+kCV6DJNlsi
         k35g==
X-Gm-Message-State: AOAM532FbXLmgQ2kCwjJVsO/jM1FjrUjTprfuZAmf6R8F+oJPXi+Er9t
        2AncpdSv4JuAwWWAnBjRZMymB00Yn7c=
X-Google-Smtp-Source: ABdhPJxDfQB3ZfQXm1ZS29uvkL7YqpNtHkHIN11UDP+eTFtwxIM+9SC9wx2gkvGY5DfdhFJ3B7m2jA==
X-Received: by 2002:a17:90a:488a:: with SMTP id b10mr5222218pjh.2.1617123739964;
        Tue, 30 Mar 2021 10:02:19 -0700 (PDT)
Received: from [10.67.49.104] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id 4sm3235448pjl.51.2021.03.30.10.02.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Mar 2021 10:02:19 -0700 (PDT)
Subject: Re: [PATCH v2 1/6] mips: bmips: fix syscon-reboot nodes
To:     =?UTF-8?Q?=c3=81lvaro_Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
        Paul Burton <paulburton@kernel.org>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210314164351.24665-1-noltari@gmail.com>
 <20210314164351.24665-2-noltari@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <cd7be816-1d88-23de-615c-ae217dda284b@gmail.com>
Date:   Tue, 30 Mar 2021 10:02:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210314164351.24665-2-noltari@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 3/14/21 9:43 AM, Álvaro Fernández Rojas wrote:
> Commit a23c4134955e added the clock controller nodes, incorrectly changing the
> syscon-reboot nodes addresses.
> 
> Fixes: a23c4134955e ("MIPS: BMIPS: add clock controller nodes")
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
