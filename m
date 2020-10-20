Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60404293BEE
	for <lists+linux-mips@lfdr.de>; Tue, 20 Oct 2020 14:40:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406328AbgJTMkl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 20 Oct 2020 08:40:41 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:35448 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406269AbgJTMkk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 20 Oct 2020 08:40:40 -0400
Received: by mail-wm1-f65.google.com with SMTP id q5so1704783wmq.0;
        Tue, 20 Oct 2020 05:40:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VtkLpRJJKtxHj2N6ScWyj3kmr3moKmOqvWjy6YQK5ng=;
        b=q6OfaFwfzKvOErT3gd6nZAjx/k7isBRC2jOdl97C04T/XzGyKVF8d1SpxYSdK5/fXB
         0CmfcjZJUtHlh39rgGSk41zXWlukRDMbiLNEVGxS1/uarRm4th8bSOKX6KahrbrG3T+U
         zQbOlRhH7SX6C/Fwb3dQMQ4MJwZ+n6PML0m07O8yVIx3ffBDfxVJd1kQc+oTSspq8st7
         R7/+JpUkTTd+2+0UkXXh/vgcIHFF7BcRjjg312zRJD89kBhFZmfAhq+GAEIDO8mpO4NF
         9+HlvM2M/qWK5tNMcp1b+BsItZiPNjJFsFBO3K01X1ZIrO6FCuYUGC8rp0XyHPbfEbKq
         tRBQ==
X-Gm-Message-State: AOAM532Ns3rozFqRcdnQ8QhRePTLXpDZnF/OA5eiIEjHSZLHcxFuae+7
        Ks5jeZ2zLkSMmS2vkVoP/j4=
X-Google-Smtp-Source: ABdhPJyiXSvi33Aa3LN4b06Q/a3tZd7toSmo0SSwva4eTsyKrqaz6+2LB5PapTqyms3d/hESiz+Dtw==
X-Received: by 2002:a05:600c:2144:: with SMTP id v4mr2708253wml.172.1603197638586;
        Tue, 20 Oct 2020 05:40:38 -0700 (PDT)
Received: from kozik-lap ([194.230.155.171])
        by smtp.googlemail.com with ESMTPSA id x81sm2480807wmb.11.2020.10.20.05.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2020 05:40:37 -0700 (PDT)
Date:   Tue, 20 Oct 2020 14:40:34 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Serge Semin <fancer.lancer@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH 12/29] mips: dts: jz47x: Harmonize EHCI/OHCI DT nodes name
Message-ID: <20201020124034.GO127386@kozik-lap>
References: <20201020115959.2658-1-Sergey.Semin@baikalelectronics.ru>
 <20201020115959.2658-13-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201020115959.2658-13-Sergey.Semin@baikalelectronics.ru>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Oct 20, 2020 at 02:59:42PM +0300, Serge Semin wrote:
> In accordance with the Generic EHCI/OHCI bindings the corresponding node
> name is suppose to comply with the Generic USB HCD DT schema, which
> requires the USB nodes to have the name acceptable by the regexp:
> "^usb(@.*)?" . Make sure the "generic-ehci" and "generic-ohci"-compatible
> nodes are correctly named.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Acked-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  arch/mips/boot/dts/ingenic/jz4740.dtsi | 2 +-
>  arch/mips/boot/dts/ingenic/jz4770.dtsi | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
