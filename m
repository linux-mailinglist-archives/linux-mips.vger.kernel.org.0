Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3007027D607
	for <lists+linux-mips@lfdr.de>; Tue, 29 Sep 2020 20:45:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728345AbgI2SpV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 29 Sep 2020 14:45:21 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:35714 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728166AbgI2SpU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 29 Sep 2020 14:45:20 -0400
Received: by mail-ot1-f66.google.com with SMTP id s66so5495485otb.2;
        Tue, 29 Sep 2020 11:45:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NiNvINm0Jdyi2H6Bq1yk8QeWWTTX9zsn0jUTDC6EGzc=;
        b=cqHv9GQ3Yv5n3ydrSjmYecj4BLhoopehF+cAoOpqKz8FbrhEJFKqnxgI+v5vsXoMxV
         lhoYXd6WOsba/HghqHCbxb93ZlrFfpmhPWl87M1OSbEQ5gOs3SHTK2OdrpCDmr1M0vzF
         yl01hjvuNHuE/GAo+C0BqQoHNnRd7k9o5Se27+C7u8KR23mssJBwEyce/1F+ywGbSe9k
         aM70t8h1EXTCMKw/O5rqVteBk8KQYyUhBLQ0/K7wCXfvDlGtBZGYPhEtoOVqIL0fbqT3
         XvElWBpQAjXyHlL3qgNmzZ3yoErgiZ7h6D/aI5nSoIPvUSur3oD2KpwaKF03nJIxeh/Y
         4Zrg==
X-Gm-Message-State: AOAM533tJ8mON56hy2FlxU+nS9uq4lIuFOv8C/GHy9lYz/axrhDKEOlD
        hoWVJSwfj7J+/g5P/ybG2dP/ns0VOXnI
X-Google-Smtp-Source: ABdhPJyh/cvOloTHJLS6pX/a3MbbYykmCIZSTijj3Haqa0d1TgJWkItTfI+j0nBP1jN4gerMd763CQ==
X-Received: by 2002:a9d:1710:: with SMTP id i16mr3501192ota.174.1601405119986;
        Tue, 29 Sep 2020 11:45:19 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l1sm3077532ooe.20.2020.09.29.11.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 11:45:19 -0700 (PDT)
Received: (nullmailer pid 942368 invoked by uid 1000);
        Tue, 29 Sep 2020 18:45:18 -0000
Date:   Tue, 29 Sep 2020 13:45:18 -0500
From:   Rob Herring <robh@kernel.org>
To:     WANG Xuerui <git@xen0n.name>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: rtc: Add bindings for LS2X RTC
Message-ID: <20200929184518.GA942310@bogus>
References: <20200923075845.360974-1-git@xen0n.name>
 <20200923075845.360974-3-git@xen0n.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200923075845.360974-3-git@xen0n.name>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 23 Sep 2020 15:58:43 +0800, WANG Xuerui wrote:
> Document the binding for the LS2X RTC block found on the Loongson-2K SoC
> and the LS7A bridge, originally appearing on the Loongson-2H.
> 
> Signed-off-by: WANG Xuerui <git@xen0n.name>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/rtc/trivial-rtc.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
