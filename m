Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72D2E22153C
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jul 2020 21:39:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726964AbgGOThR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 15 Jul 2020 15:37:17 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:44260 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726786AbgGOThQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 15 Jul 2020 15:37:16 -0400
Received: by mail-il1-f193.google.com with SMTP id h16so3011988ilj.11;
        Wed, 15 Jul 2020 12:37:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FZRDNrNebIsyZMbllDgGWNkOQhQpExnnO8mqUTe5uak=;
        b=iELUOG/l2zkxYRwxXUlp0eULZ0bLWHvLee2FVbWBlFE/bbW8YFp/ndh6PxRJxri+WS
         s1HXlLfVPIB7dXCa4vkpKLVHsaoq1VCaqyzzkdbDzq3jQArfHE0W9a819ApKqD7egAOX
         YlrQa848sAJ/TPHWCYxc7ZF0p9maGdAx7eiS9v44K8kX6MTOT5T/Qa/PZ5LI0dUtbRem
         bL7XRPKnM7Bs9ntZddfIe6Kz7Ju2bfAjCbw/Oq5bgLhs/r44e9seKeZ0TZg8qC6JsLGe
         +kyBp5l/Q/bC7FABVRhDZ7nOFMbOhx+LEllDLdNruM4Z6/7ODCxs+2MnOUsWzsbncs5A
         kAig==
X-Gm-Message-State: AOAM531e9wDFn/6P2gW/PXIdljYYF0SvlDHiR/7keOJQSHG5OVvKQt4m
        I9XWusWADNBx7tMeSk/9UxkYoiC00w==
X-Google-Smtp-Source: ABdhPJwPrpNl92AzPfR3m7WjynADwYAU4iXRD0bHvujpENXYYd6ZUdH1DNHNVRbBjtavf2DPYgh8DQ==
X-Received: by 2002:a92:c530:: with SMTP id m16mr1106218ili.300.1594841836118;
        Wed, 15 Jul 2020 12:37:16 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id b2sm1548458ilf.0.2020.07.15.12.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2020 12:37:15 -0700 (PDT)
Received: (nullmailer pid 696414 invoked by uid 1000);
        Wed, 15 Jul 2020 19:37:14 -0000
Date:   Wed, 15 Jul 2020 13:37:14 -0600
From:   Rob Herring <robh@kernel.org>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     devicetree@vger.kernel.org,
        =?utf-8?B?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>, linux-mips@vger.kernel.org,
        od@zcrc.me, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] dt-bindings: MIPS: Add entry for the YLM RetroMini
Message-ID: <20200715193714.GA696359@bogus>
References: <20200623182432.187843-1-paul@crapouillou.net>
 <20200623182432.187843-2-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200623182432.187843-2-paul@crapouillou.net>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 23 Jun 2020 20:24:27 +0200, Paul Cercueil wrote:
> Add an entry to ingenic/devices.yaml for the JZ4725B-based
> YLM "RetroMini" RS-90.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  Documentation/devicetree/bindings/mips/ingenic/devices.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
