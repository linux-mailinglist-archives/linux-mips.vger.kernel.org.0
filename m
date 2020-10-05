Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30202283701
	for <lists+linux-mips@lfdr.de>; Mon,  5 Oct 2020 15:54:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726073AbgJENyk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 5 Oct 2020 09:54:40 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:44847 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbgJENyj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 5 Oct 2020 09:54:39 -0400
Received: by mail-ot1-f68.google.com with SMTP id a2so8629367otr.11;
        Mon, 05 Oct 2020 06:54:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ywT1ID75hKID+KWrvt8jbDCqAy1lsMMxjENEdx2Y1RY=;
        b=V6wdXhTU8s6zmDWjxLEj0MacUFNdOWTRRGhViJTYug2OeeYLV+pFjXuPNCS+MCZ4Kn
         hq6INTCT4WpChylWrvBhKDCoDeXHGIV6CMRV38fShfJuJXo1hXT9dEf+jkNL1S/ULQgT
         gy/jYjG3xJIeNwTbueBPUWoAIhuMM22tLjD/W24fdc3Fq2l35VOO1klydEGbi8VMdOAQ
         miul0dffTrJgxoUi1lR2FIYg3ZmxV2k+0gP1H8MNMxVtY2GmbvgVbrFS+4faRK3aizOQ
         vYwKnR7ATRO5Ay0/3tE+HkFBbD5RSlFAVl55Gkl0j73QZKzghR9PwQ1HqqoyivVOGL6+
         u/eg==
X-Gm-Message-State: AOAM5307btv9zMTHXsxhtRPl2s9BSu/2ll7Ym//23ilbgNkI51hfHNlN
        g3aV9NybHm6bvlmyGw7FBA==
X-Google-Smtp-Source: ABdhPJy27lxmlMYfHdDW0sQLWWCljDxFmokHsIy9JCpxiH5FWa61WQb3hBS728MrEMCDCS4Vzx1c2A==
X-Received: by 2002:a05:6830:30a8:: with SMTP id g8mr10929780ots.370.1601906077165;
        Mon, 05 Oct 2020 06:54:37 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id x18sm1477902otq.61.2020.10.05.06.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 06:54:36 -0700 (PDT)
Received: (nullmailer pid 86477 invoked by uid 1000);
        Mon, 05 Oct 2020 13:54:35 -0000
Date:   Mon, 5 Oct 2020 08:54:35 -0500
From:   Rob Herring <robh@kernel.org>
To:     Alexander Dahl <post@lespocky.de>
Cc:     Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-amlogic@lists.infradead.org,
        Alexander Dahl <ada@thorsis.com>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 2/7] dt-bindings: leds: Convert pwm to yaml
Message-ID: <20201005135435.GA86443@bogus>
References: <20200930234637.7573-1-post@lespocky.de>
 <20200930234637.7573-3-post@lespocky.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200930234637.7573-3-post@lespocky.de>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 01 Oct 2020 01:46:32 +0200, Alexander Dahl wrote:
> The example was adapted in the following ways:
> 
> - make use of the now supported 'function' and 'color' properties
> - remove pwm nodes, those are documented elsewhere
> - tweake node names to be matched by new dtschema rules
> 
> License was discussed with the original author.
> 
> Suggested-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Signed-off-by: Alexander Dahl <post@lespocky.de>
> Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
> ---
> 
> Notes:
>     v5 -> v6:
>       * removed pwm nodes from example (Rob)
>       * renamed led-controller node in example (Rob)
> 
>     v4 -> v5:
>       * updated based on feedback by Rob Herring
>       * removed Acked-by
> 
>     v3 -> v4:
>       * added Cc to original author of the binding
> 
>     v2 -> v3:
>       * changed license identifier to recommended one
>       * added Acked-by
> 
>     v2:
>       * added this patch to series (Suggested-by: Jacek Anaszewski)
> 
>  .../devicetree/bindings/leds/leds-pwm.txt     | 50 -------------
>  .../devicetree/bindings/leds/leds-pwm.yaml    | 70 +++++++++++++++++++
>  2 files changed, 70 insertions(+), 50 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/leds/leds-pwm.txt
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-pwm.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
