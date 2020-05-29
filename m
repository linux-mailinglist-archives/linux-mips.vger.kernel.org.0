Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F24E1E896A
	for <lists+linux-mips@lfdr.de>; Fri, 29 May 2020 23:04:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727851AbgE2VED (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 29 May 2020 17:04:03 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:47099 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727781AbgE2VED (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 29 May 2020 17:04:03 -0400
Received: by mail-il1-f193.google.com with SMTP id h3so3822970ilh.13;
        Fri, 29 May 2020 14:04:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bWO8lpuQAv3JpAxsJFN3CcUANqxSI1/hGn9nkwy81bU=;
        b=UIl+No5uz3eGi6rUhGvAmfOFxTSEuLwx3b4uMWVlU4UP3b7fe9c9CtYN02CcSigark
         OZQj/yKy5FGamTTh5ETpG8KCzVSURpAHNV3MiimHzZrHLxpqhJtvMll4sN50Ju74jRjW
         dtJ9Eud2TDOoMziSA4PumjmWEyHg5a4LKrBA4zNhAMLiSeO+L7aJ4dWVZOhjJbX6WZE8
         kP7DgBpRVAXZN2W8cKuD+9oaPGm4pa2F0eiZr3+l8ePjQjNPTK+bdeGgCXC+e3qKRltF
         ZLEwSqVPF63zJF7wK8vPP+eRC03RbMWKvIYUO8xyso10Ht0fl2aKxabMByIEEB/lMEu4
         ge/w==
X-Gm-Message-State: AOAM532AmmkMdcbtDfvGGMiGITRJI+J/UsJGTSpZBg648dgJZjdEfo8t
        lUSQDq943AjJewWwOCDEC+x4ds0VXg==
X-Google-Smtp-Source: ABdhPJx4S/TUi2zpjmZGwjMvnhtRph2OWfzUCxYg0jk1yyLQlrvYpDscxFFMBMuKjWHROgmLrx4gUQ==
X-Received: by 2002:a05:6e02:c7:: with SMTP id r7mr5707488ilq.167.1590786242021;
        Fri, 29 May 2020 14:04:02 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id 199sm5688968ilb.11.2020.05.29.14.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 14:04:01 -0700 (PDT)
Received: (nullmailer pid 2951587 invoked by uid 1000);
        Fri, 29 May 2020 21:04:00 -0000
Date:   Fri, 29 May 2020 15:04:00 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     maz@kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: mips: Document two Loongson generic
 boards
Message-ID: <20200529210400.GA2949323@bogus>
References: <20200529034338.1137776-1-jiaxun.yang@flygoat.com>
 <20200529034338.1137776-2-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200529034338.1137776-2-jiaxun.yang@flygoat.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, May 29, 2020 at 11:43:18AM +0800, Jiaxun Yang wrote:
> Document loongson3-8core-ls7a and loongson3-r4-ls7a, with
> two boards LS7A PCH.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  .../devicetree/bindings/mips/loongson/devices.yaml        | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mips/loongson/devices.yaml b/Documentation/devicetree/bindings/mips/loongson/devices.yaml
> index 74ed4e397a78..6164b0fcb493 100644
> --- a/Documentation/devicetree/bindings/mips/loongson/devices.yaml
> +++ b/Documentation/devicetree/bindings/mips/loongson/devices.yaml
> @@ -24,4 +24,12 @@ properties:
>        - description: Generic Loongson3 Octa Core + RS780E
>          items:
>            - const: loongson,loongson3-8core-rs780e
> +
> +      - description: Generic Loongson3 Quad Core + LS7A

Quad or..

> +        items:
> +          - const: loongson,loongson3-8core-ls7a

8 core?

> +
> +      - description: Generic Loongson3 Release 4 + LS7A
> +        items:
> +          - const: loongson,loongson3-r4-ls7a
>  ...
> -- 
> 2.27.0.rc0
> 
