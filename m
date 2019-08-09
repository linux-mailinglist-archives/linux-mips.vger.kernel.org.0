Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE9CA880CC
	for <lists+linux-mips@lfdr.de>; Fri,  9 Aug 2019 19:07:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437214AbfHIRHo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 9 Aug 2019 13:07:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:60596 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2437166AbfHIRHo (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 9 Aug 2019 13:07:44 -0400
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0BB5520820;
        Fri,  9 Aug 2019 17:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565370463;
        bh=td4WT5L6sUbLPGMcC2rgQ1AreEqJT3zC3mPDyJzfMwg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=QYaiJaeNwh52yygHZKBZK4gJSBvGHNK2g9MXjg/qpBnEhDw7XHDMXx4iet/4+C9PQ
         czBsLI4++elQaRyiricXgHxxvetYGVXZbnt/gzHU1gtm0qsh7Bif8b+E9/3JSaYFp9
         9CP/LaUOkV+qh9QOdx10zuUkIq64xQzmsETb7FDs=
Received: by mail-qt1-f180.google.com with SMTP id a15so96431345qtn.7;
        Fri, 09 Aug 2019 10:07:43 -0700 (PDT)
X-Gm-Message-State: APjAAAXgCew8m2wEJkvuQaMCyuINzv11KT7MncVG62UlaJn4hsuy0Jkm
        09BLHc9RZ9PLQNzgBlzdp/zHj5aQ5XaQA2wH9w==
X-Google-Smtp-Source: APXvYqxQFlsxKQTsoRNrDqs5WV3+vuTWpbQ6YgRh5R5HUZ9BUeRSJyuUwydSt19fd8aJIkkfwtreR3hWL5+n91XE59E=
X-Received: by 2002:a0c:9782:: with SMTP id l2mr5661633qvd.72.1565370462225;
 Fri, 09 Aug 2019 10:07:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190809121918.25047-1-sr@denx.de> <20190809121918.25047-2-sr@denx.de>
In-Reply-To: <20190809121918.25047-2-sr@denx.de>
From:   Rob Herring <robh@kernel.org>
Date:   Fri, 9 Aug 2019 11:07:29 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJmcHWq8LA6CrTJEV2Pi58+6yO_ND61MNA_=LrOa33Psg@mail.gmail.com>
Message-ID: <CAL_JsqJmcHWq8LA6CrTJEV2Pi58+6yO_ND61MNA_=LrOa33Psg@mail.gmail.com>
Subject: Re: [PATCH 2/3 v3] dt-bindings: mips: Add gardena vendor prefix and
 board description
To:     Stefan Roese <sr@denx.de>
Cc:     linux-mips@vger.kernel.org, Paul Burton <paul.burton@mips.com>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Aug 9, 2019 at 6:19 AM Stefan Roese <sr@denx.de> wrote:
>
> This patch adds the vendor prefix for gardena and a short description
> including the compatible string for the "GARDENA smart Gateway" based
> on the MT7688 SoC.
>
> Signed-off-by: Stefan Roese <sr@denx.de>
> Cc: Paul Burton <paul.burton@mips.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> ---
> v3:
> - New patch
>
>  .../devicetree/bindings/mips/ralink/gardena.txt          | 9 +++++++++
>  Documentation/devicetree/bindings/vendor-prefixes.yaml   | 2 ++
>  2 files changed, 11 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mips/ralink/gardena.txt

Please add to ralink.txt rather than a new file. Ideally, that would
be converted to DT schema first, but given this is v3 already I won't
require that. A binding file per board vendor doesn't scale well and
will be a lot of duplication for schemas.

> diff --git a/Documentation/devicetree/bindings/mips/ralink/gardena.txt b/Documentation/devicetree/bindings/mips/ralink/gardena.txt
> new file mode 100644
> index 000000000000..4022fe61a8ee
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mips/ralink/gardena.txt
> @@ -0,0 +1,9 @@
> +GARDENA smart Gateway (MT7688)
> +
> +This board is based on the MediaTek MT7688 and equipped with 128 MiB
> +of DDR and 8 MiB of flash (SPI NOR) and additional 128MiB SPI NAND
> +storage.
> +
> +------------------------------
> +Required root node properties:
> +- compatible = "gardena,smartGatewayMT7688";

You need an SoC compatible for MT7688 which isn't documented either.

Rob
