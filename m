Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2817A3DE107
	for <lists+linux-mips@lfdr.de>; Mon,  2 Aug 2021 22:52:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231479AbhHBUwc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 2 Aug 2021 16:52:32 -0400
Received: from mail-io1-f43.google.com ([209.85.166.43]:43007 "EHLO
        mail-io1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231397AbhHBUwb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 2 Aug 2021 16:52:31 -0400
Received: by mail-io1-f43.google.com with SMTP id h1so21837627iol.9;
        Mon, 02 Aug 2021 13:52:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yluws7qZTg+lZJa9EBZtSYXJTFq4n6d9IGJLeWwyM7c=;
        b=eCxYtMPNCe3vJvhlYLwCRwO53afuCYvgLbXDXh3mbqpMJn02neh64tPt+QvzId9M18
         zqXevSeTqMhATtnsIZZ2zEbOW8tuSDs1QHRwlxMbY6HH5XNsT9JfLR/DtI+t4+7aX0lu
         m9MYkOnk8th24DVALNzNKpy7WzrGCTCoUPH9nAaODgUVJCDry8yo512Rg8k9RHHtYTbO
         KkrBhgUe3ahRG2yeb8738uS0cLcH+rdgUkOahHuTO4sivUJvvT5aLZYSmD9xpj2MChZz
         vJI5v0whDGHTBoHLg8yjHsvhk4byKwU0iqX3neuAgwtfRd5SzEvQqleqXkvjIAOy8F9C
         oo6g==
X-Gm-Message-State: AOAM530Z2wCv+AAEkvqN0DamYLvqFpSyh8oZBkDLDUT/fPi78ggAxOp6
        bOHUxFAbEq2k4v2XZ7/RNg==
X-Google-Smtp-Source: ABdhPJzgPbQDiHA+qIELIl5HXjaLIKyaqZMqtxwNzDCa0MmRET+HhufCquRhbYGxOpdkdVlj3alEJA==
X-Received: by 2002:a02:4444:: with SMTP id o65mr16381031jaa.24.1627937539823;
        Mon, 02 Aug 2021 13:52:19 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id p17sm6197085ilp.83.2021.08.02.13.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 13:52:19 -0700 (PDT)
Received: (nullmailer pid 1588583 invoked by uid 1000);
        Mon, 02 Aug 2021 20:52:17 -0000
Date:   Mon, 2 Aug 2021 14:52:17 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        Miguel Ojeda <ojeda@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: auxdisplay: img-ascii-lcd: Convert to
 json-schema
Message-ID: <YQhbATd6RfTO8huV@robh.at.kernel.org>
References: <6e74aa466d39ddc9abe502e054d04e8cc7b76b40.1627402094.git.geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e74aa466d39ddc9abe502e054d04e8cc7b76b40.1627402094.git.geert@linux-m68k.org>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 27 Jul 2021 18:10:34 +0200, Geert Uytterhoeven wrote:
> Convert the Device Tree binding documentation for ASCII LCD displays on
> Imagination Technologies boards to json-schema.
> 
> Drop bogus regmap property.
> Add example.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  .../bindings/auxdisplay/img,ascii-lcd.yaml    | 54 +++++++++++++++++++
>  .../bindings/auxdisplay/img-ascii-lcd.txt     | 17 ------
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 55 insertions(+), 18 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/auxdisplay/img,ascii-lcd.yaml
>  delete mode 100644 Documentation/devicetree/bindings/auxdisplay/img-ascii-lcd.txt
> 

Added a type to 'offset' and applied, thanks!
