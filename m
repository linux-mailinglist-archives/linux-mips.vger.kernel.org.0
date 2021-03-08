Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6438E331A84
	for <lists+linux-mips@lfdr.de>; Mon,  8 Mar 2021 23:57:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231321AbhCHW4m (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Mar 2021 17:56:42 -0500
Received: from mail-io1-f50.google.com ([209.85.166.50]:34771 "EHLO
        mail-io1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231334AbhCHW4j (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 8 Mar 2021 17:56:39 -0500
Received: by mail-io1-f50.google.com with SMTP id o11so11869202iob.1;
        Mon, 08 Mar 2021 14:56:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CVTuDsSc1yBBuCEQRBWNNdjOxuOlL/jEwL7KPq3I2l4=;
        b=ujiawTg4OMDy2SwF+v9vBOie1zetfi+us8UfB5lql99E8wKffTv9QPV/DPO7kEn7j9
         KfKt6i6m7A3WSgwq83eK8d0eduxmkBCuQ0/yypaOWOzEZPGjEiFuHstsBA7Xm2x1lt2t
         +NQkZIwU7Xnz16i1/05e3ogQrPqX//QVbRFUjFDLlDyx9P/B/RfWoxSD3tf8DRvmUr/A
         8ucJSPznjtNmGTvoVqyd09dngqVvKcTPIg/g/wPLGswO7yWzGkPg15+h0wQ0y9JE8ijA
         tCxdS7bTDR0uhn9bXpyM7Da6Hx9SzCdO7qJVWMuj6RyzvsTRoW87oo2PTrveRdpZkTgm
         +ZbA==
X-Gm-Message-State: AOAM530bao7H8S+M/eUf/rm6REJH7/bSNM+YjDCN/3S5kOpzqqO4Lmmj
        IXAFhcPIvQpqy2HmucRKcg==
X-Google-Smtp-Source: ABdhPJxe19VUMvx9IrYIaJvRkaXs8PQ5Uyg2xtCvdB9jiCM7oQV9mKBueoOfVdFWqa7d8a5Iu2+f/g==
X-Received: by 2002:a05:6638:1914:: with SMTP id p20mr15055667jal.92.1615244198875;
        Mon, 08 Mar 2021 14:56:38 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id m4sm6866187ilc.53.2021.03.08.14.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 14:56:38 -0800 (PST)
Received: (nullmailer pid 3103751 invoked by uid 1000);
        Mon, 08 Mar 2021 22:56:36 -0000
Date:   Mon, 8 Mar 2021 15:56:36 -0700
From:   Rob Herring <robh@kernel.org>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Stephen Boyd <sboyd@kernel.org>, od@zcrc.me,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Zhou Yanjie <zhouyanjie@wanyeetech.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: clock: ingenic: Add
 ingenic,jz4760{,b}-cgu compatibles
Message-ID: <20210308225636.GA3103375@robh.at.kernel.org>
References: <20210307141759.30426-1-paul@crapouillou.net>
 <20210307141759.30426-2-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210307141759.30426-2-paul@crapouillou.net>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, 07 Mar 2021 14:17:54 +0000, Paul Cercueil wrote:
> Add ingenic,jz4760-cgu and ingenic,jz4760b-cgu compatible strings for
> the JZ4760 and JZ4760B SoCs respectively.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  Documentation/devicetree/bindings/clock/ingenic,cgu.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
