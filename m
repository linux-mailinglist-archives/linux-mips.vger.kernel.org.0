Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D01B118DB36
	for <lists+linux-mips@lfdr.de>; Fri, 20 Mar 2020 23:36:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726880AbgCTWgb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 20 Mar 2020 18:36:31 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:44121 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726855AbgCTWga (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 20 Mar 2020 18:36:30 -0400
Received: by mail-il1-f193.google.com with SMTP id j69so7134956ila.11;
        Fri, 20 Mar 2020 15:36:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rI7HBQwLbfPUFmbFR+AsX9oV78cHxKTg/4ZkxCj7UGI=;
        b=LeWiiVxq33qrVP6MpBb4Bd7QBnMcZN1SCNW57XLL8N3klBOyQaP6SXweml2KHVvZqq
         orrQWCbT3wByng4J8IqC3NqK+gqt5V5DHD/Kl7GFS9P6yVv6emsqn9dDuEEivPlG0wCI
         ud85nTuSb4PZ41CrxYsyfrbxSlJc9ZWUGrvjHB1fYIXu2NfrcTyHdNu2Knc4Y1sCwKu2
         PNPyeb8lvhjROyAlsOIOoobtfoK3JlNmF+27KmIy7Ms5/iFt/EFcjVPyWC4GKSySPKzJ
         02XuG0A2ZpWuGTKtsb9osXvNNW2bb/wPgRrS2CjJboRfIUnwAdlkh1LhSnheBzlAe5Fn
         UDdA==
X-Gm-Message-State: ANhLgQ05JTlzVwa8xj1GoANXrSd12G6PfDJlY9z7M2ICNFEb034Yv/QN
        XEBvP5lfoi+8dAeZIUg75/13fX8=
X-Google-Smtp-Source: ADFU+vvlaK/dU0+cnAmSEA65L7XF3zpMhApyC8eQaPP1+ptlzSe6DXm0yH2xaf9FnyHyvXgMYAnubg==
X-Received: by 2002:a92:91da:: with SMTP id e87mr9956797ill.183.1584743789955;
        Fri, 20 Mar 2020 15:36:29 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id j1sm1947302iop.32.2020.03.20.15.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2020 15:36:29 -0700 (PDT)
Received: (nullmailer pid 23817 invoked by uid 1000);
        Fri, 20 Mar 2020 22:36:27 -0000
Date:   Fri, 20 Mar 2020 16:36:27 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Allison Randal <allison@lohutok.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 08/11] dt-bindings: mips: Add loongson boards
Message-ID: <20200320223627.GA23779@bogus>
References: <20200318062102.8145-1-jiaxun.yang@flygoat.com>
 <20200318062102.8145-9-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200318062102.8145-9-jiaxun.yang@flygoat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 18 Mar 2020 14:20:36 +0800, Jiaxun Yang wrote:
> 
> Prepare for later dts.
> 
> Co-developed-by: Huacai Chen <chenhc@lemote.com>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> 
> --
> v4-v5:
> 	Remove unnecessary kernel details.
> ---
>  .../bindings/mips/loongson/devices.yaml       | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mips/loongson/devices.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
