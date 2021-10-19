Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A86DA433F0E
	for <lists+linux-mips@lfdr.de>; Tue, 19 Oct 2021 21:13:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234361AbhJSTP0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 19 Oct 2021 15:15:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232717AbhJSTPZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 19 Oct 2021 15:15:25 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EA59C06161C;
        Tue, 19 Oct 2021 12:13:12 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id ez7-20020a17090ae14700b001a132a1679bso682949pjb.0;
        Tue, 19 Oct 2021 12:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=p6qfnLTqVvQn91/sU15XDboI6/iazL8ZoptqJ7b7Amg=;
        b=p7RhFcvWM69nE9OjK3HIYp+lNU5AE/rk3xrRqS8fPHXtlaDBuvlqsGboxOLLcZDo6b
         2aD/jiE7NEzjlm5uY6ggDnlHYEHOBtrBAPNosPzKLXyRbP5b0Nv/5MoVpqWjORg4tXSc
         6g26lAkbLMbYEy5JTKeWRzwDg8MB9TzxtTA64WZb8atIzN8Uyk8OH7PzEe1XLauH8caC
         xNfypsEMkaIVA7+XwWCaUnqFx6rvLy9BRluuyILFsapACZ67s2qa2Smorot8uLjbqP9Q
         ApwE0p+oVadEwCxqlPouFkTOlRZhTd8xvW/87q5ekuCBTbapJUt7oVGyaoq0hUikKgrb
         YJ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=p6qfnLTqVvQn91/sU15XDboI6/iazL8ZoptqJ7b7Amg=;
        b=VsByszhbeMytF23g8kHUqLNSZb9LiArxdDKdiAC98wC3Eci1NGZ0OlydEAQ8eRfOpq
         pXQWwDVX01jgIZZVFnL9ZjrmoFNYPpjKOe2x0SWXNrUV1jU4fZ5Ro6w10lcblYsvUD49
         xZTov9f7vb0vXSZ4GPvIsJ6drBnSUebji5wguxu9Hbp88reQl1Jw5l0hiMqH1wFqcaHq
         XZP4r1pJMDkOxWgKxf+rm7qRI1P5oiA7dBLqbqTPcInF0NORr4TC47EWx6bYNd7mymsG
         lpXufWCQA4lXJom/nvuzJdvccDwoucGhNH1xat8Sxl/pGRrqHDiJS37rt2q7kePgJGFT
         vBtg==
X-Gm-Message-State: AOAM530PkbAgnv/Ia2w9SsYqvyilIrxiwuoZw113XOVGQwieZxjjudxU
        NjskMyZlLnLVptMAq026FWNGX453wMw=
X-Google-Smtp-Source: ABdhPJzOIfguzGQQYhF5KQ5A3DkNxG7mHIZvhAk8gisM2D1yKSxZCj/A22tJmtTBhfAJOTIFKQynDQ==
X-Received: by 2002:a17:90b:4ac6:: with SMTP id mh6mr1863221pjb.230.1634670791164;
        Tue, 19 Oct 2021 12:13:11 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id nn14sm3549882pjb.27.2021.10.19.12.13.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Oct 2021 12:13:10 -0700 (PDT)
Subject: Re: [PATCH v4 00/14] Modular Broadcom irqchip drivers
To:     Florian Fainelli <f.fainelli@gmail.com>,
        linux-kernel@vger.kernel.org
Cc:     Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        "maintainer:BROADCOM BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE..." 
        <bcm-kernel-feedback-list@broadcom.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        "moderated list:ARM SUB-ARCHITECTURES" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE" 
        <devicetree@vger.kernel.org>
References: <20211009022023.3796472-1-f.fainelli@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <9f54089d-86de-cb47-d623-fb30bc9aed73@gmail.com>
Date:   Tue, 19 Oct 2021 12:13:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211009022023.3796472-1-f.fainelli@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 10/8/21 7:20 PM, Florian Fainelli wrote:
> Hi Thomas, Marc,
> 
> This patch series aims at allowing the 3 interrupt controller drivers
> used on Broadcom STB platforms to be built as modules in order for those
> to be shipped in a GKI enabled system (Android).
> 
> The irq-bcm7038-l1 requires us to export a number of symbols, which is
> not great, but there are not obvious solutions other than adding
> accessor functions to get the same information.
> 
> Assuming you are happy with the changes though, please do take the last
> two changes as well through your tree.
> 
> Thanks!

Does this look reasonable to you? If so, can you apply all of those
patches through the irqchip tree? Thanks!
-- 
Florian
