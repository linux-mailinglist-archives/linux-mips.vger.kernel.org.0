Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E6201B177D
	for <lists+linux-mips@lfdr.de>; Mon, 20 Apr 2020 22:48:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726487AbgDTUsj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 20 Apr 2020 16:48:39 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:45660 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725897AbgDTUsj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 20 Apr 2020 16:48:39 -0400
Received: by mail-ot1-f65.google.com with SMTP id i22so9369128otp.12;
        Mon, 20 Apr 2020 13:48:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2oCfqJwuGz3Gk2pXYEFniiXOXcUxFntqa2CcpJxoHTc=;
        b=mUcdqwl2LsRO4Bxrg2gXIjSfWyyXcTONl/vhYtAcnYAApYBIgeBlM3TQcgnH+bYw+d
         c7bb5e5dxvl3oxCWEeynDKt6tlAe0yDakPlLvzmS0r4wD0wd+v0vxtQtroXdiz2LnufW
         XTdTvLagE6OJg8dJLGZR9qqSPOtD3RHLHH8H6xRcgvvhIlDC1UrxSrMJ8n6SLhGkWETv
         MuzzVkfrX24NH4K0byPRrfj0nEDAbxAztJLLG4Pg/JbgFi6UND2mJlwY2suhfgQebngj
         EG8al3doRz/LX5pq7G7+6KggaccY5N1GwY9aXI7/GQxq6YYKhrHV+o0NWbI0EuQ4nxex
         /JSw==
X-Gm-Message-State: AGi0PuZ0rZAxL6GQSKdfR3eRK1dEOVIyr4Xp9ZXadCtTPq8dcH7uqfis
        kTEeB44WBeYsH12MdehxDdg3PeM=
X-Google-Smtp-Source: APiQypJuGRuX0vx38aRSPSqUZrUguhBUWLIT1yNiG8KytoIgREKhPIQ4uMRrJzJwmUg53/AXO1QjuQ==
X-Received: by 2002:a9d:4102:: with SMTP id o2mr10836043ote.98.1587415716376;
        Mon, 20 Apr 2020 13:48:36 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l187sm141794oig.0.2020.04.20.13.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 13:48:35 -0700 (PDT)
Received: (nullmailer pid 3657 invoked by uid 1000);
        Mon, 20 Apr 2020 20:48:35 -0000
Date:   Mon, 20 Apr 2020 15:48:35 -0500
From:   Rob Herring <robh@kernel.org>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>, od@zcrc.me,
        =?utf-8?B?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 02/13] dt-bindings: mmc: Convert jz4740-mmc doc to YAML
Message-ID: <20200420204835.GA3563@bogus>
References: <20200413152633.198301-1-paul@crapouillou.net>
 <20200413152633.198301-2-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200413152633.198301-2-paul@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, 13 Apr 2020 17:26:22 +0200, Paul Cercueil wrote:
> Convert the jz4740-mmc.txt documentation to YAML.
> 
> The ingenic,jz4770-mmc compatible string was added in the process, with
> a fallback to ingenic,jz4760-mmc.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  .../devicetree/bindings/mmc/ingenic,mmc.yaml  | 79 +++++++++++++++++++
>  .../devicetree/bindings/mmc/jz4740.txt        | 41 ----------
>  2 files changed, 79 insertions(+), 41 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mmc/ingenic,mmc.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mmc/jz4740.txt
> 

Applied, thanks.

Rob
