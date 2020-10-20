Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9F2A293BD6
	for <lists+linux-mips@lfdr.de>; Tue, 20 Oct 2020 14:37:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406284AbgJTMhy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 20 Oct 2020 08:37:54 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:33514 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405915AbgJTMhx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 20 Oct 2020 08:37:53 -0400
Received: by mail-wr1-f67.google.com with SMTP id b8so1958594wrn.0;
        Tue, 20 Oct 2020 05:37:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=z0iW0LyevPTiV403AK0/H1nZ2VDwTNJUowS/2f0kD0E=;
        b=YYSuV6IJdFCBjjI8BEIm3W+luDLoqBK9jOEMPmJ4JdyAPBQXaOZAs+uMJJhdnyjT/5
         gT6OqndXQEggK3wC3P3aqdAC6TxmrFIK+mcSTIUJA3C7u/GSgxFA1RTA9WL7XnweeegM
         sjcap6dWpakiA+SFiORFx6SdSCSWe2B9LixRt/XWzkbGGVRmAIekmzU8qXKcfYSfBtHx
         Mi/tsNls/bITs0IIdL1DlY0+2E2DuywfoDekys/UMsElyxKo59xGkSP3hC3Xl7guIM5N
         0cLYiIgEtGTo22c9r3MdXAgvnHRWJ6qSt3vd+x+4ZfsMPxw049ifz7fr/Q8qEG7CYYHT
         G2gQ==
X-Gm-Message-State: AOAM533HheZnoQh2cyi8ODxI3C60zEAZB9Y7JvPrSvfDJLVNs+9f6HlL
        Y9+f523fFZCbZLt27/00wGc=
X-Google-Smtp-Source: ABdhPJwKVS9/IJQVbna2Ae1zlEWxSElMPrnxYPvK43yFS9+C8lodkVORZwHVe1SRrPe97owj99GcGA==
X-Received: by 2002:adf:ed8f:: with SMTP id c15mr3186579wro.136.1603197471522;
        Tue, 20 Oct 2020 05:37:51 -0700 (PDT)
Received: from kozik-lap ([194.230.155.171])
        by smtp.googlemail.com with ESMTPSA id t12sm2653758wrm.25.2020.10.20.05.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2020 05:37:50 -0700 (PDT)
Date:   Tue, 20 Oct 2020 14:37:47 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Serge Semin <fancer.lancer@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH 13/29] mips: dts: sead3: Harmonize EHCI/OHCI DT nodes name
Message-ID: <20201020123747.GJ127386@kozik-lap>
References: <20201020115959.2658-1-Sergey.Semin@baikalelectronics.ru>
 <20201020115959.2658-14-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201020115959.2658-14-Sergey.Semin@baikalelectronics.ru>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Oct 20, 2020 at 02:59:43PM +0300, Serge Semin wrote:
> In accordance with the Generic EHCI/OHCI bindings the corresponding node
> name is suppose to comply with the Generic USB HCD DT schema, which
> requires the USB nodes to have the name acceptable by the regexp:
> "^usb(@.*)?" . Make sure the "generic-ehci" and "generic-ohci"-compatible
> nodes are correctly named.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> ---
>  arch/mips/boot/dts/mti/sead3.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
