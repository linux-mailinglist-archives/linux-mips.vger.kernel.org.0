Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D0482FD550
	for <lists+linux-mips@lfdr.de>; Wed, 20 Jan 2021 17:22:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387528AbhATPxX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 20 Jan 2021 10:53:23 -0500
Received: from mail-oo1-f41.google.com ([209.85.161.41]:38619 "EHLO
        mail-oo1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391088AbhATPvQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 20 Jan 2021 10:51:16 -0500
Received: by mail-oo1-f41.google.com with SMTP id i18so5884145ooh.5;
        Wed, 20 Jan 2021 07:50:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AwuxJ4TRyBO9NJG/uyghBKZXILepM64nYdpzoIJWbe0=;
        b=AG5/31RVXHkI3qouITEcTD2XTOcWlgd2NZIeHZFMsrFmawvYKfyA/KZ0U1WLR5hEqR
         gPZdayP8+niZLycHBlDL9Ep5mJpNbBVxGtHlCVYeFQApG7wtUTjbA80LSH2WQYtx0Mq0
         GYyOLErgAN1NCy6V6qy5twZUSMWh5k8KTxZBiwjd3keKyj3lJq6X8LSQozySKSiuvN5U
         ZT5R+Lt/FhdwDvMAp0M5DHoQ9UirvQFlf7pAPq22l5TgFxJven4TB/0eOaHJqoccDvw2
         7vUSlZnugxE3m3hxXlLbD9aCaI2XiLcg0d9hZKQPY+n5RsY9v7H879X6ZZ65j0T3wfQJ
         VWJw==
X-Gm-Message-State: AOAM530dd/ihRtgY6BObMOFPSqrVzg495GdI2EPEgisxMyTH2MKT0Hj1
        kjLwL5QhICfMvaHE6Ag5mw==
X-Google-Smtp-Source: ABdhPJzslC9cQt+PR2D4qDB7kt/LzMuuhN3F/HQPzpBC7gC0hvoF6NHWJFDAPX2VerPVgBaSbq32kA==
X-Received: by 2002:a05:6820:381:: with SMTP id r1mr6555763ooj.73.1611157830743;
        Wed, 20 Jan 2021 07:50:30 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l12sm419516ooq.22.2021.01.20.07.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 07:50:29 -0800 (PST)
Received: (nullmailer pid 214535 invoked by uid 1000);
        Wed, 20 Jan 2021 15:50:28 -0000
Date:   Wed, 20 Jan 2021 09:50:28 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bert Vermeulen <bert@biot.com>
Cc:     Birger Koblitz <mail@birger-koblitz.de>,
        Sander Vanheule <sander@svanheule.net>,
        John Crispin <john@phrozen.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v4 4/5] dt-bindings: Add Cisco prefix to vendor list
Message-ID: <20210120155028.GB213895@robh.at.kernel.org>
References: <20210119092109.185282-1-bert@biot.com>
 <20210119092109.185282-5-bert@biot.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210119092109.185282-5-bert@biot.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 19 Jan 2021 10:21:08 +0100, Bert Vermeulen wrote:
> Signed-off-by: Bert Vermeulen <bert@biot.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

