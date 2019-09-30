Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E8C3C26DC
	for <lists+linux-mips@lfdr.de>; Mon, 30 Sep 2019 22:41:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731473AbfI3Ulh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Sep 2019 16:41:37 -0400
Received: from mail-ua1-f66.google.com ([209.85.222.66]:46300 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730274AbfI3Ulh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 30 Sep 2019 16:41:37 -0400
Received: by mail-ua1-f66.google.com with SMTP id m21so4662413ual.13;
        Mon, 30 Sep 2019 13:41:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CLVDSoxV+nCW/wNVcSm6Lk6FDWMUIFr2tLuq/8JsB9M=;
        b=dS5ouCDGY22jEQnH1tj9bVk5Ucx6Ym9u4zB+OZ2aLucN+8kI5QaTNRPd1vl48+cGit
         ksRZKyJMCo0yfdy3tTKzYIXixa7O04greZdkEUvi5fOe16JC9bKkhoPaYvypIas2oBLh
         UntF2hkg8b7J7CBG7nRCpBKI6TZbRieqFYc1SUDL0FvMhDykb1GtJ9w5KRJmRROuU0JV
         d4mVC+0Y1mriSMMZTHc244t2AY9g6N1Ln1DtXXQIctWYdcbxZ8LqD0pLGp0M3dPyD0nA
         /NkgBSW4RF0enlCazTPCy6R3NHnsRIrC1t/VxdNqdV0TDBoK077OnEUEQeFlnRtqdzFd
         GlZA==
X-Gm-Message-State: APjAAAUWo2e18KnPajGdvtlB+oPP/2FR/OLGFwdNF1vrUbh9s+ipstTZ
        w9laFhEyYpHCBs3Y2tNhhVoW6jc=
X-Google-Smtp-Source: APXvYqxG+EbYwn9Iva1qgDgHWXpFLpzmQX/U5QFutEfVET8XKURRtpLNz1vDuLHXIB0GlUwULozv9A==
X-Received: by 2002:a9d:620e:: with SMTP id g14mr14524629otj.168.1569870646905;
        Mon, 30 Sep 2019 12:10:46 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id q1sm1302786otn.8.2019.09.30.12.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2019 12:10:46 -0700 (PDT)
Date:   Mon, 30 Sep 2019 14:10:45 -0500
From:   Rob Herring <robh@kernel.org>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     linux-kernel@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kevin Cernekee <cernekee@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:BROADCOM BMIPS MIPS ARCHITECTURE" 
        <bcm-kernel-feedback-list@broadcom.com>,
        "open list:BROADCOM BMIPS MIPS ARCHITECTURE" 
        <linux-mips@vger.kernel.org>
Subject: Re: [PATCH v2 4/5] dt-bindings: Document brcm,int-fwd-mask property
 for bcm7038-l1-intc
Message-ID: <20190930191045.GA8851@bogus>
References: <20190913191542.9908-1-f.fainelli@gmail.com>
 <20190913191542.9908-5-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190913191542.9908-5-f.fainelli@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 13 Sep 2019 12:15:41 -0700, Florian Fainelli wrote:
> Indicate that the brcm,int-fwd-mask property is optional and can be
> optionaly set on platforms which require to leave specific interrupts
> untouched from Linux and retain the firmware configuration.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  .../bindings/interrupt-controller/brcm,bcm7038-l1-intc.txt    | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
