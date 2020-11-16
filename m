Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 932C42B50A1
	for <lists+linux-mips@lfdr.de>; Mon, 16 Nov 2020 20:17:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729241AbgKPTRA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 16 Nov 2020 14:17:00 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:36630 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729223AbgKPTRA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 16 Nov 2020 14:17:00 -0500
Received: by mail-oi1-f195.google.com with SMTP id d9so19967730oib.3;
        Mon, 16 Nov 2020 11:16:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=D4c13z/AWlllHasXtboOHruCJmJ26ohfoTPObmNGa6I=;
        b=lFiVcBmjVw70u+icpxbE0lAFTfkIQUMxjJfrohWML4ruzkJlJQbOGSf2O6XK3Nk0f1
         us1WTsxFMqnDyBKF/9maeAPpHJiEt8S6wMNh0VR+H8TPyj8WUACjMVwXz2WV9Fi8kZOn
         pYsh1SoDjg3o+WLnJS5G62bPz3IBvhHEftVmDdNijd+CoEgzrVynyCIyAMhh8nlFfTd3
         2nT40/9Trz1E6D5FqSqwpvr/RZ+eu85LtxLtdv2IOuKnzuneqzVeFopTDQbGli3kAKp5
         7RGwDECenosRpY6ppX4kuKKiQTPZpYBcO+fMTWmKy3ApW1QnDCAvP6rEtzGEa0tHR9mI
         ZkVg==
X-Gm-Message-State: AOAM531YPChu/F8pFnfma409ClwPYAW6TFvmSu3wkn4sIdKrjeq1LYNF
        ndsYkNRDe+i/T5yjSdIu4g==
X-Google-Smtp-Source: ABdhPJzYCwATlASvNHOCVUN3DnFx1wAEYSk90oisTeLS9A3YG/B9cJipsAO6LXDTD//sFHU08Ti66w==
X-Received: by 2002:a05:6808:7cd:: with SMTP id f13mr150333oij.38.1605554217445;
        Mon, 16 Nov 2020 11:16:57 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n21sm4980586oie.15.2020.11.16.11.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 11:16:56 -0800 (PST)
Received: (nullmailer pid 1981950 invoked by uid 1000);
        Mon, 16 Nov 2020 19:16:55 -0000
Date:   Mon, 16 Nov 2020 13:16:55 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        sboyd@kernel.org, john@phrozen.org, jiaxun.yang@flygoat.com,
        devicetree@vger.kernel.org, devel@driverdev.osuosl.org,
        tsbogend@alpha.franken.de, robh+dt@kernel.org,
        hackpascal@gmail.com, gregkh@linuxfoundation.org,
        linux-mips@vger.kernel.org, mturquette@baylibre.com
Subject: Re: [PATCH 2/7] dt: bindings: add mt7621-pll device tree binding
 documentation
Message-ID: <20201116191655.GA1981921@bogus>
References: <20201111163013.29412-1-sergio.paracuellos@gmail.com>
 <20201111163013.29412-3-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201111163013.29412-3-sergio.paracuellos@gmail.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 11 Nov 2020 17:30:08 +0100, Sergio Paracuellos wrote:
> Adds device tree binding documentation for PLL controller in
> the MT7621 SOC.
> 
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---
>  .../bindings/clock/mediatek,mt7621-pll.yaml   | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt7621-pll.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
