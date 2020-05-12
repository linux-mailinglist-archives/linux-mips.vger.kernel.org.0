Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B272E1CFFED
	for <lists+linux-mips@lfdr.de>; Tue, 12 May 2020 22:57:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726324AbgELU5G (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 12 May 2020 16:57:06 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:38488 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725938AbgELU5G (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 12 May 2020 16:57:06 -0400
Received: by mail-ot1-f67.google.com with SMTP id m33so11712210otc.5;
        Tue, 12 May 2020 13:57:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qvUUedHnYOA9VhTIK7kcGh9CI/Hd/XYwgfKqm+/Yr7k=;
        b=NPkzQlj5Rj2bgvOowIrcrbz9efZflCj6L9QpGla3n521FQrUScwrV1K3AN9x8LtcYj
         i63vmtMsB6WH/f5/H0Y8EGrkCwo6IOoJPyIYPDeCkgR4Pes0UohnycTt2CEEZO6un0BC
         K/+M6oX77Pz9bhRVJHNIE9Ph6ECQ6g/S3tCRG4ceoUSnSpWKZPhoGPXrZMPgb7griZ+c
         8Zit9xwSuaiImrYmUsEtzdWHcht9yXg3wEEiGVPv5kDlCdsZer+vTBpEH0birp3Hz6lY
         os1MfJN3WiFGsSeLgPNsMo0flWkGbv3eYP8Qko328UUJZTEPPZ643FLMwHscpoqRFTGO
         bxjg==
X-Gm-Message-State: AGi0PuZxRLhWt1jDP/LQwngpwyQgup1N2I3BI7UcrIohBi3gcFStmzMB
        vKFnPRW67wPHOqKckJeC0g==
X-Google-Smtp-Source: APiQypKxoK6XahigHniSCqU5q0UEdrqSbdanvccX89CoJG47HdsJz8ESRaTYPp8ZSB7EoZNLtAc2nA==
X-Received: by 2002:a05:6830:242a:: with SMTP id k10mr18442786ots.346.1589317025769;
        Tue, 12 May 2020 13:57:05 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t9sm5581365oie.24.2020.05.12.13.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 13:57:04 -0700 (PDT)
Received: (nullmailer pid 10497 invoked by uid 1000);
        Tue, 12 May 2020 20:57:04 -0000
Date:   Tue, 12 May 2020 15:57:04 -0500
From:   Rob Herring <robh@kernel.org>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Jason Cooper <jason@lakedaemon.net>, linux-mips@vger.kernel.org,
        maz@kernel.org, devicetree@vger.kernel.org,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org, Huacai Chen <chenhc@lemote.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v3 6/6] dt-bindings: interrupt-controller: Add Loongson
 PCH MSI
Message-ID: <20200512205704.GA10412@bogus>
References: <20200422142428.1249684-1-jiaxun.yang@flygoat.com>
 <20200501092139.2988670-1-jiaxun.yang@flygoat.com>
 <20200501092139.2988670-6-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200501092139.2988670-6-jiaxun.yang@flygoat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri,  1 May 2020 17:21:37 +0800, Jiaxun Yang wrote:
> Add binding for Loongson PCH MSI controller.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  .../loongson,pch-msi.yaml                     | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/loongson,pch-msi.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
