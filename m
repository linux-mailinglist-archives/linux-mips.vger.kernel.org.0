Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EC592F22C0
	for <lists+linux-mips@lfdr.de>; Mon, 11 Jan 2021 23:28:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390299AbhAKW1W (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 11 Jan 2021 17:27:22 -0500
Received: from mail-oi1-f178.google.com ([209.85.167.178]:34634 "EHLO
        mail-oi1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389257AbhAKW1W (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 11 Jan 2021 17:27:22 -0500
Received: by mail-oi1-f178.google.com with SMTP id s75so310895oih.1;
        Mon, 11 Jan 2021 14:27:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IzW3BFNay3CoD02LlSeDHpzmzjGDGzkS0yq1gnPtTNk=;
        b=VtcRbUBmCygjFk9ZaRjVgZlUgGBczg40KdWinbwNffhSQfKaaxYKPlbuChdvjb5P0+
         dK/Feby/7ysrv6JYcUNJA0NPa6gCjaAVtQJKhQLlLQWM/r6HT25MR8unE2NVMlkOzZgk
         ohfa2xoP763LmjUdv+2D52DoMwA6zb1SduVffKuyHXAiYMPHlzUYGqCzgRbfioyATYif
         v6KwBC/W9nexgJSCZXoRarfhJnEX3zNyHJb+6iMSKC31YgM1qpYbR/yQ7Pb/Zy2pIGDo
         N7Dt27VFvFivcrUPWDn9oMd2wf22eOiY6/7aVGyqwfl1rXzYF6eQBJK/GqLcYUaZM+wP
         7qHA==
X-Gm-Message-State: AOAM530f+84d48rByRMYgpeBp1U2OvjIuj3AUDQRWWPH3Yj1gDBGQ5zF
        NSEtvltmQDi+fdIZbTPVng==
X-Google-Smtp-Source: ABdhPJz2TcwLfdcCIA1pkxX4+2VlfdOpNEt7PdXG500jxRATsjtzIydF1Jr0RC/0T+Kt7iJ5RnScrg==
X-Received: by 2002:aca:ef46:: with SMTP id n67mr577506oih.103.1610404001571;
        Mon, 11 Jan 2021 14:26:41 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id o21sm241991otj.1.2021.01.11.14.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 14:26:40 -0800 (PST)
Received: (nullmailer pid 3170182 invoked by uid 1000);
        Mon, 11 Jan 2021 22:26:39 -0000
Date:   Mon, 11 Jan 2021 16:26:39 -0600
From:   Rob Herring <robh@kernel.org>
To:     Aleksander Jan Bajkowski <olek2@wp.pl>
Cc:     devicetree@vger.kernel.org, john@phrozen.org,
        linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
        robh+dt@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mips: lantiq: Document Lantiq Xway DMA
 bindings
Message-ID: <20210111222639.GA3170130@robh.at.kernel.org>
References: <20210103101803.2123-1-olek2@wp.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210103101803.2123-1-olek2@wp.pl>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, 03 Jan 2021 11:18:03 +0100, Aleksander Jan Bajkowski wrote:
> Document the Lantiq Xway SoC DMA Controller DT bindings.
> 
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
>  .../bindings/mips/lantiq/lantiq,dma-xway.yaml | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mips/lantiq/lantiq,dma-xway.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
