Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00227221537
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jul 2020 21:39:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727042AbgGOThG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 15 Jul 2020 15:37:06 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:42190 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727021AbgGOThF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 15 Jul 2020 15:37:05 -0400
Received: by mail-io1-f66.google.com with SMTP id c16so3488417ioi.9;
        Wed, 15 Jul 2020 12:37:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WZaIoDzYYl/HXO7lkwjh/Xm4aTRVdttVJOPKuBMdG0Y=;
        b=KCb12iau8xG2V+/g++kf3vHPFhzrDZ5WauN19JTO/8JKX4Qy1OtCAngL2FHXN3xT2H
         6QZ0KO2MxGUueFK2Mz2TqZvzFRc0adoiEgIrlzydwiT7+F/2LbOZuliPQBJiJwvB767+
         v3Wi83vs427LV48U+TbV2OahhvqgduxTpQW+srTsBBxzPkq3VI9SJRoXc07ZlZdtVZnv
         uYf4A2+IcB4bVf8uz53vWg9glbvd0DziGvLA7tTSG0aR7llj7sM7myd4tpiTeG0N0NSU
         T5j4ILG3CQuwz+KgYHWc2oTiMWkVeyJpzEmSgmT5P0wyLf29AcvCAqEllJzmwcuq1OPJ
         NaGQ==
X-Gm-Message-State: AOAM531/x88/ZKKzfO+hlbqLnTiRme8WOQYElWTBdMzaz84kMIKrYOMm
        zC9rhqFkoQI1PWOukhECLLeFoAl3gw==
X-Google-Smtp-Source: ABdhPJxcBpVavEBVS1LYGqWlui1bdPPAV/Of34Hrn8YE0UAQW3n3OJuA4f90VAJa6/W+EUbZLkh/vg==
X-Received: by 2002:a6b:8d04:: with SMTP id p4mr901288iod.174.1594841823937;
        Wed, 15 Jul 2020 12:37:03 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id k1sm1506055ilr.35.2020.07.15.12.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2020 12:37:03 -0700 (PDT)
Received: (nullmailer pid 696024 invoked by uid 1000);
        Wed, 15 Jul 2020 19:37:02 -0000
Date:   Wed, 15 Jul 2020 13:37:02 -0600
From:   Rob Herring <robh@kernel.org>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     od@zcrc.me, =?utf-8?B?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: [PATCH 1/7] dt-bindings: vendor-prefixes: Add YLM
Message-ID: <20200715193702.GA695993@bogus>
References: <20200623182432.187843-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200623182432.187843-1-paul@crapouillou.net>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 23 Jun 2020 20:24:26 +0200, Paul Cercueil wrote:
> Shenzhen Yangliming Electronic Technology Co., Ltd., abbreviated YLM or
> YLMChina, and known as Anbernic in the rest of the world, is a Chinese
> manufacturer of handheld game consoles, some of which are known to be
> running Linux.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
