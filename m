Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BA8821E5BD
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jul 2020 04:38:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726372AbgGNCih (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Jul 2020 22:38:37 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:46418 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726150AbgGNCih (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 13 Jul 2020 22:38:37 -0400
Received: by mail-io1-f66.google.com with SMTP id a12so15706059ion.13;
        Mon, 13 Jul 2020 19:38:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4Gg8DYJFGz0ri+pNHJ3d+QdBSaSue9B9wGaWAqzH7gE=;
        b=cDzmnpZqLIr89deEgp39vsGloYK7iVfJ623XNV4qDAXKBbcKr3RgQ+mDtNCSh6FiBs
         qc7YOrRRB6ebCpJL2Acr+ihYQo6mvJ/hHsv3oTjn7aqahjG8F9RkSKJ7ufkaH1BGvN15
         AZqnpe99/iBWluuePChy59IT95dojhJzyDPi3/th+2GZSkWueDIRloM7yvLVIroKtkLy
         y8HGpzxRKMljNMM4gapq4lm+INy2CpYwKBI/RfYTkp8/8cUfFqI6TIy9c3VSmx1ymJWN
         uqBnKZZmr7zHcjccH6sINhbtqVdPPb+Zjtu1Zjom3M+gk+IkuG0vhB18+UqwCp03NRjq
         eY8g==
X-Gm-Message-State: AOAM5324DEydaH5vS2GlYkj7Bi9HEY6AoCTRNlNvoWEdR0zMS6YU8qio
        AkmA2lvQi8bsnZEc+QdTSg==
X-Google-Smtp-Source: ABdhPJwZqnw3INgfD6Hay7X47f+EZmXP1MZ7Ywp8k31VukJNIC1u1XNf6R93i8iUljLxukbnVOSYfg==
X-Received: by 2002:a5d:9590:: with SMTP id a16mr2767645ioo.150.1594694316558;
        Mon, 13 Jul 2020 19:38:36 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id d6sm9425301ilq.27.2020.07.13.19.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 19:38:35 -0700 (PDT)
Received: (nullmailer pid 1172482 invoked by uid 1000);
        Tue, 14 Jul 2020 02:38:35 -0000
Date:   Mon, 13 Jul 2020 20:38:35 -0600
From:   Rob Herring <robh@kernel.org>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
        David Airlie <airlied@linux.ie>, linux-mips@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, od@zcrc.me
Subject: Re: [PATCH v2 02/10] dt-bindings: display: Add ingenic,ipu.yaml
Message-ID: <20200714023835.GA1172429@bogus>
References: <20200629235210.441709-1-paul@crapouillou.net>
 <20200629235210.441709-2-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200629235210.441709-2-paul@crapouillou.net>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 30 Jun 2020 01:52:02 +0200, Paul Cercueil wrote:
> Add documentation of the Device Tree bindings for the Image Processing
> Unit (IPU) found in most Ingenic SoCs.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
> 
> Notes:
>     v2: Add missing 'const' in items list
> 
>  .../bindings/display/ingenic,ipu.yaml         | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/ingenic,ipu.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
