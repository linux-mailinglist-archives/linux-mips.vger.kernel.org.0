Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AA92331AA8
	for <lists+linux-mips@lfdr.de>; Tue,  9 Mar 2021 00:02:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231339AbhCHXCL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Mar 2021 18:02:11 -0500
Received: from mail-io1-f51.google.com ([209.85.166.51]:32788 "EHLO
        mail-io1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229528AbhCHXBl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 8 Mar 2021 18:01:41 -0500
Received: by mail-io1-f51.google.com with SMTP id n132so11883744iod.0;
        Mon, 08 Mar 2021 15:01:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WJmddZ2DEjDqbbvXamr8sfWrsbudlvy5mUoyE/Urbwk=;
        b=baHdhBD46c4xUOWftBqezOPOhsFLy2yqJU/82xkQwZJARXVfuxcJj5z+KOnzluumqM
         xbfzD7Xygsyzavs+Tcij40MwHusk0KFoX9MjjVOZQ17B7dKR5kyIQqYafcxVIWcAPaU8
         Q43bl/O1XmA39o1dcMizFvt7BaEkYneHAlpRXUA+HYm3/r6ju1lfy9CRwKTPG0lrhsK3
         oD6zdZOM4vwpmJPOixXhpXkW2y48xOiYLaL2/cTscivVLim34C1THDdgzVgC4iyOXKau
         qiS8JFhNffDzuy/PJk+iQ+RqVp+oDbeai/bCUT/Gkasx9CagSkG7qoj5m0WpY2uDqfGT
         NXYQ==
X-Gm-Message-State: AOAM533frYJf3QTxZNjBatXOd7bOlJCwIXr7kqBLm4v8dk9lwzdHb5pR
        7fYtTmLdcST9B4B7lfNzBg==
X-Google-Smtp-Source: ABdhPJxbA5Y8PpW0JsHWc7hK5dTHQqjaS/Lx+XPBoIg39S8RsNSu5u3TV1aD/g4RD+YXN3T4n1rbxg==
X-Received: by 2002:a02:c894:: with SMTP id m20mr26434884jao.80.1615244500974;
        Mon, 08 Mar 2021 15:01:40 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id c9sm6838929ilr.78.2021.03.08.15.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 15:01:40 -0800 (PST)
Received: (nullmailer pid 3110832 invoked by uid 1000);
        Mon, 08 Mar 2021 23:01:38 -0000
Date:   Mon, 8 Mar 2021 16:01:38 -0700
From:   Rob Herring <robh@kernel.org>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, od@zcrc.me,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: panel/kingdisplay, kd035g6-54nt: Remove
 spi-cs-high
Message-ID: <20210308230138.GA3110798@robh.at.kernel.org>
References: <20210307192830.208245-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210307192830.208245-1-paul@crapouillou.net>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, 07 Mar 2021 19:28:29 +0000, Paul Cercueil wrote:
> The NT39016 panel is a fun beast, even though the documentation states
> that the CS line is active-low, it will work just fine if the CS line is
> configured as active-high, but it won't work if the CS line is forced
> low or forced high.
> 
> Since it did actually work with the spi-cs-high property, this is not a
> bugfix, but we should nonetheless remove that property from the example
> to match the documentation.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  .../bindings/display/panel/kingdisplay,kd035g6-54nt.yaml         | 1 -
>  1 file changed, 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
