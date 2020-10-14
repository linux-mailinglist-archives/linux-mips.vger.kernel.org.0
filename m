Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A2C228E7CD
	for <lists+linux-mips@lfdr.de>; Wed, 14 Oct 2020 22:18:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730034AbgJNUSZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 14 Oct 2020 16:18:25 -0400
Received: from mail-ej1-f66.google.com ([209.85.218.66]:45651 "EHLO
        mail-ej1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726111AbgJNUSY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 14 Oct 2020 16:18:24 -0400
Received: by mail-ej1-f66.google.com with SMTP id dt13so303158ejb.12;
        Wed, 14 Oct 2020 13:18:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0MyUw0Y3gJD9KhX/3YhqYIS6k+1q8f/JNR3G4Oc+mO0=;
        b=OskOucAhDFwQ2kcgHj7hRJfshk9+krQ98eV7j8tLUdRWynKfnRfAyVgH6cQuzzldQM
         IoaXxnYeBZgErj2W6GobcC/hR9saMe44H1xW0NR7n/mFJpJYftYXqrM6Pzl/r8h4UdRL
         ND9+iSWwaQvBHcKCB+gm3vHduhDaZjQA5NSFEl01f4dXlOflsA/hU2KZPZo98MM2RI8w
         wdtreyoL5WALjHHTJhj9Et2gaVjhYQrNMRb/KPEekhgQ5Cg3VCtfsRfB6dkKEzxcmz0K
         lab2atL/5m1jxaSxJYGdjleJlmIKOgmC7QFavtDMIuhnKohrz8ns5UtrrYJ/rhQcTF0e
         wnVQ==
X-Gm-Message-State: AOAM531iEakl9PneyfCXMlchOlYHizdaCb39Oz5Da3GBSTuajKeQaRNf
        GjifmRWwg7zEDN11GXOvbBE=
X-Google-Smtp-Source: ABdhPJyD9mvSdzTeswKoJSSkNRNYZJV/A491oP4RLt7gITN4T+XTScFWRX+EpK8W5zlRYXEzJ8uEig==
X-Received: by 2002:a17:906:1e45:: with SMTP id i5mr798232ejj.203.1602706702595;
        Wed, 14 Oct 2020 13:18:22 -0700 (PDT)
Received: from kozik-lap ([194.230.155.171])
        by smtp.googlemail.com with ESMTPSA id i18sm222556ejr.59.2020.10.14.13.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2020 13:18:21 -0700 (PDT)
Date:   Wed, 14 Oct 2020 22:18:18 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Roger Quadros <rogerq@ti.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-snps-arc@lists.infradead.org, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 11/20] dt-bindings: usb: dwc3: Add synopsys,dwc3
 compatible string
Message-ID: <20201014201818.GA6926@kozik-lap>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-12-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201014101402.18271-12-Sergey.Semin@baikalelectronics.ru>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Oct 14, 2020 at 01:13:53PM +0300, Serge Semin wrote:
> The DWC USB3 driver and some DTS files like Exynos 5250, Keystone k2e, etc
> expects the DWC USB3 DT node to have the compatible string with the
> "synopsys" vendor prefix. Let's add the corresponding compatible string to
> the controller DT schema, but mark it as deprecated seeing the Synopsys,
> Inc. is presented with just "snps" vendor prefix.

Instead of adding deprecated schema just correct the DTSes to use snps.
The "synopsys" is not even in vendor prefixes.

Best regards,
Krzysztof
