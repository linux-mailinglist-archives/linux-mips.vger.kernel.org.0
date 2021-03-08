Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4741A331A7D
	for <lists+linux-mips@lfdr.de>; Mon,  8 Mar 2021 23:56:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbhCHW4J (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Mar 2021 17:56:09 -0500
Received: from mail-io1-f41.google.com ([209.85.166.41]:46922 "EHLO
        mail-io1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229655AbhCHWz4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 8 Mar 2021 17:55:56 -0500
Received: by mail-io1-f41.google.com with SMTP id u8so11785140ior.13;
        Mon, 08 Mar 2021 14:55:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6xLykOfAllLruOHyBLWMIQxo1ZRSm2qdesc+Rm3KDTo=;
        b=dJG937RxIGysbFtVpJigW33PhFNhRs/ue68ZSy4+VuBfOm2eDpLk3eIAV919kMBNE5
         ZBiYRHudzQMHf0fde+OJmEHlcSdyICziKm2PJ9L7SPnwKKHV2iFrUXA8cttOjGeQWAV3
         IgYMq2R+q5CRNq5pJM+eOE1zB8YAFMk2vaDdsZ8Bto/ZJw1qcpL7gH5elhJZw0eAKufD
         FzAmrFqWDLL66HHGSO3FFqlkF135abJcrg6KmR4hjl5gGK1pfJYcuz8CSv7mciHkYxIH
         MpnRRYX215hJASwyMEw39I6mRu17dhA0Z7+Y+uQRexJpY8gc/czJMW4BjWeNDkcnnm1T
         yhrg==
X-Gm-Message-State: AOAM531Q3p4seZZlR2Iq/ESXobcKpkuA6HpQXTfKzoOCDDGFdiRkAJKl
        kGyyWImAIS5DJwI413mAgg==
X-Google-Smtp-Source: ABdhPJxgeW+f58tcaUK15KRvBIwF2tFD0pHXrnxDECAuwSHZ7sTDJEkg2+tfViLQGuduC6I8RJQNEQ==
X-Received: by 2002:a05:6638:12cf:: with SMTP id v15mr25119345jas.77.1615244156258;
        Mon, 08 Mar 2021 14:55:56 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id s8sm6494741ilv.76.2021.03.08.14.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 14:55:55 -0800 (PST)
Received: (nullmailer pid 3102714 invoked by uid 1000);
        Mon, 08 Mar 2021 22:55:53 -0000
Date:   Mon, 8 Mar 2021 15:55:53 -0700
From:   Rob Herring <robh@kernel.org>
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        john@phrozen.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, neil@brown.name,
        devel@driverdev.osuosl.org, tsbogend@alpha.franken.de,
        linux-clk@vger.kernel.org, sboyd@kernel.org
Subject: Re: [PATCH v10 2/6] dt: bindings: add mt7621-sysc device tree
 binding documentation
Message-ID: <20210308225553.GA3102663@robh.at.kernel.org>
References: <20210307070426.15933-1-sergio.paracuellos@gmail.com>
 <20210307070426.15933-3-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210307070426.15933-3-sergio.paracuellos@gmail.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, 07 Mar 2021 08:04:22 +0100, Sergio Paracuellos wrote:
> Adds device tree binding documentation for clocks in the
> MT7621 SOC.
> 
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---
>  .../bindings/clock/mediatek,mt7621-sysc.yaml  | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt7621-sysc.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
