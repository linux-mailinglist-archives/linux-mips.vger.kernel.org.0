Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7456386F15
	for <lists+linux-mips@lfdr.de>; Tue, 18 May 2021 03:21:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237490AbhERBW6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 17 May 2021 21:22:58 -0400
Received: from mail-oi1-f170.google.com ([209.85.167.170]:45591 "EHLO
        mail-oi1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237293AbhERBW5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 17 May 2021 21:22:57 -0400
Received: by mail-oi1-f170.google.com with SMTP id w127so4428865oig.12;
        Mon, 17 May 2021 18:21:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=roK24cWAgMZxvTHg22P9ht1ialJs4hUE+tJxHNLXDAU=;
        b=GDEHM7pj6XYWNlcQ/89/npoqnGSjWFUHwYA5gzzZfhJXfR3nAav3cB875OFn3eLMzH
         pw/9QYi19jGbGUeFUa3BbMiBaRo/wXusQisJKf0J8HXgUpiQcH1UuoDfqQBuQkEpJiUd
         B43eSllT+aqB4t2RRwkvdTRrAld2lYtPozpwbF48iCMtdh0zpXrEE17n9zbbEfgYuz3/
         4faD6CUZHe2zJFCNnmjS2rBxPU5zB/73Mn0KU82ldAFK2P1en1UeIgZjJf4UbWwSW5F4
         yDOzFXTRFb6fcZv9yOhOBbxrYXnQw+jtzpxZGZWb5N2Sjj/t+/rcV0gEH7YRUxnAr7Ar
         r4QA==
X-Gm-Message-State: AOAM533iwQDMyhS/W+NAnOCRxkn50v9txETPjeSAmoy1oxwmtjiZryGv
        F4LcjSzg0eq+L4/ZtHKvqJoRA63ZmA==
X-Google-Smtp-Source: ABdhPJy+zxSGUtb9OL1svdetvQDtijPs5InWuaWndpH+V+4slSRtw2GLe3Sr9rTU4/rLu2vvMr3gSA==
X-Received: by 2002:a05:6808:b0f:: with SMTP id s15mr1491145oij.58.1621300900304;
        Mon, 17 May 2021 18:21:40 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k16sm3486015otp.19.2021.05.17.18.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 18:21:38 -0700 (PDT)
Received: (nullmailer pid 3590411 invoked by uid 1000);
        Tue, 18 May 2021 01:21:37 -0000
Date:   Mon, 17 May 2021 20:21:37 -0500
From:   Rob Herring <robh@kernel.org>
To:     Oleksij Rempel <o.rempel@pengutronix.de>
Cc:     linux-mips@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v1 1/3] dt-bindings: vendor-prefixes: Add an entry for
 OpenEmbed
Message-ID: <20210518012137.GA3590381@robh.at.kernel.org>
References: <20210514051743.15248-1-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210514051743.15248-1-o.rempel@pengutronix.de>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 14 May 2021 07:17:41 +0200, Oleksij Rempel wrote:
> Add "openembed" entry for https://www.openembed.com/
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
