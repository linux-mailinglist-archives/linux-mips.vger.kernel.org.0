Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34159290B5A
	for <lists+linux-mips@lfdr.de>; Fri, 16 Oct 2020 20:34:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391979AbgJPSe2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 16 Oct 2020 14:34:28 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:34144 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391877AbgJPSdm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 16 Oct 2020 14:33:42 -0400
Received: by mail-ot1-f66.google.com with SMTP id d28so3337698ote.1;
        Fri, 16 Oct 2020 11:33:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mxGxwsSCY3mfHHfinHvUgIr9QAqE/m7IS136yJ0NQIw=;
        b=q1CkGehJkDeg8Rx5V6QDLN3CI7O2GozLKb42QNNXD5TWIgmwtgyr/jxBbVAOEhuw1m
         Zy5hW6YrdPzV/Fs/vM/d8VdBqJkKH2bCMcpU8A9F+LYmCSZmy+QtUUP172SNwKvD/bHA
         0wqDLExEBU+wwCI5PoHr/2Te8E3JJjLAID9GaLBqCi6iaTwk4L0ks++6Wa7sLJ+Qh3rL
         iVVOCfiek7L1HAL32bz+f09+G+9XkLcTdeE100iyDnJ/lVl0Gt3CgGQRd83C880XR3NE
         tEk6neoV6SgtNceLbGTbUJOvSjsp/ca4JCm3fhdlkXpXWZHwFM1CCuMXqotoaYrAI9iu
         ELhw==
X-Gm-Message-State: AOAM533++Jtuhc04IfpKDg8ClNpRLMUqLWffxjfyEx4ftaJxuzeOGkEJ
        E5Kk2S4g5aEIZs+qFLrrb5VHnltWzg==
X-Google-Smtp-Source: ABdhPJxK0nBPqpEDEQqhCocwWw4MLZJrj7QLVUvcaVIp7lyur2QYnCKC/D0WCkbo+F7ROcbQWU1Nyg==
X-Received: by 2002:a9d:6d99:: with SMTP id x25mr3399434otp.57.1602873220920;
        Fri, 16 Oct 2020 11:33:40 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y4sm1357005oou.38.2020.10.16.11.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2020 11:33:40 -0700 (PDT)
Received: (nullmailer pid 1698574 invoked by uid 1000);
        Fri, 16 Oct 2020 18:33:39 -0000
Date:   Fri, 16 Oct 2020 13:33:39 -0500
From:   Rob Herring <robh@kernel.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Manu Gautam <mgautam@codeaurora.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        linux-kernel@vger.kernel.org, Roger Quadros <rogerq@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-snps-arc@lists.infradead.org,
        Serge Semin <fancer.lancer@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>, linux-mips@vger.kernel.org,
        linux-usb@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        devicetree@vger.kernel.org, Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH 01/20] dt-bindings: usb: usb-hcd: Convert generic USB
 properties to DT schema
Message-ID: <20201016183339.GA1698518@bogus>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-2-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014101402.18271-2-Sergey.Semin@baikalelectronics.ru>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 14 Oct 2020 13:13:43 +0300, Serge Semin wrote:
> The generic USB HCD properties have been described in the legacy bindings
> text file: Documentation/devicetree/bindings/usb/generic.txt . Let's
> convert it' content into the USB HCD DT schema properties so all USB DT
> nodes would be validated to have them properly utilized.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> ---
> 
> Changelog v2:
> - Discard '|' in all the new properties, since we don't need to preserve
>   the text formatting.
> - Convert abbreviated form of the "maximum-speed" enum restriction into
>   the multi-lined version of the list.
> - Drop quotes from around the string constants.
> ---
>  .../devicetree/bindings/usb/generic.txt       | 57 ------------
>  .../devicetree/bindings/usb/usb-hcd.yaml      | 88 +++++++++++++++++++
>  2 files changed, 88 insertions(+), 57 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/generic.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
