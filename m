Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72A4421AB1B
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jul 2020 01:00:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726228AbgGIXAZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Jul 2020 19:00:25 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:38988 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726222AbgGIXAZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 9 Jul 2020 19:00:25 -0400
Received: by mail-io1-f65.google.com with SMTP id f23so4109448iof.6;
        Thu, 09 Jul 2020 16:00:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=F9Kccm8v/cxuldBoqeH2GIZhAFHcx3SGHUgZ8n87Z+8=;
        b=KzZ/YWeD4ovBUyxpI73G1VUICN8jnLhzJ5AXYFZeBXiup03aqllm4IOtroTkT5elFu
         pO3/ng2NyPk8ef+0V+RtxBjczb6OEDBbvEgEbGEaU7d1GhASfcgR+fgrlhRvQ8hOw+Jd
         8eqpLQOwHOEfmLc9M1iPSteyWU0qVG8zpYopRmKQtpogGkRr1cKU2esr6zEYrR8uqK3b
         GCfWAuUX594xS7Id7Wk/LEyUMW7+woWvEMx2kh3Ek2WO3gpNDFyn8m+1fyi7NwWojUbb
         oE22gG965KnaMbyxvsLd/Z0ExNqwjHck1M8TEyvR20yKZRKqlg1TzTcVpFen+BEDwE6n
         MRrg==
X-Gm-Message-State: AOAM531dJ/VYUUeaokPVT9tntmkSQ5v4TNst9YUC4uhc1CYnNebZtM8g
        r69vo3gfeFm9GhEbpCI7WA==
X-Google-Smtp-Source: ABdhPJzyxh+8dUoWq03USHvx6fzIqbY+0o+gxJMBqOJFknQfM8ba3G1vlmwPAd6HEowJXv+8VDdLHA==
X-Received: by 2002:a05:6602:2f92:: with SMTP id u18mr44728604iow.63.1594335624446;
        Thu, 09 Jul 2020 16:00:24 -0700 (PDT)
Received: from xps15 ([64.188.179.254])
        by smtp.gmail.com with ESMTPSA id w4sm2902723ioc.23.2020.07.09.16.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 16:00:23 -0700 (PDT)
Received: (nullmailer pid 1051658 invoked by uid 1000);
        Thu, 09 Jul 2020 23:00:22 -0000
Date:   Thu, 9 Jul 2020 17:00:22 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>
Cc:     jonas.gorski@gmail.com, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, linux-kernel@vger.kernel.org,
        f.fainelli@gmail.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com, zajec5@gmail.com,
        hauke@hauke-m.de, linux-mips@vger.kernel.org
Subject: Re: [PATCH v4 2/9] mips: bmips: add BCM6328 power domain definitions
Message-ID: <20200709230022.GA1051601@bogus>
References: <20200610171630.465579-1-noltari@gmail.com>
 <20200613082140.2009461-1-noltari@gmail.com>
 <20200613082140.2009461-3-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200613082140.2009461-3-noltari@gmail.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, 13 Jun 2020 10:21:33 +0200, Álvaro Fernández Rojas wrote:
> BCM6328 SoCs have a power domain controller to enable/disable certain
> components in order to save power.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> ---
>  v4: Remove "dts: " from commit title.
>  v3: Separate dt-bindings definitions from power domain .dtsi support.
> 
>  include/dt-bindings/soc/bcm6328-pm.h | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 include/dt-bindings/soc/bcm6328-pm.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
