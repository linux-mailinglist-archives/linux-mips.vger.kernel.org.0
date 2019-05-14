Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 272CD1D0B2
	for <lists+linux-mips@lfdr.de>; Tue, 14 May 2019 22:33:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726200AbfENUd6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 14 May 2019 16:33:58 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:42709 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726143AbfENUd6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 14 May 2019 16:33:58 -0400
Received: by mail-ot1-f66.google.com with SMTP id f23so121459otl.9;
        Tue, 14 May 2019 13:33:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=N/iY6sB9hUGvw1jTATshFGk3u0Lc6Yj1Pxz9HMtGhh8=;
        b=orL+yFs6vQ1unK8O4IZomajjuMGVR4x2CUjY0WkvdlfLiQKVSHbcgdH0ZKw6EevkN8
         RVapwCBaly9VtgzDNk/6kAYD0BHKLqg720Q0hDq0oECQvYn5/ly8q+Pc72P1dOri9hhU
         QMf+Wb33kfOuIQ4CEXMgStIcPnm2EIcJ+DYwLaNfdNch65Q+/FwUdqmYjSYnyxzUtIY+
         oqwVR7iaR2/+ZXn5HNJGFVzcVI5cvjO3/kREoC7xlhUZODubo6uc0nkmy+XukvVhAzpp
         TnSrIDxlC3DGdoMx7AmoLjx9R0QARGq6Be2pGy+mQQ2Rnj5ngqJb9oNZfL2fcfYCO+g5
         mKQA==
X-Gm-Message-State: APjAAAViF14Makqb9E8DK/B6Umu4XTb50BIOSNyr268nwGpokAHK7JoF
        YYBkIVU1JYhPjY66gjPMJg==
X-Google-Smtp-Source: APXvYqwRqm2yRokrVXj0QzpMNW6UrnVH/U24rwaEb0d52X9i8aQ1wJQcU+4yjIhBQjRJPn2Vwwxfqg==
X-Received: by 2002:a05:6830:1389:: with SMTP id d9mr198055otq.329.1557866037161;
        Tue, 14 May 2019 13:33:57 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id g5sm6081253otn.5.2019.05.14.13.33.56
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 May 2019 13:33:56 -0700 (PDT)
Date:   Tue, 14 May 2019 15:33:55 -0500
From:   Rob Herring <robh@kernel.org>
To:     Jonas Gorski <jonas.gorski@gmail.com>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 1/3] devicetree: document the BCM63XX gated clock bindings
Message-ID: <20190514203355.GA31623@bogus>
References: <20190502122657.15577-1-jonas.gorski@gmail.com>
 <20190502122657.15577-2-jonas.gorski@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190502122657.15577-2-jonas.gorski@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu,  2 May 2019 14:26:55 +0200, Jonas Gorski wrote:
> Add binding documentation for the gated clock controller found on MIPS
> based BCM63XX SoCs.
> 
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
> ---
>  .../bindings/clock/brcm,bcm63xx-clocks.txt         | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/brcm,bcm63xx-clocks.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
