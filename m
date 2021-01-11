Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81D4C2F22A7
	for <lists+linux-mips@lfdr.de>; Mon, 11 Jan 2021 23:23:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389710AbhAKWWt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 11 Jan 2021 17:22:49 -0500
Received: from mail-oi1-f170.google.com ([209.85.167.170]:42348 "EHLO
        mail-oi1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389439AbhAKWWt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 11 Jan 2021 17:22:49 -0500
Received: by mail-oi1-f170.google.com with SMTP id l200so254235oig.9;
        Mon, 11 Jan 2021 14:22:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Tn6EaiyaPalV+0m2K4qvMblzUggNWDYMSA1NHP1N1LM=;
        b=ie2zjxOG2gs9fyTp0HD86KHQUCiI+P/ZIGk7/uDwu91j+uXKX4cmlXye9aNok2Sz5r
         Y2ZkU3g1t+F2d4zi7B5ssiccqdmk/ZyozmmocdbhYpvt8CZt3U7oMW9Izek4FVBw2LPg
         T/LEj/ZL91/vVSuZUKBwM6q3AooHu8Z3KAzXhwpUnb7ihbjNzp1lYCMHrBaZ7kZQitTp
         tweY0Yiot3TCHDt7ubK2ByF3JC86HFSbFOmZv0bzftIzqGagK1/w79LtsIY02g+Lt/H8
         mTV32vNHUXMnRR949n4MctUFG8tVaBp7WjVZXPtp7qHqoWN9kIkGICST14JS8T7o62Ju
         IRpw==
X-Gm-Message-State: AOAM532276rpRwMyoYizSj4UxcuPxdaTqCSORWvU5Juz0chA4rtq5B0c
        +y8ewgLzFIc4yVCjCa5bfw==
X-Google-Smtp-Source: ABdhPJx2yC/lamJbJpygZ31zw6+dS3IGN6QrKvJh95V7+avRV/WrxrkHoUT01k9Y/pLXdNatMqE1Hw==
X-Received: by 2002:aca:538c:: with SMTP id h134mr628538oib.44.1610403728724;
        Mon, 11 Jan 2021 14:22:08 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n11sm240752oij.37.2021.01.11.14.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 14:22:07 -0800 (PST)
Received: (nullmailer pid 3163414 invoked by uid 1000);
        Mon, 11 Jan 2021 22:22:06 -0000
Date:   Mon, 11 Jan 2021 16:22:06 -0600
From:   Rob Herring <robh@kernel.org>
To:     Aleksander Jan Bajkowski <olek2@wp.pl>
Cc:     tsbogend@alpha.franken.de, robh+dt@kernel.org,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        john@phrozen.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mips: lantiq: Document Lantiq Xway CGU
 bindings
Message-ID: <20210111222206.GA3163384@robh.at.kernel.org>
References: <20210101180118.2496-1-olek2@wp.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210101180118.2496-1-olek2@wp.pl>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 01 Jan 2021 19:01:18 +0100, Aleksander Jan Bajkowski wrote:
> Document the Lantiq Xway SoC series Clock Generation Unit (CGU) bindings.
> 
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
>  .../bindings/mips/lantiq/lantiq,cgu.yaml      | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mips/lantiq/lantiq,cgu.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
